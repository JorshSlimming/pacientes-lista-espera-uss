## **1. MÓDULO DE AUTENTICACIÓN Y SESIÓN**

### **Función: autenticarUsuario**
- Validar credenciales (RUT + primeros 4 dígitos como contraseña) contra Supabase Auth.
- Retornar token de sesión e información básica del usuario.

### **Función: obtenerDatosUsuarioActual**
- Obtener datos adicionales del usuario autenticado desde tabla `trabajador` (rol, nombre completo).
- Usar el RUT del usuario autenticado para buscar en tabla de trabajadores.

### **Función: cerrarSesion**
- Invalidar sesión actual en Supabase Auth.

---

## **2. MÓDULO DE CATÁLOGOS (CRUD)**

### **Función: listarComunas**
- Retornar todas las comunas (33 registros) para dropdowns.

### **Función: crear/actualizar/eliminarComuna** (solo AdminJefe)
- CRUD básico con validación de no eliminación si está en uso por pacientes.

---

### **Función: listarOrigenes**
- Retornar todos los orígenes (5 opciones).

### **Función: crear/actualizar/eliminarOrigen** (solo AdminJefe)
- CRUD básico con validación.

---

### **Función: listarInstituciones**
- Retornar todas las instituciones/convenios (29 opciones).

### **Función: crear/actualizar/eliminarInstitucion** (solo AdminJefe)
- CRUD básico con validación.

---

### **Función: listarEspecialidadesJerarquicas**
- Retornar especialidades organizadas jerárquicamente (niveles 1, 2, 3 con relaciones padre-hijo).
- Incluir solo las activas/visibles.

### **Función: crear/actualizar/eliminarEspecialidad** (solo AdminJefe)
- CRUD manteniendo estructura jerárquica (parent_id, nivel).
- Validar que no se elimine si hay pacientes asociados.

---

## **3. MÓDULO DE PACIENTES**

### **Función: crearPacienteNuevo**
- Insertar en tablas relacionadas: contacto → paciente → seguimiento.
- Validar unicidad de RUT en sistema.
- Autocompletar: fecha_ingreso (actual), agendado='no'.
- Asignar automáticamente rut_ejecutivo_ingreso (usuario logueado).

### **Función: buscarPacientePorRUT**
- Buscar paciente exacto por RUT.
- Retornar todos sus datos personales + historial de especialidades.
- **Usado solo para visualización** (no permite modificaciones).

### **Función: buscarPacientesConFiltros**
- Recibir filtros (especialidad, comuna, estado agendado, etc.).
- Retornar lista paginada con columnas principales.
- Ordenamiento opcional por columna.
- **Solo se ejecuta al presionar botón "Buscar"**.

### **Función: actualizarSeguimientoPaciente** (para Usuario)
- Permitir modificar SOLO: 
  - fechas_llamada (1ra, 2da, 3ra)
  - estado agendado (si/no/desiste)
  - fecha_citación (cuando se agenda)
  - campo OBS
- Validar reglas: no agendar sin al menos una llamada registrada.
- Registrar cambios en auditoría.

### **Función: actualizarDatosPaciente** (solo AdminJefe)
- Permitir modificar CUALQUIER campo del paciente.
- Registrar cambios detallados en auditoría.

---

## **4. MÓDULO DE ESTADÍSTICAS/ADMINISTRACIÓN**

### **Función: obtenerEstadisticasHistoricas**
- Retornar totales acumulados:
  - Total ingresos (todos los registros)
  - Pendientes (agendado='no')
  - Agendados (agendado='si')
  - Desistidos (agendado='desiste')

### **Función: obtenerIngresosPorEjecutivo**
- Contar cuántos pacientes ha ingresado CADA trabajador (total histórico).
- Retornar lista: nombre ejecutivo + cantidad de ingresos.

---

## **5. MÓDULO DE AUDITORÍA**

### **Función: obtenerHistorialCambiosPaciente**
- Retornar todos los cambios realizados a un paciente específico.
- **Solo visible para AdminJefe** (Admin lo ve desde Supabase directamente).

### **Trigger: trigger_auditoria_automatica**
- Trigger PostgreSQL que registra automáticamente en `auditoria`:
  - Usuario que modificó
  - Fecha exacta
  - Campo cambiado
  - Valor anterior y nuevo
- **Inmutable**: nadie puede modificar/eliminar estos registros.

---

## **6. FUNCIONES DE VALIDACIÓN/UTILIDAD**

### **Función: verificarRUTExistente**
- Consultar si RUT ya existe en sistema.
- Usado para autocompletado en formulario de nuevo paciente.

### **Función: obtenerDatosAutocompletar**
- Al detectar RUT existente: retornar datos personales del paciente (nombre, apellidos, contacto, etc.).
- **Frontend bloquea estos campos como solo lectura**.

