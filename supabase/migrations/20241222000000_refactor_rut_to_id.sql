-- ============================================
-- REFACTORIZACIÓN: CAMBIO DE RUT A ID COMO PK
-- Fecha: 22 de Diciembre 2024
-- ============================================
-- Esta migración cambia las tablas trabajador y paciente para usar ID como PK
-- El RUT se almacenará sin puntos ni guiones para búsquedas más rápidas

-- ============================================
-- PASO 1: ELIMINAR RESTRICCIONES Y TRIGGERS
-- ============================================

-- Eliminar triggers de auditoría
DROP TRIGGER IF EXISTS trigger_auditoria_paciente ON paciente;
DROP TRIGGER IF EXISTS trigger_auditoria_seguimiento ON seguimiento;

-- ============================================
-- PASO 2: MODIFICAR TABLA TRABAJADOR
-- ============================================

-- Crear tabla temporal para trabajador
CREATE TABLE trabajador_new (
    id_trabajador SERIAL PRIMARY KEY,
    rut VARCHAR(12) UNIQUE NOT NULL,  -- RUT sin puntos ni guiones (ej: 213091727)
    rol VARCHAR(10) NOT NULL CHECK (rol IN ('jefe', 'usuario')),
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    clave VARCHAR(255) NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE
);

-- Copiar datos de trabajador a trabajador_new (limpiar RUT)
INSERT INTO trabajador_new (rut, rol, nombre, apellido, clave, activo)
SELECT 
    REPLACE(REPLACE(rut_trabajador, '.', ''), '-', '') as rut,
    rol,
    nombre,
    apellido,
    clave,
    activo
FROM trabajador;

-- ============================================
-- PASO 3: MODIFICAR TABLA PACIENTE
-- ============================================

-- Crear tabla temporal para paciente
CREATE TABLE paciente_new (
    id_paciente SERIAL PRIMARY KEY,
    rut VARCHAR(12) UNIQUE NOT NULL,  -- RUT sin puntos ni guiones
    nombre VARCHAR(50) NOT NULL,
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50),
    fecha_nacimiento DATE NOT NULL,
    obs TEXT,
    id_comuna INTEGER NOT NULL REFERENCES comuna(id_comuna) ON DELETE RESTRICT,
    id_origen INTEGER NOT NULL REFERENCES origen(id_origen) ON DELETE RESTRICT,
    id_institucion_convenio INTEGER REFERENCES institucion_convenio(id_institucion_convenio) ON DELETE SET NULL,
    id_contacto INTEGER NOT NULL REFERENCES contacto(id_contacto) ON DELETE CASCADE
);

-- Copiar datos de paciente a paciente_new (limpiar RUT y eliminar duplicados)
INSERT INTO paciente_new (rut, nombre, primer_apellido, segundo_apellido, fecha_nacimiento, obs, id_comuna, id_origen, id_institucion_convenio, id_contacto)
SELECT DISTINCT ON (REPLACE(REPLACE(rut_paciente, '.', ''), '-', ''))
    REPLACE(REPLACE(rut_paciente, '.', ''), '-', '') as rut,
    nombre,
    primer_apellido,
    segundo_apellido,
    fecha_nacimiento,
    obs,
    id_comuna,
    id_origen,
    id_institucion_convenio,
    id_contacto
FROM paciente
ORDER BY REPLACE(REPLACE(rut_paciente, '.', ''), '-', ''), rut_paciente;

-- ============================================
-- PASO 4: MODIFICAR TABLA SEGUIMIENTO
-- ============================================

-- Crear tabla temporal para seguimiento
CREATE TABLE seguimiento_new (
    id_seguimiento SERIAL PRIMARY KEY,
    fecha_ingreso DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_primera_llamada DATE,
    fecha_segunda_llamada DATE,
    fecha_tercera_llamada DATE,
    numero_llamado INTEGER,
    fecha_citacion DATE,
    agendado VARCHAR(20) NOT NULL CHECK (agendado IN ('si', 'no', 'desiste')) DEFAULT 'no',
    id_paciente INTEGER NOT NULL,  -- Ahora referencia a id_paciente
    id_especialidad INTEGER NOT NULL REFERENCES especialidad(id_especialidad) ON DELETE RESTRICT,
    id_ejecutivo_ingreso INTEGER,  -- Ahora referencia a id_trabajador
    UNIQUE (id_paciente, id_especialidad)
);

