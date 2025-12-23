import React, { useState } from 'react';
import { pacientesService } from '../api';
import { PacienteCompleto } from '../types';
import { validarRut, formatearFecha, calcularEdad } from '../utils';
import { useAuth } from '../AuthContext';
import ModalHistorial from './ModalHistorial';
import './BusquedaPaciente.css';

const BusquedaPaciente: React.FC = () => {
  const { hasRole } = useAuth();
  const [rutBusqueda, setRutBusqueda] = useState('');
  const [pacienteEncontrado, setPacienteEncontrado] = useState<PacienteCompleto | null>(null);
  const [historialSeleccionado, setHistorialSeleccionado] = useState<{
    idPaciente: number;
    idSeguimiento: number;
    nombrePaciente: string;
    especialidad: string;
  } | null>(null);
  const [error, setError] = useState('');
  const [buscando, setBuscando] = useState(false);

  const buscarPaciente = async () => {
    setError('');
    
    if (!rutBusqueda.trim()) {
      setError('Ingrese un RUT para buscar');
      return;
    }

    // Normalizar el RUT ingresado para validación y búsqueda
    const rutNormalizado = rutBusqueda.replace(/\./g, '').replace(/-/g, '').trim();
    
    if (!validarRut(rutNormalizado)) {
      setError('RUT inválido. Verifique el formato y dígito verificador.');
      return;
    }

    setBuscando(true);
    const { data, error: apiError } = await pacientesService.buscarPorRut(rutNormalizado);
    setBuscando(false);
    
    if (apiError || !data) {
      setError(apiError || 'No se encontró ningún paciente con ese RUT');
      setPacienteEncontrado(null);
      return;
    }

    setPacienteEncontrado(data);
  };

  const obtenerEstadoLlamadas = (seg: any) => {
    const { fecha_primera_llamada, fecha_segunda_llamada, fecha_tercera_llamada } = seg;
    const numLlamadas = [fecha_primera_llamada, fecha_segunda_llamada, fecha_tercera_llamada]
      .filter(f => f).length;
    return numLlamadas;
  };

  return (
    <div className="busqueda-paciente">
      <div className="busqueda-form">
        <div className="busqueda-input-group">
          <input
            type="text"
            value={rutBusqueda}
            onChange={(e) => setRutBusqueda(e.target.value)}
            placeholder="Ingrese RUT (ej: 12345678-9)"
            onKeyPress={(e) => e.key === 'Enter' && buscarPaciente()}
            disabled={buscando}
          />
          <button onClick={buscarPaciente} className="btn-buscar" disabled={buscando}>
            {buscando ? 'Buscando...' : 'Buscar'}
          </button>
        </div>
        {error && <div className="error-busqueda">{error}</div>}
      </div>

      {pacienteEncontrado && (
        <div className="resultados-container">
          <div className="info-contacto-card">
            <h3>Información de Contacto</h3>
            <div className="info-grid-2col">
              <div className="info-item">
                <label>Nombre Completo</label>
                <div className="info-value">
                  {`${pacienteEncontrado.nombre} ${pacienteEncontrado.primer_apellido} ${pacienteEncontrado.segundo_apellido}`}
                </div>
              </div>
              <div className="info-item">
                <label>Fecha de Nacimiento</label>
                <div className="info-value">
                  {formatearFecha(pacienteEncontrado.fecha_nacimiento)} ({calcularEdad(pacienteEncontrado.fecha_nacimiento)} años)
                </div>
              </div>
              <div className="info-item">
                <label>Correo Electrónico</label>
                <div className="info-value">{pacienteEncontrado.contacto?.correo || 'N/A'}</div>
              </div>
              <div className="info-item">
                <label>Teléfono 1</label>
                <div className="info-value telefono">{pacienteEncontrado.contacto?.primer_celular || 'N/A'}</div>
              </div>
              <div className="info-item">
                <label>Teléfono 2</label>
                <div className="info-value telefono">{pacienteEncontrado.contacto?.segundo_celular || 'N/A'}</div>
              </div>
              <div className="info-item">
                <label>Dirección</label>
                <div className="info-value">{pacienteEncontrado.contacto?.direccion || 'N/A'}</div>
              </div>
              <div className="info-item">
                <label>Comuna</label>
                <div className="info-value">{pacienteEncontrado.comuna?.nombre}</div>
              </div>
              <div className="info-item">
                <label>Origen</label>
                <div className="info-value">{pacienteEncontrado.origen?.nombre}</div>
              </div>
              {pacienteEncontrado.institucion && (
                <div className="info-item">
                  <label>Institución/Convenio</label>
                  <div className="info-value">
                    {pacienteEncontrado.institucion.nombre} ({pacienteEncontrado.institucion.tipo})
                  </div>
                </div>
              )}
              <div className="info-item info-full-width">
                <label>Observaciones</label>
                <div className="info-value">{pacienteEncontrado.obs || 'Sin observaciones'}</div>
              </div>
            </div>
          </div>

          <div className="agendamientos-card">
            <div className="agendamientos-header">
              <h3>Agendamientos ({pacienteEncontrado.seguimiento?.length || 0})</h3>
            </div>

            {!pacienteEncontrado.seguimiento || pacienteEncontrado.seguimiento.length === 0 ? (
              <div className="no-data">Sin información de seguimiento</div>
            ) : (
              <div className="agendamientos-lista">
                {pacienteEncontrado.seguimiento.map((seg: any, index: number) => (
                  <div key={seg.id_seguimiento || index} className="agendamiento-item">
                    <div className="agendamiento-header-item">
                      <div className="agendamiento-especialidad">
                        {seg.especialidad?.nombre || 'Especialidad no encontrada'}
                      </div>
                      <div style={{display: 'flex', gap: '8px', alignItems: 'center'}}>
                        <span className={`badge-agendado agendado-${seg.agendado}`}>
                          {seg.agendado === 'si' ? 'AGENDADO' : seg.agendado === 'no' ? 'PENDIENTE' : 'DESISTE'}
                        </span>
                        {hasRole(['jefe']) && (
                          <button
                            onClick={() => {
                              setHistorialSeleccionado({
                                idPaciente: pacienteEncontrado.id_paciente,
                                idSeguimiento: seg.id_seguimiento,
                                nombrePaciente: `${pacienteEncontrado.nombre} ${pacienteEncontrado.primer_apellido} ${pacienteEncontrado.segundo_apellido}`,
                                especialidad: seg.especialidad?.nombre || 'Especialidad no encontrada'
                              });
                            }}
                            className="btn-historial-small"
                            title="Ver historial de cambios"
                          >
                            📜
                          </button>
                        )}
                      </div>
                    </div>
                    
                    <div className="agendamiento-detalles">
                      <div className="detalle-item">
                        <span className="detalle-label">Fecha Ingreso:</span>
                        <span className="detalle-valor">{formatearFecha(seg.fecha_ingreso)}</span>
                      </div>
                      
                      <div className="detalle-item">
                        <span className="detalle-label">Estado Llamadas:</span>
                        <span className={`badge-llamadas llamadas-${obtenerEstadoLlamadas(seg)}`}>
                          {obtenerEstadoLlamadas(seg)}/3 llamadas
                        </span>
                      </div>
                      
                      {seg.fecha_primera_llamada && (
                        <div className="detalle-item">
                          <span className="detalle-label">1ra Llamada:</span>
                          <span className="detalle-valor">{formatearFecha(seg.fecha_primera_llamada)}</span>
                        </div>
                      )}
                      
                      {seg.fecha_segunda_llamada && (
                        <div className="detalle-item">
                          <span className="detalle-label">2da Llamada:</span>
                          <span className="detalle-valor">{formatearFecha(seg.fecha_segunda_llamada)}</span>
                        </div>
                      )}
                      
                      {seg.fecha_tercera_llamada && (
                        <div className="detalle-item">
                          <span className="detalle-label">3ra Llamada:</span>
                          <span className="detalle-valor">{formatearFecha(seg.fecha_tercera_llamada)}</span>
                        </div>
                      )}
                      
                      {seg.fecha_citacion && (
                        <div className="detalle-item">
                          <span className="detalle-label">Fecha Citación:</span>
                          <span className="detalle-valor destacado">{formatearFecha(seg.fecha_citacion)}</span>
                        </div>
                      )}
                      
                      <div className="detalle-item">
                        <span className="detalle-label">Ejecutivo:</span>
                        <span className="detalle-valor">
                          {seg.ejecutivo ? `${seg.ejecutivo.nombre} ${seg.ejecutivo.apellido}` : 'No asignado'}
                        </span>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>
      )}

      {/* Modal de historial */}
      {historialSeleccionado && (
        <ModalHistorial
          idPaciente={historialSeleccionado.idPaciente}
          idSeguimiento={historialSeleccionado.idSeguimiento}
          nombrePaciente={historialSeleccionado.nombrePaciente}
          especialidad={historialSeleccionado.especialidad}
          onClose={() => setHistorialSeleccionado(null)}
        />
      )}
    </div>
  );
};

export default BusquedaPaciente;
