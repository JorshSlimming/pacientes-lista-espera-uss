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

    const body = await req.json();
    const { id_seguimiento, id_paciente, obs, ...cambios } = body;

    console.log('📝 Actualizando seguimiento:', { id_seguimiento, id_paciente, cambios });

    // Determinar qué seguimiento actualizar
    let seguimientoQuery = supabaseClient.from('seguimiento').select('*');
    
    if (id_seguimiento) {
      // Si viene id_seguimiento, usarlo (más preciso)
      seguimientoQuery = seguimientoQuery.eq('id_seguimiento', id_seguimiento);
    } else if (id_paciente) {
      // Si solo viene id_paciente, buscar el seguimiento más reciente
      seguimientoQuery = seguimientoQuery.eq('id_paciente', id_paciente).order('fecha_ingreso', { ascending: false }).limit(1);
    } else {
      throw new Error('Debe proporcionar id_seguimiento o id_paciente');
    }

    const { data: seguimientoActual, error: getError } = await seguimientoQuery.maybeSingle();

    if (getError) throw getError;
    if (!seguimientoActual) throw new Error('Seguimiento no encontrado');

    // Validación: Si se va a agendar, debe tener al menos una llamada
    if (cambios.agendado === 'si') {
      const tieneLlamada = seguimientoActual.fecha_primera_llamada || 
                          seguimientoActual.fecha_segunda_llamada || 
                          seguimientoActual.fecha_tercera_llamada ||
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

    // Solo actualizar seguimiento si hay cambios
    let seguimientoActualizado = seguimientoActual;
    if (Object.keys(camposPermitidos).length > 0) {
      // Actualizar seguimiento
      const { data, error: updateError } = await supabaseClient
        .from('seguimiento')
        .update(camposPermitidos)
        .eq('id_seguimiento', seguimientoActual.id_seguimiento)
        .select()
        .single();

      if (updateError) {
        console.error('❌ Error al actualizar seguimiento:', updateError);
        throw updateError;
      }
      if (!data) {
        throw new Error('No se pudo actualizar el seguimiento');
      }
      seguimientoActualizado = data;
      console.log('✅ Seguimiento actualizado:', seguimientoActualizado);
    }

    // Actualizar OBS en paciente si se proporciona
    if (obs !== undefined) {
      const { error: obsError } = await supabaseClient
        .from('paciente')
        .update({ obs: obs })
        .eq('id_paciente', seguimientoActualizado.id_paciente);

      if (obsError) throw obsError;
      
      // Registrar en auditoría el cambio de OBS
      const { data: { user } } = await supabaseClient.auth.getUser();
      if (user) {
        const { data: trabajador } = await supabaseClient
          .from('trabajador')
          .select('id_trabajador')
          .eq('auth_uid', user.id)
          .single();
        
        if (trabajador) {
          await supabaseClient.from('auditoria').insert({
            id_seguimiento: seguimientoActualizado.id_seguimiento,
            id_trabajador: trabajador.id_trabajador,
            campo_modificado: 'obs',
            valor_nuevo: 'Observación modificada',
            valor_modificado: 'Observación anterior'
          });
        }
      }
    }

    return new Response(
      JSON.stringify({
        data: seguimientoActualizado,
        success: true,
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
