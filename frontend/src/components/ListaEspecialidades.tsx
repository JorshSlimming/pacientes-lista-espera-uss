import React, { useState, useMemo, useEffect } from 'react';
import { pacientesService, catalogosService } from '../api';
import { PacienteCompleto, Especialidad } from '../types';
import { calcularEdad, formatearRut } from '../utils';
import DetallePaciente from './DetallePaciente';
import Toast from './Toast';
import ConfirmDialog from './ConfirmDialog';
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
  
  const [ordenPor, setOrdenPor] = useState<'fecha_ingreso' | 'num_llamadas'>('fecha_ingreso');
  const [ordenDir, setOrdenDir] = useState<'asc' | 'desc'>('desc');
  const [pacienteSeleccionado, setPacienteSeleccionado] = useState<PacienteCompleto | null>(null);
  
  // Estado para pacientes cargados y loading
  const [pacientesCargados, setPacientesCargados] = useState<PacienteCompleto[]>([]);
  const [cargando, setCargando] = useState(false);
  const [cargandoMas, setCargandoMas] = useState(false);
  const [paginaActual, setPaginaActual] = useState(1);
  const [totalPaginas, setTotalPaginas] = useState(0);
  const [totalResultados, setTotalResultados] = useState(0);
  const [modalLlamada, setModalLlamada] = useState<{ paciente: PacienteCompleto; tipo: 'primera' | 'segunda' | 'tercera' } | null>(null);
  const [fechaHoraLlamada, setFechaHoraLlamada] = useState('');
  const [especialidades, setEspecialidades] = useState<Especialidad[]>([]);
  const [toast, setToast] = useState<{ message: string; type: 'success' | 'error' | 'info' | 'warning' } | null>(null);
  const [confirmDialog, setConfirmDialog] = useState<{
    title: string;
    message: string;
    type: 'danger' | 'warning' | 'info';
    onConfirm: () => void;
  } | null>(null);

  useEffect(() => {
    cargarEspecialidades();
  }, []);

  const cargarEspecialidades = async () => {
    const response = await catalogosService.obtenerEspecialidades();
    console.log('📦 Response completa:', response);
    
    // El backend devuelve el array directamente, pero apiClient lo envuelve en { data }
    let especialidadesData: any = response.data || response;
    
    // Si viene como objeto {0: {...}, 1: {...}}, convertir a array
    if (especialidadesData && typeof especialidadesData === 'object' && !Array.isArray(especialidadesData)) {
      especialidadesData = Object.values(especialidadesData).filter(item => typeof item === 'object' && item !== null && !('success' in item));
    }
    
    // Aplanar estructura jerárquica (viene con hijos anidados)
    if (Array.isArray(especialidadesData)) {
      const aplanadas: any[] = [];
      especialidadesData.forEach((esp: any) => {
        const { hijos, ...espSinHijos } = esp;
        aplanadas.push(espSinHijos);
        if (hijos && Array.isArray(hijos)) {
          hijos.forEach((hijo1: any) => {
            const { hijos: hijos2, ...hijo1SinHijos } = hijo1;
            aplanadas.push(hijo1SinHijos);
            if (hijos2 && Array.isArray(hijos2)) {
              aplanadas.push(...hijos2);
            }
          });
        }
      });
      console.log('✅ Especialidades aplanadas:', aplanadas.length);
      setEspecialidades(aplanadas);
    } else {
      console.error('❌ Especialidades no es array:', especialidadesData);
      setEspecialidades([]);
    }
  };

  const especialidadesPrincipales = useMemo(() => 
    Array.isArray(especialidades) ? especialidades.filter(e => e.nivel === 1) : [], 
    [especialidades]
  );

  // Función recursiva para obtener todos los descendientes de una especialidad
  const obtenerTodosDescendientes = (parentId: number): number[] => {
    const hijosDirectos = especialidades.filter(e => e.parent_id === parentId);
    let todosLosDescendientes = hijosDirectos.map(e => e.id_especialidad || e.id).filter((id): id is number => id !== undefined);
    
    // Recursivamente agregar descendientes de cada hijo
    hijosDirectos.forEach(hijo => {
      const hijoId = hijo.id_especialidad || hijo.id;
      if (hijoId) {
        const descendientesDelHijo = obtenerTodosDescendientes(hijoId);
        todosLosDescendientes = [...todosLosDescendientes, ...descendientesDelHijo];
      }
    });
    
    return todosLosDescendientes;
  };

  // Función para buscar pacientes usando API
  const buscarPacientes = async (cargarMas = false) => {
    if (cargarMas) {
      setCargandoMas(true);
    } else {
      setCargando(true);
      setPaginaActual(1);
      // Resetear resultados cuando es búsqueda nueva
      setPacientesCargados([]);
    }
    
    const filtros: any = {};
    
    // Determinar qué especialidad buscar
    // Prioridad: Sub2 > Sub1 > Especialidad principal > Todas (sin filtro)
    // Cuando es "Todas" en un nivel, buscar todas las hijas de ese padre
    
    // Caso 1: Subespecialidad 2 seleccionada específicamente
    if (filtroSubesp2 && filtroSubesp2 !== '' && filtroSubesp2 !== 'TODOS') {
      filtros.id_especialidad = parseInt(filtroSubesp2);
    } 
    // Caso 2: Subespecialidad 1 seleccionada y Sub2 es "Todas" -> buscar todas las descendientes de Sub1
    else if (filtroSubesp1 && filtroSubesp1 !== '' && filtroSubesp1 !== 'TODOS' && (filtroSubesp2 === '' || filtroSubesp2 === 'TODOS')) {
      const parentId = parseInt(filtroSubesp1);
      const descendientes = obtenerTodosDescendientes(parentId);
      
      if (descendientes.length > 0) {
        // Incluir la sub1 misma Y todos sus descendientes
        filtros.id_especialidad = [parentId, ...descendientes];
      } else {
        // Si no tiene descendientes, buscar por la sub1 misma
        filtros.id_especialidad = parentId;
      }
    }
    // Caso 3: Especialidad principal seleccionada y Sub1 es "Todas" -> buscar todas las descendientes de Esp principal
    else if (filtroEspecialidad && filtroEspecialidad !== '' && filtroEspecialidad !== 'TODOS' && (filtroSubesp1 === '' || filtroSubesp1 === 'TODOS')) {
      const parentId = parseInt(filtroEspecialidad);
      const descendientes = obtenerTodosDescendientes(parentId);
      
      if (descendientes.length > 0) {
        // Incluir la especialidad misma Y todos sus descendientes
        filtros.id_especialidad = [parentId, ...descendientes];
      } else {
        // Si no tiene descendientes, buscar por la especialidad misma
        filtros.id_especialidad = parentId;
      }
    }
    // Caso 4: Todo en "Todas" -> buscar TODAS las especialidades (sin filtro)
    // Si no hay ninguna seleccionada, no se agrega filtro (busca todas)
    
    if (soloPendientes) {
      filtros.agendado = 'no';
    }
    
    const paginaParaBuscar = cargarMas ? paginaActual + 1 : 1;
    
    const response = await pacientesService.buscarConFiltros({ 
      ...filtros,
      paginacion: { page: paginaParaBuscar, per_page: 50 }
    });
    
    const { data, error } = response;
    
    if (error) {
      if (cargarMas) {
        setCargandoMas(false);
        setTotalPaginas(paginaActual);
        return;
      }
      
      const nombreEsp = filtroSubesp2 
        ? especialidades.find(e => (e.id_especialidad || e.id) === parseInt(filtroSubesp2))?.nombre
        : filtroSubesp1
        ? especialidades.find(e => (e.id_especialidad || e.id) === parseInt(filtroSubesp1))?.nombre
        : filtroEspecialidad
        ? especialidades.find(e => (e.id_especialidad || e.id) === parseInt(filtroEspecialidad))?.nombre
        : 'Todas';
      
      setToast({
        message: `Error al buscar pacientes de ${nombreEsp}. Intente con otra especialidad o active "Solo pendientes" para reducir resultados.`,
        type: 'error'
      });
      setCargando(false);
      setCargandoMas(false);
      return;
    }
    
    // El backend devuelve { data: [...], paginacion: {...} } pero apiClient lo envuelve en { data: {...} }
    const resultado = Array.isArray(data) ? data : (data as any)?.data || [];
    const paginacion = Array.isArray(data) ? undefined : (data as any)?.paginacion;
    
    if (cargarMas) {
      setPacientesCargados(prev => [...prev, ...resultado]);
      setPaginaActual(paginaParaBuscar);
    } else {
      setPacientesCargados(resultado);
      setPaginaActual(1);
    }
    
    if (paginacion) {
      setTotalPaginas(paginacion.total_pages || 0);
      setTotalResultados(paginacion.total || 0);
    }
    
    setCargando(false);
    setCargandoMas(false);
  };

  const subespecialidades1 = useMemo(() => {
    if (!filtroEspecialidad || !Array.isArray(especialidades)) return [];
    return especialidades.filter(e => 
      e.parent_id === parseInt(filtroEspecialidad) && e.nivel === 2
    );
  }, [filtroEspecialidad, especialidades]);

  const subespecialidades2 = useMemo(() => {
    if (!filtroSubesp1 || !Array.isArray(especialidades)) return [];
    return especialidades.filter(e => 
      e.parent_id === parseInt(filtroSubesp1) && e.nivel === 3
    );
  }, [filtroSubesp1, especialidades]);

  // Aplicar ordenamiento a los pacientes cargados (ya vienen filtrados de buscarPacientes)
  const pacientesFiltrados = useMemo(() => {
    if (!Array.isArray(pacientesCargados)) {
      console.error('❌ pacientesCargados no es array:', pacientesCargados);
      return [];
    }
    
    let resultado = [...pacientesCargados];

    // Ordenar
    resultado.sort((a, b) => {
      let comparacion = 0;
      const segA = Array.isArray(a.seguimiento) ? a.seguimiento[0] : a.seguimiento;
      const segB = Array.isArray(b.seguimiento) ? b.seguimiento[0] : b.seguimiento;
      
      if (ordenPor === 'fecha_ingreso') {
        comparacion = (segA?.fecha_ingreso || '').localeCompare(segB?.fecha_ingreso || '');
      } else if (ordenPor === 'num_llamadas') {
        const llamadasA = [
          segA?.fecha_primera_llamada,
          segA?.fecha_segunda_llamada,
          segA?.fecha_tercera_llamada
        ].filter(f => f).length;
        
        const llamadasB = [
          segB?.fecha_primera_llamada,
          segB?.fecha_segunda_llamada,
          segB?.fecha_tercera_llamada
        ].filter(f => f).length;
        
        comparacion = llamadasA - llamadasB;
      }
      return ordenDir === 'asc' ? comparacion : -comparacion;
    });

    return resultado;
  }, [pacientesCargados, ordenPor, ordenDir]);

  const cambiarEstadoAgendado = async (paciente: PacienteCompleto, nuevoEstado: 'si' | 'no' | 'desiste') => {
    const seguimientoActual = Array.isArray(paciente.seguimiento) ? paciente.seguimiento[0] : paciente.seguimiento;
    const { error } = await pacientesService.actualizarSeguimiento({
      id_seguimiento: seguimientoActual?.id_seguimiento,
      id_paciente: paciente.id_paciente,
      agendado: nuevoEstado
    });

    if (error) {
      setToast({ message: 'Error al actualizar estado: ' + error, type: 'error' });
    } else {
      // Actualizar solo el paciente en la lista local usando id_seguimiento como identificador único
      setPacientesCargados(prev => 
        prev.map(p => {
          const pSeguimiento = Array.isArray(p.seguimiento) ? p.seguimiento[0] : p.seguimiento;
          const pacienteSeguimiento = Array.isArray(paciente.seguimiento) ? paciente.seguimiento[0] : paciente.seguimiento;
          return pSeguimiento?.id_seguimiento === pacienteSeguimiento?.id_seguimiento
            ? { ...p, seguimiento: Array.isArray(p.seguimiento) ? [{ ...pSeguimiento, agendado: nuevoEstado }] : { ...pSeguimiento, agendado: nuevoEstado } }
            : p;
        })
      );
      setToast({ message: 'Estado actualizado correctamente', type: 'success' });
    }
  };

  const abrirModalLlamada = (paciente: PacienteCompleto) => {
    const seg = Array.isArray(paciente.seguimiento) ? paciente.seguimiento[0] : paciente.seguimiento;
    if (!seg) return;

    let tipo: 'primera' | 'segunda' | 'tercera';
    if (!seg.fecha_primera_llamada) {
      tipo = 'primera';
    } else if (!seg.fecha_segunda_llamada) {
      tipo = 'segunda';
    } else if (!seg.fecha_tercera_llamada) {
      tipo = 'tercera';
    } else {
      setToast({ message: 'Ya se registraron las 3 llamadas', type: 'info' });
      return;
    }

    const ahora = new Date();
    const fechaHoraActual = `${ahora.toISOString().split('T')[0]}T${ahora.toTimeString().slice(0, 5)}`;
    setFechaHoraLlamada(fechaHoraActual);
    setModalLlamada({ paciente, tipo });
  };

  const confirmarRegistroLlamada = async () => {
    if (!modalLlamada || !fechaHoraLlamada) return;

    const fechaISO = fechaHoraLlamada.split('T')[0];
    const { tipo, paciente } = modalLlamada;

    const campoFecha = 
      tipo === 'primera' ? 'fecha_primera_llamada' :
      tipo === 'segunda' ? 'fecha_segunda_llamada' :
      'fecha_tercera_llamada';

    const seguimientoActual = Array.isArray(paciente.seguimiento) ? paciente.seguimiento[0] : paciente.seguimiento;
    const { error } = await pacientesService.actualizarSeguimiento({
      id_seguimiento: seguimientoActual?.id_seguimiento,
      id_paciente: paciente.id_paciente,
      [campoFecha]: fechaISO
    });

    if (error) {
      setToast({ message: 'Error al registrar llamada: ' + error, type: 'error' });
      return;
    }

    if (tipo === 'tercera' && seguimientoActual?.agendado === 'no') {
      setToast({ 
        message: 'Sugerencia: Considere marcar como "desiste" si no se pudo contactar después de 3 intentos', 
        type: 'warning' 
      });
    } else {
      setToast({ message: 'Llamada registrada correctamente', type: 'success' });
    }

    // Actualizar solo el paciente en la lista local usando id_seguimiento
    setPacientesCargados(prev => 
      prev.map(p => {
        const pSeguimiento = Array.isArray(p.seguimiento) ? p.seguimiento[0] : p.seguimiento;
        const pacienteSeguimiento = Array.isArray(paciente.seguimiento) ? paciente.seguimiento[0] : paciente.seguimiento;
        if (pSeguimiento?.id_seguimiento === pacienteSeguimiento?.id_seguimiento) {
          return {
            ...p,
            seguimiento: Array.isArray(p.seguimiento) 
              ? [{ ...pSeguimiento, [campoFecha]: fechaISO }]
              : { ...pSeguimiento, [campoFecha]: fechaISO }
          };
        }
        return p;
      })
    );

    setModalLlamada(null);
    setFechaHoraLlamada('');
  };

  const obtenerEstadoLlamadas = (p: PacienteCompleto) => {
    const seguimiento = Array.isArray(p.seguimiento) ? p.seguimiento[0] : p.seguimiento;
    const { fecha_primera_llamada, fecha_segunda_llamada, fecha_tercera_llamada } = seguimiento || {};
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
                <option key={e.id || e.id_especialidad} value={e.id || e.id_especialidad}>{e.nombre}</option>
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
                  <option key={e.id || e.id_especialidad} value={e.id || e.id_especialidad}>{e.nombre}</option>
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
                  <option key={e.id || e.id_especialidad} value={e.id || e.id_especialidad}>{e.nombre}</option>
                ))}
              </select>
            </div>
          )}
        </div>
        
        <div className="filtro-boton-centrado">
          <button 
            className="btn-buscar" 
            onClick={() => buscarPacientes()} 
            disabled={cargando}
          >
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
                  <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '8px' }}>
                    <div className="spinner"></div>
                    Cargando pacientes...
                  </div>
                </td>
              </tr>
            ) : pacientesFiltrados.length === 0 ? (
              <tr>
                <td colSpan={8} className="no-data">
                  Seleccione filtros y presione "Buscar" para cargar pacientes
                </td>
              </tr>
            ) : (
              pacientesFiltrados.map(p => {
                const seg = Array.isArray(p.seguimiento) ? p.seguimiento[0] : p.seguimiento;
                return (
                <tr key={`${p.id_paciente}-${seg?.id_seguimiento || 0}`}>
                  <td>{formatearRut(p.rut)}</td>
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
                      value={seg?.agendado || 'no'}
                      onChange={(e) => cambiarEstadoAgendado(p, e.target.value as any)}
                      className={`select-agendado agendado-${seg?.agendado || 'no'}`}
                    >
                      <option value="no">NO</option>
                      <option value="si">SÍ</option>
                      <option value="desiste">DESISTE</option>
                    </select>
                  </td>
                  <td>{p.contacto?.primer_celular || 'N/A'}</td>
                  <td>{p.contacto?.segundo_celular || 'N/A'}</td>
                  <td>
                    <button
                      onClick={() => setPacienteSeleccionado(p)}
                      className="btn-ver-detalle"
                      title="Ver detalle del paciente"
                    >
                      Ver Detalle
                    </button>
                  </td>
                </tr>
              );
              })
            )}
          </tbody>
        </table>
      </div>

      {/* Botón cargar más */}
      {paginaActual < totalPaginas && pacientesFiltrados.length > 0 && (
        <div className="paginacion-container">
          <button 
            className="btn-cargar-mas" 
            onClick={() => buscarPacientes(true)}
            disabled={cargandoMas}
          >
            {cargandoMas ? 'Cargando...' : `Cargar más (${pacientesFiltrados.length} de ${totalResultados})`}
          </button>
        </div>
      )}

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
            buscarPacientes();
            onActualizar();
          }}
        />
      )}

      {/* Toast de notificaciones */}
      {toast && (
        <Toast 
          message={toast.message} 
          type={toast.type} 
          onClose={() => setToast(null)} 
        />
      )}

      {/* Diálogo de confirmación */}
      {confirmDialog && (
        <ConfirmDialog
          title={confirmDialog.title}
          message={confirmDialog.message}
          type={confirmDialog.type}
          onConfirm={confirmDialog.onConfirm}
          onCancel={() => setConfirmDialog(null)}
        />
      )}
    </div>
  );
};

export default ListaEspecialidades;
