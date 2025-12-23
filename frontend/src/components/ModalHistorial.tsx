import React, { useState, useEffect } from 'react';
import { pacientesService } from '../api';
import { Auditoria } from '../types';
import { formatearFecha } from '../utils';
import './ModalHistorial.css';

interface ModalHistorialProps {
  idPaciente: number;
  idSeguimiento: number;
  nombrePaciente: string;
  especialidad: string;
  onClose: () => void;
}

const ModalHistorial: React.FC<ModalHistorialProps> = ({
  idPaciente,
  idSeguimiento,
  nombrePaciente,
  especialidad,
  onClose
}) => {
  const [historial, setHistorial] = useState<Auditoria[]>([]);
  const [cargando, setCargando] = useState(true);
  const [error, setError] = useState<string>('');

  useEffect(() => {
    cargarHistorial();
  }, [idPaciente, idSeguimiento]);

  const cargarHistorial = async () => {
    setCargando(true);
    setError('');
    const { data, error: apiError } = await pacientesService.obtenerHistorialCambios(idPaciente, idSeguimiento);
    if (apiError) {
      setError(apiError);
    } else if (data) {
      setHistorial(data);
    }
    setCargando(false);
  };

  const formatearCambios = (cambios: any) => {
    if (!cambios) return 'Sin cambios registrados';
    
    const cambiosFormateados: string[] = [];
    
    if (cambios.agendado) {
      const valorAnterior = cambios.agendado.anterior || 'no';
      const valorNuevo = cambios.agendado.nuevo || 'no';
      cambiosFormateados.push(`Estado: ${valorAnterior.toUpperCase()} → ${valorNuevo.toUpperCase()}`);
    }
    
    if (cambios.fecha_primera_llamada) {
      cambiosFormateados.push(`1ra llamada: ${formatearFecha(cambios.fecha_primera_llamada.nuevo)}`);
    }
    
    if (cambios.fecha_segunda_llamada) {
      cambiosFormateados.push(`2da llamada: ${formatearFecha(cambios.fecha_segunda_llamada.nuevo)}`);
    }
    
    if (cambios.fecha_tercera_llamada) {
      cambiosFormateados.push(`3ra llamada: ${formatearFecha(cambios.fecha_tercera_llamada.nuevo)}`);
    }
    
    if (cambios.obs) {
      const obsAnterior = cambios.obs.anterior || 'Sin observaciones';
      const obsNuevo = cambios.obs.nuevo || 'Sin observaciones';
      cambiosFormateados.push(`Observaciones actualizadas`);
    }
    
    return cambiosFormateados.length > 0 
      ? cambiosFormateados.join(' • ') 
      : 'Sin cambios registrados';
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal-historial" onClick={(e) => e.stopPropagation()}>
        <div className="modal-historial-header">
          <div>
            <h2>Historial de Cambios</h2>
            <p className="modal-historial-subtitle">
              {nombrePaciente} - {especialidad}
            </p>
          </div>
          <button className="btn-close-modal" onClick={onClose}>×</button>
        </div>

        <div className="modal-historial-body">
          {cargando ? (
            <div className="loading-historial">Cargando historial...</div>
          ) : error ? (
            <div className="error-historial">
              <p>Error al cargar el historial: {error}</p>
              <button onClick={cargarHistorial} className="btn-retry">Reintentar</button>
            </div>
          ) : historial.length === 0 ? (
            <div className="empty-historial">
              <p>No hay cambios registrados para este agendamiento</p>
            </div>
          ) : (
            <div className="historial-timeline">
              {historial.map((item, index) => (
                <div key={item.id_auditoria || index} className="historial-item">
                  <div className="historial-marker"></div>
                  <div className="historial-content">
                    <div className="historial-header-item">
                      <span className="historial-fecha">
                        {formatearFecha(item.fecha_cambio)}
                      </span>
                      <span className="historial-usuario">
                        {item.usuario_modificador?.nombre} {item.usuario_modificador?.apellido}
                      </span>
                    </div>
                    <div className="historial-cambios">
                      {formatearCambios(item.cambios)}
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default ModalHistorial;
