import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import * as bcrypt from "https://deno.land/x/bcrypt@v0.4.1/mod.ts";

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    const { rut_trabajador, rol, nombre, apellido, clave, userRole } = await req.json();

    // Solo AdminJefe puede crear usuarios
    if (userRole !== 'jefe') {
      return new Response(
        JSON.stringify({ error: 'No tienes permisos para crear usuarios' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    if (!rut_trabajador || !rol || !nombre || !apellido || !clave) {
      return new Response(
        JSON.stringify({ error: 'Todos los campos son requeridos' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Validar rol
    if (!['jefe', 'usuario'].includes(rol)) {
      return new Response(
        JSON.stringify({ error: 'Rol inválido. Debe ser "jefe" o "usuario"' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? ''
    );

    // Limpiar RUT (quitar puntos y guiones)
    const rutLimpio = rut_trabajador.replace(/\./g, '').replace(/-/g, '');

    // Verificar si el RUT ya existe
    const { data: existente } = await supabaseClient
      .from('trabajador')
      .select('id_trabajador')
      .eq('rut', rutLimpio)
      .single();

    if (existente) {
      return new Response(
        JSON.stringify({ error: 'El RUT ya está registrado en el sistema' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Hashear contraseña con bcrypt
    const hashedPassword = await bcrypt.hash(clave);

    // Crear nuevo trabajador
    const { data: nuevoTrabajador, error: createError } = await supabaseClient
      .from('trabajador')
      .insert({
        rut: rutLimpio,
        rol,
        nombre,
        apellido,
        clave: hashedPassword
      })
      .select('id_trabajador, rut, rol, nombre, apellido')
      .single();

    if (createError) throw createError;

    return new Response(
      JSON.stringify({
        success: true,
        trabajador: nuevoTrabajador,
        message: 'Usuario creado exitosamente'
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
