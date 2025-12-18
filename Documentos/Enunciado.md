### Enunciado

## **Descripción General**

Se requiere migrar el actual sistema de gestión de listas de espera médicas (implementado en Excel) a una **plataforma web moderna** desarrollada con **React + Vite** en el frontend y **Supabase (PostgreSQL)** en el backend, desplegada en **Vercel**. El objetivo es superar las limitaciones de escalabilidad, colaboración en tiempo real, y control de accesos que presenta la solución actual.

El sistema permitirá el **registro centralizado de pacientes** en listas de espera para múltiples especialidades y subespecialidades médicas. Los ejecutivos de recepción (vía teléfono, WhatsApp o presencial) ingresarán los datos de los pacientes, realizarán seguimiento de su estado (llamadas, agendamiento) y los jefes podrán visualizar métricas y estadísticas en tiempo real.

Se estima un volumen de **5 a 10 ingresos nuevos por día**, con un histórico de aproximadamente **3,600 registros** a migrar desde el sistema Excel actual.

---

## **Anexos Referenciados**

**ANEXO A:** Estructura de la tabla principal de pacientes (29 columnas)

**ANEXO B:** Catálogo jerárquico de Especialidades y Subespecialidades

**ANEXO C:** Lista de 33 Comunas de la Provincia de Concepción

**ANEXO D:** Catálogo de Orígenes (5 opciones)

**ANEXO E:** Catálogo de Instituciones/Convenios (29 opciones)

**ANEXO F:** Lista inicial de Ejecutivos/Usuarios del sistema (9 nombres)

**ANEXO G:** Estructura de tabla de auditoría

---

## **Stack Tecnológico Definido**

- **Frontend:** React 18 + TypeScript + Vite
- **UI Components:**  CSS Clasico
- **Backend/DB:** Supabase (PostgreSQL + Autenticación + APIs)
- **Hosting Frontend:** Vercel
- **Control de Versiones:** Git + GitHub

---

## **Estructura de Datos Principal (Tabla Pacientes)**

### **Campos Obligatorios para Nuevo Paciente**

Al ingresar un nuevo paciente, los siguientes campos son **OBLIGATORIOS**:

1. **Especialidad** (referencia a ANEXO B)
2. **Subespecialidad 1** (dependiente de la especialidad seleccionada)
3. **RUT** (con formato chileno y dígito verificador válido)
4. **Nombres** (campo de texto)
5. **1° Apellido** (campo de texto)
6. **2° Apellido** (campo de texto, opcional pero marcado como obligatorio en formulario)
7. **Fecha de Nacimiento** (formato DD/MM/AAAA) 
8. **Dirección** (campo de texto)
9. **Comuna** (referencia a ANEXO C)
10. **Correo** (formato email válido)
11. **Celular 1** (9 dígitos)
12. **Celular 2** (9 dígitos) **← OBLIGATORIO**
13. **Rut Ejecutivo** (autocompletado con usuario logueado) **← ELIMINADO de campos obligatorios (se autocompleta)**

**Condicionalmente obligatorios:**

- **Origen** (obligatorio cuando se selecciona "Operativo" o "Campaña" en origen)
- **Convenio o Institución** (obligatorio cuando se selecciona "Operativo" o "Campaña" en origen)

---

## **Sistema de Auditoría y Trazabilidad**

### **Requisitos de Auditoría:**

1. **Registro Inmutable:** Todo cambio realizado en cualquier registro de paciente debe quedar registrado en una tabla de auditoría **(ver ANEXO G)**.
2. **Información por Cambio:**
    - Usuario que realizó el cambio
    - Fecha y hora exacta del cambio
    - Campo modificado
    - Valor anterior
    - Valor nuevo
3. **Visibilidad:**
    - AdminJefe: Puede ver historial completo de todos los pacientes
    - Admin: Puede ver historial completo de todos los pacientes
    - Usuario: No puede ver historial de auditoría
4. **Immutabilidad:** Los registros de auditoría NO pueden ser modificados o eliminados por nadie.

---

## **Roles del Sistema**

1. **Usuario (Ejecutivo de Recepción):**
    - Puede ingresar nuevos pacientes al sistema.
    - Puede cambiar el estado de espera del paciente (Agendado).
    - Puede registrar fechas de llamadas (1ra, 2da, 3ra).
    - Puede agregar observaciones en campo OBS.
    - **NO puede** modificar información sensible del paciente una vez ingresada (RUT, Nombre, Apellidos, Fecha Nacimiento).
    - **NO puede** modificar especialidades, subespecialidades ni datos de ingreso original.
