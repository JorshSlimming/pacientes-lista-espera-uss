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
    const { filtros, paginacion } = await req.json();

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? ''
    );

    let query = supabaseClient
      .from('seguimiento')
      .select(`
        *,
        paciente:id_paciente (
          *,
          contacto:id_contacto (*),
          comuna:id_comuna (*),
          origen:id_origen (*),
          institucion:id_institucion_convenio (*)
        ),
        especialidad:id_especialidad (*)
      `, { count: 'exact' });

    // Aplicar filtros
    if (filtros.id_especialidad) {
      query = query.eq('id_especialidad', filtros.id_especialidad);
    }
    
    if (filtros.agendado) {
      query = query.eq('agendado', filtros.agendado);
    }

    if (filtros.id_comuna) {
      query = query.eq('paciente.id_comuna', filtros.id_comuna);
    }

    if (filtros.fecha_desde) {
      query = query.gte('fecha_ingreso', filtros.fecha_desde);
    }

    if (filtros.fecha_hasta) {
      query = query.lte('fecha_ingreso', filtros.fecha_hasta);
    }

    // Ordenamiento
    const ordenarPor = filtros.ordenar_por || 'fecha_ingreso';
    const ordenDir = filtros.orden_direccion || 'desc';
    query = query.order(ordenarPor, { ascending: ordenDir === 'asc' });

    // Paginación
    const page = paginacion?.page || 1;
    const perPage = paginacion?.per_page || 50;
    const from = (page - 1) * perPage;
    const to = from + perPage - 1;
    
    query = query.range(from, to);

    const { data: resultados, error, count } = await query;

    if (error) throw error;

    return new Response(
      JSON.stringify({
        success: true,
        resultados,
        paginacion: {
          total: count,
          page,
          per_page: perPage,
          total_pages: Math.ceil((count || 0) / perPage)
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
