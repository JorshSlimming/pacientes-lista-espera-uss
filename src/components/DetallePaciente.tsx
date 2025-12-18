import React, { useState } from 'react';
import { useAuth } from '../AuthContext';
import { PacienteCompleto } from '../types';
import { formatearFecha, calcularEdad } from '../utils';
import { auditorias, seguimientos } from '../mockData';
import './DetallePaciente.css';

interface Props {
  paciente: PacienteCompleto;
  onClose: () => void;
  onActualizar: () => void;
}

const DetallePaciente: React.FC<Props> = ({ paciente, onClose, onActualizar }) => {
  const { usuario, hasRole } = useAuth();
  const [tabActiva, setTabActiva] = useState<'info' | 'seguimiento' | 'auditoria'>('info');
  const [obs, setObs] = useState(paciente.obs);
  const [editandoObs, setEditandoObs] = useState(false);

  const auditoriaPaciente = auditorias.filter(a => a.id_paciente === paciente.rut);

  const registrarLlamada = (tipo: 'primera' | 'segunda' | 'tercera') => {
    const fechaActual = new Date().toISOString().split('T')[0];
    const seg = seguimientos.find(s => s.id_paciente === paciente.rut);
    
    if (!seg) return;

    if (tipo === 'primera') {
      seg.fecha_primera_llamada = fechaActual;
    } else if (tipo === 'segunda') {
      seg.fecha_segunda_llamada = fechaActual;
    } else if (tipo === 'tercera') {
      seg.fecha_tercera_llamada = fechaActual;
      if (!seg.agendado) {
        alert('Se recomienda agregar una observación indicando "No contactable después de 3 intentos"');
      }
    }

    // Registrar en auditoría
    auditorias.push({
      id: auditorias.length + 1,
      fecha_modificacion: new Date().toISOString(),
      campo_modificado: `fecha_${tipo}_llamada`,
      valor_nuevo: fechaActual,
      valor_modificado: 'null',
      id_trabajador: usuario?.rut || '',
      id_paciente: paciente.rut,
    });

    onActualizar();
  };

  const marcarAgendado = () => {
    const seg = seguimientos.find(s => s.id_paciente === paciente.rut);
    
    if (!seg) return;

    if (!seg.fecha_primera_llamada) {
      alert('Debe registrar al menos una llamada antes de agendar');
      return;
    }

    const fechaCitacion = prompt('Ingrese fecha de citación (YYYY-MM-DD):');
    if (!fechaCitacion) return;

    const valorAnterior = seg.agendado;
    seg.agendado = 'si';
    seg.fecha_citacion = fechaCitacion;

    // Registrar en auditoría
    auditorias.push({
      id: auditorias.length + 1,
      fecha_modificacion: new Date().toISOString(),
      campo_modificado: 'agendado',
      valor_nuevo: 'si',
      valor_modificado: valorAnterior,
      id_trabajador: usuario?.rut || '',
      id_paciente: paciente.rut,
    });

    auditorias.push({
      id: auditorias.length + 1,
      fecha_modificacion: new Date().toISOString(),
      campo_modificado: 'fecha_citacion',
      valor_nuevo: fechaCitacion,
      valor_modificado: seg.fecha_citacion || 'null',
      id_trabajador: usuario?.rut || '',
      id_paciente: paciente.rut,
    });

    onActualizar();
  };

  const guardarObservacion = () => {
    const valorAnterior = paciente.obs;
    paciente.obs = obs;

    // Registrar en auditoría
    auditorias.push({
      id: auditorias.length + 1,
      fecha_modificacion: new Date().toISOString(),
      campo_modificado: 'obs',
      valor_nuevo: obs,
      valor_modificado: valorAnterior,
      id_trabajador: usuario?.rut || '',
      id_paciente: paciente.rut,
    });

    setEditandoObs(false);
    onActualizar();
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal-content modal-detalle" onClick={(e) => e.stopPropagation()}>
        <div className="modal-header">
          <h2>Detalle del Paciente</h2>
          <button className="btn-close" onClick={onClose}>×</button>
        </div>

        <div className="tabs-container">
          <button
            className={`tab ${tabActiva === 'info' ? 'tab-active' : ''}`}
            onClick={() => setTabActiva('info')}
          >
            Información
          </button>
          <button
            className={`tab ${tabActiva === 'seguimiento' ? 'tab-active' : ''}`}
            onClick={() => setTabActiva('seguimiento')}
          >
            Registro de Llamadas
          </button>
          {hasRole(['jefe']) && (
            <button
              className={`tab ${tabActiva === 'auditoria' ? 'tab-active' : ''}`}
              onClick={() => setTabActiva('auditoria')}
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
                  <label>RUT</label>
                  <div className="info-value">{paciente.rut}</div>
                </div>
                <div className="info-item">
                  <label>Nombre Completo</label>
                  <div className="info-value">
                    {`${paciente.nombre} ${paciente.primer_apellido} ${paciente.segundo_apellido}`}
                  </div>
                </div>
                <div className="info-item">
                  <label>Fecha de Nacimiento</label>
                  <div className="info-value">
                    {formatearFecha(paciente.fecha_nacimiento)} ({calcularEdad(paciente.fecha_nacimiento)} años)
                  </div>
                </div>
                <div className="info-item">
                  <label>Dirección</label>
                  <div className="info-value">{paciente.contacto.direccion}</div>
                </div>
                <div className="info-item">
                  <label>Comuna</label>
                  <div className="info-value">{paciente.comuna.nombre}</div>
                </div>
                <div className="info-item">
                  <label>Correo Electrónico</label>
                  <div className="info-value">{paciente.contacto.correo}</div>
                </div>
                <div className="info-item">
                  <label>Celular 1</label>
                  <div className="info-value">{paciente.contacto.primer_celular}</div>
                </div>
                <div className="info-item">
                  <label>Celular 2</label>
                  <div className="info-value">{paciente.contacto.segundo_celular}</div>
                </div>
                <div className="info-item">
                  <label>Origen</label>
                  <div className="info-value">{paciente.origen.nombre}</div>
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
                  <div className="info-value">{paciente.especialidad.nombre}</div>
                </div>
                <div className="info-item">
                  <label>Ejecutivo de Ingreso</label>
                  <div className="info-value">
                    {paciente.ejecutivo.nombre} {paciente.ejecutivo.apellido}
                  </div>
                </div>
                <div className="info-item">
                  <label>Fecha de Ingreso</label>
                  <div className="info-value">{formatearFecha(paciente.seguimiento.fecha_ingreso)}</div>
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
                    <div className="llamada-fecha">
                      {paciente.seguimiento.fecha_primera_llamada 
                        ? formatearFecha(paciente.seguimiento.fecha_primera_llamada)
                        : 'No registrada'}
                    </div>
                    {!paciente.seguimiento.fecha_primera_llamada && (
                      <button 
                        onClick={() => registrarLlamada('primera')}
                        className="btn-llamada"
                      >
                        Registrar
                      </button>
                    )}
                  </div>

                  <div className="llamada-card">
                    <div className="llamada-numero">2da Llamada</div>
                    <div className="llamada-fecha">
                      {paciente.seguimiento.fecha_segunda_llamada 
                        ? formatearFecha(paciente.seguimiento.fecha_segunda_llamada)
                        : 'No registrada'}
                    </div>
                    {paciente.seguimiento.fecha_primera_llamada && !paciente.seguimiento.fecha_segunda_llamada && (
                      <button 
                        onClick={() => registrarLlamada('segunda')}
                        className="btn-llamada"
                      >
                        Registrar
                      </button>
                    )}
                  </div>

                  <div className="llamada-card">
                    <div className="llamada-numero">3ra Llamada</div>
                    <div className="llamada-fecha">
                      {paciente.seguimiento.fecha_tercera_llamada 
                        ? formatearFecha(paciente.seguimiento.fecha_tercera_llamada)
                        : 'No registrada'}
                    </div>
                    {paciente.seguimiento.fecha_segunda_llamada && !paciente.seguimiento.fecha_tercera_llamada && (
                      <button 
                        onClick={() => registrarLlamada('tercera')}
                        className="btn-llamada"
                      >
                        Registrar
                      </button>
                    )}
                  </div>
                </div>
              </div>
            </div>
          )}

          {tabActiva === 'auditoria' && (
            <div className="auditoria-section">
              {auditoriaPaciente.length === 0 ? (
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
                    {auditoriaPaciente.map(a => (
                      <tr key={a.id}>
                        <td>{new Date(a.fecha_modificacion).toLocaleString('es-CL')}</td>
                        <td>{a.id_trabajador}</td>
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
