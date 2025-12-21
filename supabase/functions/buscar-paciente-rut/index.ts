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
    const { rut } = await req.json();

    if (!rut) {
      return new Response(
        JSON.stringify({ error: 'RUT es requerido' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? ''
    );

    // Limpiar RUT (quitar puntos y guiones)
    const rutLimpio = rut.replace(/\./g, '').replace(/-/g, '');

    // Buscar paciente con todos sus datos relacionados
    const { data: paciente, error: pacienteError } = await supabaseClient
      .from('paciente')
      .select(`
        *,
        contacto:id_contacto (*),
        comuna:id_comuna (*),
        origen:id_origen (*),
        institucion:id_institucion_convenio (*),
        seguimientos:seguimiento (
          *,
          especialidad:id_especialidad (*)
        )
      `)
      .eq('rut', rutLimpio)
      .single();

    if (pacienteError || !paciente) {
      return new Response(
        JSON.stringify({ error: 'Paciente no encontrado' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    return new Response(
      JSON.stringify({ success: true, paciente }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );

  } catch (error) {
    return new Response(
      JSON.stringify({ error: error.message }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});
