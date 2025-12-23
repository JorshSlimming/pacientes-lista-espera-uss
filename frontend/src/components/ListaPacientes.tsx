import React, { useState, useMemo, useEffect } from 'react';
import { pacientesService, catalogosService } from '../api';
import { PacienteCompleto, Especialidad, Comuna, Origen } from '../types';
import { formatearFecha, calcularEdad } from '../utils';
import DetallePaciente from './DetallePaciente';
import './ListaPacientes.css';

interface Props {
  onActualizar: () => void;
}

const ListaPacientes: React.FC<Props> = ({ onActualizar }) => {
  const [busqueda, setBusqueda] = useState('');
  const [filtroEspecialidad, setFiltroEspecialidad] = useState('');
  const [filtroSubespecialidad1, setFiltroSubespecialidad1] = useState('');
  const [filtroSubespecialidad2, setFiltroSubespecialidad2] = useState('');
  const [filtroComuna, setFiltroComuna] = useState('');
  const [filtroOrigen, setFiltroOrigen] = useState('');
  const [filtroAgendado, setFiltroAgendado] = useState('todos');
  const [ordenPor, setOrdenPor] = useState<'fecha_ingreso' | 'nombre' | 'especialidad'>('fecha_ingreso');
  const [ordenDir, setOrdenDir] = useState<'asc' | 'desc'>('desc');
  const [pacienteSeleccionado, setPacienteSeleccionado] = useState<PacienteCompleto | null>(null);
  
  const [pacientesCompletos, setPacientesCompletos] = useState<PacienteCompleto[]>([]);
  const [especialidades, setEspecialidades] = useState<Especialidad[]>([]);
  const [especialidadesPrincipales, setEspecialidadesPrincipales] = useState<Especialidad[]>([]);
  const [subespecialidades1Filtro, setSubespecialidades1Filtro] = useState<Especialidad[]>([]);
  const [subespecialidades2Filtro, setSubespecialidades2Filtro] = useState<Especialidad[]>([]);
  const [comunas, setComunas] = useState<Comuna[]>([]);
  const [origenes, setOrigenes] = useState<Origen[]>([]);
  const [loading, setLoading] = useState(true);
  const [loadingMore, setLoadingMore] = useState(false);
  const [paginaActual, setPaginaActual] = useState(1);
  const [totalPaginas, setTotalPaginas] = useState(1);
  const [totalPacientes, setTotalPacientes] = useState(0);

  useEffect(() => {
    cargarDatos();
  }, []);

  const cargarDatos = async (resetear = true) => {
    try {
      if (resetear) {
        setLoading(true);
        setPaginaActual(1);
        setPacientesCompletos([]);
      } else {
        setLoadingMore(true);
      }
      
      const pagina = resetear ? 1 : paginaActual + 1;
      
      console.log('📦 Cargando datos - Página:', pagina);
      
      const [pacientesRes, catalogosRes] = await Promise.all([
        pacientesService.buscarConFiltros({
          paginacion: {
            page: pagina,
            per_page: 50
          }
        }),
        resetear ? catalogosService.obtenerDatosAutocompletar() : Promise.resolve({ data: null })
      ]);
      
      console.log('📦 Respuesta pacientes:', pacientesRes);
      console.log('📦 Respuesta catálogos:', catalogosRes);
      
      if (pacientesRes.error) {
        console.error('❌ Error al cargar pacientes:', pacientesRes.error);
        setLoading(false);
        setLoadingMore(false);
        return;
      }
      
      if (pacientesRes.data) {
        console.log('✅ Pacientes recibidos:', Array.isArray(pacientesRes.data) ? pacientesRes.data.length : 'no es array');
        const pacientesData = Array.isArray(pacientesRes.data) ? pacientesRes.data : [];
        if (resetear) {
          setPacientesCompletos(pacientesData);
        } else {
          setPacientesCompletos(prev => [...prev, ...pacientesData]);
        }
        
        // Actualizar info de paginación si viene en la respuesta
        if ((pacientesRes as any).paginacion) {
          const pag = (pacientesRes as any).paginacion;
          console.log('📊 Paginación:', pag);
          setTotalPaginas(pag.total_pages || 1);
          setTotalPacientes(pag.total || 0);
          setPaginaActual(pagina);
        }
      }
      
      if (catalogosRes.data && resetear) {
        const todasEspecialidades = catalogosRes.data.especialidades || [];
        setEspecialidades(todasEspecialidades);
        setEspecialidadesPrincipales(todasEspecialidades.filter((e: Especialidad) => e.nivel === 1 && !e.archivado));
        setComunas(catalogosRes.data.comunas || []);
        setOrigenes(catalogosRes.data.origenes || []);
      }
      
      setLoading(false);
      setLoadingMore(false);
    } catch (error) {
      console.error('❌ Error en cargarDatos:', error);
      setLoading(false);
      setLoadingMore(false);
    }
  };

  const cargarMasPacientes = () => {
    if (paginaActual < totalPaginas && !loadingMore) {
      cargarDatos(false);
    }
  };

  // Función para actualizar un paciente específico sin recargar toda la lista
  const actualizarPaciente = async (rut: string) => {
    try {
      const { data, error } = await pacientesService.buscarPorRut(rut);
      if (!error && data) {
        setPacientesCompletos(prev => 
          prev.map(p => p.rut === rut ? data : p)
        );
      }
    } catch (error) {
      console.error('❌ Error al actualizar paciente:', error);
    }
  };

  // useEffect para actualizar subespecialidades cuando cambia filtro de especialidad
  useEffect(() => {
    if (filtroEspecialidad && especialidades.length > 0) {
      const subs = especialidades.filter(e => e.parent_id === parseInt(filtroEspecialidad) && e.nivel === 2 && !e.archivado);
      setSubespecialidades1Filtro(subs);
      setFiltroSubespecialidad1('');
      setFiltroSubespecialidad2('');
      setSubespecialidades2Filtro([]);
    } else {
      setSubespecialidades1Filtro([]);
      setFiltroSubespecialidad1('');
      setFiltroSubespecialidad2('');
      setSubespecialidades2Filtro([]);
    }
  }, [filtroEspecialidad, especialidades]);

  // useEffect para actualizar subespecialidades nivel 3 cuando cambia subespecialidad 1
  useEffect(() => {
    if (filtroSubespecialidad1 && especialidades.length > 0) {
      const subs = especialidades.filter(e => e.parent_id === parseInt(filtroSubespecialidad1) && e.nivel === 3 && !e.archivado);
      setSubespecialidades2Filtro(subs);
      setFiltroSubespecialidad2('');
    } else {
      setSubespecialidades2Filtro([]);
      setFiltroSubespecialidad2('');
    }
  }, [filtroSubespecialidad1, especialidades]);

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

    // Filtro por especialidad jerárquico
    if (filtroEspecialidad) {
      // Determinar qué nivel de especialidad usar para el filtro
      let idsEspecialidadesAFiltrar: number[] = [];
      
      if (filtroSubespecialidad2) {
        // Si hay subespecialidad 2 seleccionada, filtrar solo por ella
        idsEspecialidadesAFiltrar = [parseInt(filtroSubespecialidad2)];
      } else if (filtroSubespecialidad1) {
        // Si hay subespecialidad 1 seleccionada, incluir ella y todas sus hijas de nivel 3
        idsEspecialidadesAFiltrar = [parseInt(filtroSubespecialidad1)];
        const hijas = especialidades.filter(e => e.parent_id === parseInt(filtroSubespecialidad1));
        idsEspecialidadesAFiltrar.push(...hijas.map(e => (e.id || e.id_especialidad) as number).filter(id => id !== undefined));
      } else {
        // Si solo hay especialidad principal, incluir ella y todas sus hijas (nivel 2 y 3)
        idsEspecialidadesAFiltrar = [parseInt(filtroEspecialidad)];
        const hijasNivel2 = especialidades.filter(e => e.parent_id === parseInt(filtroEspecialidad));
        idsEspecialidadesAFiltrar.push(...hijasNivel2.map(e => (e.id || e.id_especialidad) as number).filter(id => id !== undefined));
        // También agregar las hijas de nivel 3
        hijasNivel2.forEach(hijo2 => {
          const hijasNivel3 = especialidades.filter(e => e.parent_id === (hijo2.id || hijo2.id_especialidad));
          idsEspecialidadesAFiltrar.push(...hijasNivel3.map(e => (e.id || e.id_especialidad) as number).filter(id => id !== undefined));
        });
      }
      
      resultado = resultado.filter(p => {
        const seg = Array.isArray(p.seguimiento) ? p.seguimiento[0] : p.seguimiento;
        return seg?.id_especialidad && idsEspecialidadesAFiltrar.includes(seg.id_especialidad);
      });
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
      resultado = resultado.filter(p => {
        const seg = Array.isArray(p.seguimiento) ? p.seguimiento[0] : p.seguimiento;
        return seg?.agendado === 'si';
      });
    } else if (filtroAgendado === 'pendiente') {
      resultado = resultado.filter(p => {
        const seg = Array.isArray(p.seguimiento) ? p.seguimiento[0] : p.seguimiento;
        return seg?.agendado === 'no';
      });
    }

    // Ordenar
    resultado.sort((a, b) => {
      let comparacion = 0;
      const segA = Array.isArray(a.seguimiento) ? a.seguimiento[0] : a.seguimiento;
      const segB = Array.isArray(b.seguimiento) ? b.seguimiento[0] : b.seguimiento;
      
      if (ordenPor === 'fecha_ingreso') {
        const fechaA = segA?.fecha_ingreso || '';
        const fechaB = segB?.fecha_ingreso || '';
        comparacion = fechaA.localeCompare(fechaB);
      } else if (ordenPor === 'nombre') {
        const nombreA = `${a.nombre} ${a.primer_apellido}`.toLowerCase();
        const nombreB = `${b.nombre} ${b.primer_apellido}`.toLowerCase();
        comparacion = nombreA.localeCompare(nombreB);
      } else if (ordenPor === 'especialidad') {
        const espA = a.especialidad?.nombre || '';
        const espB = b.especialidad?.nombre || '';
        comparacion = espA.localeCompare(espB);
      }
      return ordenDir === 'asc' ? comparacion : -comparacion;
    });

    return resultado;
  }, [pacientesCompletos, busqueda, filtroEspecialidad, filtroSubespecialidad1, filtroSubespecialidad2, filtroComuna, filtroOrigen, filtroAgendado, ordenPor, ordenDir, especialidades]);

  const estadisticas = useMemo(() => {
    return {
      total: pacientesFiltrados.length,
      pendientes: pacientesFiltrados.filter(p => {
        const seg = Array.isArray(p.seguimiento) ? p.seguimiento[0] : p.seguimiento;
        return seg?.agendado === 'no';
      }).length,
      agendados: pacientesFiltrados.filter(p => {
        const seg = Array.isArray(p.seguimiento) ? p.seguimiento[0] : p.seguimiento;
        return seg?.agendado === 'si';
      }).length,
      sinLlamar: pacientesFiltrados.filter(p => {
        const seg = Array.isArray(p.seguimiento) ? p.seguimiento[0] : p.seguimiento;
        return !seg?.fecha_primera_llamada;
      }).length
    };
  }, [pacientesFiltrados]);

  const limpiarFiltros = () => {
    setBusqueda('');
    setFiltroEspecialidad('');
    setFiltroSubespecialidad1('');
    setFiltroSubespecialidad2('');
    setFiltroComuna('');
    setFiltroOrigen('');
    setFiltroAgendado('todos');
  };

  const obtenerEstadoLlamadas = (p: PacienteCompleto) => {
    const seguimiento = Array.isArray(p.seguimiento) ? p.seguimiento[0] : p.seguimiento;
    const { fecha_primera_llamada, fecha_segunda_llamada, fecha_tercera_llamada } = seguimiento || {};
    if (fecha_tercera_llamada) return '3 llamadas';
    if (fecha_segunda_llamada) return '2 llamadas';
    if (fecha_primera_llamada) return '1 llamada';
    return 'Sin llamar';
  };

  if (loading) {
    return (
      <div className="lista-pacientes">
        <div className="loading-spinner">
          <div className="spinner"></div>
        </div>
      </div>
    );
  }

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
              {especialidadesPrincipales.map(e => (
                <option key={e.id || e.id_especialidad} value={e.id || e.id_especialidad}>{e.nombre}</option>
              ))}
            </select>
          </div>

          {filtroEspecialidad && subespecialidades1Filtro.length > 0 && (
            <div className="filtro-item">
              <label>Subespecialidad 1</label>
              <select value={filtroSubespecialidad1} onChange={(e) => setFiltroSubespecialidad1(e.target.value)}>
                <option value="">Todas</option>
                {subespecialidades1Filtro.map(e => (
                  <option key={e.id || e.id_especialidad} value={e.id || e.id_especialidad}>{e.nombre}</option>
                ))}
              </select>
            </div>
          )}

          {filtroSubespecialidad1 && subespecialidades2Filtro.length > 0 && (
            <div className="filtro-item">
              <label>Subespecialidad 2</label>
              <select value={filtroSubespecialidad2} onChange={(e) => setFiltroSubespecialidad2(e.target.value)}>
                <option value="">Todas</option>
                {subespecialidades2Filtro.map(e => (
                  <option key={e.id || e.id_especialidad} value={e.id || e.id_especialidad}>{e.nombre}</option>
                ))}
              </select>
            </div>
          )}

          <div className="filtro-item">
            <label>Comuna</label>
            <select value={filtroComuna} onChange={(e) => setFiltroComuna(e.target.value)}>
              <option value="">Todas</option>
              {comunas.map(c => (
                <option key={c.id || c.id_comuna} value={c.id || c.id_comuna}>{c.nombre}</option>
              ))}
            </select>
          </div>

          <div className="filtro-item">
            <label>Origen</label>
            <select value={filtroOrigen} onChange={(e) => setFiltroOrigen(e.target.value)}>
              <option value="">Todos</option>
              {origenes.map(o => (
                <option key={o.id || o.id_origen} value={o.id || o.id_origen}>{o.nombre}</option>
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
              pacientesFiltrados.map(p => {
                const seg = Array.isArray(p.seguimiento) ? p.seguimiento[0] : p.seguimiento;
                return (
                <tr key={p.rut}>
                  <td>{p.rut}</td>
                  <td>{`${p.nombre} ${p.primer_apellido} ${p.segundo_apellido}`}</td>
                  <td>{calcularEdad(p.fecha_nacimiento)} años</td>
                  <td>{p.especialidad?.nombre || 'N/A'}</td>
                  <td>{p.comuna?.nombre || 'N/A'}</td>
                  <td>{p.origen?.nombre || 'N/A'}</td>
                  <td>
                    <span className={`badge-llamadas llamadas-${seg?.fecha_primera_llamada ? (seg?.fecha_tercera_llamada ? '3' : (seg?.fecha_segunda_llamada ? '2' : '1')) : '0'}`}>
                      {obtenerEstadoLlamadas(p)}
                    </span>
                  </td>
                  <td>
                    <span className={`badge ${seg?.agendado === 'si' ? 'badge-success' : 'badge-warning'}`}>
                      {seg?.agendado === 'si' ? 'Sí' : 'No'}
                    </span>
                  </td>
                  <td>{seg?.fecha_ingreso ? formatearFecha(seg.fecha_ingreso) : 'N/A'}</td>
                  <td>
                    <button
                      onClick={() => setPacienteSeleccionado(p)}
                      className="btn-ver"
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

      {paginaActual < totalPaginas && (
        <div style={{ textAlign: 'center', padding: '20px' }}>
          <button 
            onClick={cargarMasPacientes} 
            disabled={loadingMore}
            className="btn-cargar-mas"
            style={{
              padding: '12px 24px',
              fontSize: '16px',
              backgroundColor: '#4CAF50',
              color: 'white',
              border: 'none',
              borderRadius: '4px',
              cursor: loadingMore ? 'not-allowed' : 'pointer',
              opacity: loadingMore ? 0.6 : 1
            }}
          >
            {loadingMore ? (
              <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                <div className="spinner" style={{ width: '16px', height: '16px', borderWidth: '2px' }}></div>
                Cargando...
              </div>
            ) : `Cargar más (${pacientesCompletos.length} de ${totalPacientes})`}
          </button>
        </div>
      )}

      {pacienteSeleccionado && (
        <DetallePaciente
          paciente={pacienteSeleccionado}
          onClose={() => setPacienteSeleccionado(null)}
          onActualizar={() => {
            actualizarPaciente(pacienteSeleccionado.rut);
            onActualizar();
          }}
        />
      )}
    </div>
  );
};

export default ListaPacientes;
