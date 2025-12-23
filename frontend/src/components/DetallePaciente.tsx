import React, { useState, useEffect } from 'react';
import { useAuth } from '../AuthContext';
import { PacienteCompleto } from '../types';
import { formatearFecha, calcularEdad } from '../utils';
import { pacientesService } from '../api';
import './DetallePaciente.css';

interface Props {
  paciente: PacienteCompleto;
  onClose: () => void;
  onActualizar: () => void;
}

const DetallePaciente: React.FC<Props> = ({ paciente, onClose }) => {
  const { hasRole } = useAuth();
  const [tabActiva, setTabActiva] = useState<'info' | 'seguimiento' | 'auditoria'>('info');
  const [obs, setObs] = useState(paciente.obs || '');
  const [editandoObs, setEditandoObs] = useState(false);
  const [historial, setHistorial] = useState<any[]>([]);
  const [cargandoHistorial, setCargandoHistorial] = useState(false);
  
  // Estados para datos actualizados del paciente
  const [datosActuales, setDatosActuales] = useState<PacienteCompleto>(paciente);
  
  // Estados para editar fechas (con hora)
  const horaInicial = new Date().toTimeString().slice(0, 5);
  const seguimientoActual = Array.isArray(paciente.seguimiento) ? paciente.seguimiento[0] : paciente.seguimiento;
  const [fecha1, setFecha1] = useState(seguimientoActual?.fecha_primera_llamada ? `${seguimientoActual.fecha_primera_llamada}T${horaInicial}` : '');
  const [fecha2, setFecha2] = useState(seguimientoActual?.fecha_segunda_llamada ? `${seguimientoActual.fecha_segunda_llamada}T${horaInicial}` : '');
  const [fecha3, setFecha3] = useState(seguimientoActual?.fecha_tercera_llamada ? `${seguimientoActual.fecha_tercera_llamada}T${horaInicial}` : '');
  const [agendado, setAgendado] = useState(seguimientoActual?.agendado || 'no');
  const [guardando, setGuardando] = useState(false);

  // Recargar datos del paciente al abrir el modal
  useEffect(() => {
    const cargarDatosActualizados = async () => {
      const { data, error } = await pacientesService.buscarPorRut(paciente.rut);
      if (!error && data) {
        console.log('🔍 Datos cargados del paciente:', data);
        console.log('🔍 Seguimiento raw:', data.seguimiento);
        
        // El seguimiento puede venir como array o como objeto
        const seguimientoRef = Array.isArray(paciente.seguimiento) ? paciente.seguimiento[0] : paciente.seguimiento;
        const seguimiento = Array.isArray(data.seguimiento) 
          ? data.seguimiento.find((s: any) => s.id_seguimiento === seguimientoRef?.id_seguimiento) || data.seguimiento[0]
          : data.seguimiento;
        
        console.log('🔍 Seguimiento seleccionado:', seguimiento);
        
        // Actualizar datosActuales con el seguimiento correcto
        const datosActualizados = {
          ...data,
          seguimiento: seguimiento
        };
        
        setDatosActuales(datosActualizados);
        setObs(data.obs || '');
        
        // Convertir fechas al formato datetime-local (YYYY-MM-DDTHH:MM)
        const ahora = new Date();
        const horaActual = ahora.toTimeString().slice(0, 5);
        
        const f1 = seguimiento?.fecha_primera_llamada;
        const f2 = seguimiento?.fecha_segunda_llamada;
        const f3 = seguimiento?.fecha_tercera_llamada;
        
        console.log('📅 Fechas del backend:', { f1, f2, f3 });
        
        setFecha1(f1 ? `${f1}T${horaActual}` : '');
        setFecha2(f2 ? `${f2}T${horaActual}` : '');
        setFecha3(f3 ? `${f3}T${horaActual}` : '');
        
        console.log('📅 Fechas seteadas:', {
          fecha1: f1 ? `${f1}T${horaActual}` : '',
          fecha2: f2 ? `${f2}T${horaActual}` : '',
          fecha3: f3 ? `${f3}T${horaActual}` : ''
        });
        
        setAgendado(seguimiento?.agendado || 'no');
      }
    };
    cargarDatosActualizados();
  }, [paciente.rut, seguimientoActual?.id_seguimiento]);

  useEffect(() => {
    if (tabActiva === 'auditoria' && hasRole(['jefe'])) {
      cargarHistorial();
    }
  }, [tabActiva]);

  const cargarHistorial = async () => {
    setCargandoHistorial(true);
    try {
      const seguimientoId = Array.isArray(datosActuales.seguimiento) 
        ? datosActuales.seguimiento[0]?.id_seguimiento 
        : datosActuales.seguimiento?.id_seguimiento;
      const response = await pacientesService.obtenerHistorialCambios(
        paciente.id_paciente,
        seguimientoId
      );
      const { data, error } = response;
      if (error) {
        console.error('❌ Error al cargar historial:', error);
        alert(`Error al cargar historial: ${error}`);
        setHistorial([]);
        return;
      }
      // El backend devuelve { success: true, historial: [...] }
      const historialArray = Array.isArray(data) ? data : (data as any)?.historial || (data as any)?.data || [];
      if (Array.isArray(historialArray)) {
        setHistorial(historialArray);
      } else {
        console.error('❌ Historial no es array:', data);
        setHistorial([]);
      }
    } catch (err: any) {
      console.error('❌ Error en cargarHistorial:', err);
      alert(`Error: ${err.message || 'Error desconocido'}`);
      setHistorial([]);
    } finally {
      setCargandoHistorial(false);
    }
  };

  const actualizarFechaLlamada = async (tipo: 'primera' | 'segunda' | 'tercera', fechaCompleta: string | null) => {
    setGuardando(true);
    
    const campoFecha = 
      tipo === 'primera' ? 'fecha_primera_llamada' :
      tipo === 'segunda' ? 'fecha_segunda_llamada' :
      'fecha_tercera_llamada';

    // Extraer solo la fecha (YYYY-MM-DD) del datetime-local
    const soloFecha = fechaCompleta ? fechaCompleta.split('T')[0] : null;

    const seguimientoId = Array.isArray(datosActuales.seguimiento) 
      ? datosActuales.seguimiento[0]?.id_seguimiento 
      : datosActuales.seguimiento?.id_seguimiento;

    const { error } = await pacientesService.actualizarSeguimiento({
      id_seguimiento: seguimientoId,
      id_paciente: datosActuales.id_paciente,
      [campoFecha]: soloFecha
    });

    setGuardando(false);

    if (error) {
      alert(`Error al actualizar llamada: ${error}`);
      return;
    }

    // Actualizar estado local
    if (tipo === 'primera') setFecha1(fechaCompleta || '');
    if (tipo === 'segunda') setFecha2(fechaCompleta || '');
    if (tipo === 'tercera') setFecha3(fechaCompleta || '');
    
    // Actualizar datosActuales
    const seguimientoActualizado = Array.isArray(datosActuales.seguimiento) 
      ? datosActuales.seguimiento[0] 
      : datosActuales.seguimiento;
    
    setDatosActuales(prev => ({
      ...prev,
      seguimiento: {
        ...seguimientoActualizado,
        [campoFecha]: soloFecha
      }
    }));
    
    if (tipo === 'tercera' && !soloFecha && agendado !== 'si') {
      alert('Se recomienda agregar una observación indicando "No contactable después de 3 intentos"');
    }
  };

  const guardarObservacion = async () => {
    setGuardando(true);
    
    const seguimientoId = Array.isArray(datosActuales.seguimiento) 
      ? datosActuales.seguimiento[0]?.id_seguimiento 
      : datosActuales.seguimiento?.id_seguimiento;
    
    const { error } = await pacientesService.actualizarSeguimiento({
      id_seguimiento: seguimientoId,
      id_paciente: datosActuales.id_paciente,
      obs
    });

    setGuardando(false);

    if (error) {
      alert(`Error al guardar observación: ${error}`);
      return;
    }

    setEditandoObs(false);
    setDatosActuales(prev => ({ ...prev, obs }));
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal-content modal-detalle" onClick={(e) => e.stopPropagation()}>
        <div className="modal-header">
          <h2>Detalle de {paciente.nombre} {paciente.primer_apellido} {paciente.segundo_apellido}</h2>
          <button className="btn-close" onClick={onClose}>×</button>
        </div>

        <div className="tabs-container">
          <button
            className={`tab ${tabActiva === 'info' ? 'tab-active' : ''}`}
            onClick={() => setTabActiva('info')}
            data-tab="info"
          >
            Información
          </button>
          <button
            className={`tab ${tabActiva === 'seguimiento' ? 'tab-active' : ''}`}
            onClick={() => setTabActiva('seguimiento')}
            data-tab="seguimiento"
          >
            Registro de Llamadas
          </button>
          {hasRole(['jefe']) && (
            <button
              className={`tab ${tabActiva === 'auditoria' ? 'tab-active' : ''}`}
              onClick={() => setTabActiva('auditoria')}
              data-tab="auditoria"
            >
              Historial de Cambios
            </button>
          )}
        </div>

        <div className="tab-content">
          {tabActiva === 'info' && (
            <div className="info-section">
              <div className="info-grid">
                <div className="info-item">
                  <label>Fecha de Nacimiento</label>
                  <div className="info-value">
                    {formatearFecha(paciente.fecha_nacimiento)} ({calcularEdad(paciente.fecha_nacimiento)} años)
                  </div>
                </div>
                <div className="info-item">
                  <label>Dirección</label>
                  <div className="info-value">{paciente.contacto?.direccion || 'N/A'}</div>
                </div>
                <div className="info-item">
                  <label>Comuna</label>
                  <div className="info-value">{paciente.comuna?.nombre || 'N/A'}</div>
                </div>
                <div className="info-item">
                  <label>Correo Electrónico</label>
                  <div className="info-value">{paciente.contacto?.correo || 'N/A'}</div>
                </div>
                <div className="info-item">
                  <label>Celular 1</label>
                  <div className="info-value">{paciente.contacto?.primer_celular || 'N/A'}</div>
                </div>
                <div className="info-item">
                  <label>Celular 2</label>
                  <div className="info-value">{paciente.contacto?.segundo_celular || 'N/A'}</div>
                </div>
                <div className="info-item">
                  <label>Origen</label>
                  <div className="info-value">{paciente.origen?.nombre || 'N/A'}</div>
                </div>
                {paciente.institucion && (
                  <div className="info-item">
                    <label>Institución/Convenio</label>
                    <div className="info-value">
                      {paciente.institucion.nombre} ({paciente.institucion.tipo})
                    </div>
                  </div>
                )}
                <div className="info-item">
                  <label>Especialidad</label>
                  <div className="info-value">{paciente.especialidad?.nombre || 'N/A'}</div>
                </div>
                <div className="info-item">
                  <label>Ejecutivo de Ingreso</label>
                  <div className="info-value">
                    {paciente.ejecutivo ? `${paciente.ejecutivo.nombre} ${paciente.ejecutivo.apellido}` : 'N/A'}
                  </div>
                </div>
                <div className="info-item">
                  <label>Fecha de Ingreso</label>
                  <div className="info-value">{formatearFecha((Array.isArray(paciente.seguimiento) ? paciente.seguimiento[0] : paciente.seguimiento)?.fecha_ingreso || '')}</div>
                </div>
              </div>

              <div className="observaciones-section">
                <div className="obs-header">
                  <label>Observaciones</label>
                  {!editandoObs && (
                    <button onClick={() => setEditandoObs(true)} className="btn-link">
                      Editar
                    </button>
                  )}
                </div>
                {editandoObs ? (
                  <div>
                    <textarea
                      value={obs}
                      onChange={(e) => setObs(e.target.value)}
                      rows={5}
                      className="obs-textarea"
                    />
                    <div className="obs-actions">
                      <button onClick={() => setEditandoObs(false)} className="btn-secondary">
                        Cancelar
                      </button>
                      <button onClick={guardarObservacion} className="btn-primary">
                        Guardar
                      </button>
                    </div>
                  </div>
                ) : (
                  <div className="info-value obs-display">{obs || '(Sin observaciones)'}</div>
                )}
              </div>
            </div>
          )}

          {tabActiva === 'seguimiento' && (
            <div className="seguimiento-section">
              <div className="llamadas-container">
                <div className="llamadas-grid">
                  <div className="llamada-card">
                    <div className="llamada-numero">1ra Llamada</div>
                    <input
                      type="datetime-local"
                      value={fecha1}
                      onChange={(e) => setFecha1(e.target.value)}
                      className="fecha-input"
                      disabled={guardando}
                    />
                    <div className="llamada-actions">
                      {fecha1 && (
                        <>
                          <button 
                            onClick={() => actualizarFechaLlamada('primera', fecha1)}
                            className="btn-llamada btn-guardar"
                            disabled={guardando || fecha1.split('T')[0] === (Array.isArray(datosActuales.seguimiento) ? datosActuales.seguimiento[0] : datosActuales.seguimiento)?.fecha_primera_llamada}
                          >
                            Guardar
                          </button>
                          <button 
                            onClick={() => {
                              if (confirm('¿Eliminar esta fecha de llamada?')) {
                                actualizarFechaLlamada('primera', null);
                              }
                            }}
                            className="btn-llamada btn-eliminar"
                            disabled={guardando}
                          >
                            Eliminar
                          </button>
                        </>
                      )}
                      {!fecha1 && (
                        <button 
                          onClick={() => {
                            const ahora = new Date();
                            const fechaHora = `${ahora.toISOString().slice(0,16)}`;
                            setFecha1(fechaHora);
                            actualizarFechaLlamada('primera', fechaHora);
                          }}
                          className="btn-llamada"
                          disabled={guardando}
                        >
                          Registrar Ahora
                        </button>
                      )}
                    </div>
                  </div>

                  <div className="llamada-card">
                    <div className="llamada-numero">2da Llamada</div>
                    <input
                      type="datetime-local"
                      value={fecha2}
                      onChange={(e) => setFecha2(e.target.value)}
                      className="fecha-input"
                      disabled={guardando || !fecha1}
                    />
                    <div className="llamada-actions">
                      {fecha2 && (
                        <>
                          <button 
                            onClick={() => actualizarFechaLlamada('segunda', fecha2)}
                            className="btn-llamada btn-guardar"
                            disabled={guardando || fecha2.split('T')[0] === (Array.isArray(datosActuales.seguimiento) ? datosActuales.seguimiento[0] : datosActuales.seguimiento)?.fecha_segunda_llamada}
                          >
                            Guardar
                          </button>
                          <button 
                            onClick={() => {
                              if (confirm('¿Eliminar esta fecha de llamada?')) {
                                actualizarFechaLlamada('segunda', null);
                              }
                            }}
                            className="btn-llamada btn-eliminar"
                            disabled={guardando}
                          >
                            Eliminar
                          </button>
                        </>
                      )}
                      {!fecha2 && fecha1 && (
                        <button 
                          onClick={() => {
                            const ahora = new Date();
                            const fechaHora = `${ahora.toISOString().slice(0,16)}`;
                            setFecha2(fechaHora);
                            actualizarFechaLlamada('segunda', fechaHora);
                          }}
                          className="btn-llamada"
                          disabled={guardando}
                        >
                          Registrar Ahora
                        </button>
                      )}
                    </div>
                  </div>

                  <div className="llamada-card">
                    <div className="llamada-numero">3ra Llamada</div>
                    <input
                      type="datetime-local"
                      value={fecha3}
                      onChange={(e) => setFecha3(e.target.value)}
                      className="fecha-input"
                      disabled={guardando || !fecha2}
                    />
                    <div className="llamada-actions">
                      {fecha3 && (
                        <>
                          <button 
                            onClick={() => actualizarFechaLlamada('tercera', fecha3)}
                            className="btn-llamada btn-guardar"
                            disabled={guardando || fecha3.split('T')[0] === (Array.isArray(datosActuales.seguimiento) ? datosActuales.seguimiento[0] : datosActuales.seguimiento)?.fecha_tercera_llamada}
                          >
                            Guardar
                          </button>
                          <button 
                            onClick={() => {
                              if (confirm('¿Eliminar esta fecha de llamada?')) {
                                actualizarFechaLlamada('tercera', null);
                              }
                            }}
                            className="btn-llamada btn-eliminar"
                            disabled={guardando}
                          >
                            Eliminar
                          </button>
                        </>
                      )}
                      {!fecha3 && fecha2 && (
                        <button 
                          onClick={() => {
                            const ahora = new Date();
                            const fechaHora = `${ahora.toISOString().slice(0,16)}`;
                            setFecha3(fechaHora);
                            actualizarFechaLlamada('tercera', fechaHora);
                          }}
                          className="btn-llamada"
                          disabled={guardando}
                        >
                          Registrar Ahora
                        </button>
                      )}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          )}

          {tabActiva === 'auditoria' && (
            <div className="auditoria-section">
              {cargandoHistorial ? (
                <div className="loading"><div className="spinner"></div> Cargando historial...</div>
              ) : historial.length === 0 ? (
                <div className="no-data">No hay cambios registrados para este paciente</div>
              ) : (
                <table className="tabla-auditoria">
                  <thead>
                    <tr>
                      <th>Fecha y Hora</th>
                      <th>Usuario</th>
                      <th>Campo</th>
                      <th>Valor Anterior</th>
                      <th>Valor Nuevo</th>
                    </tr>
                  </thead>
                  <tbody>
                    {historial.map((a, idx) => (
                      <tr key={idx}>
                        <td>{new Date(a.fecha_modificacion).toLocaleString('es-CL')}</td>
                        <td>{a.trabajador ? `${a.trabajador.nombre} ${a.trabajador.apellido}` : 'Sistema'}</td>
                        <td>{a.campo_modificado}</td>
                        <td>{a.valor_modificado || '(vacío)'}</td>
                        <td>{a.valor_nuevo || '(vacío)'}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default DetallePaciente;
