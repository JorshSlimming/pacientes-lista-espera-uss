-- Verificar trabajador y su vinculación
SELECT 
  t.id_trabajador,
  t.rut,
  t.nombre,
  t.apellido,
  t.rol,
  t.activo,
  t.auth_uid,
  au.email as email_vinculado,
  au.email_confirmed_at,
  au.created_at as auth_creado
FROM trabajador t
LEFT JOIN auth.users au ON t.auth_uid = au.id
WHERE t.rut = '213091727';
