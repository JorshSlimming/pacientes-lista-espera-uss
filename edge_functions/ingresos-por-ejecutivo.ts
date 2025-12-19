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
      .select('rut_trabajador, nombre, apellido');

    if (trabajadoresError) throw trabajadoresError;

    // Contar ingresos por cada ejecutivo
    // Nota: Necesitarías agregar campo rut_ejecutivo_ingreso en tabla seguimiento
    // Por ahora, retornamos los trabajadores con contador en 0
    // En producción, deberías modificar el modelo para incluir este campo
    
    const ingresosPromises = trabajadores.map(async (trabajador) => {
      // Aquí irías a buscar en una tabla de auditoría o seguimiento
      // el contador de pacientes ingresados por cada ejecutivo
      return {
        rut_trabajador: trabajador.rut_trabajador,
        nombre_completo: `${trabajador.nombre} ${trabajador.apellido}`,
        total_ingresos: 0 // Placeholder - necesita implementarse según modelo
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
