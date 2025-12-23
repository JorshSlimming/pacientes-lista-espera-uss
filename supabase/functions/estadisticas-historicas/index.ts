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
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    );

    // Verificar autenticación
    await verificarAutenticacion(req, supabaseClient);

    // Total de ingresos
    const { count: totalIngresos } = await supabaseClient
      .from('seguimiento')
      .select('*', { count: 'exact', head: true });

    // Pendientes
    const { count: pendientes } = await supabaseClient
      .from('seguimiento')
      .select('*', { count: 'exact', head: true })
      .eq('agendado', 'no');

    // Agendados
    const { count: agendados } = await supabaseClient
      .from('seguimiento')
      .select('*', { count: 'exact', head: true })
      .eq('agendado', 'si');

    // Desistidos
    const { count: desistidos } = await supabaseClient
      .from('seguimiento')
      .select('*', { count: 'exact', head: true })
      .eq('agendado', 'desiste');

    return new Response(
      JSON.stringify({
        success: true,
        estadisticas: {
          total_ingresos: totalIngresos || 0,
          pendientes: pendientes || 0,
          agendados: agendados || 0,
          desistidos: desistidos || 0
        }
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
