import React, { useState, useEffect } from 'react';
import { comunas, origenes, especialidades, institucionesConvenio } from '../mockData';
import type { Comuna, Origen, Especialidad, InstitucionConvenio } from '../types';
import './Administracion.css';

type Entidad = 'comunas' | 'origenes' | 'especialidades' | 'subesp1' | 'subesp2' | 'instituciones';

const Administracion: React.FC = () => {
  const [entidadActiva, setEntidadActiva] = useState<Entidad>('comunas');
  const [mostrarModal, setMostrarModal] = useState(false);
  const [itemSeleccionado, setItemSeleccionado] = useState<any>(null);
  const [subTabEspecialidad, setSubTabEspecialidad] = useState<'especialidades' | 'subesp1' | 'subesp2'>('especialidades');
  const [ocultarVacias, setOcultarVacias] = useState(true);
  const [busqueda, setBusqueda] = useState('');

  // Estados de formulario
  const [formComuna, setFormComuna] = useState({ nombre: '' });
  const [formOrigen, setFormOrigen] = useState({ nombre: '' });
  const [formEspecialidad, setFormEspecialidad] = useState({ nombre: '', nivel: 1, parent_id: null as number | null });
  const [formInstitucion, setFormInstitucion] = useState({ nombre: '', tipo: '' });

  const [mensaje, setMensaje] = useState<{ tipo: 'success' | 'error'; texto: string } | null>(null);

  // Limpiar búsqueda al cambiar de pestaña
  useEffect(() => {
    setBusqueda('');
  }, [entidadActiva]);

  const mostrarMensaje = (tipo: 'success' | 'error', texto: string) => {
    setMensaje({ tipo, texto });
    setTimeout(() => setMensaje(null), 3000);
  };

  const limpiarFormularios = () => {
    setFormComuna({ nombre: '' });
    setFormOrigen({ nombre: '' });
    setFormEspecialidad({ nombre: '', nivel: 1, parent_id: null });
    setFormInstitucion({ nombre: '', tipo: '' });
    setItemSeleccionado(null);
  };

  const handleNuevo = () => {
    limpiarFormularios();
    setMostrarModal(true);
  };

  const handleNuevoEnGrupo = (parentId: number, nivel: number) => {
    limpiarFormularios();
    setFormEspecialidad({ nombre: '', nivel, parent_id: parentId });
    setMostrarModal(true);
  };

  const handleEditar = (item: any) => {
    setItemSeleccionado(item);
    
    if (entidadActiva === 'comunas') {
      setFormComuna({ nombre: item.nombre });
    } else if (entidadActiva === 'origenes') {
      setFormOrigen({ nombre: item.nombre });
    } else if (entidadActiva === 'especialidades' || entidadActiva === 'subesp1' || entidadActiva === 'subesp2') {
      setFormEspecialidad({ nombre: item.nombre, nivel: item.nivel, parent_id: item.parent_id || null });
    } else if (entidadActiva === 'instituciones') {
      setFormInstitucion({ nombre: item.nombre, tipo: item.tipo });
    }
    
    setMostrarModal(true);
  };

  const handleGuardar = () => {
    if (entidadActiva === 'comunas') {
      if (!formComuna.nombre) {
        mostrarMensaje('error', 'El nombre es obligatorio');
        return;
      }
      
      if (itemSeleccionado) {
        const comuna = comunas.find(c => c.id === itemSeleccionado.id);
        if (comuna) comuna.nombre = formComuna.nombre;
        mostrarMensaje('success', 'Comuna actualizada exitosamente');
      } else {
        const nuevaComuna: Comuna = {
          id: Math.max(...comunas.map(c => c.id), 0) + 1,
          nombre: formComuna.nombre,
        };
        comunas.push(nuevaComuna);
        mostrarMensaje('success', 'Comuna creada exitosamente');
      }
    } else if (entidadActiva === 'origenes') {
      if (!formOrigen.nombre) {
        mostrarMensaje('error', 'El nombre es obligatorio');
        return;
      }
      
      if (itemSeleccionado) {
        const origen = origenes.find(o => o.id === itemSeleccionado.id);
        if (origen) origen.nombre = formOrigen.nombre;
        mostrarMensaje('success', 'Origen actualizado exitosamente');
      } else {
        const nuevoOrigen: Origen = {
          id: Math.max(...origenes.map(o => o.id), 0) + 1,
          nombre: formOrigen.nombre,
          requiere_ci: false,
        };
        origenes.push(nuevoOrigen);
        mostrarMensaje('success', 'Origen creado exitosamente');
      }
    } else if (entidadActiva === 'especialidades' || entidadActiva === 'subesp1' || entidadActiva === 'subesp2') {
      if (!formEspecialidad.nombre) {
        mostrarMensaje('error', 'El nombre es obligatorio');
        return;
      }
      
      if (itemSeleccionado) {
        const especialidad = especialidades.find(e => e.id === itemSeleccionado.id);
        if (especialidad) {
          especialidad.nombre = formEspecialidad.nombre;
          especialidad.parent_id = formEspecialidad.parent_id;
        }
        mostrarMensaje('success', 'Especialidad actualizada exitosamente');
      } else {
        const nuevaEspecialidad: Especialidad = {
          id: Math.max(...especialidades.map(e => e.id), 0) + 1,
          nombre: formEspecialidad.nombre,
          parent_id: formEspecialidad.parent_id,
          nivel: formEspecialidad.nivel,
        };
        especialidades.push(nuevaEspecialidad);
        mostrarMensaje('success', 'Especialidad creada exitosamente');
      }
    } else if (entidadActiva === 'instituciones') {
      if (!formInstitucion.nombre || !formInstitucion.tipo) {
        mostrarMensaje('error', 'Complete los campos obligatorios');
        return;
      }
      
      if (itemSeleccionado) {
        const institucion = institucionesConvenio.find(i => i.id === itemSeleccionado.id);
        if (institucion) {
          institucion.nombre = formInstitucion.nombre;
          institucion.tipo = formInstitucion.tipo;
        }
        mostrarMensaje('success', 'Institución actualizada exitosamente');
      } else {
        const nuevaInstitucion: InstitucionConvenio = {
          id: Math.max(...institucionesConvenio.map(i => i.id), 0) + 1,
          nombre: formInstitucion.nombre,
          tipo: formInstitucion.tipo,
        };
        institucionesConvenio.push(nuevaInstitucion);
        mostrarMensaje('success', 'Institución creada exitosamente');
      }
    }
    
    limpiarFormularios();
    setMostrarModal(false);
  };

  const handleArchivar = (item: any) => {
    const confirmar = window.confirm(`¿Está seguro de archivar "${item.nombre}"?`);
    if (!confirmar) return;
    
    if (entidadActiva === 'comunas') {
      const comuna = comunas.find(c => c.id === item.id);
      if (comuna) comuna.archivado = true;
    } else if (entidadActiva === 'origenes') {
      const origen = origenes.find(o => o.id === item.id);
      if (origen) origen.archivado = true;
    } else if (entidadActiva === 'especialidades' || entidadActiva === 'subesp1' || entidadActiva === 'subesp2') {
      const especialidad = especialidades.find(e => e.id === item.id);
      if (especialidad) especialidad.archivado = true;
    } else if (entidadActiva === 'instituciones') {
      const institucion = institucionesConvenio.find(i => i.id === item.id);
      if (institucion) institucion.archivado = true;
    }
    
    mostrarMensaje('success', 'Elemento archivado exitosamente');
  };

  const renderTablaItems = () => {
    let items: any[] = [];
    
    if (entidadActiva === 'comunas') {
      items = comunas.filter(c => !c.archivado && (!busqueda || c.nombre.toLowerCase().includes(busqueda.toLowerCase())));
    } else if (entidadActiva === 'origenes') {
      items = origenes.filter(o => !o.archivado && (!busqueda || o.nombre.toLowerCase().includes(busqueda.toLowerCase())));
    } else if (entidadActiva === 'especialidades') {
      // Tabla simple de especialidades principales (nivel 1)
      items = especialidades.filter(e => !e.archivado && e.nivel === 1 && (!busqueda || e.nombre.toLowerCase().includes(busqueda.toLowerCase())));
    } else if (entidadActiva === 'subesp1') {
      // Mostrar agrupadas por especialidad principal
      let especialidadesPrincipales = especialidades.filter(e => !e.archivado && e.nivel === 1);
      
      // Filtrar solo las que tienen hijas si está activado
      if (ocultarVacias) {
        especialidadesPrincipales = especialidadesPrincipales.filter(espPrincipal => {
          const tieneHijas = especialidades.some(e => !e.archivado && e.nivel === 2 && e.parent_id === espPrincipal.id);
          return tieneHijas;
        });
      }
      
      return (
        <div className="especialidades-agrupadas">
          {especialidadesPrincipales.map(espPrincipal => {
            const subesp1 = especialidades.filter(e => !e.archivado && e.nivel === 2 && e.parent_id === espPrincipal.id && (!busqueda || e.nombre.toLowerCase().includes(busqueda.toLowerCase())));
            
            return (
              <div key={espPrincipal.id} className="grupo-especialidad">
                <div className="grupo-header">
                  <h4>{espPrincipal.nombre}</h4>
                  <button 
                    className="btn btn-sm btn-primary" 
                    onClick={() => handleNuevoEnGrupo(espPrincipal.id, 2)}
                  >
                    ➕ Nuevo
                  </button>
                </div>
                
                <div className="tabla-administracion">
                  <table>
                    <thead>
                      <tr>
                        <th>Nombre</th>
                        <th>Acciones</th>
                      </tr>
                    </thead>
                    <tbody>
                      {subesp1.length === 0 ? (
                        <tr>
                          <td colSpan={2} className="no-data">No hay subespecialidades nivel 1</td>
                        </tr>
                      ) : (
                        subesp1.map(sub1 => (
                          <tr key={sub1.id}>
                            <td>{sub1.nombre}</td>
                            <td className="acciones">
                              <button 
                                className="btn-accion btn-editar" 
                                onClick={() => handleEditar(sub1)}
                                title="Editar"
                              >
                                Editar
                              </button>
                              <button 
                                className="btn-accion btn-archivar" 
                                onClick={() => handleArchivar(sub1)}
                                title="Archivar"
                              >
                                Archivar
                              </button>
                            </td>
                          </tr>
                        ))
                      )}
                    </tbody>
                  </table>
                </div>
              </div>
            );
          })}
        </div>
      );
    } else if (entidadActiva === 'subesp2') {
      // Mostrar agrupadas por subespecialidad 1
      let subesp1List = especialidades.filter(e => !e.archivado && e.nivel === 2);
      
      // Filtrar solo las que tienen hijas si está activado
      if (ocultarVacias) {
        subesp1List = subesp1List.filter(sub1 => {
          const tieneHijas = especialidades.some(e => !e.archivado && e.nivel === 3 && e.parent_id === sub1.id);
          return tieneHijas;
        });
      }
      
      return (
        <div className="especialidades-agrupadas">
          {subesp1List.map(sub1 => {
            const subesp2 = especialidades.filter(e => !e.archivado && e.nivel === 3 && e.parent_id === sub1.id && (!busqueda || e.nombre.toLowerCase().includes(busqueda.toLowerCase())));
            const padre = especialidades.find(e => e.id === sub1.parent_id);
            
            return (
              <div key={sub1.id} className="grupo-especialidad">
                <div className="grupo-header">
                  <h4>{sub1.nombre} <span className="padre-badge">({padre?.nombre})</span></h4>
                  <button 
                    className="btn btn-sm btn-primary" 
                    onClick={() => handleNuevoEnGrupo(sub1.id, 3)}
                  >
                    ➕ Nuevo
                  </button>
                </div>
                
                <div className="tabla-administracion">
                  <table>
                    <thead>
                      <tr>
                        <th>Nombre</th>
                        <th>Acciones</th>
                      </tr>
                    </thead>
                    <tbody>
                      {subesp2.length === 0 ? (
                        <tr>
                          <td colSpan={2} className="no-data">No hay subespecialidades nivel 2</td>
                        </tr>
                      ) : (
                        subesp2.map(sub2 => (
                          <tr key={sub2.id}>
                            <td>{sub2.nombre}</td>
                            <td className="acciones">
                              <button 
                                className="btn-accion btn-editar" 
                                onClick={() => handleEditar(sub2)}
                                title="Editar"
                              >
                                Editar
                              </button>
                              <button 
                                className="btn-accion btn-archivar" 
                                onClick={() => handleArchivar(sub2)}
                                title="Archivar"
                              >
                                Archivar
                              </button>
                            </td>
                          </tr>
                        ))
                      )}
                    </tbody>
                  </table>
                </div>
              </div>
            );
          })}
        </div>
      );
    } else if (entidadActiva === 'instituciones') {
      items = institucionesConvenio.filter(i => !i.archivado && (!busqueda || i.nombre.toLowerCase().includes(busqueda.toLowerCase())));
    }
    
    // Para especialidades, instituciones, comunas, origenes - mostrar tabla normal
    return (
      <div className="tabla-administracion">
        <table>
          <thead>
            <tr>
              <th>Nombre</th>
              {entidadActiva === 'instituciones' && <th>Tipo</th>}
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            {items.length === 0 ? (
              <tr>
                <td colSpan={entidadActiva === 'instituciones' ? 3 : 2} className="no-data">
                  No hay registros disponibles
                </td>
              </tr>
            ) : (
              items.map(item => (
                <tr key={item.id}>
                  <td>{item.nombre}</td>
                  {entidadActiva === 'instituciones' && <td>{item.tipo}</td>}
                  <td className="acciones">
                    <button 
                      className="btn-accion btn-editar" 
                      onClick={() => handleEditar(item)}
                      title="Editar"
                    >
                      Editar
                    </button>
                    <button 
                      className="btn-accion btn-archivar" 
                      onClick={() => handleArchivar(item)}
                      title="Archivar"
                    >
                      Archivar
                    </button>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>
    );
  };

  const renderModal = () => {
    if (!mostrarModal) return null;
    
    return (
      <div className="modal-overlay" onClick={() => setMostrarModal(false)}>
        <div className="modal-content-admin" onClick={(e) => e.stopPropagation()}>
          <div className="modal-header-admin">
            <h3>{itemSeleccionado ? 'Editar' : 'Nuevo'} {
              entidadActiva === 'comunas' ? 'Comuna' :
              entidadActiva === 'origenes' ? 'Origen' :
              entidadActiva === 'instituciones' ? 'Institución' :
              'Especialidad'
            }</h3>
            <button className="btn-close" onClick={() => setMostrarModal(false)}>×</button>
          </div>
          
          <div className="modal-body-admin">
            {entidadActiva === 'comunas' && (
              <div className="form-group">
                <label>Nombre <span className="required">*</span></label>
                <input
                  type="text"
                  value={formComuna.nombre}
                  onChange={(e) => setFormComuna({ ...formComuna, nombre: e.target.value })}
                  placeholder="Ej: Santiago"
                />
              </div>
            )}
            
            {entidadActiva === 'origenes' && (
              <div className="form-group">
                <label>Nombre <span className="required">*</span></label>
                <input
                  type="text"
                  value={formOrigen.nombre}
                  onChange={(e) => setFormOrigen({ ...formOrigen, nombre: e.target.value })}
                  placeholder="Ej: Web USS"
                />
              </div>
            )}
            
            {(entidadActiva === 'especialidades' || entidadActiva === 'subesp1' || entidadActiva === 'subesp2') && (
              <>
                <div className="form-group">
                  <label>Nombre <span className="required">*</span></label>
                  <input
                    type="text"
                    value={formEspecialidad.nombre}
                    onChange={(e) => setFormEspecialidad({ ...formEspecialidad, nombre: e.target.value })}
                    placeholder="Ej: Cardiología"
                  />
                </div>
                
                {!itemSeleccionado && (
                  <>
                    <div className="form-group">
                      <label>Tipo <span className="required">*</span></label>
                      <select
                        value={formEspecialidad.nivel}
                        onChange={(e) => setFormEspecialidad({ ...formEspecialidad, nivel: parseInt(e.target.value), parent_id: null })}
                      >
                        <option value={1}>Especialidad Principal</option>
                        <option value={2}>Subespecialidad 1</option>
                        <option value={3}>Subespecialidad 2</option>
                      </select>
                    </div>
                    
                    {formEspecialidad.nivel === 2 && (
                      <div className="form-group">
                        <label>Especialidad Padre <span className="required">*</span></label>
                        <select
                          value={formEspecialidad.parent_id || ''}
                          onChange={(e) => setFormEspecialidad({ ...formEspecialidad, parent_id: e.target.value ? parseInt(e.target.value) : null })}
                        >
                          <option value="">-- Seleccione --</option>
                          {especialidades.filter(e => e.nivel === 1 && !e.archivado).map(e => (
                            <option key={e.id} value={e.id}>{e.nombre}</option>
                          ))}
                        </select>
                      </div>
                    )}
                    
                    {formEspecialidad.nivel === 3 && (
                      <div className="form-group">
                        <label>Subespecialidad 1 Padre <span className="required">*</span></label>
                        <select
                          value={formEspecialidad.parent_id || ''}
                          onChange={(e) => setFormEspecialidad({ ...formEspecialidad, parent_id: e.target.value ? parseInt(e.target.value) : null })}
                        >
                          <option value="">-- Seleccione --</option>
                          {especialidades.filter(e => e.nivel === 2 && !e.archivado).map(e => (
                            <option key={e.id} value={e.id}>{e.nombre}</option>
                          ))}
                        </select>
                      </div>
                    )}
                  </>
                )}
              </>
            )}
            
            {entidadActiva === 'instituciones' && (
              <>
                <div className="form-group">
                  <label>Nombre <span className="required">*</span></label>
                  <input
                    type="text"
                    value={formInstitucion.nombre}
                    onChange={(e) => setFormInstitucion({ ...formInstitucion, nombre: e.target.value })}
                    placeholder="Ej: Hospital Regional"
                  />
                </div>
                <div className="form-group">
                  <label>Tipo <span className="required">*</span></label>
                  <select
                    value={formInstitucion.tipo}
                    onChange={(e) => setFormInstitucion({ ...formInstitucion, tipo: e.target.value })}
                  >
                    <option value="">-- Seleccione --</option>
                    <option value="convenio">Convenio</option>
                    <option value="institucion">Institución</option>
                  </select>
                </div>
              </>
            )}
          </div>
          
          <div className="modal-footer-admin">
            <button className="btn btn-secondary" onClick={() => setMostrarModal(false)}>
              Cancelar
            </button>
            <button className="btn btn-primary" onClick={handleGuardar}>
              Guardar
            </button>
          </div>
        </div>
      </div>
    );
  };

  return (
    <div className="administracion">
      {mensaje && (
        <div className={`mensaje mensaje-${mensaje.tipo}`}>
          {mensaje.texto}
        </div>
      )}

      <div className="mantenedores-section">
        <div className="tabs-entidades">
          <button
            className={`tab-entidad ${entidadActiva === 'comunas' ? 'active' : ''}`}
            onClick={() => setEntidadActiva('comunas')}
          >
            Comunas
          </button>
          <button
            className={`tab-entidad ${entidadActiva === 'origenes' ? 'active' : ''}`}
            onClick={() => setEntidadActiva('origenes')}
          >
            Orígenes
          </button>
          <button
            className={`tab-entidad ${(entidadActiva === 'especialidades' || entidadActiva === 'subesp1' || entidadActiva === 'subesp2') ? 'active' : ''}`}
            onClick={() => setEntidadActiva('especialidades')}
          >
            Especialidades
          </button>
          <button
            className={`tab-entidad ${entidadActiva === 'instituciones' ? 'active' : ''}`}
            onClick={() => setEntidadActiva('instituciones')}
          >
            Instituciones
          </button>
        </div>

        {/* Sub-tabs de Especialidades */}
        {(entidadActiva === 'especialidades' || entidadActiva === 'subesp1' || entidadActiva === 'subesp2') && (
          <div className="sub-tabs-especialidades">
            <button
              className={`sub-tab ${subTabEspecialidad === 'especialidades' ? 'active' : ''}`}
              onClick={() => {
                setSubTabEspecialidad('especialidades');
                setEntidadActiva('especialidades');
              }}
            >
              Especialidades
            </button>
            <button
              className={`sub-tab ${subTabEspecialidad === 'subesp1' ? 'active' : ''}`}
              onClick={() => {
                setSubTabEspecialidad('subesp1');
                setEntidadActiva('subesp1');
              }}
            >
              Subespecialidades 1
            </button>
            <button
              className={`sub-tab ${subTabEspecialidad === 'subesp2' ? 'active' : ''}`}
              onClick={() => {
                setSubTabEspecialidad('subesp2');
                setEntidadActiva('subesp2');
              }}
            >
              Subespecialidades 2
            </button>
          </div>
        )}

        <div className="contenido-administracion">
          <div className="acciones-lista">
            {/* Buscador */}
            <div className="buscador-catalogo">
              <input
                type="text"
                placeholder="Buscar..."
                value={busqueda}
                onChange={(e) => setBusqueda(e.target.value)}
                className="input-buscar"
              />
            </div>
            
            {/* Checkbox para ocultar vacías en vistas agrupadas */}
            {(entidadActiva === 'subesp1' || entidadActiva === 'subesp2') && (
              <label className="checkbox-ocultar-vacias">
                <input
                  type="checkbox"
                  checked={ocultarVacias}
                  onChange={(e) => setOcultarVacias(e.target.checked)}
                />
                <span>Ocultar sin subespecialidad</span>
              </label>
            )}
            
            {/* Botón Nuevo solo para las vistas que no tienen agrupación */}
            {entidadActiva !== 'subesp1' && entidadActiva !== 'subesp2' && (
              <button className="btn btn-primary" onClick={handleNuevo}>
                ➕ Nuevo
              </button>
            )}
          </div>
          {renderTablaItems()}
        </div>
      </div>

      {renderModal()}
    </div>
  );
};

export default Administracion;