2. **AdminJefe (Jefe de Recepción/Coordinador):**
    - Tiene todos los permisos del **Usuario**.
    - Puede modificar **cualquier dato** de cualquier paciente.
    - Puede visualizar reportes y estadísticas completas.
    - Puede ver el historial de auditoría de cambios de todos los pacientes.
    - Puede gestionar los catálogos del sistema (especialidades, comunas, instituciones, etc.).
3. **Admin (Administrador del Sistema):**
    - Tiene todos los permisos del **AdminJefe**.
    - Puede gestionar la creación, edición y deshabilitación de cuentas de **Usuario** y **AdminJefe**.

---

## **Historias de Usuario (Priorizadas)**

### **HU-01: Ingreso de Paciente Completo**

**Como** Ejecutivo de Recepción (Usuario),

**Quiero** poder registrar un nuevo paciente con todos los campos proporcionados,

**Para** que quede disponible para ser contactado y agendado.

**Criterios de Aceptación:**

- Formulario React con todos los campos de la estructura principal.
- Validaciones en tiempo real para RUT (formato y dígito verificador), teléfonos (9 dígitos), email, **fecha de nacimiento**.
- Selectores anidados: Especialidad → Subespecialidad_1 → Subespecialidad_2 (cuando aplique).
- Dropdowns para: Comuna (33 opciones), Origen (5 opciones), Institución/Convenio (30 opciones).
- Campos opcionales claramente marcados.
- Al guardar, se registra automáticamente: Fecha_Ingreso (actual), Rut_Ejecutivo_Ingreso (usuario logueado), Agendado (false).

### **HU-02: Visualización y Filtrado Avanzado**

**Como** Usuario o AdminJefe,

**Quiero** ver y filtrar pacientes por múltiples criterios,

**Para** gestionar eficientemente las listas de espera.

**Criterios de Aceptación:**

- Tabla con todas las columnas principales.
- Filtros múltiples combinables: por especialidad, subespecialidad, comuna, origen, estado de agendado, fechas.
- Búsqueda por RUT, nombre + apellidos.
- Ordenamiento por cualquier columna.

### **HU-03: Seguimiento de Llamadas**

**Como** Ejecutivo de Recepción (Usuario),

**Quiero** registrar las fechas de llamadas a pacientes,

**Para** llevar control del contacto y cumplir con el protocolo de 3 llamadas.

**Criterios de Aceptación:**

- Desde la ficha del paciente, botones para registrar 1ra, 2da, 3ra llamada.
- Al hacer clic, se registra la fecha actual automáticamente.
- Visualización clara de qué llamadas han sido realizadas.
- Si se registra la 3ra llamada sin éxito, el sistema debe sugerir agregar una observación en campo OBS indicando "No contactable después de 3 intentos".
- **NO** se cambia automáticamente el estado del paciente, solo se sugiere la observación.

### **HU-04: Agendamiento y Cambio de Estado**

**Como** Usuario,

**Quiero** marcar pacientes como agendados y registrar fecha de cita,

**Para** llevar control de los pacientes que ya tienen cita médica.

**Criterios de Aceptación:**

- Checkbox "Agendado" que al activarse muestre campo para Fecha_Citacion.
- Validación: No se puede agendar sin al menos una llamada registrada.
- Al marcar como agendado, el paciente sale de la vista principal de "Pendientes".

### **HU-05: Dashboard con Estadísticas Detalladas**

**Como** AdminJefe,

**Quiero** ver métricas específicas de gestión,

**Para** tomar decisiones informadas sobre la operación.

**Criterios de Aceptación:**

- Tarjetas con: Total pacientes pendientes, agendados esta semana, no contactables.
- Gráficos: Pacientes por especialidad, por comuna, por origen.
- Tabla: Ejecutivos con más pacientes ingresados/agendados.
- Filtros por fecha para todas las métricas.

### **HU-06: Sistema de Auditoría Completo**

**Como** AdminJefe o Admin,

**Quiero** ver el historial completo de cambios de cualquier paciente,

**Para** auditar modificaciones y mantener trazabilidad.

**Criterios de Aceptación:**

