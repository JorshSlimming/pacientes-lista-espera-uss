import React, { useState, useMemo } from 'react';
import { useAuth } from '../AuthContext';
import NuevoPacienteForm from './NuevoPacienteForm';
import ListaEspecialidades from './ListaEspecialidades';
import BusquedaPaciente from './BusquedaPaciente';
import Administracion from './Administracion';
import GestionUsuarios from './GestionUsuarios';
import { seguimientos } from '../mockData';
import './Layout.css';

type Vista = 'nuevo' | 'especialidades' | 'busqueda' | 'administracion' | 'usuarios';

const Layout: React.FC = () => {
  const { usuario, logout, hasRole } = useAuth();
  const [vistaActiva, setVistaActiva] = useState<Vista>('nuevo');
  const [actualizarKey, setActualizarKey] = useState(0);

  const handleActualizar = () => {
    setActualizarKey(prev => prev + 1);
  };

  // Calcular estadísticas globales para KPIs del encabezado
  const estadisticas = useMemo(() => {
    return {
      totalIngresos: seguimientos.length,
      pendientes: seguimientos.filter(s => s.agendado === 'no').length,
      agendados: seguimientos.filter(s => s.agendado === 'si').length,
      desistidos: seguimientos.filter(s => s.agendado === 'desiste').length,
    };
  }, [actualizarKey]);

  return (
    <div className="layout">
      <header className="header">
        <div className="header-content">
          <div className="header-left">
            <h1>Sistema de Lista de Espera</h1>
            <span className="header-subtitle">Universidad San Sebastián</span>
          </div>

          {/* KPIs en el encabezado - solo para jefes */}
          {hasRole(['jefe']) && (
            <div className="header-kpis">
              <div className="header-kpi kpi-primary">
                <span className="header-kpi-icon">📋</span>
                <div className="header-kpi-info">
                  <span className="header-kpi-value">{estadisticas.totalIngresos}</span>
                  <span className="header-kpi-label">Total Pacientes</span>
                </div>
              </div>
              <div className="header-kpi kpi-warning">
                <span className="header-kpi-icon">⏳</span>
                <div className="header-kpi-info">
                  <span className="header-kpi-value">{estadisticas.pendientes}</span>
                  <span className="header-kpi-label">Por Agendar</span>
                </div>
              </div>
              <div className="header-kpi kpi-success">
                <span className="header-kpi-icon">✓</span>
                <div className="header-kpi-info">
                  <span className="header-kpi-value">{estadisticas.agendados}</span>
                  <span className="header-kpi-label">Ya Agendados</span>
                </div>
              </div>
              <div className="header-kpi kpi-danger">
                <span className="header-kpi-icon">✗</span>
                <div className="header-kpi-info">
                  <span className="header-kpi-value">{estadisticas.desistidos}</span>
                  <span className="header-kpi-label">Desistieron</span>
                </div>
              </div>
            </div>
          )}

          <div className="header-right">
            <div className="user-info">
              <span className="user-name">
                {usuario?.nombre} {usuario?.apellido}
              </span>
              <span className="user-role">
                {usuario?.rol === 'jefe' ? 'Jefe' : 'Usuario'}
              </span>
            </div>
            <button onClick={logout} className="btn-logout">
              Cerrar Sesión
            </button>
          </div>
        </div>
      </header>

      <nav className="navbar">
        <div className="nav-content">
          <div className="nav-links">
            <button
              className={`nav-link ${vistaActiva === 'nuevo' ? 'nav-link-active' : ''}`}
              onClick={() => setVistaActiva('nuevo')}
            >
              ➕ Nuevo Paciente
            </button>
            <button
              className={`nav-link ${vistaActiva === 'especialidades' ? 'nav-link-active' : ''}`}
              onClick={() => setVistaActiva('especialidades')}
            >
              📋 Listado Pacientes
            </button>
            <button
              className={`nav-link ${vistaActiva === 'busqueda' ? 'nav-link-active' : ''}`}
              onClick={() => setVistaActiva('busqueda')}
            >
              🔍 Búsqueda por RUT
            </button>
            {hasRole(['jefe']) && (
              <>
                <button
                  className={`nav-link ${vistaActiva === 'usuarios' ? 'nav-link-active' : ''}`}
                  onClick={() => setVistaActiva('usuarios')}
                >
                  👥 Gestión de Usuarios
                </button>
                <button
                  className={`nav-link ${vistaActiva === 'administracion' ? 'nav-link-active' : ''}`}
                  onClick={() => setVistaActiva('administracion')}
                >
                  ⚙️ Administración de Catálogos
                </button>
              </>
            )}
          </div>
        </div>
      </nav>

      <main className="main-content">
        <div className="container">
          {vistaActiva === 'nuevo' && (
            <NuevoPacienteForm key={actualizarKey} onSuccess={handleActualizar} />
          )}
          {vistaActiva === 'especialidades' && (
            <ListaEspecialidades key={actualizarKey} onActualizar={handleActualizar} />
          )}
          {vistaActiva === 'busqueda' && (
            <BusquedaPaciente key={actualizarKey} />
          )}
          {vistaActiva === 'usuarios' && hasRole(['jefe']) && (
            <GestionUsuarios key={actualizarKey} />
          )}
          {vistaActiva === 'administracion' && hasRole(['jefe']) && (
            <Administracion key={actualizarKey} />
          )}
        </div>
      </main>
    </div>
  );
};

export default Layout;
