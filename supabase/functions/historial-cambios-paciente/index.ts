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
    const trabajador = await verificarAutenticacion(req, supabaseClient);
    verificarRol(trabajador, ['jefe']);

    const { id_paciente, id_seguimiento } = await req.json();

    console.log('📋 Obteniendo historial para id_paciente:', id_paciente, 'id_seguimiento:', id_seguimiento);

    let idsSeguimientos: number[] = [];

    if (id_seguimiento) {
      // Si se proporciona id_seguimiento, solo mostrar cambios de ese seguimiento
      idsSeguimientos = [id_seguimiento];
    } else {
      // Si no se proporciona, obtener todos los seguimientos del paciente
      const { data: seguimientos, error: segError } = await supabaseClient
        .from('seguimiento')
        .select('id_seguimiento')
        .eq('id_paciente', id_paciente);

      if (segError) throw segError;
      idsSeguimientos = seguimientos?.map(s => s.id_seguimiento) || [];
    }

    if (idsSeguimientos.length === 0) {
      return new Response(
        JSON.stringify({
          success: true,
          historial: []
        }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Obtener el historial de cambios
    let query = supabaseClient
      .from('auditoria')
      .select(`
        *,
        trabajador:id_trabajador (
          nombre,
          apellido
        ),
        seguimiento:id_seguimiento (
          id_seguimiento,
          id_paciente,
          especialidad:id_especialidad (
            nombre
          )
        )
      `);

    // Si se proporciona id_seguimiento, filtrar solo ese seguimiento
    // Los cambios de OBS siempre se muestran porque tienen campo_modificado = 'obs'
    if (id_seguimiento) {
      // Mostrar solo cambios de ese seguimiento específico
      // (los de OBS ya vendrán incluidos si pertenecen a ese seguimiento)
      query = query.eq('id_seguimiento', id_seguimiento);
    } else {
      // Mostrar todos los seguimientos del paciente
      query = query.in('id_seguimiento', idsSeguimientos);
    }

    const { data: historial, error } = await query.order('fecha_modificacion', { ascending: false });

    if (error) throw error;

    return new Response(
      JSON.stringify({
        success: true,
        historial
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
