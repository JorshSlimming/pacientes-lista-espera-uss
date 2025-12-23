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
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    );

    // Verificar autenticación y rol de jefe
    const trabajadorActual = await verificarAutenticacion(req, supabaseClient);
    verificarRol(trabajadorActual, ['jefe']);

    const body = await req.json();
    const { id_trabajador, action } = body;

    console.log('📥 Body recibido:', body);
    console.log('📥 id_trabajador:', id_trabajador, 'action:', action);

    if (!id_trabajador) {
      return new Response(
        JSON.stringify({ error: 'ID del trabajador es requerido' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    if (!action) {
      return new Response(
        JSON.stringify({ error: 'Action es requerido (archivar o activar)' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Verificar que el usuario existe
    const { data: trabajador, error: fetchError } = await supabaseClient
      .from('trabajador')
      .select('id_trabajador, rut, rol, nombre, apellido, activo')
      .eq('id_trabajador', id_trabajador)
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
      .eq('id_trabajador', trabajador.id_trabajador);

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
