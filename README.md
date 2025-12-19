# Sistema de Gestión de Lista de Espera de Pacientes USS

## 📋 Descripción

Sistema web completo para la gestión de listas de espera médicas de la Universidad San Sebastián. Consta de un frontend React/TypeScript que se integra con backend Supabase mediante Edge Functions.

## 🚀 Características Principales

### ✅ Gestión de Pacientes
- Registro completo con validaciones en tiempo real
- Validación de RUT chileno
- Selección jerárquica de especialidades (3 niveles)
- Campos obligatorios dinámicos según origen

### 📋 Visualización Avanzada
- Tabla con todos los pacientes registrados
- Filtros múltiples combinables
- Búsqueda por RUT o nombre
- Ordenamiento por diferentes campos
- Estadísticas rápidas por especialidad

### 📞 Sistema de Seguimiento
- Registro de hasta 3 llamadas por paciente
- Marcado de agendamiento exitoso
- Gestión de observaciones detalladas
- Historial completo de interacciones

### 📊 Dashboard Analítico
- KPIs principales en tiempo real
- Gráficos por especialidad y estado
- Distribución geográfica por comuna
- Rendimiento por ejecutivo

### 🔒 Sistema de Roles Multi-nivel
- **AdminJefe:** Acceso completo (usuarios, catálogos, auditoría)
- **Jefe:** Dashboard + modificación completa
- **Usuario:** Registro y seguimiento básico

### 📝 Auditoría Completa
- Historial inmutable de todos los cambios
- Trazabilidad completa de acciones
- Filtros por fecha, usuario y tipo de operación

## 🏗️ Arquitectura del Sistema

### 📁 Estructura del Proyecto

```
pacientes-lista-espera-uss/
├── frontend/                     # Aplicación React + TypeScript + Vite
│   ├── src/
│   │   ├── components/          # Componentes React reutilizables
│   │   │   ├── Login.tsx/css    # Pantalla de inicio de sesión
│   │   │   ├── Layout.tsx/css   # Layout principal con navegación
│   │   │   ├── RegistroPaciente.tsx/css  # Formulario de registro
│   │   │   ├── ListaPacientes.tsx/css    # Tabla y filtros
│   │   │   ├── DetallePaciente.tsx/css   # Vista detallada
│   │   │   └── Dashboard.tsx/css         # Métricas y estadísticas
│   │   ├── api/                 # Llamadas a Edge Functions
│   │   ├── AuthContext.tsx      # Contexto de autenticación
│   │   ├── mockData.ts          # Datos simulados (modo desarrollo)
│   │   ├── types.ts             # Tipos TypeScript
│   │   └── utils.ts             # Utilidades y validaciones
│   ├── index.html
│   ├── package.json
│   └── vite.config.ts
│
├── supabase/                    # Configuración Supabase CLI
│   ├── functions/              # Edge Functions (Backend)
│   │   ├── autenticar-usuario/
│   │   ├── crear-paciente/
│   │   ├── buscar-paciente-rut/
│   │   └── ... (20 funciones total)
│   ├── migrations/             # Migraciones SQL
│   └── config.toml
│
├── Documentos/                 # Documentación técnica
│   ├── Backend Functions.md    # Especificación de API
│   ├── Enunciado.md           # Requisitos del proyecto
│   └── modelo_relacional_bd.md # Diseño de base de datos
│
└── README.md                   # Este archivo
```

## 🛠️ Stack Tecnológico

### Frontend
- **React 18** + **TypeScript** + **Vite**
- **CSS Clásico** (sin frameworks - diseño personalizado)
- **Context API** para gestión de estado de autenticación
- **Fetch API** para comunicación con backend

### Backend (Supabase)
- **PostgreSQL** con **Row Level Security**
- **Edge Functions** en TypeScript
- **bcrypt** para hashing de contraseñas
- **Triggers** para auditoría automática

## 🚀 Inicio Rápido

### Prerrequisitos
- Node.js 18+ y npm
- Cuenta de Supabase
- Supabase CLI instalado globalmente

### 1. Configuración del Frontend
```bash
# Clonar el repositorio (si aplica)
git clone <repositorio>

# Navegar al directorio del frontend
cd pacientes-lista-espera-uss/frontend

# Instalar dependencias
npm install

# Configurar variables de entorno
# Crear archivo .env basado en .env.example
# Obtener valores desde el dashboard de Supabase

# Iniciar servidor de desarrollo
npm run dev
```

### 2. Configuración del Backend (Supabase)
```bash
# Navegar al directorio de Supabase
cd ../supabase

# Login a Supabase CLI
npx supabase login

# Vincular proyecto existente
npx supabase link --project-ref lhhsksiahokbizocjvpf

# Deployar todas las funciones
npx supabase functions deploy

# Aplicar migraciones a la base de datos
npx supabase db push
```

### 3. URLs de Acceso
- **Frontend Local:** http://localhost:5173
- **API Base URL:** https://lhhsksiahokbizocjvpf.supabase.co/functions/v1/

## 🔐 Credenciales de Prueba

### AdminJefe (Acceso Completo)
- **RUT:** 21309172-7
- **Contraseña:** USS2025
- **Permisos:** Crear usuarios, gestionar catálogos, ver auditoría completa

### Usuario Regular (ANEXO F)
- **RUT:** 11111111-1
- **Contraseña:** USS2025
- **Permisos:** Gestión de pacientes y seguimientos

### Modo Desarrollo (Mock Data)
Para desarrollo sin backend, usa:
- **RUT:** 12345678-9
- **Contraseña:** admin123
- **RUT:** 23456789-0
- **Contraseña:** jefe123
- **RUT:** 34567890-1
- **Contraseña:** user123

