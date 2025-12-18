# Sistema de Lista de Espera - USS

Sistema web para la gestión de listas de espera médicas de la Universidad San Sebastián.

## 🚀 Características

- ✅ Registro completo de pacientes con validaciones
- 📋 Visualización y filtrado avanzado de pacientes
- 📞 Sistema de seguimiento de llamadas
- 📊 Dashboard con métricas y estadísticas
- 🔒 Sistema de roles (Admin, Jefe, Usuario)
- 📝 Auditoría completa de cambios
- 🎨 Diseño minimalista y responsive

## 🛠️ Tecnologías

- **Frontend:** React 18 + TypeScript + Vite
- **Estilos:** CSS Clásico (sin frameworks)
- **Datos:** Mock data (simulación completa)

## 📦 Instalación

1. Instalar dependencias:
```bash
npm install
```

2. Iniciar servidor de desarrollo:
```bash
npm run dev
```

3. Abrir en el navegador: http://localhost:5173

## 👥 Usuarios de Prueba

### Administrador
- **RUT:** 12345678-9
- **Contraseña:** admin123
- **Permisos:** Acceso completo

### Jefe
- **RUT:** 23456789-0
- **Contraseña:** jefe123
- **Permisos:** Dashboard + modificación completa

### Usuario
- **RUT:** 34567890-1
- **Contraseña:** user123
- **Permisos:** Registro y seguimiento básico

## 📋 Funcionalidades Principales

### 1. Registro de Pacientes
- Formulario completo con validaciones en tiempo real
- Validación de RUT chileno
- Selección jerárquica de especialidades
- Campos obligatorios según origen

### 2. Lista de Pacientes
- Tabla con todos los pacientes registrados
- Filtros múltiples combinables
- Búsqueda por RUT o nombre
- Ordenamiento por diferentes campos
- Estadísticas rápidas

### 3. Seguimiento
- Registro de hasta 3 llamadas
- Marcado de agendamiento
- Gestión de observaciones
- Historial completo

### 4. Dashboard (Jefe/Admin)
- KPIs principales
- Gráficos por especialidad
- Distribución por comuna
- Rendimiento por ejecutivo

### 5. Auditoría (Jefe/Admin)
- Historial inmutable de cambios
- Trazabilidad completa
- Filtros por fecha y usuario

## 🎨 Diseño

El sistema utiliza una paleta de colores sobria y profesional:
- **Principal:** #667eea (púrpura)
- **Secundario:** #764ba2 (púrpura oscuro)
- **Éxito:** #27ae60 (verde)
- **Advertencia:** #f39c12 (naranja)
- **Peligro:** #e74c3c (rojo)
- **Neutros:** Escala de grises

## 📁 Estructura del Proyecto

```
src/
├── components/
│   ├── Login.tsx/css          # Pantalla de inicio de sesión
│   ├── Layout.tsx/css         # Layout principal con navegación
│   ├── RegistroPaciente.tsx/css   # Formulario de registro
│   ├── ListaPacientes.tsx/css     # Tabla y filtros
│   ├── DetallePaciente.tsx/css    # Vista detallada y seguimiento
│   └── Dashboard.tsx/css      # Métricas y estadísticas
├── AuthContext.tsx            # Contexto de autenticación
├── mockData.ts                # Datos simulados
├── types.ts                   # Tipos TypeScript
├── utils.ts                   # Utilidades y validaciones
├── App.tsx/css                # Componente principal
└── main.tsx                   # Punto de entrada

```

## 🔧 Scripts Disponibles

```bash
# Desarrollo
npm run dev

# Build para producción
npm run build

# Preview de build
npm run preview
```

## 📝 Notas

Este es un frontend **completamente funcional** con datos simulados. Todas las operaciones (registro, edición, seguimiento, auditoría) funcionan en memoria durante la sesión.
Frontend web para la gestión de listas de espera de pacientes en USS. Construido con React + Vite, se integra con Supabase para mostrar listas, registrar seguimientos y actualizar estados de pacientes de forma moderna y colaborativa. Esta repo contiene solo el frontend.
