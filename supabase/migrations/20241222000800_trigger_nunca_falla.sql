-- ============================================
-- MIGRACIÓN: Arreglar trigger para que NUNCA falle
-- Fecha: 2024-12-22
-- Descripción: El trigger debe manejar TODOS los casos posibles sin fallar
-- ============================================

CREATE OR REPLACE FUNCTION registrar_auditoria_seguimiento()
RETURNS TRIGGER AS $$
DECLARE
    id_trabajador_auditoria INTEGER;
BEGIN
    -- Determinar el id_trabajador para la auditoría
    -- Si id_ejecutivo_ingreso es NULL o inválido, simplemente no auditar (no fallar)
    IF NEW.id_ejecutivo_ingreso IS NOT NULL THEN
        -- Verificar que el trabajador existe
        IF EXISTS (SELECT 1 FROM trabajador WHERE id_trabajador = NEW.id_ejecutivo_ingreso) THEN
            id_trabajador_auditoria := NEW.id_ejecutivo_ingreso;
        ELSE
            -- Si no existe el trabajador, no auditar pero no fallar
            RETURN NEW;
        END IF;
    ELSE
        -- Si es NULL, no auditar pero no fallar
        RETURN NEW;
    END IF;

    -- Auditar solo si tenemos un id_trabajador válido
    BEGIN
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
    EXCEPTION
        WHEN OTHERS THEN
            -- Si hay cualquier error en auditoría, solo loguearlo pero NO FALLAR el UPDATE
            RAISE WARNING 'Error en auditoría: %', SQLERRM;
            RETURN NEW;
    END;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Comentario
COMMENT ON FUNCTION registrar_auditoria_seguimiento() IS 'Función de auditoría que NUNCA falla - maneja todos los casos y errores silenciosamente';
