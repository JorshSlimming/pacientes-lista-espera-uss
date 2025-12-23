-- Agregar campos para manejo de sesiones
ALTER TABLE trabajador 
ADD COLUMN IF NOT EXISTS session_token TEXT,
ADD COLUMN IF NOT EXISTS session_expires_at TIMESTAMP WITH TIME ZONE;

-- Crear índice para búsquedas rápidas por token
CREATE INDEX IF NOT EXISTS idx_trabajador_session_token ON trabajador(session_token);
