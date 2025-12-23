-- DIAGNÓSTICO: Verificar estado del usuario en Supabase Auth

-- 1. Ver el usuario en auth.users
SELECT 
  id,
  email,
  email_confirmed_at,
  created_at,
  confirmation_sent_at,
  confirmed_at,
  last_sign_in_at
FROM auth.users
WHERE email = '213091727@uss.cl';

-- Si aparece NULL en email_confirmed_at, el usuario NO está confirmado
-- Solución: Confirmar manualmente

-- 2. Ver el trabajador y su vinculación
SELECT 
  t.id_trabajador,
  t.rut,
  t.nombre,
  t.apellido,
  t.rol,
  t.auth_uid,
  t.activo,
  au.email,
  au.email_confirmed_at,
  au.confirmed_at
FROM trabajador t
LEFT JOIN auth.users au ON au.id = t.auth_uid
WHERE t.rut = '213091727';

-- 3. Si el usuario existe pero NO está confirmado, ejecutar esto:
UPDATE auth.users
SET 
  email_confirmed_at = NOW(),
  confirmed_at = NOW()
WHERE email = '213091727@uss.cl';

-- 4. IMPORTANTE: Si no aparece ningún usuario en auth.users, significa que no se creó correctamente
-- En ese caso, ve al Dashboard y créalo nuevamente:
-- Authentication → Users → Add user
-- - Email: 213091727@uss.cl
-- - Password: USS2025
-- - Auto Confirm User: ✓ ACTIVAR
