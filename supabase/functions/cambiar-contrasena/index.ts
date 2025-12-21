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
    const { rut_trabajador, nueva_clave, userRole } = await req.json();

    // Solo AdminJefe puede cambiar contraseñas
    if (userRole !== 'jefe') {
      return new Response(
        JSON.stringify({ error: 'No tienes permisos para cambiar contraseñas' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    if (!rut_trabajador || !nueva_clave) {
      return new Response(
        JSON.stringify({ error: 'RUT y nueva contraseña son requeridos' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Validar longitud mínima de contraseña
    if (nueva_clave.length < 4) {
      return new Response(
        JSON.stringify({ error: 'La contraseña debe tener al menos 4 caracteres' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? ''
    );

    // Limpiar RUT (quitar puntos y guiones)
    const rutLimpio = rut_trabajador.replace(/\./g, '').replace(/-/g, '');

    // Verificar que el usuario existe
    const { data: trabajador, error: fetchError } = await supabaseClient
      .from('trabajador')
      .select('id_trabajador, rut, rol, nombre, apellido')
      .eq('rut', rutLimpio)
      .single();

    if (fetchError || !trabajador) {
      return new Response(
        JSON.stringify({ error: 'Usuario no encontrado' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Hashear nueva contraseña
    const hashedPassword = await bcrypt.hash(nueva_clave);

    // Actualizar contraseña
    const { error: updateError } = await supabaseClient
      .from('trabajador')
      .update({ clave: hashedPassword })
      .eq('id_trabajador', trabajador.id_trabajador);

    if (updateError) throw updateError;

    return new Response(
      JSON.stringify({
        success: true,
        message: `Contraseña de ${trabajador.nombre} ${trabajador.apellido} actualizada exitosamente`
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