- Pestaña "Historial" en ficha de paciente.
- Tabla con: fecha, usuario, campo cambiado, valor anterior, valor nuevo.
- Los registros son solo lectura para todos.
- Filtros por fecha de modificación y usuario.

### **HU-07: Gestión de Catálogos**

**Como** AdminJefe,

**Quiero** gestionar todos los catálogos del sistema,

**Para** mantener actualizadas las opciones sin intervención técnica.

**Criterios de Aceptación:**

- Módulo separado "Administrar Catálogos".
- CRUD completo para: Especialidades, Subespecialidades, Comunas, Instituciones, Orígenes.
- Para especialidades: mantener relación jerárquica (Especialidad → Sub1 → Sub2).
- Validación: No eliminar elementos en uso (sino que se podría “archivar”).

### **HU-08: Migración Masiva desde Excel**

**Como** Admin,

**Quiero** importar el archivo Excel histórico,

**Para** migrar todos los datos manteniendo las reglas de transformación.

**Criterios de Aceptación:**

- Interfaz de carga de archivo Excel.
- Validación de columnas contra estructura esperada.
- Aplicación automática de reglas: fecha ingreso a 01-01-2025, cálculo de edad, texto erróneo a OBS.
- Reporte detallado de importación (éxitos, errores, advertencias).

### **HU-09: Gestión de Usuarios con Roles**

**Como** Admin,

**Quiero** crear y gestionar usuarios del sistema,

**Para** controlar acceso y permisos.

**Criterios de Aceptación:**

- Formulario de creación de usuario con: RUT, nombre, rol (Usuario, AdminJefe, Admin).
- Asignación automática de contraseña.
- Deshabilitar usuarios sin eliminar sus registros históricos.

### **HU-10: Autocompletado Inteligente por RUT**

**Como** Ejecutivo de Recepción,

**Quiero** que al ingresar un RUT existente en el sistema, se autocomplete automáticamente toda la información personal del paciente,

**Para** agilizar el ingreso de pacientes recurrentes o evitar duplicados accidentales.

**Criterios de Aceptación:**

- Al escribir el RUT en el formulario de ingreso, si el RUT ya existe en el sistema:
    - Se autocompletan automáticamente: Nombres, Apellidos, Fecha de Nacimiento, Dirección, Comuna, Correo, Celular 1, Celular 2.
    - Estos campos autocompletados se muestran en **modo solo lectura** (no editables).
    - Se mantienen editables: Especialidad, Subespecialidad, Origen, Institución, Observaciones.
- El sistema muestra un mensaje claro: "Paciente encontrado en el sistema. Datos personales bloqueados para edición."
- El usuario puede optar por "Ingresar como nuevo paciente" para limpiar el formulario si es un error.

### **HU-11: Administración Completa de Catálogos**

**Como** AdminJefe,

**Quiero** poder gestionar (añadir, editar, eliminar) todos los catálogos del sistema,

**Para** mantener actualizadas las opciones sin necesidad de intervención técnica.

**Criterios de Aceptación:**

- Módulo separado "Administración de Catálogos" con pestañas para:
    - Comunas (ANEXO C)
    - Especialidades y Subespecialidades (ANEXO B)
    - Orígenes (ANEXO D)
    - Instituciones/Convenios (ANEXO E)
- **Añadir:** Formulario para agregar nuevos elementos a cada catálogo.
- **Editar:** Modificar elementos existentes (excepto aquellos en uso por pacientes).
- **Eliminar:** Eliminar elementos no utilizados, con confirmación y validación.
- Para especialidades: mantener estructura jerárquica (Especialidad → Sub1 → Sub2).
- Los cambios en catálogos se reflejan inmediatamente en los formularios de ingreso.

### **HU-12: Autenticación y Gestión de Sesiones**

**Como** cualquier usuario del sistema,

**Quiero** poder iniciar y cerrar sesión de forma segura,

**Para** acceder al sistema con mis credenciales y mantener la seguridad de la información.

**Criterios de Aceptación:**

- Página de login con campos: RUT y contraseña.
- Validación de credenciales contra base de datos Supabase.
- Botón de "Cerrar sesión" visible en todas las páginas cuando el usuario está autenticado.
- Redirección automática a login si la sesión expira o el usuario intenta acceder a rutas protegidas sin autenticación.
- Mensajes de error claros: "Credenciales incorrectas", "Usuario deshabilitado", etc.
- Al iniciar sesión, redirigir al dashboard.

---

## **Reglas de Negocio Específicas**

