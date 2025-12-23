-- ============================================
-- MIGRACIÓN: Arreglar RLS para auditoria
-- Fecha: 2024-12-22
-- Descripción: Permitir inserciones en auditoria desde triggers
-- ============================================

-- Eliminar política de solo lectura actual
DROP POLICY IF EXISTS auditoria_jefes_view ON auditoria;

-- Política para que jefes puedan ver toda la auditoría
CREATE POLICY auditoria_jefes_view ON auditoria
  FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM trabajador
      WHERE trabajador.auth_uid = auth.uid()
      AND trabajador.rol = 'jefe'
      AND trabajador.activo = true
    )
  );

-- Política para permitir INSERT desde triggers (sin restricción de usuario)
-- Los triggers se ejecutan con privilegios del sistema, no del usuario
CREATE POLICY auditoria_allow_trigger_insert ON auditoria
  FOR INSERT
  WITH CHECK (true);

-- Comentario
COMMENT ON POLICY auditoria_allow_trigger_insert ON auditoria IS 'Permite inserciones desde triggers sin restricción, ya que los triggers validan el id_trabajador';
