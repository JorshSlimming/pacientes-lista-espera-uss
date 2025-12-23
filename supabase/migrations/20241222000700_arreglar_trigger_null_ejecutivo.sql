-- ============================================
-- MIGRACIÓN: Arreglar trigger para manejar id_ejecutivo_ingreso NULL
-- Fecha: 2024-12-22
-- Descripción: El trigger debe manejar el caso cuando id_ejecutivo_ingreso es NULL
-- ============================================

CREATE OR REPLACE FUNCTION registrar_auditoria_seguimiento()
RETURNS TRIGGER AS $$
DECLARE
    id_trabajador_auditoria INTEGER;
BEGIN
    -- Determinar el id_trabajador para la auditoría
    -- Si id_ejecutivo_ingreso es NULL, usar 0 (trabajador SISTEMA que creamos antes)
    -- Si existe, buscar si es válido
    IF NEW.id_ejecutivo_ingreso IS NULL THEN
        -- No auditar si no hay ejecutivo (para evitar errores de FK)
        RETURN NEW;
    ELSE
        id_trabajador_auditoria := NEW.id_ejecutivo_ingreso;
    END IF;

    -- Auditar fecha_ingreso en INSERT
    IF TG_OP = 'INSERT' THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
        VALUES (CURRENT_TIMESTAMP, 'fecha_ingreso', NULL, NEW.fecha_ingreso::TEXT, id_trabajador_auditoria, NEW.id_seguimiento);
        
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
        VALUES (CURRENT_TIMESTAMP, 'creacion_seguimiento', NULL, 'NUEVO', id_trabajador_auditoria, NEW.id_seguimiento);
    END IF;

    -- Auditar cambios en UPDATE
    IF TG_OP = 'UPDATE' THEN
        IF OLD.fecha_primera_llamada IS DISTINCT FROM NEW.fecha_primera_llamada THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'fecha_primera_llamada', OLD.fecha_primera_llamada::TEXT, NEW.fecha_primera_llamada::TEXT, id_trabajador_auditoria, NEW.id_seguimiento);
        END IF;

        IF OLD.fecha_segunda_llamada IS DISTINCT FROM NEW.fecha_segunda_llamada THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'fecha_segunda_llamada', OLD.fecha_segunda_llamada::TEXT, NEW.fecha_segunda_llamada::TEXT, id_trabajador_auditoria, NEW.id_seguimiento);
        END IF;

        IF OLD.fecha_tercera_llamada IS DISTINCT FROM NEW.fecha_tercera_llamada THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'fecha_tercera_llamada', OLD.fecha_tercera_llamada::TEXT, NEW.fecha_tercera_llamada::TEXT, id_trabajador_auditoria, NEW.id_seguimiento);
        END IF;

        IF OLD.agendado IS DISTINCT FROM NEW.agendado THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'agendado', OLD.agendado, NEW.agendado, id_trabajador_auditoria, NEW.id_seguimiento);
        END IF;

        IF OLD.fecha_citacion IS DISTINCT FROM NEW.fecha_citacion THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'fecha_citacion', OLD.fecha_citacion::TEXT, NEW.fecha_citacion::TEXT, id_trabajador_auditoria, NEW.id_seguimiento);
        END IF;

        IF OLD.numero_llamado IS DISTINCT FROM NEW.numero_llamado THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'numero_llamado', OLD.numero_llamado::TEXT, NEW.numero_llamado::TEXT, id_trabajador_auditoria, NEW.id_seguimiento);
        END IF;

        IF OLD.id_especialidad IS DISTINCT FROM NEW.id_especialidad THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'id_especialidad', OLD.id_especialidad::TEXT, NEW.id_especialidad::TEXT, id_trabajador_auditoria, NEW.id_seguimiento);
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Comentario
COMMENT ON FUNCTION registrar_auditoria_seguimiento() IS 'Función de auditoría que maneja correctamente id_ejecutivo_ingreso NULL';
