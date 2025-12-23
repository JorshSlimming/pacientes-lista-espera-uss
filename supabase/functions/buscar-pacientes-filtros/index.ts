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

    // Verificar autenticación
    await verificarAutenticacion(req, supabaseClient);

    const { filtros, paginacion } = await req.json();

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
        especialidad:id_especialidad (*),
        ejecutivo:id_ejecutivo_ingreso (
          id_trabajador,
          rut,
          nombre,
          apellido
        )
      `, { count: 'exact' });

    // Aplicar filtros de especialidad (jerárquico)
    if (filtros.id_especialidad) {
      // Si se proporciona un array de IDs de especialidades (para búsqueda jerárquica)
      if (Array.isArray(filtros.id_especialidad)) {
        query = query.in('id_especialidad', filtros.id_especialidad);
      } else {
        query = query.eq('id_especialidad', filtros.id_especialidad);
      }
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

    // Transformar resultados para que el paciente esté en el nivel superior
    const pacientesTransformados = (resultados || []).map(seg => ({
      ...seg.paciente,
      seguimiento: {
        id_seguimiento: seg.id_seguimiento,
        fecha_ingreso: seg.fecha_ingreso,
        fecha_primera_llamada: seg.fecha_primera_llamada,
        fecha_segunda_llamada: seg.fecha_segunda_llamada,
        fecha_tercera_llamada: seg.fecha_tercera_llamada,
        numero_llamado: seg.numero_llamado,
        fecha_citacion: seg.fecha_citacion,
        agendado: seg.agendado,
        id_especialidad: seg.id_especialidad,
        id_ejecutivo_ingreso: seg.id_ejecutivo_ingreso
      },
      especialidad: seg.especialidad,
      ejecutivo: seg.ejecutivo
    }));

    return new Response(
      JSON.stringify({
        data: pacientesTransformados,
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
