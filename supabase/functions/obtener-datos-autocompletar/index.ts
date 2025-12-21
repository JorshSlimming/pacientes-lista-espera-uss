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

    const { data: paciente, error } = await supabaseClient
      .from('paciente')
      .select(`
        id_paciente,
        rut,
        nombre,
        primer_apellido,
        segundo_apellido,
        fecha_nacimiento,
        contacto:id_contacto (
          correo,
          direccion,
          primer_celular,
          segundo_celular
        )
      `)
      .eq('rut', rutLimpio)
      .single();

    if (error || !paciente) {
      return new Response(
        JSON.stringify({
          success: true,
          existe: false,
          datos: null
        }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    return new Response(
      JSON.stringify({
        success: true,
        existe: true,
        datos: paciente
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