-- Copiar datos de seguimiento a seguimiento_new (eliminar duplicados)
INSERT INTO seguimiento_new (
    fecha_ingreso, 
    fecha_primera_llamada, 
    fecha_segunda_llamada, 
    fecha_tercera_llamada, 
    numero_llamado, 
    fecha_citacion, 
    agendado, 
    id_paciente, 
    id_especialidad, 
    id_ejecutivo_ingreso
)
SELECT DISTINCT ON (pn.id_paciente, s.id_especialidad)
    s.fecha_ingreso,
    s.fecha_primera_llamada,
    s.fecha_segunda_llamada,
    s.fecha_tercera_llamada,
    s.numero_llamado,
    s.fecha_citacion,
    s.agendado,
    pn.id_paciente,
    s.id_especialidad,
    tn.id_trabajador
FROM seguimiento s
INNER JOIN paciente_new pn ON REPLACE(REPLACE(s.id_paciente, '.', ''), '-', '') = pn.rut
LEFT JOIN trabajador_new tn ON REPLACE(REPLACE(s.rut_ejecutivo_ingreso, '.', ''), '-', '') = tn.rut
ORDER BY pn.id_paciente, s.id_especialidad, s.id_seguimiento DESC;

-- ============================================
-- PASO 5: MODIFICAR TABLA AUDITORÍA
-- ============================================

-- Crear tabla temporal para auditoría
CREATE TABLE auditoria_new (
    id_auditoria SERIAL PRIMARY KEY,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    campo_modificado VARCHAR(50) NOT NULL,
    valor_nuevo TEXT,
    valor_modificado TEXT,
    id_trabajador INTEGER NOT NULL,  -- Ahora referencia a id_trabajador
    id_paciente INTEGER NOT NULL  -- Ahora referencia a id_paciente
);

-- Copiar datos de auditoría a auditoria_new
INSERT INTO auditoria_new (
    fecha_modificacion,
    campo_modificado,
    valor_nuevo,
    valor_modificado,
    id_trabajador,
    id_paciente
)
SELECT 
    a.fecha_modificacion,
    a.campo_modificado,
    a.valor_nuevo,
    a.valor_modificado,
    tn.id_trabajador,
    pn.id_paciente
FROM auditoria a
INNER JOIN trabajador_new tn ON REPLACE(REPLACE(a.id_trabajador, '.', ''), '-', '') = tn.rut
INNER JOIN paciente_new pn ON REPLACE(REPLACE(a.id_paciente, '.', ''), '-', '') = pn.rut;

-- ============================================
-- PASO 6: ELIMINAR TABLAS ANTIGUAS Y RENOMBRAR
-- ============================================

DROP TABLE IF EXISTS auditoria CASCADE;
DROP TABLE IF EXISTS seguimiento CASCADE;
DROP TABLE IF EXISTS paciente CASCADE;
DROP TABLE IF EXISTS trabajador CASCADE;

ALTER TABLE trabajador_new RENAME TO trabajador;
ALTER TABLE paciente_new RENAME TO paciente;
ALTER TABLE seguimiento_new RENAME TO seguimiento;
ALTER TABLE auditoria_new RENAME TO auditoria;

-- ============================================
-- PASO 7: AGREGAR FOREIGN KEYS
-- ============================================

ALTER TABLE seguimiento 
    ADD CONSTRAINT fk_seguimiento_paciente 
    FOREIGN KEY (id_paciente) 
    REFERENCES paciente(id_paciente) 
    ON DELETE CASCADE;

ALTER TABLE seguimiento 
    ADD CONSTRAINT fk_seguimiento_ejecutivo 
    FOREIGN KEY (id_ejecutivo_ingreso) 
    REFERENCES trabajador(id_trabajador) 
    ON DELETE SET NULL;

