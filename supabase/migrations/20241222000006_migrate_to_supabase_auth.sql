-- Script para migrar trabajadores existentes a Supabase Auth
-- EJECUTAR MANUALMENTE desde el Dashboard de Supabase o CLI

-- Para cada trabajador existente, necesitas crear un usuario en auth.users
-- Esto NO se puede hacer con SQL directo, debe hacerse via Admin API

-- OPCIÓN 1: Usar Supabase CLI (RECOMENDADO)
-- Crea un script temporal en edge functions:

/*
import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

serve(async (req) => {
  const supabaseAdmin = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
  );

  // Obtener todos los trabajadores
  const { data: trabajadores } = await supabaseAdmin
    .from('trabajador')
    .select('id_trabajador, rut, clave')
    .is('auth_uid', null); // Solo los que no tienen auth_uid

  const resultados = [];

  for (const t of trabajadores || []) {
    try {
      // Crear usuario en Supabase Auth
      const { data: authUser, error } = await supabaseAdmin.auth.admin.createUser({
        email: `${t.rut}@uss.cl`,
        password: 'USS2025', // Contraseña temporal - deben cambiarla
        email_confirm: true
      });

      if (error) throw error;

      // Vincular auth_uid con trabajador
      await supabaseAdmin
        .from('trabajador')
        .update({ auth_uid: authUser.user.id })
        .eq('id_trabajador', t.id_trabajador);

      resultados.push({ 
        rut: t.rut, 
        status: 'OK', 
        email: `${t.rut}@uss.cl` 
      });
    } catch (error) {
      resultados.push({ 
        rut: t.rut, 
        status: 'ERROR', 
        error: error.message 
      });
    }
  }

  return new Response(JSON.stringify(resultados, null, 2));
});
*/

-- OPCIÓN 2: Crear manualmente desde el Dashboard
-- 1. Ir a Authentication > Users
-- 2. Para cada trabajador:
--    - Email: <rut>@uss.cl (sin puntos ni guiones)
--    - Password: USS2025 (temporal)
--    - Copiar UUID generado
-- 3. Actualizar trabajador:
--    UPDATE trabajador SET auth_uid = '<uuid>' WHERE rut = '<rut>';

-- NOTA IMPORTANTE:
-- Después de migrar, puedes eliminar la columna 'clave' de trabajador
-- ya que Supabase Auth maneja las contraseñas
-- ALTER TABLE trabajador DROP COLUMN clave;
