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
    const { rut_paciente, userRole } = await req.json();

    // Solo AdminJefe puede ver el historial completo
    if (userRole !== 'jefe') {
      return new Response(
        JSON.stringify({ error: 'No tienes permisos para ver el historial de cambios' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? ''
    );

    const { data: historial, error } = await supabaseClient
      .from('auditoria')
      .select(`
        *,
        trabajador:id_trabajador (
          nombre,
          apellido
        )
      `)
      .eq('id_paciente', rut_paciente)
      .order('fecha_modificacion', { ascending: false });

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
