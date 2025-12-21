import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    const { paciente, rut_ejecutivo } = await req.json();

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? ''
    );

    // Limpiar RUT (quitar puntos y guiones)
    const rutLimpio = paciente.rut_paciente.replace(/\./g, '').replace(/-/g, '');

    // Verificar si el RUT ya existe
    const { data: existente } = await supabaseClient
      .from('paciente')
      .select('id_paciente')
      .eq('rut', rutLimpio)
      .single();

    if (existente) {
      return new Response(
        JSON.stringify({ error: 'El RUT ya está registrado en el sistema' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

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

    // 3. Crear seguimiento
    const { data: seguimiento, error: seguimientoError } = await supabaseClient
      .from('seguimiento')
      .insert({
        fecha_ingreso: new Date().toISOString().split('T')[0],
        agendado: 'no',
        numero_llamado: null,
        id_paciente: nuevoPaciente.id_paciente,
        id_especialidad: paciente.id_especialidad,
        id_ejecutivo_ingreso: rut_ejecutivo ? parseInt(rut_ejecutivo) : null
      })
      .select()
      .single();

    if (seguimientoError) throw seguimientoError;

    return new Response(
      JSON.stringify({
        success: true,
        paciente: nuevoPaciente,
        seguimiento,
        message: 'Paciente creado exitosamente'
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
