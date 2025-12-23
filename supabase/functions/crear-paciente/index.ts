import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { verificarAutenticacion } from "../_shared/auth.ts";

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      {
        auth: {
          autoRefreshToken: false,
          persistSession: false
        },
        global: {
          headers: { Authorization: req.headers.get('Authorization')! }
        }
      }
    );

    // Verificar autenticación
    const trabajador = await verificarAutenticacion(req, supabaseClient);

    const { paciente, rut_ejecutivo } = await req.json();

    console.log('📝 Datos recibidos:', { paciente, rut_ejecutivo });

    // Limpiar RUT (quitar puntos y guiones)
    const rutLimpio = paciente.rut.replace(/\./g, '').replace(/-/g, '');

    // Verificar si el paciente ya existe
    const { data: pacienteExistente, error: busquedaError } = await supabaseClient
      .from('paciente')
      .select('id_paciente, id_contacto')
      .eq('rut', rutLimpio)
      .maybeSingle();

    let idPaciente: number;
    let esNuevo = false;

    if (pacienteExistente) {
      // Paciente ya existe, actualizar su contacto
      console.log('📋 Paciente ya existe, actualizando contacto');
      
      const { error: actualizarContactoError } = await supabaseClient
        .from('contacto')
        .update({
          correo: paciente.correo,
          direccion: paciente.direccion,
          primer_celular: paciente.primer_celular,
          segundo_celular: paciente.segundo_celular || null
        })
        .eq('id_contacto', pacienteExistente.id_contacto);

      if (actualizarContactoError) throw actualizarContactoError;
      
      idPaciente = pacienteExistente.id_paciente;
    } else {
      // Crear nuevo paciente
      console.log('🆕 Creando nuevo paciente');
      esNuevo = true;

      // 1. Crear contacto
      const { data: contacto, error: contactoError } = await supabaseClient
        .from('contacto')
        .insert({
          correo: paciente.correo,
          direccion: paciente.direccion,
          primer_celular: paciente.primer_celular,
          segundo_celular: paciente.segundo_celular || null
        })
        .select()
        .single();

      if (contactoError) throw contactoError;

      // 2. Crear paciente
      const { data: nuevoPaciente, error: pacienteError } = await supabaseClient
        .from('paciente')
        .insert({
          rut: rutLimpio,
          nombre: paciente.nombre,
          primer_apellido: paciente.primer_apellido,
          segundo_apellido: paciente.segundo_apellido || null,
          fecha_nacimiento: paciente.fecha_nacimiento,
          obs: paciente.obs || null,
          id_comuna: paciente.id_comuna,
          id_origen: paciente.id_origen,
          id_institucion_convenio: paciente.id_institucion_convenio || null,
          id_contacto: contacto.id_contacto
        })
        .select()
        .single();

      if (pacienteError) throw pacienteError;
      
      idPaciente = nuevoPaciente.id_paciente;
    }

    // 3. Crear seguimiento
    const { data: seguimiento, error: seguimientoError } = await supabaseClient
      .from('seguimiento')
      .insert({
        fecha_ingreso: new Date().toISOString().split('T')[0],
        agendado: 'no',
        numero_llamado: null,
        id_paciente: idPaciente,
        id_especialidad: paciente.id_especialidad,
        id_ejecutivo_ingreso: trabajador.id_trabajador
      })
      .select()
      .single();

    if (seguimientoError) throw seguimientoError;

    return new Response(
      JSON.stringify({
        success: true,
        seguimiento,
        message: esNuevo 
          ? 'Paciente y seguimiento creados exitosamente' 
          : 'Nuevo seguimiento agregado para paciente existente'
      }),
      { status: 201, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );

  } catch (error) {
    return new Response(
      JSON.stringify({ error: error.message }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});
