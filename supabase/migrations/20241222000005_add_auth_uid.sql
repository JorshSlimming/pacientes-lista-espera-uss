-- Agregar columna auth_uid para vincular con Supabase Auth
ALTER TABLE trabajador
ADD COLUMN auth_uid UUID UNIQUE REFERENCES auth.users(id) ON DELETE SET NULL;

-- Crear índice para búsquedas rápidas
CREATE INDEX idx_trabajador_auth_uid ON trabajador(auth_uid);

-- Eliminar columnas de session token (ya no se usan)
ALTER TABLE trabajador
DROP COLUMN IF EXISTS session_token,
DROP COLUMN IF EXISTS session_expires_at;

-- Comentarios
COMMENT ON COLUMN trabajador.auth_uid IS 'UUID del usuario en auth.users de Supabase Auth';
