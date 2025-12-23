import React, { useState, useEffect, useMemo } from 'react';
import { adminService, EstadisticasHistoricas } from '../api/admin.service';
import './Dashboard.css';

const Dashboard: React.FC = () => {
  const [estadisticas, setEstadisticas] = useState<EstadisticasHistoricas | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    cargarEstadisticas();
  }, []);

  const cargarEstadisticas = async () => {
    setLoading(true);
    const { data, error: err } = await adminService.obtenerEstadisticasHistoricas();
    
    if (err) {
      setError(err);
    } else if (data) {
      setEstadisticas(data);
    }
    
    setLoading(false);
  };

  const datosCalculados = useMemo(() => {
    if (!estadisticas) return null;

    const totalPacientes = estadisticas.total_ingresos || 0;
    const pendientes = estadisticas.pendientes || 0;
    const agendados = estadisticas.agendados || 0;
    const sinLlamar = 0; // No disponible en API actual
    const noContactables = 0; // No disponible en API actual
    const agendadosEstaSemana = 0; // No disponible en API actual

    // Top especialidades, comunas, origenes - usar datos si están disponibles
    const topEspecialidades: [string, number][] = [];
    const topComunas: [string, number][] = [];
    const topOrigenes: [string, number][] = [];
    const porEjecutivo: { nombre: string; ingresados: number; agendados: number }[] = [];

    return {
      totalPacientes,
      pendientes,
      agendados,
      sinLlamar,
      noContactables,
      agendadosEstaSemana,
      topEspecialidades,
      topComunas,
      topOrigenes,
      porEjecutivo,
    };
  }, [estadisticas]);

  if (loading) {
    return (
      <div className="dashboard">
        <div className="loading">Cargando estadísticas...</div>
      </div>
    );
  }

  if (error || !datosCalculados) {
    return (
      <div className="dashboard">
        <div className="error-message">{error || 'Error al cargar datos'}</div>
      </div>
    );
  }

  return (
    <div className="dashboard">
      <div className="dashboard-header">
        <h2>Dashboard de Gestión</h2>
        <p>Métricas y estadísticas del sistema de listas de espera</p>
      </div>

      <div className="kpis-grid">
        <div className="kpi-card kpi-primary">
          <div className="kpi-icon">📋</div>
          <div className="kpi-content">
            <div className="kpi-value">{datosCalculados.totalPacientes}</div>
            <div className="kpi-label">Total Pacientes</div>
          </div>
        </div>

        <div className="kpi-card kpi-warning">
          <div className="kpi-icon">⏳</div>
          <div className="kpi-content">
            <div className="kpi-value">{datosCalculados.pendientes}</div>
            <div className="kpi-label">Pendientes</div>
          </div>
        </div>

        <div className="kpi-card kpi-success">
          <div className="kpi-icon">✅</div>
          <div className="kpi-content">
            <div className="kpi-value">{datosCalculados.agendados}</div>
            <div className="kpi-label">Agendados</div>
          </div>
        </div>

        <div className="kpi-card kpi-info">
          <div className="kpi-icon">📅</div>
          <div className="kpi-content">
            <div className="kpi-value">{datosCalculados.agendadosEstaSemana}</div>
            <div className="kpi-label">Agendados Esta Semana</div>
          </div>
        </div>

        <div className="kpi-card kpi-danger">
          <div className="kpi-icon">📞</div>
          <div className="kpi-content">
            <div className="kpi-value">{datosCalculados.sinLlamar}</div>
            <div className="kpi-label">Sin Llamar</div>
          </div>
        </div>

        <div className="kpi-card kpi-dark">
          <div className="kpi-icon">🚫</div>
          <div className="kpi-content">
            <div className="kpi-value">{datosCalculados.noContactables}</div>
            <div className="kpi-label">No Contactables</div>
          </div>
        </div>
      </div>

      <div className="charts-grid">
        <div className="chart-card">
          <h3>Top 5 Especialidades (Pendientes)</h3>
          <div className="bar-chart">
            {datosCalculados.topEspecialidades.length > 0 ? (
              datosCalculados.topEspecialidades.slice(0, 5).map(([nombre, cantidad]) => (
                <div key={nombre} className="bar-item">
                  <div className="bar-label">{nombre}</div>
                  <div className="bar-wrapper">
                    <div 
                      className="bar-fill" 
                      style={{ width: `${(cantidad / datosCalculados.topEspecialidades[0][1]) * 100}%` }}
                    ></div>
                    <span className="bar-value">{cantidad}</span>
                  </div>
                </div>
              ))
            ) : (
              <div className="no-data">Sin datos disponibles</div>
            )}
          </div>
        </div>

        <div className="chart-card">
          <h3>Top 5 Comunas (Pendientes)</h3>
          <div className="bar-chart">
            {datosCalculados.topComunas.length > 0 ? (
              datosCalculados.topComunas.slice(0, 5).map(([nombre, cantidad]) => (
                <div key={nombre} className="bar-item">
                  <div className="bar-label">{nombre}</div>
                  <div className="bar-wrapper">
                    <div 
                      className="bar-fill" 
                      style={{ width: `${(cantidad / datosCalculados.topComunas[0][1]) * 100}%` }}
                    ></div>
                    <span className="bar-value">{cantidad}</span>
                  </div>
                </div>
              ))
            ) : (
              <div className="no-data">Sin datos disponibles</div>
            )}
          </div>
        </div>

        <div className="chart-card">
          <h3>Origen de Pacientes (Pendientes)</h3>
          <div className="bar-chart">
            {datosCalculados.topOrigenes.length > 0 ? (
              datosCalculados.topOrigenes.map(([nombre, cantidad]) => (
                <div key={nombre} className="bar-item">
                  <div className="bar-label">{nombre}</div>
                  <div className="bar-wrapper">
                    <div 
                      className="bar-fill bar-fill-accent" 
                      style={{ width: `${datosCalculados.topOrigenes[0] ? (cantidad / datosCalculados.topOrigenes[0][1]) * 100 : 0}%` }}
                    ></div>
                    <span className="bar-value">{cantidad}</span>
                  </div>
                </div>
              ))
            ) : (
              <div className="no-data">Sin datos disponibles</div>
            )}
          </div>
        </div>

        <div className="chart-card">
          <h3>Rendimiento por Ejecutivo</h3>
          <div className="tabla-ejecutivos">
            {datosCalculados.porEjecutivo.length > 0 ? (
              <table>
                <thead>
                  <tr>
                    <th>Ejecutivo</th>
                    <th>Ingresados</th>
                    <th>Agendados</th>
                    <th>% Éxito</th>
                  </tr>
                </thead>
                <tbody>
                  {datosCalculados.porEjecutivo.map(e => (
                    <tr key={e.nombre}>
                      <td>{e.nombre}</td>
                      <td>{e.ingresados}</td>
                      <td>{e.agendados}</td>
                      <td>
                        <span className="percentage">
                          {e.ingresados > 0 ? Math.round((e.agendados / e.ingresados) * 100) : 0}%
                        </span>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            ) : (
              <div className="no-data">Sin datos disponibles</div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
