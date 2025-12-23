-- Desactivar RLS en tabla trabajador para permitir que las Edge Functions lean los datos
-- Las Edge Functions usan SERVICE_ROLE_KEY que bypass RLS, pero por si acaso

ALTER TABLE trabajador DISABLE ROW LEVEL SECURITY;

-- O si prefieres mantener RLS pero permitir lectura pública:
-- ALTER TABLE trabajador ENABLE ROW LEVEL SECURITY;
-- 
-- DROP POLICY IF EXISTS "Permitir lectura a trabajador para autenticación" ON trabajador;
-- 
-- CREATE POLICY "Permitir lectura a trabajador para autenticación"
--   ON trabajador
--   FOR SELECT
--   USING (true);
