-- ============================================
-- MIGRACIÓN: Limpiar todos los datos de pacientes
-- Fecha: 2024-12-22
-- Descripción: Elimina todos los datos de pacientes y relacionados
-- ============================================

-- Desactivar temporalmente los triggers de auditoría para evitar registros innecesarios
ALTER TABLE seguimiento DISABLE TRIGGER trigger_auditoria_seguimiento;

-- 1. Eliminar todos los registros de auditoría
DELETE FROM auditoria;

-- 2. Eliminar todos los seguimientos (esto eliminará automáticamente auditorías por CASCADE)
DELETE FROM seguimiento;

-- 3. Eliminar todos los pacientes (esto eliminará seguimientos por CASCADE)
DELETE FROM paciente;

-- 4. Eliminar todos los contactos huérfanos (sin pacientes)
DELETE FROM contacto;

-- Reactivar triggers de auditoría
ALTER TABLE seguimiento ENABLE TRIGGER trigger_auditoria_seguimiento;

-- Reiniciar las secuencias para que los IDs comiencen desde 1
-- Nota: Los nombres de secuencias se obtienen del esquema real
DO $$
BEGIN
    -- Reiniciar secuencia de paciente
    PERFORM setval(pg_get_serial_sequence('paciente', 'id_paciente'), 1, false);
    
    -- Reiniciar secuencia de seguimiento
    PERFORM setval(pg_get_serial_sequence('seguimiento', 'id_seguimiento'), 1, false);
    
    -- Reiniciar secuencia de contacto
    PERFORM setval(pg_get_serial_sequence('contacto', 'id_contacto'), 1, false);
    
    -- Reiniciar secuencia de auditoria
    PERFORM setval(pg_get_serial_sequence('auditoria', 'id_auditoria'), 1, false);
END $$;

-- Comentario
COMMENT ON TABLE paciente IS 'Tabla de pacientes - Limpiada el 2024-12-22';