ALTER TABLE auditoria 
    ADD CONSTRAINT fk_auditoria_trabajador 
    FOREIGN KEY (id_trabajador) 
    REFERENCES trabajador(id_trabajador) 
    ON DELETE CASCADE;

ALTER TABLE auditoria 
    ADD CONSTRAINT fk_auditoria_paciente 
    FOREIGN KEY (id_paciente) 
    REFERENCES paciente(id_paciente) 
    ON DELETE CASCADE;

-- ============================================
-- PASO 8: RECREAR ÍNDICES OPTIMIZADOS
-- ============================================

CREATE INDEX idx_trabajador_rut ON trabajador(rut);
CREATE INDEX idx_paciente_rut ON paciente(rut);
CREATE INDEX idx_seguimiento_paciente ON seguimiento(id_paciente);
CREATE INDEX idx_seguimiento_agendado ON seguimiento(agendado);
CREATE INDEX idx_seguimiento_especialidad ON seguimiento(id_especialidad);
CREATE INDEX idx_seguimiento_ejecutivo ON seguimiento(id_ejecutivo_ingreso);
CREATE INDEX idx_auditoria_paciente ON auditoria(id_paciente);
CREATE INDEX idx_auditoria_trabajador ON auditoria(id_trabajador);

-- ============================================
-- PASO 9: RECREAR TRIGGERS DE AUDITORÍA
-- ============================================

-- Función: Auditar cambios en PACIENTE (actualizada)
CREATE OR REPLACE FUNCTION registrar_auditoria_paciente()
RETURNS TRIGGER AS $$
DECLARE
    id_usuario INTEGER;
BEGIN
    -- Obtener el ID del usuario desde el contexto de la aplicación
    id_usuario := current_setting('app.current_user_id', TRUE)::INTEGER;
    
    IF id_usuario IS NULL THEN
        -- Si no hay usuario en contexto, usar un trabajador del sistema
        SELECT id_trabajador INTO id_usuario FROM trabajador WHERE rol = 'jefe' LIMIT 1;
    END IF;

    -- Comparar cada campo y registrar cambios
    IF OLD.nombre IS DISTINCT FROM NEW.nombre THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'nombre', OLD.nombre, NEW.nombre, id_usuario, NEW.id_paciente);
    END IF;

    IF OLD.primer_apellido IS DISTINCT FROM NEW.primer_apellido THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'primer_apellido', OLD.primer_apellido, NEW.primer_apellido, id_usuario, NEW.id_paciente);
    END IF;

    IF OLD.segundo_apellido IS DISTINCT FROM NEW.segundo_apellido THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'segundo_apellido', OLD.segundo_apellido, NEW.segundo_apellido, id_usuario, NEW.id_paciente);
    END IF;

    IF OLD.fecha_nacimiento IS DISTINCT FROM NEW.fecha_nacimiento THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'fecha_nacimiento', OLD.fecha_nacimiento::TEXT, NEW.fecha_nacimiento::TEXT, id_usuario, NEW.id_paciente);
    END IF;

    IF OLD.obs IS DISTINCT FROM NEW.obs THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'obs', OLD.obs, NEW.obs, id_usuario, NEW.id_paciente);
    END IF;

    IF OLD.id_comuna IS DISTINCT FROM NEW.id_comuna THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'id_comuna', OLD.id_comuna::TEXT, NEW.id_comuna::TEXT, id_usuario, NEW.id_paciente);
    END IF;

    IF OLD.id_origen IS DISTINCT FROM NEW.id_origen THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'id_origen', OLD.id_origen::TEXT, NEW.id_origen::TEXT, id_usuario, NEW.id_paciente);
    END IF;

    IF OLD.id_institucion_convenio IS DISTINCT FROM NEW.id_institucion_convenio THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'id_institucion_convenio', OLD.id_institucion_convenio::TEXT, NEW.id_institucion_convenio::TEXT, id_usuario, NEW.id_paciente);
    END IF;

    IF OLD.rut IS DISTINCT FROM NEW.rut THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'rut', OLD.rut, NEW.rut, id_usuario, NEW.id_paciente);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear trigger para PACIENTE
