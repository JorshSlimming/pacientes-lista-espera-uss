-- Agregar columna archivado a las tablas de catálogos

-- Comuna
ALTER TABLE comuna 
ADD COLUMN archivado BOOLEAN DEFAULT FALSE NOT NULL;

-- Origen
ALTER TABLE origen 
ADD COLUMN archivado BOOLEAN DEFAULT FALSE NOT NULL;

-- Institución Convenio
ALTER TABLE institucion_convenio 
ADD COLUMN archivado BOOLEAN DEFAULT FALSE NOT NULL;

-- Especialidad
ALTER TABLE especialidad 
ADD COLUMN archivado BOOLEAN DEFAULT FALSE NOT NULL;

-- Crear índices para mejorar performance en consultas con archivado
CREATE INDEX idx_comuna_archivado ON comuna(archivado);
CREATE INDEX idx_origen_archivado ON origen(archivado);
CREATE INDEX idx_institucion_convenio_archivado ON institucion_convenio(archivado);
CREATE INDEX idx_especialidad_archivado ON especialidad(archivado);
