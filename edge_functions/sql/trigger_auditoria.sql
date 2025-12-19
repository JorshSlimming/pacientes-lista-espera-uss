-- Trigger para auditoría automática en cambios de paciente
CREATE OR REPLACE FUNCTION registrar_auditoria_paciente()
RETURNS TRIGGER AS $$
DECLARE
    campo TEXT;
    valor_anterior TEXT;
    valor_nuevo TEXT;
    rut_usuario TEXT;
BEGIN
    -- Obtener el RUT del usuario desde el contexto de la aplicación
    -- En producción deberías pasar esto desde la aplicación
    rut_usuario := current_setting('app.current_user', TRUE);
    
    IF rut_usuario IS NULL THEN
        rut_usuario := 'SISTEMA';
    END IF;

    -- Comparar cada campo y registrar cambios
    IF OLD.nombre IS DISTINCT FROM NEW.nombre THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'nombre', OLD.nombre, NEW.nombre, rut_usuario, NEW.rut_paciente);
    END IF;

    IF OLD.primer_apellido IS DISTINCT FROM NEW.primer_apellido THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'primer_apellido', OLD.primer_apellido, NEW.primer_apellido, rut_usuario, NEW.rut_paciente);
    END IF;

    IF OLD.segundo_apellido IS DISTINCT FROM NEW.segundo_apellido THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'segundo_apellido', OLD.segundo_apellido, NEW.segundo_apellido, rut_usuario, NEW.rut_paciente);
    END IF;

    IF OLD.fecha_nacimiento IS DISTINCT FROM NEW.fecha_nacimiento THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'fecha_nacimiento', OLD.fecha_nacimiento::TEXT, NEW.fecha_nacimiento::TEXT, rut_usuario, NEW.rut_paciente);
    END IF;

    IF OLD.obs IS DISTINCT FROM NEW.obs THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'obs', OLD.obs, NEW.obs, rut_usuario, NEW.rut_paciente);
    END IF;

    IF OLD.id_comuna IS DISTINCT FROM NEW.id_comuna THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'id_comuna', OLD.id_comuna::TEXT, NEW.id_comuna::TEXT, rut_usuario, NEW.rut_paciente);
    END IF;

    IF OLD.id_origen IS DISTINCT FROM NEW.id_origen THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'id_origen', OLD.id_origen::TEXT, NEW.id_origen::TEXT, rut_usuario, NEW.rut_paciente);
    END IF;

    IF OLD.id_institucion_convenio IS DISTINCT FROM NEW.id_institucion_convenio THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'id_institucion_convenio', OLD.id_institucion_convenio::TEXT, NEW.id_institucion_convenio::TEXT, rut_usuario, NEW.rut_paciente);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear trigger
DROP TRIGGER IF EXISTS trigger_auditoria_paciente ON paciente;
CREATE TRIGGER trigger_auditoria_paciente
    AFTER UPDATE ON paciente
    FOR EACH ROW
    EXECUTE FUNCTION registrar_auditoria_paciente();

-- Trigger similar para seguimiento
CREATE OR REPLACE FUNCTION registrar_auditoria_seguimiento()
RETURNS TRIGGER AS $$
DECLARE
    rut_usuario TEXT;
BEGIN
    rut_usuario := current_setting('app.current_user', TRUE);
    
    IF rut_usuario IS NULL THEN
        rut_usuario := 'SISTEMA';
    END IF;

    IF OLD.fecha_primera_llamada IS DISTINCT FROM NEW.fecha_primera_llamada THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'fecha_primera_llamada', OLD.fecha_primera_llamada::TEXT, NEW.fecha_primera_llamada::TEXT, rut_usuario, NEW.id_paciente);
    END IF;

    IF OLD.fecha_segunda_llamada IS DISTINCT FROM NEW.fecha_segunda_llamada THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'fecha_segunda_llamada', OLD.fecha_segunda_llamada::TEXT, NEW.fecha_segunda_llamada::TEXT, rut_usuario, NEW.id_paciente);
    END IF;

    IF OLD.fecha_tercera_llamada IS DISTINCT FROM NEW.fecha_tercera_llamada THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'fecha_tercera_llamada', OLD.fecha_tercera_llamada::TEXT, NEW.fecha_tercera_llamada::TEXT, rut_usuario, NEW.id_paciente);
    END IF;

    IF OLD.agendado IS DISTINCT FROM NEW.agendado THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'agendado', OLD.agendado, NEW.agendado, rut_usuario, NEW.id_paciente);
    END IF;

    IF OLD.fecha_citacion IS DISTINCT FROM NEW.fecha_citacion THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'fecha_citacion', OLD.fecha_citacion::TEXT, NEW.fecha_citacion::TEXT, rut_usuario, NEW.id_paciente);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear trigger para seguimiento
DROP TRIGGER IF EXISTS trigger_auditoria_seguimiento ON seguimiento;
CREATE TRIGGER trigger_auditoria_seguimiento
    AFTER UPDATE ON seguimiento
    FOR EACH ROW
    EXECUTE FUNCTION registrar_auditoria_seguimiento();
