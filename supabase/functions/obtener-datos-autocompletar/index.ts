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
    // Esta función NO requiere autenticación - solo devuelve catálogos públicos
    // Usar SERVICE_ROLE_KEY para bypass de RLS
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      {
        auth: {
          autoRefreshToken: false,
          persistSession: false
        }
      }
    );

    // Obtener todos los catálogos en paralelo (solo no archivados)
    const [comunasRes, origenesRes, institucionesRes, especialidadesRes] = await Promise.all([
      supabaseClient.from('comuna').select('*').eq('archivado', false).order('nombre'),
      supabaseClient.from('origen').select('*').eq('archivado', false).order('nombre'),
      supabaseClient.from('institucion_convenio').select('*').eq('archivado', false).order('nombre'),
      supabaseClient.from('especialidad').select('*').eq('archivado', false).order('nombre')
    ]);

    console.log('Comunas:', comunasRes.data?.length || 0, 'Error:', comunasRes.error);
    console.log('Origenes:', origenesRes.data?.length || 0, 'Error:', origenesRes.error);
    console.log('Instituciones:', institucionesRes.data?.length || 0, 'Error:', institucionesRes.error);
    console.log('Especialidades:', especialidadesRes.data?.length || 0, 'Error:', especialidadesRes.error);

    return new Response(
      JSON.stringify({
        comunas: comunasRes.data || [],
        origenes: origenesRes.data || [],
        instituciones: institucionesRes.data || [],
        especialidades: especialidadesRes.data || []
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );

  } catch (error) {
    console.error('Error en obtener-datos-autocompletar:', error);
    return new Response(
      JSON.stringify({ error: error.message }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});
