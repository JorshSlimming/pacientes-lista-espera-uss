import React, { useState, useEffect, useMemo } from 'react';
import { adminService, catalogosService } from '../api';
import './DashboardJefe.css';

interface IngresoEjecutivo {
  id_trabajador: number;
  rut: string;
  nombre_completo: string;
  total_ingresos: number;
}

const DashboardJefe: React.FC = () => {
  const [ingresos, setIngresos] = useState<IngresoEjecutivo[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [especialidades, setEspecialidades] = useState<any[]>([]);
  const [trabajadores, setTrabajadores] = useState<any[]>([]);
  
  const [fechaDesde, setFechaDesde] = useState('2025-12-01');
  const [fechaHasta, setFechaHasta] = useState('2025-12-31');
  const [filtroEspecialidad, setFiltroEspecialidad] = useState('');
  const [filtroEjecutivo, setFiltroEjecutivo] = useState('');

  useEffect(() => {
    cargarDatos();
  }, []);

  const cargarDatos = async () => {
    setLoading(true);
    
    const [ingresosRes, especialidadesRes, trabajadoresRes] = await Promise.all([
      adminService.obtenerIngresosPorEjecutivo(),
      catalogosService.obtenerEspecialidades(),
      adminService.listarUsuarios()
    ]);
    
    if (ingresosRes.error) {
      setError(ingresosRes.error);
    } else if (ingresosRes.data) {
      const ordenados = [...ingresosRes.data].sort((a, b) => b.total_ingresos - a.total_ingresos);
      setIngresos(ordenados);
    }
    
    if (especialidadesRes.data) {
      setEspecialidades(especialidadesRes.data);
    }
    
    if (trabajadoresRes.data) {
      setTrabajadores(trabajadoresRes.data);
    }
    
    setLoading(false);
  };

  const especialidadesPrincipales = especialidades.filter((e: any) => e.nivel === 1);

  const estadisticas = useMemo(() => {
    // Calcular estadísticas con datos reales
    // Nota: Los filtros de fecha/especialidad no están implementados en la API actual
    // por lo que mostramos datos generales
    const totalIngresos = ingresos.reduce((sum, ing) => sum + ing.total_ingresos, 0);
    
    // Datos para el gráfico de últimos 30 días (simulado por ahora)
    const ingresosPorDia = [];
    const hoy = new Date();
    const hace30Dias = new Date(hoy);
    hace30Dias.setDate(hoy.getDate() - 30);
    
    for (let i = 0; i <= 30; i++) {
      const fecha = new Date(hace30Dias);
      fecha.setDate(hace30Dias.getDate() + i);
      const key = fecha.toISOString().split('T')[0];
      ingresosPorDia.push({ fecha: key, cantidad: 0 });
    }
    
    // Ingresos por ejecutivo (usando datos reales de la API)
    const ingresosPorEjecutivo = ingresos.map(ing => ({
      nombre: ing.nombre_completo,
      ingresos: ing.total_ingresos
    }));

    return {
      totalIngresos,
      pendientes: 0, // No disponible en API actual
      agendados: 0,  // No disponible en API actual
      desisten: 0,   // No disponible en API actual
      ingresosPorDia,
      ingresosPorEjecutivo,
    };
  }, [ingresos]);

  const maxIngresosGrafico = Math.max(...estadisticas.ingresosPorDia.map(d => d.cantidad), 1);

  if (loading) {
    return (
      <div className="dashboard-jefe">
        <div className="loading">Cargando datos de ejecutivos...</div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="dashboard-jefe">
        <div className="error-message">{error}</div>
      </div>
    );
  }

  return (
    <div className="dashboard-jefe">
      <div className="dashboard-header">
        <h2>Dashboard de Gestión</h2>
        <p>Análisis de ingresos y seguimiento de pacientes</p>
      </div>

      <div className="filtros-dashboard">
        <div className="filtro-fecha-range">
          <div className="filtro-item">
            <label>Fecha Desde</label>
            <input
              type="date"
              value={fechaDesde}
              onChange={(e) => setFechaDesde(e.target.value)}
            />
          </div>
          <div className="filtro-item">
            <label>Fecha Hasta</label>
            <input
              type="date"
              value={fechaHasta}
              onChange={(e) => setFechaHasta(e.target.value)}
            />
          </div>
        </div>
        
        <div className="filtro-item">
          <label>Especialidad</label>
          <select value={filtroEspecialidad} onChange={(e) => setFiltroEspecialidad(e.target.value)}>
            <option value="">Todas</option>
            {especialidadesPrincipales.map((e: any) => (
              <option key={e.id || e.id_especialidad} value={e.id || e.id_especialidad}>{e.nombre}</option>
            ))}
          </select>
        </div>
        
        <div className="filtro-item">
          <label>Ejecutivo</label>
          <select value={filtroEjecutivo} onChange={(e) => setFiltroEjecutivo(e.target.value)}>
            <option value="">Todos</option>
            {trabajadores.map((t: any) => (
              <option key={t.rut} value={t.rut}>{t.nombre} {t.apellido}</option>
            ))}
          </select>
        </div>
      </div>

      <div className="kpis-grid">
        <div className="kpi-card kpi-primary">
          <div className="kpi-icon">📊</div>
          <div className="kpi-content">
            <div className="kpi-value">{estadisticas.totalIngresos}</div>
            <div className="kpi-label">Total Ingresos</div>
          </div>
        </div>

        <div className="kpi-card kpi-warning">
          <div className="kpi-icon">⏳</div>
          <div className="kpi-content">
            <div className="kpi-value">{estadisticas.pendientes}</div>
            <div className="kpi-label">Pendientes</div>
          </div>
        </div>

        <div className="kpi-card kpi-success">
          <div className="kpi-icon">✅</div>
          <div className="kpi-content">
            <div className="kpi-value">{estadisticas.agendados}</div>
            <div className="kpi-label">Agendados</div>
          </div>
        </div>

        <div className="kpi-card kpi-danger">
          <div className="kpi-icon">❌</div>
          <div className="kpi-content">
            <div className="kpi-value">{estadisticas.desisten}</div>
            <div className="kpi-label">Desisten</div>
          </div>
        </div>
      </div>

      <div className="charts-container">
        <div className="chart-card chart-full">
          <h3>Ingresos Últimos 30 Días</h3>
          <div className="line-chart">
            <div className="line-chart-wrapper">
              <svg width="100%" height="300" viewBox="0 0 1000 300" preserveAspectRatio="none">
                <defs>
                  <linearGradient id="lineGradient" x1="0%" y1="0%" x2="0%" y2="100%">
                    <stop offset="0%" stopColor="#667eea" stopOpacity="0.3" />
                    <stop offset="100%" stopColor="#667eea" stopOpacity="0.05" />
                  </linearGradient>
                </defs>
                
                {/* Área bajo la línea */}
                <path
                  d={`M 0 300 ${estadisticas.ingresosPorDia.map((d, i) => {
                    const x = (i / (estadisticas.ingresosPorDia.length - 1)) * 1000;
                    const y = 300 - ((d.cantidad / maxIngresosGrafico) * 250);
                    return `L ${x} ${y}`;
                  }).join(' ')} L 1000 300 Z`}
                  fill="url(#lineGradient)"
                />
                
                {/* Línea */}
                <polyline
                  points={estadisticas.ingresosPorDia.map((d, i) => {
                    const x = (i / (estadisticas.ingresosPorDia.length - 1)) * 1000;
                    const y = 300 - ((d.cantidad / maxIngresosGrafico) * 250);
                    return `${x},${y}`;
                  }).join(' ')}
                  fill="none"
                  stroke="#667eea"
                  strokeWidth="3"
                />
                
                {/* Puntos */}
                {estadisticas.ingresosPorDia.map((d, i) => {
                  const x = (i / (estadisticas.ingresosPorDia.length - 1)) * 1000;
                  const y = 300 - ((d.cantidad / maxIngresosGrafico) * 250);
                  return d.cantidad > 0 ? (
                    <circle
                      key={i}
                      cx={x}
                      cy={y}
                      r="5"
                      fill="#667eea"
                    />
                  ) : null;
                })}
              </svg>
            </div>
            <div className="line-chart-legend">
              <span>🔵 Cantidad de ingresos por día</span>
            </div>
          </div>
        </div>

        <div className="chart-card">
          <h3>Ingresos de la Semana por Ejecutivo</h3>
          {estadisticas.ingresosPorEjecutivo.length === 0 ? (
            <div className="no-data">No hay ingresos esta semana</div>
          ) : (
            <div className="bar-chart">
              {estadisticas.ingresosPorEjecutivo.map((e, idx) => (
                <div key={idx} className="bar-item">
                  <div className="bar-label">{e.nombre}</div>
                  <div className="bar-wrapper">
                    <div 
                      className="bar-fill" 
                      style={{ 
                        width: `${estadisticas.ingresosPorEjecutivo[0] ? (e.ingresos / estadisticas.ingresosPorEjecutivo[0].ingresos) * 100 : 0}%` 
                      }}
                    ></div>
                    <span className="bar-value">{e.ingresos}</span>
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

export default DashboardJefe;
