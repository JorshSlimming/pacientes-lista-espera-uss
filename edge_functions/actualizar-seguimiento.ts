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
    const { id_seguimiento, cambios, rut_trabajador } = await req.json();

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? ''
    );

    // Validación: Si se va a agendar, debe tener al menos una llamada
    if (cambios.agendado === 'si') {
      const { data: seguimiento } = await supabaseClient
        .from('seguimiento')
        .select('fecha_primera_llamada, fecha_segunda_llamada, fecha_tercera_llamada')
        .eq('id_seguimiento', id_seguimiento)
        .single();

      const tieneLlamada = seguimiento?.fecha_primera_llamada || 
                          seguimiento?.fecha_segunda_llamada || 
                          seguimiento?.fecha_tercera_llamada ||
                          cambios.fecha_primera_llamada ||
                          cambios.fecha_segunda_llamada ||
                          cambios.fecha_tercera_llamada;

      if (!tieneLlamada) {
        return new Response(
          JSON.stringify({ error: 'Debe registrar al menos una llamada antes de agendar' }),
          { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
      }
    }

    // Campos permitidos para Usuario
    const camposPermitidos: any = {};
    
    if (cambios.fecha_primera_llamada !== undefined) {
      camposPermitidos.fecha_primera_llamada = cambios.fecha_primera_llamada;
    }
    if (cambios.fecha_segunda_llamada !== undefined) {
      camposPermitidos.fecha_segunda_llamada = cambios.fecha_segunda_llamada;
    }
    if (cambios.fecha_tercera_llamada !== undefined) {
      camposPermitidos.fecha_tercera_llamada = cambios.fecha_tercera_llamada;
    }
    if (cambios.numero_llamado !== undefined) {
      camposPermitidos.numero_llamado = cambios.numero_llamado;
    }
    if (cambios.agendado !== undefined) {
      camposPermitidos.agendado = cambios.agendado;
    }
    if (cambios.fecha_citacion !== undefined) {
      camposPermitidos.fecha_citacion = cambios.fecha_citacion;
    }

    // Actualizar seguimiento
    const { data: seguimientoActualizado, error: updateError } = await supabaseClient
      .from('seguimiento')
      .update(camposPermitidos)
      .eq('id_seguimiento', id_seguimiento)
      .select()
      .single();

    if (updateError) throw updateError;

    // Actualizar OBS en paciente si se proporciona
    if (cambios.obs !== undefined) {
      const { error: obsError } = await supabaseClient
        .from('paciente')
        .update({ obs: cambios.obs })
        .eq('id_paciente', seguimientoActualizado.id_paciente);

      if (obsError) throw obsError;
    }

    return new Response(
      JSON.stringify({
        success: true,
        seguimiento: seguimientoActualizado,
        message: 'Seguimiento actualizado exitosamente'
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
