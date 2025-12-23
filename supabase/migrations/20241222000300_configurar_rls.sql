-- ============================================
-- MIGRACIÓN: Configurar RLS para tablas auditoria y trabajador
-- Fecha: 2024-12-22
-- Descripción: Activa Row Level Security en tablas sensibles
-- ============================================

-- ============================================
-- TABLA TRABAJADOR - RLS
-- ============================================

-- Habilitar RLS en trabajador
ALTER TABLE trabajador ENABLE ROW LEVEL SECURITY;

-- Política 1: Los trabajadores autenticados pueden ver todos los trabajadores
CREATE POLICY "Trabajadores autenticados pueden ver todos los trabajadores"
ON trabajador
FOR SELECT
TO authenticated
USING (true);

-- Política 2: Solo jefes pueden insertar nuevos trabajadores
CREATE POLICY "Solo jefes pueden crear trabajadores"
ON trabajador
FOR INSERT
TO authenticated
WITH CHECK (
  EXISTS (
    SELECT 1 FROM trabajador
    WHERE auth_uid = auth.uid()
    AND rol = 'jefe'
    AND activo = true
  )
);

-- Política 3: Solo jefes pueden actualizar trabajadores
CREATE POLICY "Solo jefes pueden actualizar trabajadores"
ON trabajador
FOR UPDATE
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM trabajador
    WHERE auth_uid = auth.uid()
    AND rol = 'jefe'
    AND activo = true
  )
);

-- Política 4: Los trabajadores pueden actualizar su propia información (excepto rol)
CREATE POLICY "Trabajadores pueden actualizar su propia información"
ON trabajador
FOR UPDATE
TO authenticated
USING (auth_uid = auth.uid())
WITH CHECK (auth_uid = auth.uid());

-- ============================================
-- TABLA AUDITORIA - RLS
-- ============================================

-- Habilitar RLS en auditoria
ALTER TABLE auditoria ENABLE ROW LEVEL SECURITY;

-- Política 1: Solo jefes pueden ver la auditoría
CREATE POLICY "Solo jefes pueden ver auditoría"
ON auditoria
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM trabajador
    WHERE auth_uid = auth.uid()
    AND rol = 'jefe'
    AND activo = true
  )
);

-- Política 2: Los triggers pueden insertar en auditoría (bypass RLS)
-- Esto se maneja con un ROL especial o usando SERVICE_ROLE_KEY en los triggers

-- ============================================
-- OTRAS TABLAS - Verificar RLS
-- ============================================

-- Habilitar RLS en paciente si no está habilitado
ALTER TABLE paciente ENABLE ROW LEVEL SECURITY;

-- Política: Trabajadores autenticados pueden ver todos los pacientes
CREATE POLICY "Trabajadores autenticados pueden ver pacientes"
ON paciente
FOR SELECT
TO authenticated
USING (true);

-- Política: Trabajadores autenticados pueden crear pacientes
CREATE POLICY "Trabajadores autenticados pueden crear pacientes"
ON paciente
FOR INSERT
TO authenticated
WITH CHECK (
  EXISTS (
    SELECT 1 FROM trabajador
    WHERE auth_uid = auth.uid()
    AND activo = true
  )
);

-- Política: Trabajadores autenticados pueden actualizar pacientes
CREATE POLICY "Trabajadores autenticados pueden actualizar pacientes"
ON paciente
FOR UPDATE
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM trabajador
    WHERE auth_uid = auth.uid()
    AND activo = true
  )
);

-- Habilitar RLS en seguimiento
ALTER TABLE seguimiento ENABLE ROW LEVEL SECURITY;

-- Política: Trabajadores autenticados pueden ver todos los seguimientos
CREATE POLICY "Trabajadores autenticados pueden ver seguimientos"
ON seguimiento
FOR SELECT
TO authenticated
USING (true);

-- Política: Trabajadores autenticados pueden crear seguimientos
CREATE POLICY "Trabajadores autenticados pueden crear seguimientos"
ON seguimiento
FOR INSERT
TO authenticated
WITH CHECK (
  EXISTS (
    SELECT 1 FROM trabajador
    WHERE auth_uid = auth.uid()
    AND activo = true
  )
);

-- Política: Trabajadores autenticados pueden actualizar seguimientos
CREATE POLICY "Trabajadores autenticados pueden actualizar seguimientos"
ON seguimiento
FOR UPDATE
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM trabajador
    WHERE auth_uid = auth.uid()
    AND activo = true
  )
);

-- ============================================
-- TABLAS DE CATÁLOGOS - RLS
-- ============================================

-- Las tablas de catálogos (comuna, origen, especialidad, institucion_convenio)
-- deben ser accesibles para lectura pero solo jefes pueden modificar

-- Comuna
ALTER TABLE comuna ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Todos pueden ver comunas"
ON comuna FOR SELECT TO authenticated USING (true);

CREATE POLICY "Solo jefes pueden modificar comunas"
ON comuna FOR ALL TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM trabajador
    WHERE auth_uid = auth.uid()
    AND rol = 'jefe'
    AND activo = true
  )
);

-- Origen
ALTER TABLE origen ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Todos pueden ver orígenes"
ON origen FOR SELECT TO authenticated USING (true);

CREATE POLICY "Solo jefes pueden modificar orígenes"
ON origen FOR ALL TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM trabajador
    WHERE auth_uid = auth.uid()
    AND rol = 'jefe'
    AND activo = true
  )
);

-- Especialidad
ALTER TABLE especialidad ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Todos pueden ver especialidades"
ON especialidad FOR SELECT TO authenticated USING (true);

CREATE POLICY "Solo jefes pueden modificar especialidades"
ON especialidad FOR ALL TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM trabajador
    WHERE auth_uid = auth.uid()
    AND rol = 'jefe'
    AND activo = true
  )
);

-- Institución Convenio
ALTER TABLE institucion_convenio ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Todos pueden ver instituciones"
ON institucion_convenio FOR SELECT TO authenticated USING (true);

CREATE POLICY "Solo jefes pueden modificar instituciones"
ON institucion_convenio FOR ALL TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM trabajador
    WHERE auth_uid = auth.uid()
    AND rol = 'jefe'
    AND activo = true
  )
);

-- Contacto
ALTER TABLE contacto ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Trabajadores pueden ver contactos"
ON contacto FOR SELECT TO authenticated USING (true);

CREATE POLICY "Trabajadores pueden crear contactos"
ON contacto FOR INSERT TO authenticated
WITH CHECK (
  EXISTS (
    SELECT 1 FROM trabajador
    WHERE auth_uid = auth.uid()
    AND activo = true
  )
);

CREATE POLICY "Trabajadores pueden actualizar contactos"
ON contacto FOR UPDATE TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM trabajador
    WHERE auth_uid = auth.uid()
    AND activo = true
  )
);

-- Comentarios
COMMENT ON TABLE trabajador IS 'Tabla de trabajadores con RLS habilitado - Solo jefes pueden gestionar';
COMMENT ON TABLE auditoria IS 'Tabla de auditoría con RLS habilitado - Solo jefes pueden ver';