### **Validaciones:**

1. **RUT:** Formato chileno con guión, dígito verificador válido (validar en frontend), único en el sistema.
2. **Teléfono:** 9 dígitos numéricos para Celular_1 y Celular_2 (ambos obligatorios).
3. **Email:** Formato válido (obligatorio).
4. **Fecha de Nacimiento:** Formato DD/MM/AAAA, fecha válida y que no sea futura.
5. **Campos Condicionales:** Origen e Institución obligatorios cuando Origen = "Operativo" o "Campaña".

### **Restricciones por Rol:**

1. **Usuario:** Solo puede modificar: Fechas de llamada, Agendado, Fecha_Citacion, OBS.
2. **AdminJefe:** Puede modificar cualquier campo excepto registros de auditoría + gestión de catálogos.
3. **Admin:** Acceso total excepto modificación de auditoría .

### **Reglas de Transformación (Migración):**

1. Fecha_Ingreso → 01-01-2025 para datos migrados.
2. Si hay texto donde no corresponde → mover a campo OBS.
3. Si hay múltiples "no contesta" en llamadas → mantener en agendado pero con observación.

### **Autocompletado:**

1. Al detectar RUT existente: bloquear campos personales (solo lectura).
2. El **Rut Ejecutivo** se autocompleta automáticamente con el RUT del usuario logueado y no es editable.

---

## Anexos

---

## **ANEXO A: Estructura de la Tabla Principal de Pacientes**

| **Columna** | **Tipo** | **Obligatorio** | **Descripción** |
| --- | --- | --- | --- |
| ID | Entero (serial) | Sí (automático) | Identificador único autoincremental |
| Fecha_Ingreso | Timestamp | Sí (automático) | Fecha y hora de ingreso del paciente |
| Rut | Texto | Sí | RUT del paciente (formato chileno) |
| Nombre | Texto | Sí | Nombres del paciente |
| Primer_Apellido | Texto | Sí | Primer apellido |
| Segundo_Apellido | Texto | Sí (en formulario) | Segundo apellido |
| **Fecha_Nacimiento** | **Date** | **Sí (en formulario)** | **Fecha de nacimiento (DD/MM/AAAA)**  |
| Correo | Texto | Sí (en formulario) | Correo electrónico |
| Direccion | Texto | Sí (en formulario) | Dirección particular |
| Comuna | Texto | Sí (en formulario) | Comuna de residencia |
| Celular_1 | Texto | Sí | Teléfono principal (9 dígitos) |
| Celular_2 | Texto | Sí (en formulario) | Teléfono secundario |
| Origen | Texto | Condicional | Procedencia del paciente |
| Institucion_Convenio | Texto | Condicional | Institución o convenio asociado |
| Fecha_Primera_Llamada | Date | No | Fecha de primera llamada |
| Fecha_Segunda_Llamada | Date | No | Fecha de segunda llamada |
| Fecha_Tercera_Llamada | Date | No | Fecha de tercera llamada |
| Agendado | Boolean | Sí (automático) | Estado de agendamiento (true/false) |
| Fecha_Citacion | Date | No | Fecha de cita agendada |
| OBS | Texto | No | Observaciones libres |
| Especialidad | Texto | Sí | Especialidad médica principal |
| Subespecialidad_1 | Texto | Sí | Subespecialidad nivel 1 |
| Subespecialidad_2 | Texto | No | Subespecialidad nivel 2 (cuando aplica) |
| Rut_Ejecutivo_Ingreso | Texto | Sí (automático) | RUT del ejecutivo que ingresó al paciente |
| Fecha_Creacion | Timestamp | Sí (automático) | Fecha de creación del registro |
| Fecha_Modificacion | Timestamp | Sí (automático) | Fecha de última modificación |
| Usuario_Ultima_Modificacion | Texto | Sí (automático) | Usuario que realizó la última modificación |

## **ANEXO B: Catálogo Jerárquico de Especialidades y Subespecialidades**

### **Nivel 1: Especialidades**

1. Medicina
2. Odontología

### **Nivel 2: Subespecialidades Nivel 1 (dependientes de Especialidad)**

**Para Medicina:**

- Medicina General
- Dermatología
- Neurología Adulto
- Neurología Pediátrica
- Otorrinolaringología
- Ginecología
- Pediatría
- Psiquiatría
- Oftalmología
- Fonoaudiología
- TM.Oftalmología
- T.Ocupacional
- Kinesiología

