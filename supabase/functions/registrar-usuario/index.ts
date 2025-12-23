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

    // Verificar autenticación y rol de jefe
    const trabajador = await verificarAutenticacion(req, supabaseClient);
    verificarRol(trabajador, ['jefe']);

    const { rut, rol, nombre, apellido, email, clave } = await req.json();

    if (!rut || !rol || !nombre || !apellido || !email || !clave) {
      return new Response(
        JSON.stringify({ error: 'Todos los campos son requeridos' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Validar rol
    if (!['jefe', 'usuario'].includes(rol)) {
      return new Response(
        JSON.stringify({ error: 'Rol inválido. Debe ser "jefe" o "usuario"' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Limpiar RUT (quitar puntos y guiones)
    const rutLimpio = rut.replace(/\./g, '').replace(/-/g, '');

    // Usar SERVICE_ROLE para operaciones de admin
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    );

    // Verificar si el RUT ya existe
    const { data: existente } = await supabaseAdmin
      .from('trabajador')
      .select('id_trabajador')
      .eq('rut', rutLimpio)
      .single();

    if (existente) {
      return new Response(
        JSON.stringify({ error: 'El RUT ya está registrado en el sistema' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // 1. Crear usuario en Supabase Auth
    const { data: authUser, error: authError } = await supabaseAdmin.auth.admin.createUser({
      email: email,
      password: clave,
      email_confirm: true // Confirmar email automáticamente
    });

    if (authError) throw authError;

    // 2. Crear trabajador vinculado al auth_uid
    const { data: nuevoTrabajador, error: createError } = await supabaseAdmin
      .from('trabajador')
      .insert({
        rut: rutLimpio,
        rol,
        nombre,
        apellido,
        auth_uid: authUser.user.id,
        activo: true
      })
      .select('id_trabajador, rut, rol, nombre, apellido')
      .single();

    if (createError) {
      // Si falla la creación del trabajador, eliminar el usuario de auth
      await supabaseAdmin.auth.admin.deleteUser(authUser.user.id);
      throw createError;
    }

    return new Response(
      JSON.stringify({
        success: true,
        trabajador: nuevoTrabajador,
        message: 'Usuario creado exitosamente'
      }),
      { status: 201, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );

  } catch (error) {
    return new Response(
      JSON.stringify({ error: error.message }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});
