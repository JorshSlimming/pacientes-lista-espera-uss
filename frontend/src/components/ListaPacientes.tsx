import React, { useState, useMemo } from 'react';
import { pacientes, seguimientos, especialidades, comunas, origenes, instituciones, trabajadores } from '../mockData';
import { PacienteCompleto } from '../types';
import { formatearFecha, calcularEdad } from '../utils';
import DetallePaciente from './DetallePaciente';
import './ListaPacientes.css';

interface Props {
  onActualizar: () => void;
}

const ListaPacientes: React.FC<Props> = ({ onActualizar }) => {
  const [busqueda, setBusqueda] = useState('');
  const [filtroEspecialidad, setFiltroEspecialidad] = useState('');
  const [filtroComuna, setFiltroComuna] = useState('');
  const [filtroOrigen, setFiltroOrigen] = useState('');
  const [filtroAgendado, setFiltroAgendado] = useState('todos');
  const [ordenPor, setOrdenPor] = useState<'fecha_ingreso' | 'nombre' | 'especialidad'>('fecha_ingreso');
  const [ordenDir, setOrdenDir] = useState<'asc' | 'desc'>('desc');
  const [pacienteSeleccionado, setPacienteSeleccionado] = useState<PacienteCompleto | null>(null);

  // Construir lista completa de pacientes
  const pacientesCompletos: PacienteCompleto[] = useMemo(() => {
    return pacientes.map(p => {
      const seg = seguimientos.find(s => s.id_paciente === p.rut);
      const esp = especialidades.find(e => e.id === seg?.id_especialidad);
      const com = comunas.find(c => c.id === p.id_comuna);
      const ori = origenes.find(o => o.id === p.id_origen);
      const inst = instituciones.find(i => i.id === p.id_institucion_convenio);
      const ejec = trabajadores.find(t => t.rut === seg?.rut_ejecutivo_ingreso);

      return {
        ...p,
        seguimiento: seg!,
        especialidad: esp!,
        comuna: com!,
        origen: ori!,
        institucion: inst || null,
        ejecutivo: ejec!,
      };
    });
  }, []);

  // Filtrar y ordenar pacientes
  const pacientesFiltrados = useMemo(() => {
    let resultado = [...pacientesCompletos];

    // Búsqueda por RUT o nombre
    if (busqueda) {
      const busquedaLower = busqueda.toLowerCase();
      resultado = resultado.filter(p =>
        p.rut.toLowerCase().includes(busquedaLower) ||
        p.nombre.toLowerCase().includes(busquedaLower) ||
        p.primer_apellido.toLowerCase().includes(busquedaLower) ||
        p.segundo_apellido.toLowerCase().includes(busquedaLower)
      );
    }

    // Filtro por especialidad
    if (filtroEspecialidad) {
      resultado = resultado.filter(p => p.seguimiento.id_especialidad === parseInt(filtroEspecialidad));
    }

    // Filtro por comuna
    if (filtroComuna) {
      resultado = resultado.filter(p => p.id_comuna === parseInt(filtroComuna));
    }

    // Filtro por origen
    if (filtroOrigen) {
      resultado = resultado.filter(p => p.id_origen === parseInt(filtroOrigen));
    }

    // Filtro por estado de agendado
    if (filtroAgendado === 'agendado') {
      resultado = resultado.filter(p => p.seguimiento.agendado);
    } else if (filtroAgendado === 'pendiente') {
      resultado = resultado.filter(p => !p.seguimiento.agendado);
    }

    // Ordenar
    resultado.sort((a, b) => {
      let comparacion = 0;
      if (ordenPor === 'fecha_ingreso') {
        comparacion = a.seguimiento.fecha_ingreso.localeCompare(b.seguimiento.fecha_ingreso);
      } else if (ordenPor === 'nombre') {
        const nombreA = `${a.nombre} ${a.primer_apellido}`.toLowerCase();
        const nombreB = `${b.nombre} ${b.primer_apellido}`.toLowerCase();
        comparacion = nombreA.localeCompare(nombreB);
      } else if (ordenPor === 'especialidad') {
        comparacion = a.especialidad.nombre.localeCompare(b.especialidad.nombre);
      }
      return ordenDir === 'asc' ? comparacion : -comparacion;
    });

    return resultado;
  }, [pacientesCompletos, busqueda, filtroEspecialidad, filtroComuna, filtroOrigen, filtroAgendado, ordenPor, ordenDir]);

  const estadisticas = useMemo(() => {
    return {
      total: pacientesFiltrados.length,
      pendientes: pacientesFiltrados.filter(p => !p.seguimiento.agendado).length,
      agendados: pacientesFiltrados.filter(p => p.seguimiento.agendado).length,
      sinLlamar: pacientesFiltrados.filter(p => !p.seguimiento.fecha_primera_llamada).length,
    };
  }, [pacientesFiltrados]);

  const limpiarFiltros = () => {
    setBusqueda('');
    setFiltroEspecialidad('');
    setFiltroComuna('');
    setFiltroOrigen('');
    setFiltroAgendado('todos');
  };

  const obtenerEstadoLlamadas = (p: PacienteCompleto) => {
    const { fecha_primera_llamada, fecha_segunda_llamada, fecha_tercera_llamada } = p.seguimiento;
    if (fecha_tercera_llamada) return '3 llamadas';
    if (fecha_segunda_llamada) return '2 llamadas';
    if (fecha_primera_llamada) return '1 llamada';
    return 'Sin llamar';
  };

  return (
    <div className="lista-pacientes">
      <div className="filtros-container">
        <div className="filtros-header">
          <h3>Filtros de Búsqueda</h3>
          <button onClick={limpiarFiltros} className="btn-link">Limpiar filtros</button>
        </div>

        <div className="filtros-grid">
          <div className="filtro-item">
            <label>Búsqueda (RUT o Nombre)</label>
            <input
              type="text"
              value={busqueda}
              onChange={(e) => setBusqueda(e.target.value)}
              placeholder="Buscar paciente..."
            />
          </div>

          <div className="filtro-item">
            <label>Especialidad</label>
            <select value={filtroEspecialidad} onChange={(e) => setFiltroEspecialidad(e.target.value)}>
              <option value="">Todas</option>
              {especialidades.map(e => (
                <option key={e.id} value={e.id}>{e.nombre}</option>
              ))}
            </select>
          </div>

          <div className="filtro-item">
            <label>Comuna</label>
            <select value={filtroComuna} onChange={(e) => setFiltroComuna(e.target.value)}>
              <option value="">Todas</option>
              {comunas.map(c => (
                <option key={c.id} value={c.id}>{c.nombre}</option>
              ))}
            </select>
          </div>

          <div className="filtro-item">
            <label>Origen</label>
            <select value={filtroOrigen} onChange={(e) => setFiltroOrigen(e.target.value)}>
              <option value="">Todos</option>
              {origenes.map(o => (
                <option key={o.id} value={o.id}>{o.nombre}</option>
              ))}
            </select>
          </div>

          <div className="filtro-item">
            <label>Estado</label>
            <select value={filtroAgendado} onChange={(e) => setFiltroAgendado(e.target.value)}>
              <option value="todos">Todos</option>
              <option value="pendiente">Pendientes</option>
              <option value="agendado">Agendados</option>
            </select>
          </div>

          <div className="filtro-item">
            <label>Ordenar por</label>
            <div className="orden-controls">
              <select 
                value={ordenPor} 
                onChange={(e) => setOrdenPor(e.target.value as any)}
                style={{ flex: 1 }}
              >
                <option value="fecha_ingreso">Fecha Ingreso</option>
                <option value="nombre">Nombre</option>
                <option value="especialidad">Especialidad</option>
              </select>
              <button
                onClick={() => setOrdenDir(ordenDir === 'asc' ? 'desc' : 'asc')}
                className="btn-orden"
                title={ordenDir === 'asc' ? 'Ascendente' : 'Descendente'}
              >
                {ordenDir === 'asc' ? '↑' : '↓'}
              </button>
            </div>
          </div>
        </div>
      </div>

      <div className="estadisticas-rapidas">
        <div className="stat-card">
          <div className="stat-value">{estadisticas.total}</div>
          <div className="stat-label">Total</div>
        </div>
        <div className="stat-card">
          <div className="stat-value">{estadisticas.pendientes}</div>
          <div className="stat-label">Pendientes</div>
        </div>
        <div className="stat-card">
          <div className="stat-value">{estadisticas.agendados}</div>
          <div className="stat-label">Agendados</div>
        </div>
        <div className="stat-card">
          <div className="stat-value">{estadisticas.sinLlamar}</div>
          <div className="stat-label">Sin Llamar</div>
        </div>
      </div>

      <div className="tabla-container">
        <table className="tabla-pacientes">
          <thead>
            <tr>
              <th>RUT</th>
              <th>Nombre Completo</th>
              <th>Edad</th>
              <th>Especialidad</th>
              <th>Comuna</th>
              <th>Origen</th>
              <th>Estado Llamadas</th>
              <th>Agendado</th>
              <th>Fecha Ingreso</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            {pacientesFiltrados.length === 0 ? (
              <tr>
                <td colSpan={10} className="no-data">
                  No se encontraron pacientes con los filtros aplicados
                </td>
              </tr>
            ) : (
              pacientesFiltrados.map(p => (
                <tr key={p.rut}>
                  <td>{p.rut}</td>
                  <td>{`${p.nombre} ${p.primer_apellido} ${p.segundo_apellido}`}</td>
                  <td>{calcularEdad(p.fecha_nacimiento)} años</td>
                  <td>{p.especialidad.nombre}</td>
                  <td>{p.comuna.nombre}</td>
                  <td>{p.origen.nombre}</td>
                  <td>
                    <span className={`badge-llamadas llamadas-${p.seguimiento.fecha_primera_llamada ? (p.seguimiento.fecha_tercera_llamada ? '3' : (p.seguimiento.fecha_segunda_llamada ? '2' : '1')) : '0'}`}>
                      {obtenerEstadoLlamadas(p)}
                    </span>
                  </td>
                  <td>
                    <span className={`badge ${p.seguimiento.agendado ? 'badge-success' : 'badge-warning'}`}>
                      {p.seguimiento.agendado ? 'Sí' : 'No'}
                    </span>
                  </td>
                  <td>{formatearFecha(p.seguimiento.fecha_ingreso)}</td>
                  <td>
                    <button
                      onClick={() => setPacienteSeleccionado(p)}
                      className="btn-ver"
                    >
                      Ver Detalle
                    </button>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>

      {pacienteSeleccionado && (
        <DetallePaciente
          paciente={pacienteSeleccionado}
          onClose={() => setPacienteSeleccionado(null)}
          onActualizar={() => {
            onActualizar();
            setPacienteSeleccionado(null);
          }}
        />
      )}
    </div>
  );
};

export default ListaPacientes;
