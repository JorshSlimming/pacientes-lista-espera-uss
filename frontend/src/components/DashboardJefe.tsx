import React, { useState, useMemo } from 'react';
import { seguimientos, especialidades, trabajadores } from '../mockData';
import './DashboardJefe.css';

const DashboardJefe: React.FC = () => {
  const [fechaDesde, setFechaDesde] = useState('2025-12-01');
  const [fechaHasta, setFechaHasta] = useState('2025-12-31');
  const [filtroEspecialidad, setFiltroEspecialidad] = useState('');
  const [filtroEjecutivo, setFiltroEjecutivo] = useState('');

  const especialidadesPrincipales = especialidades.filter(e => e.nivel === 1);

  const estadisticas = useMemo(() => {
    let seguimientosFiltrados = seguimientos.filter(s => {
      const fechaIngreso = new Date(s.fecha_ingreso);
      const desde = new Date(fechaDesde);
      const hasta = new Date(fechaHasta);
      
      if (fechaIngreso < desde || fechaIngreso > hasta) return false;
      if (filtroEspecialidad && s.id_especialidad !== parseInt(filtroEspecialidad)) {
        const esp = especialidades.find(e => e.id === s.id_especialidad);
        if (!esp) return false;
        
        let match = false;
        if (esp.id === parseInt(filtroEspecialidad)) match = true;
        if (esp.parent_id === parseInt(filtroEspecialidad)) match = true;
        
        const parent = especialidades.find(e => e.id === esp.parent_id);
        if (parent && parent.parent_id === parseInt(filtroEspecialidad)) match = true;
        
        if (!match) return false;
      }
      if (filtroEjecutivo && s.rut_ejecutivo_ingreso !== filtroEjecutivo) return false;
      
      return true;
    });

    // Ingresos últimos 30 días (datos para gráfico)
    const hoy = new Date();
    const hace30Dias = new Date(hoy);
    hace30Dias.setDate(hoy.getDate() - 30);
    
    const ingresosPorDia: Record<string, number> = {};
    for (let i = 0; i <= 30; i++) {
      const fecha = new Date(hace30Dias);
      fecha.setDate(hace30Dias.getDate() + i);
      const key = fecha.toISOString().split('T')[0];
      ingresosPorDia[key] = 0;
    }
    
    seguimientos.forEach(s => {
      const fecha = new Date(s.fecha_ingreso);
      if (fecha >= hace30Dias && fecha <= hoy) {
        const key = s.fecha_ingreso;
        ingresosPorDia[key] = (ingresosPorDia[key] || 0) + 1;
      }
    });

    // Ingresos por ejecutivo esta semana
    const inicioSemana = new Date(hoy);
    inicioSemana.setDate(hoy.getDate() - hoy.getDay());
    const finSemana = new Date(inicioSemana);
    finSemana.setDate(inicioSemana.getDate() + 6);

    const ingresosPorEjecutivo: Record<string, { nombre: string; ingresos: number }> = {};
    
    seguimientos.forEach(s => {
      const fecha = new Date(s.fecha_ingreso);
      if (fecha >= inicioSemana && fecha <= finSemana) {
        const ejec = trabajadores.find(t => t.rut === s.rut_ejecutivo_ingreso);
        if (ejec) {
          const key = ejec.rut;
          if (!ingresosPorEjecutivo[key]) {
            ingresosPorEjecutivo[key] = {
              nombre: `${ejec.nombre} ${ejec.apellido}`,
              ingresos: 0
            };
          }
          ingresosPorEjecutivo[key].ingresos++;
        }
      }
    });

    return {
      totalIngresos: seguimientosFiltrados.length,
      pendientes: seguimientosFiltrados.filter(s => s.agendado === 'no').length,
      agendados: seguimientosFiltrados.filter(s => s.agendado === 'si').length,
      desisten: seguimientosFiltrados.filter(s => s.agendado === 'desiste').length,
      ingresosPorDia: Object.entries(ingresosPorDia).map(([fecha, cantidad]) => ({ fecha, cantidad })),
      ingresosPorEjecutivo: Object.values(ingresosPorEjecutivo).sort((a, b) => b.ingresos - a.ingresos),
    };
  }, [fechaDesde, fechaHasta, filtroEspecialidad, filtroEjecutivo]);

  const maxIngresosGrafico = Math.max(...estadisticas.ingresosPorDia.map(d => d.cantidad), 1);

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
            {especialidadesPrincipales.map(e => (
              <option key={e.id} value={e.id}>{e.nombre}</option>
            ))}
          </select>
        </div>
        
        <div className="filtro-item">
          <label>Ejecutivo</label>
          <select value={filtroEjecutivo} onChange={(e) => setFiltroEjecutivo(e.target.value)}>
            <option value="">Todos</option>
            {trabajadores.map(t => (
              <option key={t.rut} value={t.rut}>{t.nombre} {t.apellido}</option>
            ))}
          </select>
        </div>
      </div>

      <div className="kpis-grid">
        <div className="kpi-card kpi-primary">
          <div className="kpi-icon"></div>
          <div className="kpi-content">
            <div className="kpi-value">{estadisticas.totalIngresos}</div>
            <div className="kpi-label">Total Ingresos</div>
          </div>
        </div>

        <div className="kpi-card kpi-warning">
          <div className="kpi-icon"></div>
          <div className="kpi-content">
            <div className="kpi-value">{estadisticas.pendientes}</div>
            <div className="kpi-label">Pendientes</div>
          </div>
        </div>

        <div className="kpi-card kpi-success">
          <div className="kpi-icon"></div>
          <div className="kpi-content">
            <div className="kpi-value">{estadisticas.agendados}</div>
            <div className="kpi-label">Agendados</div>
          </div>
        </div>

        <div className="kpi-card kpi-danger">
          <div className="kpi-icon"></div>
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
                        width: `${(e.ingresos / estadisticas.ingresosPorEjecutivo[0].ingresos) * 100}%` 
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
