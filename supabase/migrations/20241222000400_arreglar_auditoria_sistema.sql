-- ============================================
-- MIGRACIÓN: Arreglar auditoría para manejar SISTEMA
-- Fecha: 2024-12-22
-- Descripción: Crear trabajador especial para SISTEMA y 
-- actualizar trigger para manejar correctamente el id_trabajador
-- ============================================

-- 1. Crear trabajador especial para SISTEMA (si no existe)
INSERT INTO trabajador (id_trabajador, rut, nombre, apellido, rol, activo)
VALUES (0, '00000000-0', 'Sistema', 'Automático', 'jefe', true)
ON CONFLICT (id_trabajador) DO NOTHING;

-- 2. Reemplazar función de auditoría para manejar correctamente SISTEMA
CREATE OR REPLACE FUNCTION registrar_auditoria_seguimiento()
RETURNS TRIGGER AS $$
DECLARE
    rut_usuario TEXT;
    id_trabajador_actual INTEGER;
BEGIN
    -- Obtener el RUT del usuario desde el contexto de la aplicación
    rut_usuario := current_setting('app.current_user', TRUE);
    
    IF rut_usuario IS NULL OR rut_usuario = 'SISTEMA' THEN
        -- Usar trabajador SISTEMA (id = 0)
        id_trabajador_actual := 0;
    ELSE
        -- Buscar el id_trabajador por RUT
        SELECT t.id_trabajador INTO id_trabajador_actual
        FROM trabajador t
        WHERE t.rut = rut_usuario;
        
        -- Si no se encuentra, usar SISTEMA
        IF id_trabajador_actual IS NULL THEN
            id_trabajador_actual := 0;
        END IF;
    END IF;

    -- Auditar fecha_ingreso
    IF TG_OP = 'INSERT' THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
        VALUES (CURRENT_TIMESTAMP, 'fecha_ingreso', NULL, NEW.fecha_ingreso::TEXT, id_trabajador_actual, NEW.id_seguimiento);
        
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
        VALUES (CURRENT_TIMESTAMP, 'creacion_seguimiento', NULL, 'NUEVO', id_trabajador_actual, NEW.id_seguimiento);
    END IF;

    -- Auditar cambios en UPDATE
    IF TG_OP = 'UPDATE' THEN
        IF OLD.fecha_primera_llamada IS DISTINCT FROM NEW.fecha_primera_llamada THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'fecha_primera_llamada', OLD.fecha_primera_llamada::TEXT, NEW.fecha_primera_llamada::TEXT, id_trabajador_actual, NEW.id_seguimiento);
        END IF;

        IF OLD.fecha_segunda_llamada IS DISTINCT FROM NEW.fecha_segunda_llamada THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'fecha_segunda_llamada', OLD.fecha_segunda_llamada::TEXT, NEW.fecha_segunda_llamada::TEXT, id_trabajador_actual, NEW.id_seguimiento);
        END IF;

        IF OLD.fecha_tercera_llamada IS DISTINCT FROM NEW.fecha_tercera_llamada THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'fecha_tercera_llamada', OLD.fecha_tercera_llamada::TEXT, NEW.fecha_tercera_llamada::TEXT, id_trabajador_actual, NEW.id_seguimiento);
        END IF;

        IF OLD.agendado IS DISTINCT FROM NEW.agendado THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'agendado', OLD.agendado, NEW.agendado, id_trabajador_actual, NEW.id_seguimiento);
        END IF;

        IF OLD.fecha_citacion IS DISTINCT FROM NEW.fecha_citacion THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'fecha_citacion', OLD.fecha_citacion::TEXT, NEW.fecha_citacion::TEXT, id_trabajador_actual, NEW.id_seguimiento);
        END IF;

        IF OLD.numero_llamado IS DISTINCT FROM NEW.numero_llamado THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'numero_llamado', OLD.numero_llamado::TEXT, NEW.numero_llamado::TEXT, id_trabajador_actual, NEW.id_seguimiento);
        END IF;

        IF OLD.id_especialidad IS DISTINCT FROM NEW.id_especialidad THEN
            INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_seguimiento)
            VALUES (CURRENT_TIMESTAMP, 'id_especialidad', OLD.id_especialidad::TEXT, NEW.id_especialidad::TEXT, id_trabajador_actual, NEW.id_seguimiento);
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 3. Comentarios
COMMENT ON FUNCTION registrar_auditoria_seguimiento() IS 'Función mejorada que maneja correctamente el id_trabajador, usando trabajador SISTEMA (id=0) cuando no hay usuario autenticado';
