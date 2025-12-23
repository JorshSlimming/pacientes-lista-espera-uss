-- Script para vincular manualmente el usuario Admin Prueba con Supabase Auth
-- EJECUTAR DESDE: Dashboard de Supabase → SQL Editor

-- PASO 1: Crear usuario en Supabase Auth
-- IMPORTANTE: Esto NO se puede hacer con SQL directo, debes hacerlo via Dashboard:
-- 1. Ir a: Authentication → Users → Add user
-- 2. Email: 213091727@uss.cl
-- 3. Password: USS2025 (o la que prefieras)
-- 4. Auto Confirm User: Activar ✓
-- 5. Copiar el UUID generado

-- PASO 2: Una vez creado el usuario en Auth, ejecutar esto reemplazando <UUID_COPIADO>:
UPDATE trabajador
SET auth_uid = '<UUID_COPIADO_AQUI>'::uuid
WHERE rut = '213091727';

-- VERIFICAR QUE FUNCIONÓ:
SELECT 
  t.id_trabajador,
  t.rut,
  t.nombre,
  t.apellido,
  t.rol,
  t.auth_uid,
  t.activo,
  au.email as supabase_email,
  au.created_at as auth_created_at
FROM trabajador t
LEFT JOIN auth.users au ON au.id = t.auth_uid
WHERE t.rut = '213091727';

-- Deberías ver:
-- - auth_uid con el UUID
-- - supabase_email: 213091727@uss.cl
-- - auth_created_at: fecha reciente

-- NOTAS:
-- ✅ La tabla trabajador se mantiene INTACTA
-- ✅ RUT, nombre, apellido, rol: TODO se conserva
-- ✅ La columna 'clave' ya NO se usa (Supabase Auth maneja las contraseñas)
-- ⚠️ Puedes eliminar la columna 'clave' después si quieres: ALTER TABLE trabajador DROP COLUMN clave;