CREATE TRIGGER trigger_auditoria_paciente
    AFTER UPDATE ON paciente
    FOR EACH ROW
    EXECUTE FUNCTION registrar_auditoria_paciente();

-- Función: Auditar cambios en SEGUIMIENTO (actualizada)
CREATE OR REPLACE FUNCTION registrar_auditoria_seguimiento()
RETURNS TRIGGER AS $$
DECLARE
    id_usuario INTEGER;
BEGIN
    id_usuario := current_setting('app.current_user_id', TRUE)::INTEGER;
    
    IF id_usuario IS NULL THEN
        SELECT id_trabajador INTO id_usuario FROM trabajador WHERE rol = 'jefe' LIMIT 1;
    END IF;

    IF OLD.fecha_primera_llamada IS DISTINCT FROM NEW.fecha_primera_llamada THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'fecha_primera_llamada', OLD.fecha_primera_llamada::TEXT, NEW.fecha_primera_llamada::TEXT, id_usuario, NEW.id_paciente);
    END IF;

    IF OLD.fecha_segunda_llamada IS DISTINCT FROM NEW.fecha_segunda_llamada THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'fecha_segunda_llamada', OLD.fecha_segunda_llamada::TEXT, NEW.fecha_segunda_llamada::TEXT, id_usuario, NEW.id_paciente);
    END IF;

    IF OLD.fecha_tercera_llamada IS DISTINCT FROM NEW.fecha_tercera_llamada THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'fecha_tercera_llamada', OLD.fecha_tercera_llamada::TEXT, NEW.fecha_tercera_llamada::TEXT, id_usuario, NEW.id_paciente);
    END IF;

    IF OLD.agendado IS DISTINCT FROM NEW.agendado THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'agendado', OLD.agendado, NEW.agendado, id_usuario, NEW.id_paciente);
    END IF;

    IF OLD.fecha_citacion IS DISTINCT FROM NEW.fecha_citacion THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'fecha_citacion', OLD.fecha_citacion::TEXT, NEW.fecha_citacion::TEXT, id_usuario, NEW.id_paciente);
    END IF;

    IF OLD.numero_llamado IS DISTINCT FROM NEW.numero_llamado THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'numero_llamado', OLD.numero_llamado::TEXT, NEW.numero_llamado::TEXT, id_usuario, NEW.id_paciente);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear trigger para SEGUIMIENTO
CREATE TRIGGER trigger_auditoria_seguimiento
    AFTER UPDATE ON seguimiento
    FOR EACH ROW
    EXECUTE FUNCTION registrar_auditoria_seguimiento();

-- ============================================
-- PASO 10: ACTUALIZAR POLÍTICAS RLS
-- ============================================

-- Deshabilitar RLS temporalmente
ALTER TABLE trabajador DISABLE ROW LEVEL SECURITY;
ALTER TABLE paciente DISABLE ROW LEVEL SECURITY;
ALTER TABLE seguimiento DISABLE ROW LEVEL SECURITY;
ALTER TABLE auditoria DISABLE ROW LEVEL SECURITY;

-- Eliminar políticas antiguas
DROP POLICY IF EXISTS "Permitir lectura de trabajadores a todos" ON trabajador;
DROP POLICY IF EXISTS "Permitir modificación de trabajadores solo a jefe" ON trabajador;
DROP POLICY IF EXISTS "Permitir lectura de pacientes a todos" ON paciente;
DROP POLICY IF EXISTS "Permitir creación de pacientes a todos" ON paciente;
DROP POLICY IF EXISTS "Permitir actualización de pacientes solo a jefe" ON paciente;
DROP POLICY IF EXISTS "Permitir lectura de seguimientos a todos" ON seguimiento;
DROP POLICY IF EXISTS "Permitir creación de seguimientos a todos" ON seguimiento;
DROP POLICY IF EXISTS "Permitir actualización de seguimientos a todos" ON seguimiento;
DROP POLICY IF EXISTS "Permitir lectura de auditoría solo a jefe" ON auditoria;
DROP POLICY IF EXISTS "Permitir inserción de auditoría por sistema" ON auditoria;

