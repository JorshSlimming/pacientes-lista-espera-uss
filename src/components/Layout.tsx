import React, { useState } from 'react';
import { useAuth } from '../AuthContext';
import NuevoPacienteForm from './NuevoPacienteForm';
import ListaEspecialidades from './ListaEspecialidades';
import BusquedaPaciente from './BusquedaPaciente';
import Administracion from './Administracion';
import './Layout.css';

type Vista = 'nuevo' | 'especialidades' | 'busqueda' | 'administracion';

const Layout: React.FC = () => {
  const { usuario, logout, hasRole } = useAuth();
  const [vistaActiva, setVistaActiva] = useState<Vista>('nuevo');
  const [actualizarKey, setActualizarKey] = useState(0);

  const handleActualizar = () => {
    setActualizarKey(prev => prev + 1);
  };

  return (
    <div className="layout">
      <header className="header">
        <div className="header-content">
          <div className="header-left">
            <h1>Sistema de Lista de Espera</h1>
            <span className="header-subtitle">Universidad San Sebastián</span>
          </div>
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
              <button
                className={`nav-link ${vistaActiva === 'administracion' ? 'nav-link-active' : ''}`}
                onClick={() => setVistaActiva('administracion')}
              >
                ⚙️ Administración
              </button>
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
          {vistaActiva === 'administracion' && hasRole(['jefe']) && (
            <Administracion key={actualizarKey} />
          )}
        </div>
      </main>
    </div>
  );
};

export default Layout;
