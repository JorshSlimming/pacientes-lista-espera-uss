import React, { useState } from 'react';
import { pacientes, seguimientos, especialidades, comunas, origenes, instituciones, trabajadores } from '../mockData';
import { validarRut, formatearFecha, calcularEdad } from '../utils';
import './BusquedaPaciente.css';

const BusquedaPaciente: React.FC = () => {
  const [rutBusqueda, setRutBusqueda] = useState('');
  const [pacienteEncontrado, setPacienteEncontrado] = useState<any>(null);
  const [mostrarSoloPendientes, setMostrarSoloPendientes] = useState(false);
  const [ordenFecha, setOrdenFecha] = useState<'asc' | 'desc'>('desc');
  const [error, setError] = useState('');

  const buscarPaciente = () => {
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

    // Buscar paciente comparando RUTs normalizados
    const paciente = pacientes.find(p => p.rut.replace(/\./g, '').replace(/-/g, '') === rutNormalizado);
    
    if (!paciente) {
      setError('No se encontró ningún paciente con ese RUT');
      setPacienteEncontrado(null);
      return;
    }

    // Obtener todos los seguimientos del paciente
    const seguimientosPaciente = seguimientos.filter(s => s.id_paciente === paciente.rut);
    
    const pacienteCompleto = {
      ...paciente,
      seguimientos: seguimientosPaciente.map(seg => {
        const esp = especialidades.find(e => e.id === seg.id_especialidad);
        const ejec = trabajadores.find(t => t.rut === seg.rut_ejecutivo_ingreso);
        return {
          ...seg,
          especialidad: esp,
          ejecutivo: ejec,
        };
      }),
      comuna: comunas.find(c => c.id === paciente.id_comuna),
      origen: origenes.find(o => o.id === paciente.id_origen),
      institucion: instituciones.find(i => i.id === paciente.id_institucion_convenio),
    };

    setPacienteEncontrado(pacienteCompleto);
  };

  const seguimientosFiltrados = pacienteEncontrado?.seguimientos.filter((seg: any) => {
    if (mostrarSoloPendientes) return seg.agendado === 'no';
    return true;
  }).sort((a: any, b: any) => {
    const fechaA = new Date(a.fecha_ingreso).getTime();
    const fechaB = new Date(b.fecha_ingreso).getTime();
    return ordenFecha === 'desc' ? fechaB - fechaA : fechaA - fechaB;
  }) || [];

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
            placeholder="Ingrese RUT (ej: 12345678-9 o 123456789)"
            onKeyPress={(e) => e.key === 'Enter' && buscarPaciente()}
          />
          <button onClick={buscarPaciente} className="btn-buscar">
            Buscar
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
                <div className="info-value">{pacienteEncontrado.contacto.correo}</div>
              </div>
              <div className="info-item">
                <label>Teléfono 1</label>
                <div className="info-value telefono">{pacienteEncontrado.contacto.primer_celular}</div>
              </div>
              <div className="info-item">
                <label>Teléfono 2</label>
                <div className="info-value telefono">{pacienteEncontrado.contacto.segundo_celular}</div>
              </div>
              <div className="info-item">
                <label>Dirección</label>
                <div className="info-value">{pacienteEncontrado.contacto.direccion}</div>
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
              <h3>Agendamientos ({pacienteEncontrado.seguimientos.length})</h3>
              <div className="agendamientos-controles">
                <select 
                  className="select-orden"
                  value={ordenFecha}
                  onChange={(e) => setOrdenFecha(e.target.value as 'asc' | 'desc')}
                >
                  <option value="desc">Más reciente primero</option>
                  <option value="asc">Más antiguo primero</option>
                </select>
                <label className="checkbox-label">
                  <input
                    type="checkbox"
                    checked={mostrarSoloPendientes}
                    onChange={(e) => setMostrarSoloPendientes(e.target.checked)}
                  />
                  <span>Solo pendientes</span>
                </label>
              </div>
            </div>

            {seguimientosFiltrados.length === 0 ? (
              <div className="no-data">No hay agendamientos{mostrarSoloPendientes ? ' pendientes' : ''}</div>
            ) : (
              <div className="agendamientos-lista">
                {seguimientosFiltrados.map((seg: any) => (
                  <div key={seg.id} className="agendamiento-item">
                    <div className="agendamiento-header-item">
                      <div className="agendamiento-especialidad">
                        {seg.especialidad?.nombre || 'Especialidad no encontrada'}
                      </div>
                      <span className={`badge-agendado agendado-${seg.agendado}`}>
                        {seg.agendado === 'si' ? 'AGENDADO' : seg.agendado === 'no' ? 'PENDIENTE' : 'DESISTE'}
                      </span>
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
    </div>
  );
};

export default BusquedaPaciente;
