import React, { useState, useEffect } from 'react';
import { pacientesService } from '../api';
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
  const [historial, setHistorial] = useState<any[]>([]);
  const [cargando, setCargando] = useState(true);
  const [error, setError] = useState<string>('');

  useEffect(() => {
    cargarHistorial();
  }, [idPaciente, idSeguimiento]);

  const cargarHistorial = async () => {
    setCargando(true);
    setError('');
    try {
      const response = await pacientesService.obtenerHistorialCambios(idPaciente, idSeguimiento);
      const { data, error: apiError } = response;
      if (apiError) {
        console.error('❌ Error al cargar historial:', apiError);
        setError(apiError);
        setHistorial([]);
        return;
      }
      // El backend devuelve { success: true, historial: [...] }
      const historialArray = data?.historial || data?.data || data || [];
      if (Array.isArray(historialArray)) {
        setHistorial(historialArray);
      } else {
        console.error('❌ Historial no es array:', data);
        setHistorial([]);
      }
    } catch (err: any) {
      console.error('❌ Error en cargarHistorial:', err);
      setError(err.message || 'Error desconocido');
      setHistorial([]);
    } finally {
      setCargando(false);
    }
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
            <table className="tabla-historial">
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
      </div>
    </div>
  );
};

export default ModalHistorial;
