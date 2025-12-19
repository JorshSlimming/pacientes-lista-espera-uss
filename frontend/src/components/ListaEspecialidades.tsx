import React, { useState, useMemo, useEffect } from 'react';
import { pacientes, seguimientos, especialidades, trabajadores, auditorias } from '../mockData';
import { PacienteCompleto } from '../types';
import { calcularEdad } from '../utils';
import DetallePaciente from './DetallePaciente';
import './ListaEspecialidades.css';

interface Props {
  onActualizar: () => void;
}

const ListaEspecialidades: React.FC<Props> = ({ onActualizar }) => {
  // Filtros temporales (lo que el usuario selecciona)
  const [filtroEspecialidad, setFiltroEspecialidad] = useState('');
  const [filtroSubesp1, setFiltroSubesp1] = useState('');
  const [filtroSubesp2, setFiltroSubesp2] = useState('');
  const [soloPendientes, setSoloPendientes] = useState(false);
  
  // Filtros aplicados (lo que realmente filtra la lista)
  const [filtrosAplicados, setFiltrosAplicados] = useState({
    especialidad: '',
    subesp1: '',
    subesp2: '',
    pendientes: false
  });
  
  const [ordenPor, setOrdenPor] = useState<'fecha_ingreso' | 'num_llamadas'>('fecha_ingreso');
  const [ordenDir, setOrdenDir] = useState<'asc' | 'desc'>('desc');
  const [pacienteSeleccionado, setPacienteSeleccionado] = useState<PacienteCompleto | null>(null);
  
  // Estado para pacientes cargados y loading
  const [pacientesCargados, setPacientesCargados] = useState<PacienteCompleto[]>([]);
  const [cargando, setCargando] = useState(false);
  const [modalLlamada, setModalLlamada] = useState<{ paciente: PacienteCompleto; tipo: 'primera' | 'segunda' | 'tercera' } | null>(null);
  const [fechaHoraLlamada, setFechaHoraLlamada] = useState('');

  const especialidadesPrincipales = useMemo(() => 
    especialidades.filter(e => e.nivel === 1), []
  );

  // Función para buscar pacientes en mockData según filtros
  const buscarPacientes = () => {
    setCargando(true);
    
    // Construir pacientes completos desde mockData
    let resultado = pacientes.map(p => {
      const seg = seguimientos.find(s => s.id_paciente === p.rut);
      const esp = especialidades.find(e => e.id === seg?.id_especialidad);
      const ejec = trabajadores.find(t => t.rut === seg?.rut_ejecutivo_ingreso);

      return {
        ...p,
        seguimiento: seg!,
        especialidad: esp!,
        comuna: { id: 0, nombre: '' },
        origen: { id: 0, nombre: '', requiere_ci: false },
        institucion: null,
        ejecutivo: ejec!,
      };
    });
    
    // Aplicar filtros seleccionados
    if (filtroEspecialidad) {
      resultado = resultado.filter(p => {
        const esp = especialidades.find(e => e.id === p.seguimiento.id_especialidad);
        if (!esp) return false;
        if (esp.id === parseInt(filtroEspecialidad)) return true;
        if (esp.parent_id === parseInt(filtroEspecialidad)) return true;
        const parent = especialidades.find(e => e.id === esp.parent_id);
        if (parent && parent.parent_id === parseInt(filtroEspecialidad)) return true;
        return false;
      });
    }
    
    if (filtroSubesp1) {
      resultado = resultado.filter(p => {
        const esp = especialidades.find(e => e.id === p.seguimiento.id_especialidad);
        if (!esp) return false;
        if (esp.id === parseInt(filtroSubesp1)) return true;
        if (esp.parent_id === parseInt(filtroSubesp1)) return true;
        return false;
      });
    }
    
    if (filtroSubesp2) {
      resultado = resultado.filter(p => 
        p.seguimiento.id_especialidad === parseInt(filtroSubesp2)
      );
    }
    
    if (soloPendientes) {
      resultado = resultado.filter(p => p.seguimiento.agendado === 'no');
    }
    
    setPacientesCargados(resultado);
    setFiltrosAplicados({
      especialidad: filtroEspecialidad,
      subesp1: filtroSubesp1,
      subesp2: filtroSubesp2,
      pendientes: soloPendientes
    });
    setCargando(false);
  };

  const subespecialidades1 = useMemo(() => {
    if (!filtroEspecialidad) return [];
    return especialidades.filter(e => 
      e.parent_id === parseInt(filtroEspecialidad) && e.nivel === 2
    );
  }, [filtroEspecialidad]);

  const subespecialidades2 = useMemo(() => {
    if (!filtroSubesp1) return [];
    return especialidades.filter(e => 
      e.parent_id === parseInt(filtroSubesp1) && e.nivel === 3
    );
  }, [filtroSubesp1]);

  // Aplicar ordenamiento a los pacientes cargados (ya vienen filtrados de buscarPacientes)
  const pacientesFiltrados = useMemo(() => {
    let resultado = [...pacientesCargados];

    // Ordenar
    resultado.sort((a, b) => {
      let comparacion = 0;
      if (ordenPor === 'fecha_ingreso') {
        comparacion = a.seguimiento.fecha_ingreso.localeCompare(b.seguimiento.fecha_ingreso);
      } else if (ordenPor === 'num_llamadas') {
        const llamadasA = [
          a.seguimiento.fecha_primera_llamada,
          a.seguimiento.fecha_segunda_llamada,
          a.seguimiento.fecha_tercera_llamada
        ].filter(f => f).length;
        
        const llamadasB = [
          b.seguimiento.fecha_primera_llamada,
          b.seguimiento.fecha_segunda_llamada,
          b.seguimiento.fecha_tercera_llamada
        ].filter(f => f).length;
        
        comparacion = llamadasA - llamadasB;
      }
      return ordenDir === 'asc' ? comparacion : -comparacion;
    });

    return resultado;
  }, [pacientesCargados, ordenPor, ordenDir]);

  const cambiarEstadoAgendado = (paciente: PacienteCompleto, nuevoEstado: 'si' | 'no' | 'desiste') => {
    const confirmar = window.confirm(
      `¿Confirmar cambio de estado a "${nuevoEstado.toUpperCase()}" para ${paciente.nombre} ${paciente.primer_apellido}?`
    );
    
    if (!confirmar) return;

    const seg = seguimientos.find(s => s.id_paciente === paciente.rut);
    if (seg) {
      const estadoAnterior = seg.agendado;
      seg.agendado = nuevoEstado;

      // Registrar en auditoría
      auditorias.push({
        id: auditorias.length + 1,
        fecha_modificacion: new Date().toISOString(),
        campo_modificado: 'agendado',
        valor_nuevo: nuevoEstado,
        valor_modificado: estadoAnterior,
        id_trabajador: '23456789-0',
        id_paciente: paciente.rut,
      });

      onActualizar();
    }
  };

  const abrirModalLlamada = (paciente: PacienteCompleto) => {
    const seg = seguimientos.find(s => s.id_paciente === paciente.rut);
    if (!seg) return;

    let tipo: 'primera' | 'segunda' | 'tercera';
    if (!seg.fecha_primera_llamada) {
      tipo = 'primera';
    } else if (!seg.fecha_segunda_llamada) {
      tipo = 'segunda';
    } else if (!seg.fecha_tercera_llamada) {
      tipo = 'tercera';
    } else {
      alert('Ya se registraron las 3 llamadas');
      return;
    }

    const ahora = new Date();
    const fechaHoraActual = `${ahora.toISOString().split('T')[0]}T${ahora.toTimeString().slice(0, 5)}`;
    setFechaHoraLlamada(fechaHoraActual);
    setModalLlamada({ paciente, tipo });
  };

  const confirmarRegistroLlamada = () => {
    if (!modalLlamada || !fechaHoraLlamada) return;

    const seg = seguimientos.find(s => s.id_paciente === modalLlamada.paciente.rut);
    if (!seg) return;

    const fechaISO = fechaHoraLlamada.split('T')[0];
    const { tipo } = modalLlamada;

    if (tipo === 'primera') {
      seg.fecha_primera_llamada = fechaISO;
    } else if (tipo === 'segunda') {
      seg.fecha_segunda_llamada = fechaISO;
    } else if (tipo === 'tercera') {
      seg.fecha_tercera_llamada = fechaISO;
      if (seg.agendado === 'no') {
        alert('Sugerencia: Considere marcar como "desiste" si no se pudo contactar después de 3 intentos');
      }
    }

    // Registrar en auditoría con fecha y hora completa
    auditorias.push({
      id: auditorias.length + 1,
      fecha_modificacion: new Date().toISOString(),
      campo_modificado: `fecha_${tipo}_llamada`,
      valor_nuevo: `${fechaHoraLlamada} (registrado)`,
      valor_modificado: 'null',
      id_trabajador: '23456789-0',
      id_paciente: modalLlamada.paciente.rut,
    });

    setModalLlamada(null);
    setFechaHoraLlamada('');
    onActualizar();
  };

  const obtenerEstadoLlamadas = (p: PacienteCompleto) => {
    const { fecha_primera_llamada, fecha_segunda_llamada, fecha_tercera_llamada } = p.seguimiento;
    const numLlamadas = [fecha_primera_llamada, fecha_segunda_llamada, fecha_tercera_llamada]
      .filter(f => f).length;
    return numLlamadas;
  };



  return (
    <div className="lista-especialidades">
      <div className="filtros-container">
        <div className="filtros-header">
          <h3>Filtros por Especialidad</h3>
          <div className="filtros-actions">
            <label className="checkbox-pendientes">
              <input
                type="checkbox"
                checked={soloPendientes}
                onChange={(e) => setSoloPendientes(e.target.checked)}
              />
              Solo pendientes (no agendados)
            </label>
            <div className="orden-controls-inline">
              <label>Ordenar:</label>
              <select value={ordenPor} onChange={(e) => setOrdenPor(e.target.value as any)}>
                <option value="fecha_ingreso">Fecha Ingreso</option>
                <option value="num_llamadas">Cantidad Llamadas</option>
              </select>
              <button
                onClick={() => setOrdenDir(ordenDir === 'asc' ? 'desc' : 'asc')}
                className="btn-orden"
              >
                {ordenDir === 'asc' ? '↑' : '↓'}
              </button>
            </div>
          </div>
        </div>

        <div className="filtros-grid-esp">
          <div className="filtro-item">
            <label>Especialidad</label>
            <select value={filtroEspecialidad} onChange={(e) => {
              setFiltroEspecialidad(e.target.value);
              setFiltroSubesp1('');
              setFiltroSubesp2('');
            }}>
              <option value="">Todas</option>
              {especialidadesPrincipales.map(e => (
                <option key={e.id} value={e.id}>{e.nombre}</option>
              ))}
            </select>
          </div>

          {subespecialidades1.length > 0 && (
            <div className="filtro-item">
              <label>Subespecialidad 1</label>
              <select value={filtroSubesp1} onChange={(e) => {
                setFiltroSubesp1(e.target.value);
                setFiltroSubesp2('');
              }}>
                <option value="">Todas</option>
                {subespecialidades1.map(e => (
                  <option key={e.id} value={e.id}>{e.nombre}</option>
                ))}
              </select>
            </div>
          )}

          {subespecialidades2.length > 0 && (
            <div className="filtro-item">
              <label>Subespecialidad 2</label>
              <select value={filtroSubesp2} onChange={(e) => setFiltroSubesp2(e.target.value)}>
                <option value="">Todas</option>
                {subespecialidades2.map(e => (
                  <option key={e.id} value={e.id}>{e.nombre}</option>
                ))}
              </select>
            </div>
          )}
        </div>
        
        <div className="filtro-boton-centrado">
          <button className="btn-buscar" onClick={buscarPacientes} disabled={cargando}>
            {cargando ? 'Buscando...' : 'Buscar'}
          </button>
        </div>
        <div className="contador-resultados">
          <span className="contador-badge">{pacientesFiltrados.length} resultados encontrados</span>
        </div>
      </div>

      <div className="tabla-container">
        <table className="tabla-pacientes">
          <thead>
            <tr>
              <th>RUT</th>
              <th>Nombre Completo</th>
              <th>Edad</th>
              <th>Estado Llamadas</th>
              <th>Agendado</th>
              <th>Teléfono 1</th>
              <th>Teléfono 2</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            {cargando ? (
              <tr>
                <td colSpan={8} className="no-data">
                  🔄 Cargando pacientes...
                </td>
              </tr>
            ) : pacientesFiltrados.length === 0 ? (
              <tr>
                <td colSpan={8} className="no-data">
                  {Object.values(filtrosAplicados).every(v => !v) 
                    ? 'Seleccione filtros y presione "Buscar" para cargar pacientes'
                    : 'No se encontraron pacientes con los filtros aplicados'}
                </td>
              </tr>
            ) : (
              pacientesFiltrados.map(p => (
                <tr key={p.rut}>
                  <td>{p.rut}</td>
                  <td>{`${p.nombre} ${p.primer_apellido} ${p.segundo_apellido}`}</td>
                  <td>{calcularEdad(p.fecha_nacimiento)} años</td>
                  <td>
                    <button
                      onClick={() => abrirModalLlamada(p)}
                      className={`btn-llamadas llamadas-${obtenerEstadoLlamadas(p)}`}
                      title="Click para registrar nueva llamada"
                    >
                      {obtenerEstadoLlamadas(p)}/3 llamadas
                    </button>
                  </td>
                  <td>
                    <select
                      value={p.seguimiento.agendado}
                      onChange={(e) => cambiarEstadoAgendado(p, e.target.value as any)}
                      className={`select-agendado agendado-${p.seguimiento.agendado}`}
                    >
                      <option value="no">NO</option>
                      <option value="si">SÍ</option>
                      <option value="desiste">DESISTE</option>
                    </select>
                  </td>
                  <td>{p.contacto.primer_celular}</td>
                  <td>{p.contacto.segundo_celular}</td>
                  <td>
                    <button
                      onClick={() => setPacienteSeleccionado(p)}
                      className="btn-ver-detalle"
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

      {/* Modal de registro de llamada */}
      {modalLlamada && (
        <div className="modal-overlay" onClick={() => setModalLlamada(null)}>
          <div className="modal-content" onClick={(e) => e.stopPropagation()} style={{maxWidth: '400px'}}>
            <div className="modal-header">
              <h2>Registrar {modalLlamada.tipo} Llamada</h2>
              <button className="btn-close" onClick={() => setModalLlamada(null)}>×</button>
            </div>
            <div className="modal-body" style={{padding: '2rem'}}>
              <p style={{marginBottom: '1rem', color: '#2c3e50'}}>
                <strong>Paciente:</strong> {modalLlamada.paciente.nombre} {modalLlamada.paciente.primer_apellido}
              </p>
              <div className="form-group">
                <label>Fecha y Hora de la Llamada <span style={{color: '#e74c3c'}}>*</span></label>
                <input
                  type="datetime-local"
                  value={fechaHoraLlamada}
                  onChange={(e) => setFechaHoraLlamada(e.target.value)}
                  style={{
                    width: '100%',
                    padding: '0.75rem',
                    border: '2px solid #e0e0e0',
                    borderRadius: '6px',
                    fontSize: '0.95rem'
                  }}
                />
              </div>
            </div>
            <div className="modal-footer" style={{padding: '1rem 2rem', borderTop: '1px solid #e0e0e0', display: 'flex', justifyContent: 'flex-end', gap: '1rem'}}>
              <button onClick={() => setModalLlamada(null)} className="btn-secondary">
                Cancelar
              </button>
              <button onClick={confirmarRegistroLlamada} className="btn-primary" disabled={!fechaHoraLlamada}>
                Confirmar
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Modal de detalle del paciente */}
      {pacienteSeleccionado && (
        <DetallePaciente
          paciente={pacienteSeleccionado}
          onClose={() => setPacienteSeleccionado(null)}
          onActualizar={() => {
            setPacienteSeleccionado(null);
            onActualizar();
          }}
        />
      )}
    </div>
  );
};

export default ListaEspecialidades;
