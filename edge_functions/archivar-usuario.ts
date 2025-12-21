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
    const { action, rut_trabajador, userRole } = await req.json();

    // Solo AdminJefe puede archivar usuarios
    if (userRole !== 'jefe') {
      return new Response(
        JSON.stringify({ error: 'No tienes permisos para esta acción' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    if (!rut_trabajador) {
      return new Response(
        JSON.stringify({ error: 'RUT del trabajador es requerido' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Limpiar RUT
    const rutLimpio = rut_trabajador.replace(/\./g, '').replace(/-/g, '');

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? ''
    );

    // Verificar que el usuario existe
    const { data: trabajador, error: fetchError } = await supabaseClient
      .from('trabajador')
      .select('id_trabajador, rut, rol, nombre, apellido, activo')
      .eq('rut', rutLimpio)
      .single();

    if (fetchError || !trabajador) {
      return new Response(
        JSON.stringify({ error: 'Usuario no encontrado' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // No se puede archivar a un AdminJefe (solo se crean desde SQL)
    if (trabajador.rol === 'jefe') {
      return new Response(
        JSON.stringify({ error: 'No se puede archivar a un AdminJefe. Solo se gestionan desde Supabase' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    let nuevoEstado: boolean;
    let mensaje: string;

    if (action === 'archivar') {
      nuevoEstado = false;
      mensaje = 'Usuario archivado exitosamente';
    } else if (action === 'activar') {
      nuevoEstado = true;
      mensaje = 'Usuario activado exitosamente';
    } else {
      return new Response(
        JSON.stringify({ error: 'Acción inválida. Use "archivar" o "activar"' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Actualizar estado
    const { error: updateError } = await supabaseClient
      .from('trabajador')
      .update({ activo: nuevoEstado })
      .eq('rut', rutLimpio);

    if (updateError) throw updateError;

    return new Response(
      JSON.stringify({
        success: true,
        message: mensaje
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
