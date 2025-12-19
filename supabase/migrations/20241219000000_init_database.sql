-- ============================================
-- SISTEMA DE GESTIÓN DE LISTA DE ESPERA
-- Script de Inicialización Completo
-- ============================================

-- Eliminar tablas existentes (solo para desarrollo)
DROP TABLE IF EXISTS auditoria CASCADE;
DROP TABLE IF EXISTS seguimiento CASCADE;
DROP TABLE IF EXISTS paciente CASCADE;
DROP TABLE IF EXISTS contacto CASCADE;
DROP TABLE IF EXISTS especialidad CASCADE;
DROP TABLE IF EXISTS institucion_convenio CASCADE;
DROP TABLE IF EXISTS origen CASCADE;
DROP TABLE IF EXISTS comuna CASCADE;
DROP TABLE IF EXISTS trabajador CASCADE;

-- ============================================
-- TABLAS CATÁLOGO
-- ============================================

-- Tabla: COMUNA
CREATE TABLE comuna (
    id_comuna SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL
);

-- Tabla: ORIGEN
CREATE TABLE origen (
    id_origen SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    requiere_ci BOOLEAN DEFAULT FALSE
);

-- Tabla: INSTITUCIÓN/CONVENIO
CREATE TABLE institucion_convenio (
    id_institucion_convenio SERIAL PRIMARY KEY,
    tipo VARCHAR(20) CHECK (tipo IN ('convenio', 'institucion')),
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- Tabla: CONTACTO
CREATE TABLE contacto (
    id_contacto SERIAL PRIMARY KEY,
    correo VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    primer_celular VARCHAR(9) CHECK (primer_celular ~ '^[0-9]{9}$'),
    segundo_celular VARCHAR(9) CHECK (segundo_celular ~ '^[0-9]{9}$')
);

-- ============================================
-- TABLA: TRABAJADOR
-- ============================================
CREATE TABLE trabajador (
    rut_trabajador VARCHAR(12) PRIMARY KEY,
    rol VARCHAR(10) NOT NULL CHECK (rol IN ('jefe', 'usuario')),
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    clave VARCHAR(255) NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE
);

-- ============================================
-- TABLA: ESPECIALIDAD (Jerárquica)
-- ============================================
CREATE TABLE especialidad (
    id_especialidad SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    parent_id INTEGER REFERENCES especialidad(id_especialidad) ON DELETE CASCADE,
    nivel INTEGER NOT NULL CHECK (nivel IN (1, 2, 3))
);

-- ============================================
-- TABLA: PACIENTE
-- ============================================
CREATE TABLE paciente (
    rut_paciente VARCHAR(12) PRIMARY KEY,
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

-- ============================================
-- TABLA: SEGUIMIENTO
-- ============================================
CREATE TABLE seguimiento (
    id_seguimiento SERIAL PRIMARY KEY,
    fecha_ingreso DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_primera_llamada DATE,
    fecha_segunda_llamada DATE,
    fecha_tercera_llamada DATE,
    numero_llamado INTEGER,
    fecha_citacion DATE,
    agendado VARCHAR(20) NOT NULL CHECK (agendado IN ('si', 'no', 'desiste')) DEFAULT 'no',
    id_paciente VARCHAR(12) NOT NULL REFERENCES paciente(rut_paciente) ON DELETE CASCADE,
    id_especialidad INTEGER NOT NULL REFERENCES especialidad(id_especialidad) ON DELETE RESTRICT,
    rut_ejecutivo_ingreso VARCHAR(12) REFERENCES trabajador(rut_trabajador) ON DELETE SET NULL,
    UNIQUE (id_paciente, id_especialidad)
);

-- ============================================
-- TABLA: AUDITORÍA
-- ============================================
CREATE TABLE auditoria (
    id_auditoria SERIAL PRIMARY KEY,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    campo_modificado VARCHAR(50) NOT NULL,
    valor_nuevo TEXT,
    valor_modificado TEXT,
    id_trabajador VARCHAR(12) NOT NULL REFERENCES trabajador(rut_trabajador) ON DELETE CASCADE,
    id_paciente VARCHAR(12) NOT NULL REFERENCES paciente(rut_paciente) ON DELETE CASCADE
);

-- ============================================
-- ÍNDICES PARA OPTIMIZACIÓN
-- ============================================
CREATE INDEX idx_paciente_rut ON paciente(rut_paciente);
CREATE INDEX idx_seguimiento_paciente ON seguimiento(id_paciente);
CREATE INDEX idx_seguimiento_agendado ON seguimiento(agendado);
CREATE INDEX idx_seguimiento_especialidad ON seguimiento(id_especialidad);
CREATE INDEX idx_seguimiento_ejecutivo ON seguimiento(rut_ejecutivo_ingreso);
CREATE INDEX idx_auditoria_paciente ON auditoria(id_paciente);
CREATE INDEX idx_auditoria_trabajador ON auditoria(id_trabajador);
CREATE INDEX idx_especialidad_nivel ON especialidad(nivel);
CREATE INDEX idx_especialidad_parent ON especialidad(parent_id);

-- ============================================
-- TRIGGERS DE AUDITORÍA AUTOMÁTICA
-- ============================================

-- Función: Auditar cambios en PACIENTE
CREATE OR REPLACE FUNCTION registrar_auditoria_paciente()
RETURNS TRIGGER AS $$
DECLARE
    rut_usuario TEXT;
BEGIN
    -- Obtener el RUT del usuario desde el contexto de la aplicación
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

-- Crear trigger para PACIENTE
DROP TRIGGER IF EXISTS trigger_auditoria_paciente ON paciente;
CREATE TRIGGER trigger_auditoria_paciente
    AFTER UPDATE ON paciente
    FOR EACH ROW
    EXECUTE FUNCTION registrar_auditoria_paciente();

-- Función: Auditar cambios en SEGUIMIENTO
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

    IF OLD.numero_llamado IS DISTINCT FROM NEW.numero_llamado THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_modificado, valor_nuevo, id_trabajador, id_paciente)
        VALUES (CURRENT_TIMESTAMP, 'numero_llamado', OLD.numero_llamado::TEXT, NEW.numero_llamado::TEXT, rut_usuario, NEW.id_paciente);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear trigger para SEGUIMIENTO
DROP TRIGGER IF EXISTS trigger_auditoria_seguimiento ON seguimiento;
CREATE TRIGGER trigger_auditoria_seguimiento
    AFTER UPDATE ON seguimiento
    FOR EACH ROW
    EXECUTE FUNCTION registrar_auditoria_seguimiento();

-- ============================================
-- POLÍTICAS RLS (Row Level Security)
-- ============================================

-- Habilitar RLS en todas las tablas
ALTER TABLE comuna ENABLE ROW LEVEL SECURITY;
ALTER TABLE origen ENABLE ROW LEVEL SECURITY;
ALTER TABLE institucion_convenio ENABLE ROW LEVEL SECURITY;
ALTER TABLE especialidad ENABLE ROW LEVEL SECURITY;
ALTER TABLE trabajador ENABLE ROW LEVEL SECURITY;
ALTER TABLE contacto ENABLE ROW LEVEL SECURITY;
ALTER TABLE paciente ENABLE ROW LEVEL SECURITY;
ALTER TABLE seguimiento ENABLE ROW LEVEL SECURITY;
ALTER TABLE auditoria ENABLE ROW LEVEL SECURITY;

-- POLÍTICAS PARA CATÁLOGOS (todos pueden leer, solo jefe puede modificar)
-- COMUNA
CREATE POLICY "Permitir lectura de comunas a todos" ON comuna FOR SELECT USING (true);
CREATE POLICY "Permitir modificación de comunas solo a jefe" ON comuna FOR ALL USING (current_setting('app.user_role', TRUE) = 'jefe');

-- ORIGEN
CREATE POLICY "Permitir lectura de orígenes a todos" ON origen FOR SELECT USING (true);
CREATE POLICY "Permitir modificación de orígenes solo a jefe" ON origen FOR ALL USING (current_setting('app.user_role', TRUE) = 'jefe');

-- INSTITUCIÓN/CONVENIO
CREATE POLICY "Permitir lectura de instituciones a todos" ON institucion_convenio FOR SELECT USING (true);
CREATE POLICY "Permitir modificación de instituciones solo a jefe" ON institucion_convenio FOR ALL USING (current_setting('app.user_role', TRUE) = 'jefe');

-- ESPECIALIDAD
CREATE POLICY "Permitir lectura de especialidades a todos" ON especialidad FOR SELECT USING (true);
CREATE POLICY "Permitir modificación de especialidades solo a jefe" ON especialidad FOR ALL USING (current_setting('app.user_role', TRUE) = 'jefe');

-- TRABAJADOR
CREATE POLICY "Permitir lectura de trabajadores a todos" ON trabajador FOR SELECT USING (true);
CREATE POLICY "Permitir modificación de trabajadores solo a jefe" ON trabajador FOR ALL USING (current_setting('app.user_role', TRUE) = 'jefe');

-- CONTACTO (todos pueden crear y leer)
CREATE POLICY "Permitir acceso a contactos" ON contacto FOR ALL USING (true);

-- PACIENTE (todos pueden crear y leer, solo jefe puede actualizar todo)
CREATE POLICY "Permitir lectura de pacientes a todos" ON paciente FOR SELECT USING (true);
CREATE POLICY "Permitir creación de pacientes a todos" ON paciente FOR INSERT WITH CHECK (true);
CREATE POLICY "Permitir actualización de pacientes solo a jefe" ON paciente FOR UPDATE USING (current_setting('app.user_role', TRUE) = 'jefe');

-- SEGUIMIENTO (todos pueden leer y actualizar, crear todos)
CREATE POLICY "Permitir lectura de seguimientos a todos" ON seguimiento FOR SELECT USING (true);
CREATE POLICY "Permitir creación de seguimientos a todos" ON seguimiento FOR INSERT WITH CHECK (true);
CREATE POLICY "Permitir actualización de seguimientos a todos" ON seguimiento FOR UPDATE USING (true);

-- AUDITORÍA (solo lectura para jefe, inserción por triggers)
CREATE POLICY "Permitir lectura de auditoría solo a jefe" ON auditoria FOR SELECT USING (current_setting('app.user_role', TRUE) = 'jefe');
CREATE POLICY "Permitir inserción de auditoría por sistema" ON auditoria FOR INSERT WITH CHECK (true);

-- ============================================
-- DATOS INICIALES
-- ============================================

-- Insertar Comunas de Región del Bíobbío (33 comunas)
INSERT INTO comuna (nombre) VALUES
('Arauco'),
('Cañete'),
('Contulmo'),
('Curanilahue'),
('Lebu'),
('Los Álamos'),
('Tirúa'),
('Alto Biobío'),
('Antuco'),
('Cabrero'),
('Laja'),
('Los Ángeles'),
('Mulchén'),
('Nacimiento'),
('Negrete'),
('Quilaco'),
('Quilleco'),
('San Rosendo'),
('Santa Bárbara'),
('Tucapel'),
('Yumbel'),
('Concepción'),
('Coronel'),
('Chiguayante'),
('Florida'),
('Hualpén'),
('Hualqui'),
('Lota'),
('Penco'),
('San Pedro de la Paz'),
('Santa Juana'),
('Talcahuano'),
('Tomé');


-- Insertar Orígenes (ANEXO D - 5 opciones)
INSERT INTO origen (nombre, requiere_ci) VALUES
('Espontaneo', false),
('Operativo', true),
('Campaña', true),
('Convenio', false),
('Otros', false);


-- Insertar Instituciones/Convenios (ANEXO E - 29 opciones)
INSERT INTO institucion_convenio (tipo, nombre) VALUES 
('institucion', 'DOCENCIA ASISTENCIAL'),
('convenio', 'SODIMAC. S.A.'),
('convenio', 'BBOSCH'),
('institucion', 'COMUNIDAD USS'),
('convenio', 'CLUB SOCIAL COLO COLO'),
('convenio', 'JENABIEN PDI'),
('convenio', 'PARTICULAR'),
('institucion', 'HOSPITAL DE LOTA'),
('institucion', 'FUNDACION RED MIGRANTES'),
('institucion', 'JUNAEB'),
('convenio', 'COEMCO'),
('convenio', 'Copago Fonasa'),
('institucion', 'DEPORTISTAS USS'),
('convenio', 'AFAEB-JUNAEB'),
('convenio', 'SOMOS TAB'),
('institucion', 'CORAPEHI'),
('institucion', 'FUNDACION HONRA'),
('institucion', 'RED COLABORATIVA'),
('institucion', 'XFRAGIL'),
('institucion', 'DOWN UP'),
('institucion', 'SERNAMEG'),
('convenio', 'CLUB DEPORTIVO UDC'),
('convenio', 'BOMBEROS CHILE'),
('institucion', 'LICEO JORGE SANCHEZ UGARTE'),
('convenio', 'COLEGIO PROFESORES CORONEL'),
('convenio', 'BIENESTAR DE CARABINEROS'),
('convenio', 'SINDICATO RIPLEY'),
('convenio', 'ARAMARK'),
('institucion', 'GENDARMERIA');

-- Insertar Especialidades Jerárquicas (ANEXO B)
-- Nivel 1: Especialidades Principales
INSERT INTO especialidad (nombre, parent_id, nivel) VALUES 
('Medicina', NULL, 1),
('Odontología', NULL, 1);

-- Nivel 2: Subespecialidades Nivel 1 - Para Medicina
INSERT INTO especialidad (nombre, parent_id, nivel) VALUES 
('Medicina General', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Medicina'), 2),
('Dermatología', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Medicina'), 2),
('Neurología Adulto', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Medicina'), 2),
('Neurología Pediátrica', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Medicina'), 2),
('Otorrinolaringología', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Medicina'), 2),
('Ginecología', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Medicina'), 2),
('Pediatría', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Medicina'), 2),
('Psiquiatría', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Medicina'), 2),
('Oftalmología', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Medicina'), 2),
('Fonoaudiología', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Medicina'), 2),
('TM.Oftalmología', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Medicina'), 2),
('T.Ocupacional', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Medicina'), 2),
('Kinesiología', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Medicina'), 2);

-- Nivel 2: Subespecialidades Nivel 1 - Para Odontología
INSERT INTO especialidad (nombre, parent_id, nivel) VALUES 
('O.General', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Odontología'), 2),
('O.Especialidades', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Odontología'), 2);

-- Nivel 3: Subespecialidades Nivel 2 - Para Fonoaudiología
INSERT INTO especialidad (nombre, parent_id, nivel) VALUES 
('Audición', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Fonoaudiología'), 3),
('Voz', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Fonoaudiología'), 3),
('Infantil', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Fonoaudiología'), 3);

-- Nivel 3: Para TM.Oftalmología
INSERT INTO especialidad (nombre, parent_id, nivel) VALUES 
('Glaucoma', (SELECT id_especialidad FROM especialidad WHERE nombre = 'TM.Oftalmología'), 3),
('Refracción', (SELECT id_especialidad FROM especialidad WHERE nombre = 'TM.Oftalmología'), 3),
('Estrabismo', (SELECT id_especialidad FROM especialidad WHERE nombre = 'TM.Oftalmología'), 3),
('Evaluación', (SELECT id_especialidad FROM especialidad WHERE nombre = 'TM.Oftalmología'), 3);

-- Nivel 3: Para T.Ocupacional
INSERT INTO especialidad (nombre, parent_id, nivel) VALUES 
('Adulto', (SELECT id_especialidad FROM especialidad WHERE nombre = 'T.Ocupacional'), 3),
('Infantil (TO)', (SELECT id_especialidad FROM especialidad WHERE nombre = 'T.Ocupacional'), 3),
('Psicosocial', (SELECT id_especialidad FROM especialidad WHERE nombre = 'T.Ocupacional'), 3);

-- Nivel 3: Para Kinesiología
INSERT INTO especialidad (nombre, parent_id, nivel) VALUES 
('Musculoesquelética', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Kinesiología'), 3),
('Neurorehabilitación', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Kinesiología'), 3),
('Cardiometabólico', (SELECT id_especialidad FROM especialidad WHERE nombre = 'Kinesiología'), 3);

-- Nivel 3: Para O.General
INSERT INTO especialidad (nombre, parent_id, nivel) VALUES 
('Adulto (OG)', (SELECT id_especialidad FROM especialidad WHERE nombre = 'O.General'), 3),
('Pediátrica', (SELECT id_especialidad FROM especialidad WHERE nombre = 'O.General'), 3);

-- Nivel 3: Para O.Especialidades
INSERT INTO especialidad (nombre, parent_id, nivel) VALUES 
('Endodoncia', (SELECT id_especialidad FROM especialidad WHERE nombre = 'O.Especialidades'), 3),
('Ortodoncia', (SELECT id_especialidad FROM especialidad WHERE nombre = 'O.Especialidades'), 3),
('Rehabilitación Oral', (SELECT id_especialidad FROM especialidad WHERE nombre = 'O.Especialidades'), 3),
('Estética Orofacial', (SELECT id_especialidad FROM especialidad WHERE nombre = 'O.Especialidades'), 3),
('Implantología', (SELECT id_especialidad FROM especialidad WHERE nombre = 'O.Especialidades'), 3);

-- ============================================
-- COMENTARIOS FINALES
-- ============================================
COMMENT ON TABLE paciente IS 'Tabla principal de pacientes en lista de espera';
COMMENT ON TABLE seguimiento IS 'Registro de seguimiento por especialidad para cada paciente';
COMMENT ON TABLE auditoria IS 'Log inmutable de todos los cambios realizados en el sistema';
COMMENT ON COLUMN seguimiento.rut_ejecutivo_ingreso IS 'Ejecutivo que ingresó al paciente en el sistema';
