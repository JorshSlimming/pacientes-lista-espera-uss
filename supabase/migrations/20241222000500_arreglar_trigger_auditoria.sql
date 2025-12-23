-- ============================================
-- MIGRACIÓN: Arreglar trigger de auditoría
-- Fecha: 2024-12-22
-- Descripción: El trigger debe usar id_ejecutivo_ingreso del seguimiento
-- en lugar de intentar obtener el usuario desde configuración
-- ============================================

-- 1. Eliminar trabajador SISTEMA si existe
DELETE FROM trabajador WHERE id_trabajador = 0;

-- 2. Reemplazar función de auditoría para usar id_ejecutivo_ingreso
CREATE OR REPLACE FUNCTION registrar_auditoria_seguimiento()
RETURNS TRIGGER AS $$
BEGIN
    -- Auditar fecha_ingreso en INSERT
    IF TG_OP = 'INSERT' THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
        VALUES (CURRENT_TIMESTAMP, 'fecha_ingreso', NULL, NEW.fecha_ingreso::TEXT, NEW.id_ejecutivo_ingreso, NEW.id_seguimiento);
        
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
        VALUES (CURRENT_TIMESTAMP, 'creacion_seguimiento', NULL, 'NUEVO', NEW.id_ejecutivo_ingreso, NEW.id_seguimiento);
    END IF;

    -- Auditar cambios en UPDATE
    IF TG_OP = 'UPDATE' THEN
        IF OLD.fecha_primera_llamada IS DISTINCT FROM NEW.fecha_primera_llamada THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'fecha_primera_llamada', OLD.fecha_primera_llamada::TEXT, NEW.fecha_primera_llamada::TEXT, NEW.id_ejecutivo_ingreso, NEW.id_seguimiento);
        END IF;

        IF OLD.fecha_segunda_llamada IS DISTINCT FROM NEW.fecha_segunda_llamada THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'fecha_segunda_llamada', OLD.fecha_segunda_llamada::TEXT, NEW.fecha_segunda_llamada::TEXT, NEW.id_ejecutivo_ingreso, NEW.id_seguimiento);
        END IF;

        IF OLD.fecha_tercera_llamada IS DISTINCT FROM NEW.fecha_tercera_llamada THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'fecha_tercera_llamada', OLD.fecha_tercera_llamada::TEXT, NEW.fecha_tercera_llamada::TEXT, NEW.id_ejecutivo_ingreso, NEW.id_seguimiento);
        END IF;

        IF OLD.agendado IS DISTINCT FROM NEW.agendado THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'agendado', OLD.agendado, NEW.agendado, NEW.id_ejecutivo_ingreso, NEW.id_seguimiento);
        END IF;

        IF OLD.fecha_citacion IS DISTINCT FROM NEW.fecha_citacion THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'fecha_citacion', OLD.fecha_citacion::TEXT, NEW.fecha_citacion::TEXT, NEW.id_ejecutivo_ingreso, NEW.id_seguimiento);
        END IF;

        IF OLD.numero_llamado IS DISTINCT FROM NEW.numero_llamado THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'numero_llamado', OLD.numero_llamado::TEXT, NEW.numero_llamado::TEXT, NEW.id_ejecutivo_ingreso, NEW.id_seguimiento);
        END IF;

        IF OLD.id_especialidad IS DISTINCT FROM NEW.id_especialidad THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'id_especialidad', OLD.id_especialidad::TEXT, NEW.id_especialidad::TEXT, NEW.id_ejecutivo_ingreso, NEW.id_seguimiento);
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 3. Comentario
COMMENT ON FUNCTION registrar_auditoria_seguimiento() IS 'Función de auditoría que usa id_ejecutivo_ingreso del seguimiento como id_trabajador';
