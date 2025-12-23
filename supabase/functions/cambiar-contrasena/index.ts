import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { verificarAutenticacion, verificarRol } from "../_shared/auth.ts";

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

    // Verificar autenticación y rol de jefe
    const trabajador = await verificarAutenticacion(req, supabaseClient);
    verificarRol(trabajador, ['jefe']);

    const { id_trabajador, nueva_clave } = await req.json();

    if (!id_trabajador || !nueva_clave) {
      return new Response(
        JSON.stringify({ error: 'ID del trabajador y nueva contraseña son requeridos' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Validar longitud mínima de contraseña
    if (nueva_clave.length < 6) {
      return new Response(
        JSON.stringify({ error: 'La contraseña debe tener al menos 6 caracteres' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Usar SERVICE_ROLE para operaciones de admin
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    );

    // Verificar que el usuario existe y obtener su auth_uid
    const { data: trabajadorData, error: fetchError } = await supabaseAdmin
      .from('trabajador')
      .select('id_trabajador, rut, rol, nombre, apellido, auth_uid')
      .eq('id_trabajador', id_trabajador)
      .single();

    if (fetchError || !trabajadorData || !trabajadorData.auth_uid) {
      return new Response(
        JSON.stringify({ error: 'Usuario no encontrado o no vinculado a Supabase Auth' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Actualizar contraseña en Supabase Auth
    const { error: updateError } = await supabaseAdmin.auth.admin.updateUserById(
      trabajadorData.auth_uid,
      { password: nueva_clave }
    );

    if (updateError) throw updateError;

    return new Response(
      JSON.stringify({
        success: true,
        message: `Contraseña de ${trabajadorData.nombre} ${trabajadorData.apellido} actualizada exitosamente`
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );

  } catch (error) {
    return new Response(
      JSON.stringify({ error: error.message }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});
