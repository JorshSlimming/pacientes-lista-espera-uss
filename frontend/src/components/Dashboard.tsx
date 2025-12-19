import React, { useMemo } from 'react';
import { pacientes, seguimientos, especialidades, comunas, origenes, trabajadores } from '../mockData';
import './Dashboard.css';

const Dashboard: React.FC = () => {
  const estadisticas = useMemo(() => {
    const totalPacientes = pacientes.length;
    const pendientes = seguimientos.filter(s => !s.agendado).length;
    const agendados = seguimientos.filter(s => s.agendado).length;
    const sinLlamar = seguimientos.filter(s => !s.fecha_primera_llamada).length;
    const noContactables = pacientes.filter(p => 
      p.obs.toLowerCase().includes('no contactable')
    ).length;

    // Pacientes agendados esta semana
    const hoy = new Date();
    const inicioSemana = new Date(hoy);
    inicioSemana.setDate(hoy.getDate() - hoy.getDay());
    const finSemana = new Date(inicioSemana);
    finSemana.setDate(inicioSemana.getDate() + 6);

    const agendadosEstaSemana = seguimientos.filter(s => {
      if (!s.fecha_citacion) return false;
      const fecha = new Date(s.fecha_citacion);
      return fecha >= inicioSemana && fecha <= finSemana;
    }).length;

    // Por especialidad
    const porEspecialidad: Record<string, number> = {};
    seguimientos.forEach(s => {
      if (!s.agendado) {
        const esp = especialidades.find(e => e.id === s.id_especialidad);
        if (esp) {
          porEspecialidad[esp.nombre] = (porEspecialidad[esp.nombre] || 0) + 1;
        }
      }
    });

    // Por comuna
    const porComuna: Record<string, number> = {};
    pacientes.forEach(p => {
      const seg = seguimientos.find(s => s.id_paciente === p.rut);
      if (seg && !seg.agendado) {
        const com = comunas.find(c => c.id === p.id_comuna);
        if (com) {
          porComuna[com.nombre] = (porComuna[com.nombre] || 0) + 1;
        }
      }
    });

    // Por origen
    const porOrigen: Record<string, number> = {};
    pacientes.forEach(p => {
      const seg = seguimientos.find(s => s.id_paciente === p.rut);
      if (seg && !seg.agendado) {
        const ori = origenes.find(o => o.id === p.id_origen);
        if (ori) {
          porOrigen[ori.nombre] = (porOrigen[ori.nombre] || 0) + 1;
        }
      }
    });

    // Por ejecutivo
    const porEjecutivo: Record<string, { nombre: string; ingresados: number; agendados: number }> = {};
    seguimientos.forEach(s => {
      const ejec = trabajadores.find(t => t.rut === s.rut_ejecutivo_ingreso);
      if (ejec) {
        const key = `${ejec.nombre} ${ejec.apellido}`;
        if (!porEjecutivo[key]) {
          porEjecutivo[key] = { nombre: key, ingresados: 0, agendados: 0 };
        }
        porEjecutivo[key].ingresados++;
        if (s.agendado) {
          porEjecutivo[key].agendados++;
        }
      }
    });

    return {
      totalPacientes,
      pendientes,
      agendados,
      sinLlamar,
      noContactables,
      agendadosEstaSemana,
      porEspecialidad,
      porComuna,
      porOrigen,
      porEjecutivo: Object.values(porEjecutivo).sort((a, b) => b.ingresados - a.ingresados),
    };
  }, []);

  const topEspecialidades = Object.entries(estadisticas.porEspecialidad)
    .sort(([, a], [, b]) => b - a)
    .slice(0, 5);

  const topComunas = Object.entries(estadisticas.porComuna)
    .sort(([, a], [, b]) => b - a)
    .slice(0, 5);

  const topOrigenes = Object.entries(estadisticas.porOrigen)
    .sort(([, a], [, b]) => b - a);

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
            <div className="kpi-value">{estadisticas.totalPacientes}</div>
            <div className="kpi-label">Total Pacientes</div>
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
          <div className="kpi-icon">✓</div>
          <div className="kpi-content">
            <div className="kpi-value">{estadisticas.agendados}</div>
            <div className="kpi-label">Agendados</div>
          </div>
        </div>

        <div className="kpi-card kpi-info">
          <div className="kpi-icon">📅</div>
          <div className="kpi-content">
            <div className="kpi-value">{estadisticas.agendadosEstaSemana}</div>
            <div className="kpi-label">Agendados Esta Semana</div>
          </div>
        </div>

        <div className="kpi-card kpi-danger">
          <div className="kpi-icon">📞</div>
          <div className="kpi-content">
            <div className="kpi-value">{estadisticas.sinLlamar}</div>
            <div className="kpi-label">Sin Llamar</div>
          </div>
        </div>

        <div className="kpi-card kpi-dark">
          <div className="kpi-icon">⚠️</div>
          <div className="kpi-content">
            <div className="kpi-value">{estadisticas.noContactables}</div>
            <div className="kpi-label">No Contactables</div>
          </div>
        </div>
      </div>

      <div className="charts-grid">
        <div className="chart-card">
          <h3>Top 5 Especialidades (Pendientes)</h3>
          <div className="bar-chart">
            {topEspecialidades.map(([nombre, cantidad]) => (
              <div key={nombre} className="bar-item">
                <div className="bar-label">{nombre}</div>
                <div className="bar-wrapper">
                  <div 
                    className="bar-fill" 
                    style={{ width: `${(cantidad / topEspecialidades[0][1]) * 100}%` }}
                  ></div>
                  <span className="bar-value">{cantidad}</span>
                </div>
              </div>
            ))}
          </div>
        </div>

        <div className="chart-card">
          <h3>Top 5 Comunas (Pendientes)</h3>
          <div className="bar-chart">
            {topComunas.map(([nombre, cantidad]) => (
              <div key={nombre} className="bar-item">
                <div className="bar-label">{nombre}</div>
                <div className="bar-wrapper">
                  <div 
                    className="bar-fill" 
                    style={{ width: `${(cantidad / topComunas[0][1]) * 100}%` }}
                  ></div>
                  <span className="bar-value">{cantidad}</span>
                </div>
              </div>
            ))}
          </div>
        </div>

        <div className="chart-card">
          <h3>Origen de Pacientes (Pendientes)</h3>
          <div className="bar-chart">
            {topOrigenes.map(([nombre, cantidad]) => (
              <div key={nombre} className="bar-item">
                <div className="bar-label">{nombre}</div>
                <div className="bar-wrapper">
                  <div 
                    className="bar-fill bar-fill-accent" 
                    style={{ width: `${topOrigenes[0] ? (cantidad / topOrigenes[0][1]) * 100 : 0}%` }}
                  ></div>
                  <span className="bar-value">{cantidad}</span>
                </div>
              </div>
            ))}
          </div>
        </div>

        <div className="chart-card">
          <h3>Rendimiento por Ejecutivo</h3>
          <div className="tabla-ejecutivos">
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
                {estadisticas.porEjecutivo.map(e => (
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
          </div>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