## 📡 API - Edge Functions

### Autenticación
```
POST /autenticar-usuario      # Login de usuarios
POST /cerrar-sesion          # Logout
GET  /obtener-datos-usuario  # Obtener información del usuario actual
```

### Gestión de Usuarios (AdminJefe)
```
POST /registrar-usuario      # Crear nuevo usuario
POST /archivar-usuario       # Desactivar usuario (soft delete)
POST /cambiar-contrasena     # Cambiar contraseña
POST /listar-usuarios        # Listar todos los usuarios
```

### Gestión de Pacientes
```
POST /crear-paciente                     # Registrar nuevo paciente
GET  /buscar-paciente-rut?rut=...        # Buscar paciente por RUT
POST /buscar-pacientes-filtros           # Búsqueda con filtros avanzados
PUT  /actualizar-seguimiento             # Actualizar estado de seguimiento
PUT  /actualizar-paciente-completo       # Actualizar datos completos (AdminJefe)
GET  /verificar-rut?rut=...              # Verificar disponibilidad de RUT
GET  /obtener-datos-autocompletar        # Datos para autocompletar formularios
```

### Catálogos (AdminJefe)
```
POST /gestion-comunas        # CRUD de comunas
POST /gestion-origenes       # CRUD de orígenes
POST /gestion-instituciones  # CRUD de instituciones
POST /gestion-especialidades # CRUD de especialidades jerárquicas
```

### Reportes
```
GET /estadisticas-historicas          # Estadísticas generales
GET /ingresos-por-ejecutivo           # Rendimiento por usuario
GET /historial-cambios-paciente       # Auditoría de cambios (AdminJefe)
```

## 🗄️ Base de Datos

### Estructura Relacional (9 Tablas)
1. **trabajador** - Usuarios del sistema con roles
2. **comuna** - 33 comunas de la región
3. **origen** - 5 tipos de origen de pacientes
4. **institucion_convenio** - 29 instituciones de convenio
5. **especialidad** - Especialidades médicas jerárquicas
6. **contacto** - Información de contacto de pacientes
7. **paciente** - Datos principales de pacientes
8. **seguimiento** - Historial de seguimientos
9. **auditoria** - Registro de todos los cambios

### Características de BD
- **RLS Policies:** Seguridad a nivel de fila por roles
- **Triggers:** Auditoría automática en tablas críticas
- **Soft Delete:** Usuarios archivados (campo `activo`)
- **Datos Iniciales:** Catálogos pre-cargados para producción

## 🎨 Diseño de Interfaz

### Paleta de Colores
- **Principal:** `#667eea` (púrpura USS)
- **Secundario:** `#764ba2` (púrpura oscuro)
- **Éxito:** `#27ae60` (verde - agendado)
- **Advertencia:** `#f39c12` (naranja - pendiente)
- **Peligro:** `#e74c3c` (rojo - no contactado)
- **Neutros:** Escala de grises para fondos y textos

### Principios de UX
- **Responsive:** Funciona en desktop, tablet y móvil
- **Accesible:** Contrastes adecuados, navegación por teclado
- **Performance:** Carga rápida, optimización de imágenes
- **Consistencia:** Mismos patrones en toda la aplicación

## 🔧 Scripts y Comandos Útiles

### Frontend
```bash
# Desarrollo con hot reload
npm run dev

# Build para producción
npm run build

# Preview del build localmente
npm run preview

# Linter
npm run lint
```

### Supabase (Backend)
```bash
# Ver logs de una función específica
npx supabase functions logs autenticar-usuario --follow

# Deployar función específica
npx supabase functions deploy crear-paciente

# Ver diferencias SQL antes de aplicar migraciones
npx supabase db diff

# Resetear base de datos local (desarrollo)
npx supabase db reset

# Generar tipos TypeScript desde BD
npx supabase gen types typescript --linked > ../frontend/src/types/database.types.ts
```

## 🔒 Seguridad

### Autenticación y Autorización
- Contraseñas hasheadas con **bcrypt**
- Tokens de sesión gestionados por Supabase Auth
- Validación de roles en cada endpoint
- Timeout automático de sesión

### Protección de Datos
- **Row Level Security (RLS)** en PostgreSQL
- Validación de entrada en todos los endpoints
- Sanitización de datos antes de almacenar
- Auditoría de todos los accesos y modificaciones

### Cumplimiento Normativo
- Validación de RUT chileno
- Registro de consentimientos implícitos
- Historial completo de modificaciones
- Exportación controlada de datos

## 📊 Modo de Operación

### Producción
- Conexión a Supabase real
- Datos persistentes en PostgreSQL
- Edge Functions en la nube
- Autenticación real con roles

### Desarrollo (Mock Data)
- Datos simulados en memoria
- Sin necesidad de backend
- Ideal para pruebas y demostraciones
- Todos los flujos funcionales

## 🐛 Solución de Problemas

### Frontend no se conecta al backend
```bash
# Verificar variables de entorno
cat frontend/.env

# Probar conexión a Edge Functions
curl https://lhhsksiahokbizocjvpf.supabase.co/functions/v1/health

# Ver logs de Supabase
npx supabase status
```

### Error al deployar funciones
```bash
# Verificar login
npx supabase projects list

# Re-deployar todas las funciones
npx supabase functions deploy --no-verify-jwt
```

### Problemas con la base de datos
```bash
# Aplicar migraciones desde cero
npx supabase db reset
npx supabase db push
```
