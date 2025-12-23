import React, { useState, useEffect } from 'react';
import { catalogosService } from '../api';
import type { Comuna, Origen, Especialidad, InstitucionConvenio } from '../types';
import Toast from './Toast';
import ConfirmDialog from './ConfirmDialog';
import './Administracion.css';

type Entidad = 'comunas' | 'origenes' | 'especialidades' | 'subesp1' | 'subesp2' | 'instituciones';

const Administracion: React.FC = () => {
  const [entidadActiva, setEntidadActiva] = useState<Entidad>('comunas');
  const [mostrarModal, setMostrarModal] = useState(false);
  const [itemSeleccionado, setItemSeleccionado] = useState<any>(null);
  const [subTabEspecialidad, setSubTabEspecialidad] = useState<'especialidades' | 'subesp1' | 'subesp2'>('especialidades');
  const [ocultarVacias, setOcultarVacias] = useState(true);
  const [mostrarArchivados, setMostrarArchivados] = useState(false);
  const [datosYaCargados, setDatosYaCargados] = useState(false);
  const [busqueda, setBusqueda] = useState('');
  const [loading, setLoading] = useState(false);

  // Datos de la API
  const [comunas, setComunas] = useState<Comuna[]>([]);
  const [origenes, setOrigenes] = useState<Origen[]>([]);
  const [especialidades, setEspecialidades] = useState<Especialidad[]>([]);
  const [instituciones, setInstituciones] = useState<InstitucionConvenio[]>([]);

  // Estados de formulario
  const [formComuna, setFormComuna] = useState({ nombre: '' });
  const [formOrigen, setFormOrigen] = useState({ nombre: '' });
  const [formEspecialidad, setFormEspecialidad] = useState({ nombre: '', nivel: 1, parent_id: null as number | null });
  const [formInstitucion, setFormInstitucion] = useState({ nombre: '', tipo: '' });

  const [mensaje, setMensaje] = useState<{ tipo: 'success' | 'error'; texto: string } | null>(null);
  const [toast, setToast] = useState<{ message: string; type: 'success' | 'error' | 'warning' | 'info' } | null>(null);
  const [confirmDialog, setConfirmDialog] = useState<{
    title: string;
    message: string;
    type: 'danger' | 'warning' | 'info';
    onConfirm: () => void;
  } | null>(null);

  useEffect(() => {
    cargarDatos();
  }, []);

  // Cargar datos solo la primera vez que se activa mostrarArchivados
  useEffect(() => {
    if (mostrarArchivados && !datosYaCargados) {
      cargarDatos();
      setDatosYaCargados(true);
    }
  }, [mostrarArchivados]);

  // Limpiar búsqueda al cambiar de pestaña
  useEffect(() => {
    setBusqueda('');
  }, [entidadActiva]);

  const cargarDatos = async () => {
    setLoading(true);
    console.log('📦 Cargando catálogos...');
    
    try {
      // Cargar todos los catálogos directamente (incluye archivados)
      const [comunasRes, origenesRes, especialidadesRes, institucionesRes] = await Promise.all([
        catalogosService.comunas.listar(),
        catalogosService.origenes.listar(),
        catalogosService.especialidades.listar(),
        catalogosService.instituciones.listar()
      ]);

      if (comunasRes.error) {
        console.error('❌ Error al cargar comunas:', comunasRes.error);
        mostrarMensaje('error', `Error al cargar comunas: ${comunasRes.error}`);
      } else if (comunasRes.data) {
        setComunas(comunasRes.data);
        console.log('📦 Comunas cargadas:', comunasRes.data.length);
      }

      if (origenesRes.error) {
        console.error('❌ Error al cargar orígenes:', origenesRes.error);
        mostrarMensaje('error', `Error al cargar orígenes: ${origenesRes.error}`);
      } else if (origenesRes.data) {
        setOrigenes(origenesRes.data);
        console.log('📦 Orígenes cargados:', origenesRes.data.length);
      }

      if (especialidadesRes.error) {
        console.error('❌ Error al cargar especialidades:', especialidadesRes.error);
        mostrarMensaje('error', `Error al cargar especialidades: ${especialidadesRes.error}`);
      } else if (especialidadesRes.data) {
        setEspecialidades(especialidadesRes.data);
        console.log('📦 Especialidades cargadas:', especialidadesRes.data.length);
      }

      if (institucionesRes.error) {
        console.error('❌ Error al cargar instituciones:', institucionesRes.error);
        mostrarMensaje('error', `Error al cargar instituciones: ${institucionesRes.error}`);
      } else if (institucionesRes.data) {
        setInstituciones(institucionesRes.data);
        console.log('📦 Instituciones cargadas:', institucionesRes.data.length);
      }
    } catch (error) {
      console.error('❌ Error cargando catálogos:', error);
      mostrarMensaje('error', 'Error al cargar catálogos');
    } finally {
      setLoading(false);
    }
  };

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
      setFormEspecialidad({ nombre: item.nombre, nivel: item.nivel || 1, parent_id: item.parent_id || null });
    } else if (entidadActiva === 'instituciones') {
      setFormInstitucion({ nombre: item.nombre, tipo: item.tipo });
    }
    
    setMostrarModal(true);
  };

  const handleGuardar = async () => {
    if (entidadActiva === 'comunas') {
      if (!formComuna.nombre) {
        mostrarMensaje('error', 'El nombre es obligatorio');
        return;
      }
      
      let resultado;
      if (itemSeleccionado) {
        resultado = await catalogosService.comunas.actualizar(itemSeleccionado.id_comuna || itemSeleccionado.id, { nombre: formComuna.nombre });
      } else {
        resultado = await catalogosService.comunas.crear({ nombre: formComuna.nombre, archivado: false });
      }
      
      if (resultado.error) {
        mostrarMensaje('error', resultado.error);
      } else {
        mostrarMensaje('success', itemSeleccionado ? 'Comuna actualizada exitosamente' : 'Comuna creada exitosamente');
        cargarDatos();
      }
    } else if (entidadActiva === 'origenes') {
      if (!formOrigen.nombre) {
        mostrarMensaje('error', 'El nombre es obligatorio');
        return;
      }
      
      let resultado;
      if (itemSeleccionado) {
        resultado = await catalogosService.origenes.actualizar(itemSeleccionado.id_origen || itemSeleccionado.id, { nombre: formOrigen.nombre });
      } else {
        resultado = await catalogosService.origenes.crear({ nombre: formOrigen.nombre, requiere_ci: false, archivado: false });
      }
      
      if (resultado.error) {
        mostrarMensaje('error', resultado.error);
      } else {
        mostrarMensaje('success', itemSeleccionado ? 'Origen actualizado exitosamente' : 'Origen creado exitosamente');
        cargarDatos();
      }
    } else if (entidadActiva === 'especialidades' || entidadActiva === 'subesp1' || entidadActiva === 'subesp2') {
      if (!formEspecialidad.nombre) {
        mostrarMensaje('error', 'El nombre es obligatorio');
        return;
      }
      
      let resultado;
      if (itemSeleccionado) {
        resultado = await catalogosService.especialidades.actualizar(itemSeleccionado.id_especialidad || itemSeleccionado.id, { nombre: formEspecialidad.nombre });
      } else {
        resultado = await catalogosService.especialidades.crear({ 
          nombre: formEspecialidad.nombre, 
          nivel: formEspecialidad.nivel,
          parent_id: formEspecialidad.parent_id,
          archivado: false 
        });
      }
      
      if (resultado.error) {
        mostrarMensaje('error', resultado.error);
      } else {
        mostrarMensaje('success', itemSeleccionado ? 'Especialidad actualizada exitosamente' : 'Especialidad creada exitosamente');
        cargarDatos();
      }
    } else if (entidadActiva === 'instituciones') {
      if (!formInstitucion.nombre || !formInstitucion.tipo) {
        mostrarMensaje('error', 'Complete los campos obligatorios');
        return;
      }
      
      let resultado;
      if (itemSeleccionado) {
        resultado = await catalogosService.instituciones.actualizar(itemSeleccionado.id_institucion_convenio || itemSeleccionado.id_institucion || itemSeleccionado.id, { 
          nombre: formInstitucion.nombre,
          tipo: formInstitucion.tipo 
        });
      } else {
        resultado = await catalogosService.instituciones.crear({ 
          nombre: formInstitucion.nombre, 
          tipo: formInstitucion.tipo,
          archivado: false 
        });
      }
      
      if (resultado.error) {
        mostrarMensaje('error', resultado.error);
      } else {
        mostrarMensaje('success', itemSeleccionado ? 'Institución actualizada exitosamente' : 'Institución creada exitosamente');
        cargarDatos();
      }
    }
    
    limpiarFormularios();
    setMostrarModal(false);
  };

  const handleArchivar = async (item: any) => {
    setConfirmDialog({
      title: 'Archivar Elemento',
      message: `¿Está seguro de archivar "${item.nombre}"?`,
      type: 'warning',
      onConfirm: async () => {
        setConfirmDialog(null);
        
        let resultado;
        if (entidadActiva === 'comunas') {
          resultado = await catalogosService.comunas.archivar(item.id_comuna || item.id);
        } else if (entidadActiva === 'origenes') {
          resultado = await catalogosService.origenes.archivar(item.id_origen || item.id);
        } else if (entidadActiva === 'especialidades' || entidadActiva === 'subesp1' || entidadActiva === 'subesp2') {
          resultado = await catalogosService.especialidades.archivar(item.id_especialidad || item.id);
        } else if (entidadActiva === 'instituciones') {
          resultado = await catalogosService.instituciones.archivar(item.id_institucion_convenio || item.id_institucion || item.id);
        }
        
        if (resultado?.error) {
          setToast({ message: resultado.error, type: 'error' });
        } else {
          setToast({ message: 'Elemento archivado exitosamente', type: 'success' });
          cargarDatos();
        }
      }
    });
  };

  const handleDesarchivar = async (item: any) => {
    setConfirmDialog({
      title: 'Desarchivar Elemento',
      message: `¿Está seguro de desarchivar "${item.nombre}"?`,
      type: 'info',
      onConfirm: async () => {
        setConfirmDialog(null);
        
        let resultado;
        if (entidadActiva === 'comunas') {
          resultado = await catalogosService.comunas.desarchivar(item.id_comuna || item.id);
        } else if (entidadActiva === 'origenes') {
          resultado = await catalogosService.origenes.desarchivar(item.id_origen || item.id);
        } else if (entidadActiva === 'especialidades' || entidadActiva === 'subesp1' || entidadActiva === 'subesp2') {
          resultado = await catalogosService.especialidades.desarchivar(item.id_especialidad || item.id);
        } else if (entidadActiva === 'instituciones') {
          resultado = await catalogosService.instituciones.desarchivar(item.id_institucion_convenio || item.id_institucion || item.id);
        }
        
        if (resultado?.error) {
          setToast({ message: resultado.error, type: 'error' });
        } else {
          setToast({ message: 'Elemento desarchivado exitosamente', type: 'success' });
          cargarDatos();
        }
      }
    });
  };

  const renderTablaItems = () => {
    let items: any[] = [];
    
    if (entidadActiva === 'comunas') {
      items = Array.isArray(comunas) ? comunas.filter(c => {
        const matchBusqueda = !busqueda || c.nombre.toLowerCase().includes(busqueda.toLowerCase());
        const matchArchivado = mostrarArchivados || !c.archivado;
        return matchBusqueda && matchArchivado;
      }) : [];
    } else if (entidadActiva === 'origenes') {
      items = Array.isArray(origenes) ? origenes.filter(o => {
        const matchBusqueda = !busqueda || o.nombre.toLowerCase().includes(busqueda.toLowerCase());
        const matchArchivado = mostrarArchivados || !o.archivado;
        return matchBusqueda && matchArchivado;
      }) : [];
    } else if (entidadActiva === 'especialidades') {
      // Tabla simple de especialidades principales (nivel 1)
      items = Array.isArray(especialidades) ? especialidades.filter(e => {
        const matchNivel = e.nivel === 1;
        const matchBusqueda = !busqueda || e.nombre.toLowerCase().includes(busqueda.toLowerCase());
        const matchArchivado = mostrarArchivados || !e.archivado;
        return matchNivel && matchBusqueda && matchArchivado;
      }) : [];
    } else if (entidadActiva === 'subesp1') {
      // Mostrar agrupadas por especialidad principal
      let especialidadesPrincipales = Array.isArray(especialidades) ? especialidades.filter(e => e.nivel === 1) : [];
      
      // Filtrar solo las que tienen hijas si está activado
      if (ocultarVacias) {
        especialidadesPrincipales = especialidadesPrincipales.filter(espPrincipal => {
          const tieneHijas = especialidades.some(e => e.nivel === 2 && e.parent_id === espPrincipal.id_especialidad);
          return tieneHijas;
        });
      }
      
      return (
        <div className="especialidades-agrupadas">
          {especialidadesPrincipales.map(espPrincipal => {
            const subesp1 = especialidades.filter(e => e.nivel === 2 && e.parent_id === espPrincipal.id_especialidad && (!busqueda || e.nombre.toLowerCase().includes(busqueda.toLowerCase())));
            
            return (
              <div key={espPrincipal.id_especialidad} className="grupo-especialidad">
                <div className="grupo-header">
                  <h4>{espPrincipal.nombre}</h4>
                  <button 
                    className="btn btn-sm btn-primary" 
                    onClick={() => handleNuevoEnGrupo(espPrincipal.id_especialidad || espPrincipal.id || 0, 2)}
                  >
                    ➕ Nuevo
                  </button>
                </div>
                
                <div className="tabla-administracion">
                  <table>
                    <thead>
                      <tr>
                        <th>Nombre</th>
                        <th>Archivado</th>
                        <th>Acciones</th>
                      </tr>
                    </thead>
                    <tbody>
                      {subesp1.length === 0 ? (
                        <tr>
                          <td colSpan={3} className="no-data">No hay subespecialidades nivel 1</td>
                        </tr>
                      ) : (
                        subesp1.map(sub1 => (
                          <tr key={sub1.id_especialidad}>
                            <td>{sub1.nombre}</td>
                            <td>{sub1.archivado ? 'Sí' : 'No'}</td>
                            <td className="acciones">
                              <button 
                                className="btn-accion btn-editar" 
                                onClick={() => handleEditar(sub1)}
                                title="Editar"
                              >
                                Editar
                              </button>
                              {!sub1.archivado ? (
                                <button 
                                  className="btn-accion btn-archivar" 
                                  onClick={() => handleArchivar(sub1)}
                                  title="Archivar"
                                >
                                  Archivar
                                </button>
                              ) : (
                                <button 
                                  className="btn-accion btn-desarchivar" 
                                  onClick={() => handleDesarchivar(sub1)}
                                  title="Desarchivar"
                                >
                                  Desarchivar
                                </button>
                              )}
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
      let subesp1List = Array.isArray(especialidades) ? especialidades.filter(e => e.nivel === 2) : [];
      
      // Filtrar solo las que tienen hijas si está activado
      if (ocultarVacias) {
        subesp1List = subesp1List.filter(sub1 => {
          const tieneHijas = especialidades.some(e => e.nivel === 3 && e.parent_id === sub1.id_especialidad);
          return tieneHijas;
        });
      }
      
      return (
        <div className="especialidades-agrupadas">
          {subesp1List.map(sub1 => {
            const subesp2 = especialidades.filter(e => e.nivel === 3 && e.parent_id === sub1.id_especialidad && (!busqueda || e.nombre.toLowerCase().includes(busqueda.toLowerCase())));
            const padre = especialidades.find(e => e.id_especialidad === sub1.parent_id);
            
            return (
              <div key={sub1.id_especialidad} className="grupo-especialidad">
                <div className="grupo-header">
                  <h4>{sub1.nombre} <span className="padre-badge">({padre?.nombre})</span></h4>
                  <button 
                    className="btn btn-sm btn-primary" 
                    onClick={() => handleNuevoEnGrupo(sub1.id_especialidad || sub1.id || 0, 3)}
                  >
                    ➕ Nuevo
                  </button>
                </div>
                
                <div className="tabla-administracion">
                  <table>
                    <thead>
                      <tr>
                        <th>Nombre</th>
                        <th>Archivado</th>
                        <th>Acciones</th>
                      </tr>
                    </thead>
                    <tbody>
                      {subesp2.length === 0 ? (
                        <tr>
                          <td colSpan={3} className="no-data">No hay subespecialidades nivel 2</td>
                        </tr>
                      ) : (
                        subesp2.map(sub2 => (
                          <tr key={sub2.id_especialidad}>
                            <td>{sub2.nombre}</td>
                            <td>{sub2.archivado ? 'Sí' : 'No'}</td>
                            <td className="acciones">
                              <button 
                                className="btn-accion btn-editar" 
                                onClick={() => handleEditar(sub2)}
                                title="Editar"
                              >
                                Editar
                              </button>
                              {!sub2.archivado ? (
                                <button 
                                  className="btn-accion btn-archivar" 
                                  onClick={() => handleArchivar(sub2)}
                                  title="Archivar"
                                >
                                  Archivar
                                </button>
                              ) : (
                                <button 
                                  className="btn-accion btn-desarchivar" 
                                  onClick={() => handleDesarchivar(sub2)}
                                  title="Desarchivar"
                                >
                                  Desarchivar
                                </button>
                              )}
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
      items = Array.isArray(instituciones) ? instituciones.filter(i => {
        const matchBusqueda = !busqueda || i.nombre.toLowerCase().includes(busqueda.toLowerCase());
        const matchArchivado = mostrarArchivados || !i.archivado;
        return matchBusqueda && matchArchivado;
      }) : [];
    }
    
    // Para especialidades, instituciones, comunas, origenes - mostrar tabla normal
    return (
      <div className="tabla-administracion">
        <table>
          <thead>
            <tr>
              <th>Nombre</th>
              {entidadActiva === 'instituciones' && <th>Tipo</th>}
              <th>Archivado</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            {items.length === 0 ? (
              <tr>
                <td colSpan={entidadActiva === 'instituciones' ? 4 : 3} className="no-data">
                  No hay registros disponibles
                </td>
              </tr>
            ) : (
              items.map(item => (
                <tr key={item.id_comuna || item.id_origen || item.id_especialidad || item.id_institucion_convenio || item.id}>
                  <td>{item.nombre}</td>
                  {entidadActiva === 'instituciones' && <td>{item.tipo}</td>}
                  <td>{item.archivado ? 'Sí' : 'No'}</td>
                  <td className="acciones">
                    <button 
                      className="btn-accion btn-editar" 
                      onClick={() => handleEditar(item)}
                      title="Editar"
                    >
                      Editar
                    </button>
                    {!item.archivado ? (
                      <button 
                        className="btn-accion btn-archivar" 
                        onClick={() => handleArchivar(item)}
                        title="Archivar"
                      >
                        Archivar
                      </button>
                    ) : (
                      <button 
                        className="btn-accion btn-desarchivar" 
                        onClick={() => handleDesarchivar(item)}
                        title="Desarchivar"
                      >
                        Desarchivar
                      </button>
                    )}
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
                            <option key={e.id_especialidad} value={e.id_especialidad}>{e.nombre}</option>
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
                            <option key={e.id_especialidad} value={e.id_especialidad}>{e.nombre}</option>
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
            
            {/* Checkbox para mostrar archivados */}
            {entidadActiva !== 'subesp1' && entidadActiva !== 'subesp2' && (
              <label className="checkbox-ocultar-vacias">
                <input
                  type="checkbox"
                  checked={mostrarArchivados}
                  onChange={(e) => setMostrarArchivados(e.target.checked)}
                />
                <span>Mostrar archivados</span>
              </label>
            )}
            
            {/* Botón Nuevo solo para las vistas que no tienen agrupación */}
            {entidadActiva !== 'subesp1' && entidadActiva !== 'subesp2' && (
              <button className="btn btn-primary" onClick={handleNuevo}>
                ➕ Nuevo
              </button>
            )}
          </div>
          
          {loading ? (
            <div className="loading-spinner">
              <div className="spinner"></div>
            </div>
          ) : (
            renderTablaItems()
          )}
        </div>
      </div>

      {renderModal()}

      {/* Toast de notificaciones */}
      {toast && (
        <Toast 
          message={toast.message} 
          type={toast.type} 
          onClose={() => setToast(null)} 
        />
      )}

      {/* Diálogo de confirmación */}
      {confirmDialog && (
        <ConfirmDialog
          title={confirmDialog.title}
          message={confirmDialog.message}
          type={confirmDialog.type}
          onConfirm={confirmDialog.onConfirm}
          onCancel={() => setConfirmDialog(null)}
        />
      )}
    </div>
  );
};

export default Administracion;
