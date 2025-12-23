# Frontend - Sistema Lista de Espera USS

## ⚡ Inicio Rápido

### 1. Configurar Variables de Entorno
Edita el archivo `.env`:
```env
VITE_SUPABASE_URL=https://tu-proyecto.supabase.co
VITE_SUPABASE_ANON_KEY=tu-anon-key
```
**Obtener credenciales:** Supabase Dashboard → Settings → API

### 2. Instalar y Ejecutar
```bash
npm install
npm run dev
```

### 3. Login
Consulta la tabla `trabajador` en Supabase para obtener el RUT del usuario jefe.

---

## 🎯 Estado de la Integración

### ✅ Funcional
- **Login/Logout** - Autenticación completa con tokens
- **Registro de Pacientes** - Formulario conectado a API
- **Búsqueda por RUT** - Visualización de datos completos
- **Catálogos** - Comunas, orígenes, instituciones, especialidades

### ⏸️ Pendientes (temporalmente deshabilitados)
Dashboard, DashboardJefe, ListaPacientes, GestionUsuarios, Administracion, ListaEspecialidades, DetallePaciente

> Estos componentes muestran mensaje "En proceso de conexión con API"

---

## 📁 Estructura

```
src/
├── api/                    # Servicios backend
│   ├── client.ts          # Cliente HTTP + tokens
│   ├── auth.service.ts    # Login/Logout
│   ├── catalogos.service.ts
│   ├── pacientes.service.ts
│   └── admin.service.ts
├── hooks/
│   └── useCatalogos.ts   # Hook para catálogos
├── components/           # Componentes React
├── config.ts            # Config Supabase
└── AuthContext.tsx      # Gestión de sesión
```

---

## 🔧 Componentes Pendientes - Patrón de Actualización

Para conectar un componente a la API:

```typescript
// ANTES (mock):
import { pacientes } from '../mockData';
const data = pacientes;

// DESPUÉS (API):
import { pacientesService } from '../api';
const [data, setData] = useState([]);
const [loading, setLoading] = useState(true);

useEffect(() => {
  const cargar = async () => {
    const { data, error } = await pacientesService.buscarConFiltros({});
    if (data) setData(data);
    setLoading(false);
  };
  cargar();
}, []);
```

**Referencias:** Ver `NuevoPacienteForm.tsx` y `BusquedaPaciente.tsx`

---

## 🐛 Solución de Problemas

**Error "Failed to fetch":**
- Verifica URLs en `.env`
- Confirma edge functions desplegadas en Supabase

**Credenciales inválidas:**
- Verifica usuario activo en BD: `SELECT * FROM trabajador WHERE activo = true`

**No carga catálogos:**
- Verifica función `obtener-datos-autocompletar` desplegada
- Confirma datos en tablas: `SELECT COUNT(*) FROM comunas`

---

## 📝 Notas Técnicas

- Autenticación: Tokens JWT en localStorage
- Edge Functions: `/functions/v1/nombre-funcion`
- RUTs: Se limpian automáticamente (sin puntos/guiones)
- Sesión: Se mantiene al recargar página
