```sql
-- TABLAS CATALOGO
CREATE TABLE comuna (id_comuna SERIAL PRIMARY KEY, nombre VARCHAR(50) UNIQUE NOT NULL);
CREATE TABLE origen (id_origen SERIAL PRIMARY KEY, nombre VARCHAR(50) UNIQUE NOT NULL, requiere_ci BOOLEAN DEFAULT FALSE);
CREATE TABLE institucion_convenio (id_institucion_convenio SERIAL PRIMARY KEY, tipo VARCHAR(20) CHECK (tipo IN ('convenio', 'institucion')), nombre VARCHAR(100) UNIQUE NOT NULL);
CREATE TABLE contacto (id_contacto SERIAL PRIMARY KEY, correo VARCHAR(100) NOT NULL, direccion VARCHAR(200) NOT NULL, primer_celular VARCHAR(9) CHECK (primer_celular ~ '^[0-9]{9}$'), segundo_celular VARCHAR(9) CHECK (segundo_celular ~ '^[0-9]{9}$'));

-- TRABAJADOR
CREATE TABLE trabajador (
    rut_trabajador VARCHAR(12) PRIMARY KEY,
    rol VARCHAR(10) NOT NULL CHECK (rol IN ('jefe', 'usuario')),
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    clave VARCHAR(255) NOT NULL
);

-- ESPECIALIDAD 
CREATE TABLE especialidad (
    id_especialidad SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    parent_id INTEGER REFERENCES especialidad(id_especialidad),
    nivel INTEGER NOT NULL CHECK (nivel IN (1, 2, 3))
);

-- PACIENTE 
CREATE TABLE paciente (
    rut_paciente VARCHAR(12) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50),
    fecha_nacimiento DATE NOT NULL,
    obs TEXT,
    id_comuna INTEGER NOT NULL REFERENCES comuna(id_comuna),
    id_origen INTEGER NOT NULL REFERENCES origen(id_origen),
    id_institucion_convenio INTEGER REFERENCES institucion_convenio(id_institucion_convenio),
    id_contacto INTEGER NOT NULL REFERENCES contacto(id_contacto)
);

-- SEGUIMIENTO 
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
    id_especialidad INTEGER NOT NULL REFERENCES especialidad(id_especialidad),
    UNIQUE (id_paciente, id_especialidad)
);

-- AUDITORIA
CREATE TABLE auditoria (
    id_auditoria SERIAL PRIMARY KEY,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    campo_modificado VARCHAR(50) NOT NULL,
    valor_nuevo TEXT,
    valor_modificado TEXT,
    id_trabajador VARCHAR(12) NOT NULL REFERENCES trabajador(rut_trabajador),
    id_paciente VARCHAR(12) NOT NULL REFERENCES paciente(rut_paciente) ON DELETE CASCADE
);

-- ÍNDICES
CREATE INDEX idx_paciente_rut ON paciente(rut_paciente);
CREATE INDEX idx_seguimiento_paciente ON seguimiento(id_paciente);
CREATE INDEX idx_seguimiento_agendado ON seguimiento(agendado) WHERE agendado = FALSE;
CREATE INDEX idx_auditoria_paciente ON auditoria(id_paciente);
CREATE INDEX idx_especialidad_nivel ON especialidad(nivel);
CREATE INDEX idx_especialidad_parent ON especialidad(parent_id);
```