**Para Odontología:**

- O.General
- O.Especialidades

### **Nivel 3: Subespecialidades Nivel 2 (dependientes de Subespecialidad Nivel 1)**

**Para Fonoaudiologia:**

- Audición
- Voz
- Infantil

**Para TM.Oftalmología:**

- Glaucoma
- Refracción
- Estrabismo
- Evaluación

**Para T.Ocupacional:**

- Adulto
- Infantil
- Psicosocial

**Para Kinesiologia:**

- Musculoesquelética
- Neurorehabilitación
- Cardiometabólico

**Para O.General:**

- Adulto
- Pediátrica

**Para O.Especialidades:**

- Endodoncia
- Ortodoncia
- Rehabilitación Oral
- Estética Orofacial
- Implantología

---

## **ANEXO C: Lista de Comunas de la Provincia de Concepción**

1. Arauco
2. Cañete
3. Contulmo
4. Curanilahue
5. Lebu
6. Los Alamos
7. Tirua
8. Alto Bíobio
9. Antuco
10. Cabrero
11. Laja
12. Los Ángeles
13. Mulchen
14. Nacimiento
15. Negrete
16. Quilaco
17. Quilleco
18. San Rosendo
19. Santa Bárbara
20. Tucapel
21. Yumbel
22. Concepción
23. Coronel
24. Chiguayante
25. Florida
26. Hualpen
27. Hualqui
28. Lota
29. Penco
30. San Pedro de la Paz
31. Santa Juana
32. Talcahuano
33. Tomé

---

## **ANEXO D: Catálogo de Orígenes**

1. Espontaneo
2. Operativo
3. Campaña
4. Convenio
5. Otros

---

## **ANEXO E: Catálogo de Instituciones/Convenios**

1. DOCENCIA ASISTENCIAL
2. SODIMAC. S.A.
3. BBOSCH
4. COMUNIDAD USS
5. CLUB SOCIAL COLO COLO
6. JENABIEN PDI
7. PARTICULAR
8. HOSPITAL DE LOTA
9. FUNDACION RED MIGRANTES
10. JUNAEB
11. COEMCO
12. Copago Fonasa
13. DEPORTISTAS USS
14. AFAEB-JUNAEB
15. SOMOS TAB
16. CORAPEHI
17. FUNDACION HONRA
18. RED COLABORATIVA
19. XFRAGIL
20. DOWN UP
21. SERNAMEG
22. CLUB DEPORTIVO UDC
23. BOMBEROS CHILE
24. LICEO JORGE SANCHEZ UGARTE
25. COLEGIO PROFESORES CORONEL
26. BIENESTAR DE CARABINEROS
27. SINDICATO RIPLEY
28. ARAMARK
29. GENDARMERIA

---

## **ANEXO F: Lista Inicial de Ejecutivos/Usuarios del Sistema**

1. Maricel Fierro
2. Jazmin Alanes
3. Veronica Cifuentes
4. Fernanda Morales
5. Ynsira Gajardo
6. Marta Elena Muñoz
7. Carla Sanchez
8. Alejandra Leiva
9. Maria Contreras

## **ANEXO G: Estructura de Tabla de Auditoría**

### **Tabla: auditoria_pacientes**

| **Columna** | **Tipo** | **Obligatorio** | **Descripción** |
| --- | --- | --- | --- |
| ID | Entero (serial) | Sí | Identificador único autoincremental |
| Paciente_ID | Entero | Sí | Referencia al paciente modificado (FK a pacientes.ID) |
| Usuario_RUT | Texto | Sí | RUT del usuario que realizó el cambio |
| Fecha_Modificacion | Timestamp | Sí (automático) | Fecha y hora exacta del cambio |
| Campo_Modificado | Texto | Sí | Nombre del campo modificado (ej: "Celular_1", "Agendado") |
| Valor_Anterior | Texto | No | Valor antes del cambio (NULL para nuevos registros) |
| Valor_Nuevo | Texto | Sí | Valor después del cambio |

### **Reglas de Auditoría:**

1. Trigger automático en tabla `pacientes` para registrar todos los cambios.
2. Solo usuarios AdminJefe y Admin pueden consultar esta tabla.
3. Registros inmutables: no se pueden modificar ni eliminarlos.
4. Se debe auditar incluso cuando el Admin modifica catálogos que afectan a pacientes.