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
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? ''
    );

    // Obtener todos los trabajadores
    const { data: trabajadores, error: trabajadoresError } = await supabaseClient
      .from('trabajador')
      .select('id_trabajador, rut, nombre, apellido');

    if (trabajadoresError) throw trabajadoresError;

    // Contar ingresos por cada ejecutivo desde tabla seguimiento
    const ingresosPromises = trabajadores.map(async (trabajador) => {
      const { count } = await supabaseClient
        .from('seguimiento')
        .select('*', { count: 'exact', head: true })
        .eq('id_ejecutivo_ingreso', trabajador.id_trabajador);

      return {
        id_trabajador: trabajador.id_trabajador,
        rut: trabajador.rut,
        nombre_completo: `${trabajador.nombre} ${trabajador.apellido}`,
        total_ingresos: count || 0
      };
    });

    const ingresos = await Promise.all(ingresosPromises);

    return new Response(
      JSON.stringify({
        success: true,
        ingresos_por_ejecutivo: ingresos
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
