-- Verificar que el trabajador tenga auth_uid
SELECT 
  t.id_trabajador,
  t.rut,
  t.nombre,
  t.apellido,
  t.activo,
  t.auth_uid,
  CASE 
    WHEN t.auth_uid IS NULL THEN '❌ NO VINCULADO'
    ELSE '✅ VINCULADO'
  END as estado_vinculacion
FROM trabajador t
WHERE t.rut = '213091727';

-- Verificar si existe el usuario en auth.users
SELECT 
  id,
  email,
  created_at,
  email_confirmed_at
FROM auth.users
WHERE id = (SELECT auth_uid FROM trabajador WHERE rut = '213091727');
