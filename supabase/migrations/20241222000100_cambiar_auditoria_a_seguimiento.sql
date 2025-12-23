-- ============================================
-- MIGRACIÓN: Cambiar auditoría de paciente a seguimiento
-- Fecha: 2024-12-22
-- Descripción: La tabla auditoria ahora se conecta a seguimiento 
-- en vez de paciente, ya que en seguimiento se registran todos 
-- los cambios (llamados, agendamientos, etc.)
-- ============================================

-- 1. Eliminar triggers existentes
DROP TRIGGER IF EXISTS trigger_auditoria_paciente ON paciente;
DROP TRIGGER IF EXISTS trigger_auditoria_seguimiento ON seguimiento;

-- 2. Eliminar funciones existentes
DROP FUNCTION IF EXISTS registrar_auditoria_paciente();
DROP FUNCTION IF EXISTS registrar_auditoria_seguimiento();

-- 3. Eliminar tabla auditoria existente
DROP TABLE IF EXISTS auditoria CASCADE;

-- 4. Crear nueva tabla auditoria conectada a seguimiento
CREATE TABLE auditoria (
    id_auditoria SERIAL PRIMARY KEY,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    campo_modificado VARCHAR(50) NOT NULL,
    valor_nuevo TEXT,
    valor_modificado TEXT,
    id_trabajador INTEGER NOT NULL REFERENCES trabajador(id_trabajador) ON DELETE CASCADE,
    id_seguimiento INTEGER NOT NULL REFERENCES seguimiento(id_seguimiento) ON DELETE CASCADE
);

-- 5. Crear índices para optimización
CREATE INDEX idx_auditoria_seguimiento ON auditoria(id_seguimiento);
CREATE INDEX idx_auditoria_trabajador ON auditoria(id_trabajador);
CREATE INDEX idx_auditoria_fecha ON auditoria(fecha_modificacion);

-- 6. Crear función para auditar cambios en SEGUIMIENTO
CREATE OR REPLACE FUNCTION registrar_auditoria_seguimiento()
RETURNS TRIGGER AS $$
DECLARE
    rut_usuario TEXT;
BEGIN
    -- Obtener el RUT del usuario desde el contexto de la aplicación
    rut_usuario := current_setting('app.current_user', TRUE);
    
    IF rut_usuario IS NULL THEN
        rut_usuario := 'SISTEMA';
    END IF;

    -- Auditar fecha_ingreso
    IF TG_OP = 'INSERT' THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
        VALUES (CURRENT_TIMESTAMP, 'fecha_ingreso', NULL, NEW.fecha_ingreso::TEXT, rut_usuario::INTEGER, NEW.id_seguimiento);
        
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
        VALUES (CURRENT_TIMESTAMP, 'creacion_seguimiento', NULL, 'NUEVO', rut_usuario::INTEGER, NEW.id_seguimiento);
    END IF;

    -- Auditar cambios en UPDATE
    IF TG_OP = 'UPDATE' THEN
        IF OLD.fecha_primera_llamada IS DISTINCT FROM NEW.fecha_primera_llamada THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'fecha_primera_llamada', OLD.fecha_primera_llamada::TEXT, NEW.fecha_primera_llamada::TEXT, rut_usuario::INTEGER, NEW.id_seguimiento);
        END IF;

        IF OLD.fecha_segunda_llamada IS DISTINCT FROM NEW.fecha_segunda_llamada THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'fecha_segunda_llamada', OLD.fecha_segunda_llamada::TEXT, NEW.fecha_segunda_llamada::TEXT, rut_usuario::INTEGER, NEW.id_seguimiento);
        END IF;

        IF OLD.fecha_tercera_llamada IS DISTINCT FROM NEW.fecha_tercera_llamada THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'fecha_tercera_llamada', OLD.fecha_tercera_llamada::TEXT, NEW.fecha_tercera_llamada::TEXT, rut_usuario::INTEGER, NEW.id_seguimiento);
        END IF;

        IF OLD.agendado IS DISTINCT FROM NEW.agendado THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'agendado', OLD.agendado, NEW.agendado, rut_usuario::INTEGER, NEW.id_seguimiento);
        END IF;

        IF OLD.fecha_citacion IS DISTINCT FROM NEW.fecha_citacion THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'fecha_citacion', OLD.fecha_citacion::TEXT, NEW.fecha_citacion::TEXT, rut_usuario::INTEGER, NEW.id_seguimiento);
        END IF;

        IF OLD.numero_llamado IS DISTINCT FROM NEW.numero_llamado THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'numero_llamado', OLD.numero_llamado::TEXT, NEW.numero_llamado::TEXT, rut_usuario::INTEGER, NEW.id_seguimiento);
        END IF;

        IF OLD.id_especialidad IS DISTINCT FROM NEW.id_especialidad THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'id_especialidad', OLD.id_especialidad::TEXT, NEW.id_especialidad::TEXT, rut_usuario::INTEGER, NEW.id_seguimiento);
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 7. Crear trigger para SEGUIMIENTO
CREATE TRIGGER trigger_auditoria_seguimiento
    AFTER INSERT OR UPDATE ON seguimiento
    FOR EACH ROW
    EXECUTE FUNCTION registrar_auditoria_seguimiento();

-- 8. Comentarios para documentación
COMMENT ON TABLE auditoria IS 'Tabla de auditoría que registra todos los cambios en seguimientos (llamados, agendamientos, etc.)';
COMMENT ON COLUMN auditoria.id_seguimiento IS 'Referencia al seguimiento modificado';
COMMENT ON COLUMN auditoria.campo_modificado IS 'Nombre del campo que fue modificado';
COMMENT ON COLUMN auditoria.valor_modificado IS 'Valor anterior del campo';
COMMENT ON COLUMN auditoria.valor_nuevo IS 'Nuevo valor del campo';
COMMENT ON COLUMN auditoria.id_trabajador IS 'ID del trabajador que realizó el cambio';