-- Habilitar RLS nuevamente
ALTER TABLE trabajador ENABLE ROW LEVEL SECURITY;
ALTER TABLE paciente ENABLE ROW LEVEL SECURITY;
ALTER TABLE seguimiento ENABLE ROW LEVEL SECURITY;
ALTER TABLE auditoria ENABLE ROW LEVEL SECURITY;

-- Recrear políticas
-- TRABAJADOR
CREATE POLICY "Permitir lectura de trabajadores a todos" ON trabajador FOR SELECT USING (true);
CREATE POLICY "Permitir modificación de trabajadores solo a jefe" ON trabajador FOR ALL USING (current_setting('app.user_role', TRUE) = 'jefe');

-- PACIENTE
CREATE POLICY "Permitir lectura de pacientes a todos" ON paciente FOR SELECT USING (true);
CREATE POLICY "Permitir creación de pacientes a todos" ON paciente FOR INSERT WITH CHECK (true);
CREATE POLICY "Permitir actualización de pacientes solo a jefe" ON paciente FOR UPDATE USING (current_setting('app.user_role', TRUE) = 'jefe');

-- SEGUIMIENTO
CREATE POLICY "Permitir lectura de seguimientos a todos" ON seguimiento FOR SELECT USING (true);
CREATE POLICY "Permitir creación de seguimientos a todos" ON seguimiento FOR INSERT WITH CHECK (true);
CREATE POLICY "Permitir actualización de seguimientos a todos" ON seguimiento FOR UPDATE USING (true);

-- AUDITORÍA
CREATE POLICY "Permitir lectura de auditoría solo a jefe" ON auditoria FOR SELECT USING (current_setting('app.user_role', TRUE) = 'jefe');
CREATE POLICY "Permitir inserción de auditoría por sistema" ON auditoria FOR INSERT WITH CHECK (true);

-- ============================================
-- FUNCIONES AUXILIARES
-- ============================================

-- Función para formatear RUT (agregar puntos y guión)
CREATE OR REPLACE FUNCTION formatear_rut(rut_sin_formato VARCHAR)
RETURNS VARCHAR AS $$
DECLARE
    rut_body VARCHAR;
    rut_dv VARCHAR;
    formatted VARCHAR;
BEGIN
    IF rut_sin_formato IS NULL OR LENGTH(rut_sin_formato) < 2 THEN
        RETURN rut_sin_formato;
    END IF;
    
    rut_dv := RIGHT(rut_sin_formato, 1);
    rut_body := LEFT(rut_sin_formato, LENGTH(rut_sin_formato) - 1);
    
    -- Agregar puntos
    formatted := REVERSE(rut_body);
    formatted := REGEXP_REPLACE(formatted, '([0-9]{3})', '\1.', 'g');
    formatted := REVERSE(formatted);
    formatted := LTRIM(formatted, '.');
    
    RETURN formatted || '-' || rut_dv;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- Función para limpiar RUT (quitar puntos y guiones)
CREATE OR REPLACE FUNCTION limpiar_rut(rut_formato VARCHAR)
RETURNS VARCHAR AS $$
BEGIN
    RETURN REPLACE(REPLACE(rut_formato, '.', ''), '-', '');
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- ============================================
-- COMENTARIOS
-- ============================================
COMMENT ON COLUMN trabajador.rut IS 'RUT sin puntos ni guiones para búsquedas rápidas (ej: 213091727)';
COMMENT ON COLUMN paciente.rut IS 'RUT sin puntos ni guiones para búsquedas rápidas (ej: 213091727)';
COMMENT ON COLUMN seguimiento.id_ejecutivo_ingreso IS 'ID del ejecutivo que ingresó al paciente en el sistema';
COMMENT ON FUNCTION formatear_rut IS 'Formatea un RUT agregando puntos y guión (ej: 12.345.678-9)';
COMMENT ON FUNCTION limpiar_rut IS 'Elimina puntos y guiones de un RUT (ej: 123456789)';
