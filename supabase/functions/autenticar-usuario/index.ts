import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

function limpiarRut(rut: string): string {
  return rut.replace(/\./g, '').replace(/-/g, '');
}

Deno.serve(async (req) => {
  // Log inicial para confirmar que la función se ejecuta
  console.log('🚀 Función iniciada - Method:', req.method);
  console.log('🔑 Headers:', Object.fromEntries(req.headers.entries()));
  
  if (req.method === 'OPTIONS') {
    console.log('✅ Respondiendo a OPTIONS');
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    console.log('📥 Iniciando autenticación...');
    const body = await req.text();
    console.log('📦 Body:', body);
    
    const { rut, clave } = JSON.parse(body);
    console.log('📝 RUT recibido:', rut);
    console.log('🔐 Clave:', clave ? '***' : 'NO');

    if (!rut || !clave) {
      console.log('❌ Faltan parámetros');
      return new Response(
        JSON.stringify({ error: 'RUT y contraseña son requeridos' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const rutLimpio = limpiarRut(rut);
    console.log('🧹 RUT limpio:', rutLimpio);

    // Crear cliente admin para consultar trabajador y auth.users
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    );

    // Crear cliente anon para autenticar
    const supabaseAnon = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? ''
    );

    // 1. Buscar trabajador por RUT
    console.log('🔍 Buscando trabajador...');
    const { data: trabajador, error: dbError } = await supabaseAdmin
      .from('trabajador')
      .select('id_trabajador, rut, rol, nombre, apellido, activo, auth_uid')
      .eq('rut', rutLimpio)
      .single();

    if (dbError || !trabajador) {
      console.log('❌ Error DB o trabajador no encontrado:', dbError);
      return new Response(
        JSON.stringify({ error: 'RUT no registrado en el sistema', details: dbError?.message }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    console.log('✅ Trabajador encontrado:', trabajador.nombre);
    console.log('🔑 auth_uid:', trabajador.auth_uid);

    if (!trabajador.auth_uid) {
      return new Response(
        JSON.stringify({ error: 'Usuario no vinculado. Contacte al administrador' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    if (!trabajador.activo) {
      return new Response(
        JSON.stringify({ error: 'Usuario deshabilitado. Contacte al administrador' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // 2. Obtener email del usuario en auth.users
    console.log('📧 Obteniendo email de auth.users...');
    const { data: { user: authUser }, error: authUserError } = await supabaseAdmin.auth.admin.getUserById(trabajador.auth_uid);

    if (authUserError || !authUser || !authUser.email) {
      console.log('❌ Error obteniendo usuario auth:', authUserError);
      return new Response(
        JSON.stringify({ error: 'Error al obtener datos de autenticación', details: authUserError?.message }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    console.log('✅ Email encontrado:', authUser.email);

    // 3. Autenticar con el email obtenido
    console.log('🔐 Autenticando con Supabase Auth...');
    const { data: authData, error: authError } = await supabaseAnon.auth.signInWithPassword({
      email: authUser.email,
      password: clave,
    });

    if (authError || !authData.user) {
      console.log('❌ Error de autenticación:', authError?.message);
      return new Response(
        JSON.stringify({ error: 'Contraseña incorrecta', details: authError?.message }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    console.log('✅ Autenticación exitosa!');
    console.log('📦 Session recibida:', authData.session ? 'SÍ' : 'NO');
    console.log('🔑 Access token:', authData.session?.access_token ? 'Presente' : 'Ausente');

    // Remover auth_uid de la respuesta
    const { auth_uid, ...trabajadorSinAuthUid } = trabajador;

    // Retornar datos del usuario (JWT ya está en authData.session)
    return new Response(
      JSON.stringify({
        success: true,
        user: trabajadorSinAuthUid,
        session: authData.session, // JWT de Supabase Auth
        message: 'Autenticación exitosa'
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );

  } catch (error) {
    console.error('💥 Error general en autenticación:', error);
    return new Response(
      JSON.stringify({ error: 'Error en autenticación', details: error.message }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});
