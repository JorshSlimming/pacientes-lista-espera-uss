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
    const { userRole, incluir_archivados } = await req.json();

    // Solo AdminJefe puede listar usuarios
    if (userRole !== 'jefe') {
      return new Response(
        JSON.stringify({ error: 'No tienes permisos para ver la lista de usuarios' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? ''
    );

    let query = supabaseClient
      .from('trabajador')
      .select('rut_trabajador, rol, nombre, apellido, activo')
      .order('nombre');

    // Por defecto, solo mostrar usuarios activos
    if (!incluir_archivados) {
      query = query.eq('activo', true);
    }

    const { data: usuarios, error } = await query;

    if (error) throw error;

    return new Response(
      JSON.stringify({
        success: true,
        usuarios
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
