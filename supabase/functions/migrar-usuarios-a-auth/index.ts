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
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    );

    // Obtener todos los trabajadores sin auth_uid
    const { data: trabajadores, error: fetchError } = await supabaseAdmin
      .from('trabajador')
      .select('id_trabajador, rut')
      .is('auth_uid', null);

    if (fetchError) throw fetchError;

    const resultados = [];

    for (const trabajador of trabajadores || []) {
      try {
        // Crear usuario en Supabase Auth
        const { data: authUser, error: authError } = await supabaseAdmin.auth.admin.createUser({
          email: `${trabajador.rut}@uss.cl`,
          password: 'USS2025', // Contraseña temporal - DEBEN CAMBIARLA
          email_confirm: true
        });

        if (authError) throw authError;

        // Vincular auth_uid con trabajador
        const { error: updateError } = await supabaseAdmin
          .from('trabajador')
          .update({ auth_uid: authUser.user.id })
          .eq('id_trabajador', trabajador.id_trabajador);

        if (updateError) throw updateError;

        resultados.push({ 
          rut: trabajador.rut, 
          status: 'OK', 
          email: `${trabajador.rut}@uss.cl`,
          password: 'USS2025'
        });
      } catch (error) {
        resultados.push({ 
          rut: trabajador.rut, 
          status: 'ERROR', 
          error: error.message 
        });
      }
    }

    return new Response(
      JSON.stringify({ 
        success: true,
        total: resultados.length,
        resultados 
      }, null, 2),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );

  } catch (error) {
    return new Response(
      JSON.stringify({ error: error.message }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});
