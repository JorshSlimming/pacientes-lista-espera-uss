import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import * as bcrypt from "https://deno.land/x/bcrypt@v0.4.1/mod.ts";

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    const { rut, clave } = await req.json();

    if (!rut || !clave) {
      return new Response(
        JSON.stringify({ error: 'RUT y clave son requeridos' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? ''
    );

    // Buscar trabajador por RUT
    const { data: trabajador, error } = await supabaseClient
      .from('trabajador')
      .select('rut_trabajador, rol, nombre, apellido, clave, activo')
      .eq('rut_trabajador', rut)
      .single();

    if (error || !trabajador) {
      return new Response(
        JSON.stringify({ error: 'Credenciales inválidas' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Verificar si el usuario está activo
    if (!trabajador.activo) {
      return new Response(
        JSON.stringify({ error: 'Usuario deshabilitado. Contacte al administrador' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Validar contraseña con bcrypt
    const passwordMatch = await bcrypt.compare(clave, trabajador.clave);
    
    if (!passwordMatch) {
      return new Response(
        JSON.stringify({ error: 'Credenciales inválidas' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Retornar datos del usuario sin la contraseña ni el campo activo
    const { clave: _, activo: __, ...userData } = trabajador;

    return new Response(
      JSON.stringify({
        success: true,
        user: userData,
        message: 'Autenticación exitosa'
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
