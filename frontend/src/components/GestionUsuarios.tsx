import React, { useState, useEffect, useMemo } from 'react';
import { adminService } from '../api/admin.service';
import type { Trabajador } from '../types';
import { validarRut, limpiarRut } from '../utils';
import Toast from './Toast';
import ConfirmDialog from './ConfirmDialog';
import './GestionUsuarios.css';

const GestionUsuarios: React.FC = () => {
  const [usuarios, setUsuarios] = useState<Trabajador[]>([]);
  const [loading, setLoading] = useState(false);
  const [mostrarInactivos, setMostrarInactivos] = useState(true);
  const [datosYaCargados, setDatosYaCargados] = useState(false);
  const [mostrarModal, setMostrarModal] = useState(false);
  const [modalTipo, setModalTipo] = useState<'nuevo' | 'editar' | 'cambiarPassword'>('nuevo');
  const [usuarioSeleccionado, setUsuarioSeleccionado] = useState<Trabajador | null>(null);
  const [mensaje, setMensaje] = useState<{ tipo: 'success' | 'error'; texto: string } | null>(null);
  const [toast, setToast] = useState<{ message: string; type: 'success' | 'error' | 'warning' | 'info' } | null>(null);
  const [confirmDialog, setConfirmDialog] = useState<{
    title: string;
    message: string;
    type: 'danger' | 'warning' | 'info';
    onConfirm: () => void;
  } | null>(null);

  // Estados del formulario
  const [formUsuario, setFormUsuario] = useState({
    rut: '',
    nombre: '',
    apellido: '',
    email: '',
    contrasena: '',
    confirmarContrasena: '',
    activo: true
  });

  useEffect(() => {
    cargarUsuarios();
  }, []);

  // Cargar datos solo la primera vez que se activa mostrarInactivos
  useEffect(() => {
    if (mostrarInactivos && !datosYaCargados) {
      cargarUsuarios();
      setDatosYaCargados(true);
    }
  }, [mostrarInactivos]);

  const cargarUsuarios = async () => {
    setLoading(true);
    console.log('👥 Cargando usuarios...');
    const { data, error } = await adminService.listarUsuarios();
    console.log('👥 Respuesta listarUsuarios:', { data, error });
    if (data) {
      setUsuarios(data);
      console.log('👥 Usuarios cargados:', data);
    } else if (error) {
      console.error('❌ Error al cargar usuarios:', error);
    }
    setLoading(false);
  };

  // Calcular ingresos por ejecutivo
  const ingresosPorEjecutivo = useMemo(() => {
    const ingresos: Record<string, number> = {};
    // TODO: Obtener ingresos reales de la API cuando esté disponible
    // Por ahora retorna objeto vacío
    return ingresos;
  }, []);

  const mostrarMensaje = (tipo: 'success' | 'error', texto: string) => {
    setMensaje({ tipo, texto });
    setTimeout(() => setMensaje(null), 3000);
  };

  const limpiarFormulario = () => {
    setFormUsuario({
      rut: '',
      nombre: '',
      apellido: '',
      email: '',
      contrasena: '',
      confirmarContrasena: '',
      activo: true
    });
    setUsuarioSeleccionado(null);
  };

  const handleNuevoUsuario = () => {
    limpiarFormulario();
    setModalTipo('nuevo');
    setMostrarModal(true);
  };

  const handleCambiarPassword = (usuario: Trabajador) => {
    setUsuarioSeleccionado(usuario);
    setFormUsuario({
      ...formUsuario,
      rut: usuario.rut,
      contrasena: '',
      confirmarContrasena: ''
    });
    setModalTipo('cambiarPassword');
    setMostrarModal(true);
  };

  const handleDesactivarUsuario = async (usuario: Trabajador) => {
    setConfirmDialog({
      title: usuario.activo ? 'Desactivar Usuario' : 'Activar Usuario',
      message: `¿Está seguro de ${usuario.activo ? 'desactivar' : 'activar'} al usuario ${usuario.nombre} ${usuario.apellido}?`,
      type: usuario.activo ? 'warning' : 'info',
      onConfirm: async () => {
        setConfirmDialog(null);
        
        if (!usuario.id_trabajador) {
          setToast({ message: 'Error: ID de trabajador no disponible', type: 'error' });
          return;
        }

        // Usar el servicio correcto según el estado actual
        const { error } = usuario.activo 
          ? await adminService.archivarUsuario(usuario.id_trabajador)
          : await adminService.activarUsuario(usuario.id_trabajador);
        
        if (error) {
          setToast({ message: `Error al ${usuario.activo ? 'desactivar' : 'activar'} usuario: ${error}`, type: 'error' });
        } else {
          setToast({ message: `Usuario ${usuario.activo ? 'desactivado' : 'activado'} exitosamente`, type: 'success' });
          cargarUsuarios();
        }
      }
    });
  };

  const handleGuardar = async () => {
    if (modalTipo === 'nuevo') {
      // Validar campos obligatorios
      if (!formUsuario.rut || !formUsuario.nombre || !formUsuario.apellido || !formUsuario.email || !formUsuario.contrasena) {
        mostrarMensaje('error', 'Complete todos los campos obligatorios');
        return;
      }

      const rutLimpio = limpiarRut(formUsuario.rut);

      if (!validarRut(rutLimpio)) {
        mostrarMensaje('error', 'RUT inválido. Formato: 12345678-9');
        return;
      }

      if (formUsuario.contrasena !== formUsuario.confirmarContrasena) {
        mostrarMensaje('error', 'Las contraseñas no coinciden');
        return;
      }

      if (formUsuario.contrasena.length < 6) {
        mostrarMensaje('error', 'La contraseña debe tener al menos 6 caracteres');
        return;
      }

      // Verificar si el RUT ya existe
      if (usuarios.some(t => t.rut === rutLimpio)) {
        mostrarMensaje('error', 'El RUT ya está registrado');
        return;
      }

      // Crear nuevo usuario
      const { error } = await adminService.registrarUsuario({
        rut: rutLimpio,
        nombre: formUsuario.nombre,
        apellido: formUsuario.apellido,
        email: formUsuario.email,
        rol: 'usuario',
        clave: formUsuario.contrasena
      });

      if (error) {
        mostrarMensaje('error', `Error al crear usuario: ${error}`);
        return;
      }

      mostrarMensaje('success', 'Usuario creado exitosamente');
      cargarUsuarios();
      
    } else if (modalTipo === 'cambiarPassword') {
      if (!formUsuario.contrasena || !formUsuario.confirmarContrasena) {
        mostrarMensaje('error', 'Complete ambos campos de contraseña');
        return;
      }

      if (formUsuario.contrasena !== formUsuario.confirmarContrasena) {
        mostrarMensaje('error', 'Las contraseñas no coinciden');
        return;
      }

      if (formUsuario.contrasena.length < 6) {
        mostrarMensaje('error', 'La contraseña debe tener al menos 6 caracteres');
        return;
      }

      // Buscar el usuario por RUT para obtener su id_trabajador
      const usuario = usuarios.find(u => u.rut === formUsuario.rut);
      if (!usuario || !usuario.id_trabajador) {
        mostrarMensaje('error', 'Usuario no encontrado');
        return;
      }

      const { error } = await adminService.cambiarContrasena(
        usuario.id_trabajador,
        formUsuario.contrasena
      );

      if (error) {
        mostrarMensaje('error', `Error al cambiar contraseña: ${error}`);
        return;
      }

      mostrarMensaje('success', 'Contraseña actualizada exitosamente');
    }

    limpiarFormulario();
    setMostrarModal(false);
  };

  const renderModal = () => {
    if (!mostrarModal) return null;

    return (
      <div className="modal-overlay" onClick={() => setMostrarModal(false)}>
        <div className="modal-content-usuarios" onClick={(e) => e.stopPropagation()}>
          <div className="modal-header-usuarios">
            <h3>
              {modalTipo === 'nuevo' && '➕ Nuevo Usuario'}
              {modalTipo === 'cambiarPassword' && '🔒 Cambiar Contraseña'}
            </h3>
            <button className="btn-close" onClick={() => setMostrarModal(false)}>×</button>
          </div>

          <div className="modal-body-usuarios">
            {modalTipo === 'nuevo' && (
              <>
                <div className="form-group">
                  <label>RUT <span className="required">*</span></label>
                  <input
                    type="text"
                    value={formUsuario.rut}
                    onChange={(e) => setFormUsuario({ ...formUsuario, rut: e.target.value })}
                    placeholder="12345678-9"
                  />
                </div>
                <div className="form-row">
                  <div className="form-group">
                    <label>Nombre <span className="required">*</span></label>
                    <input
                      type="text"
                      value={formUsuario.nombre}
                      onChange={(e) => setFormUsuario({ ...formUsuario, nombre: e.target.value })}
                      placeholder="Juan"
                    />
                  </div>
                  <div className="form-group">
                    <label>Apellido <span className="required">*</span></label>
                    <input
                      type="text"
                      value={formUsuario.apellido}
                      onChange={(e) => setFormUsuario({ ...formUsuario, apellido: e.target.value })}
                      placeholder="Pérez"
                    />
                  </div>
                </div>
                <div className="form-group">
                  <label>Email <span className="required">*</span></label>
                  <input
                    type="email"
                    value={formUsuario.email}
                    onChange={(e) => setFormUsuario({ ...formUsuario, email: e.target.value })}
                    placeholder="ejemplo@correo.com"
                  />
                </div>
                <div className="form-row">
                  <div className="form-group">
                    <label>Contraseña <span className="required">*</span></label>
                    <input
                      type="password"
                      value={formUsuario.contrasena}
                      onChange={(e) => setFormUsuario({ ...formUsuario, contrasena: e.target.value })}
                      placeholder="Mínimo 6 caracteres"
                    />
                  </div>
                  <div className="form-group">
                    <label>Confirmar Contraseña <span className="required">*</span></label>
                    <input
                      type="password"
                      value={formUsuario.confirmarContrasena}
                      onChange={(e) => setFormUsuario({ ...formUsuario, confirmarContrasena: e.target.value })}
                      placeholder="Repetir contraseña"
                    />
                  </div>
                </div>
              </>
            )}

            {modalTipo === 'cambiarPassword' && (
              <>
                <div className="form-group">
                  <label>Usuario</label>
                  <input
                    type="text"
                    value={`${usuarioSeleccionado?.nombre} ${usuarioSeleccionado?.apellido}`}
                    disabled
                    className="input-disabled"
                  />
                </div>
                <div className="form-group">
                  <label>Nueva Contraseña <span className="required">*</span></label>
                  <input
                    type="password"
                    value={formUsuario.contrasena}
                    onChange={(e) => setFormUsuario({ ...formUsuario, contrasena: e.target.value })}
                    placeholder="Mínimo 6 caracteres"
                  />
                </div>
                <div className="form-group">
                  <label>Confirmar Nueva Contraseña <span className="required">*</span></label>
                  <input
                    type="password"
                    value={formUsuario.confirmarContrasena}
                    onChange={(e) => setFormUsuario({ ...formUsuario, confirmarContrasena: e.target.value })}
                    placeholder="Repetir contraseña"
                    style={{
                      borderColor: formUsuario.confirmarContrasena && formUsuario.contrasena !== formUsuario.confirmarContrasena ? '#e74c3c' : undefined
                    }}
                  />
                  {formUsuario.confirmarContrasena && formUsuario.contrasena !== formUsuario.confirmarContrasena && (
                    <span style={{ color: '#e74c3c', fontSize: '12px', marginTop: '4px' }}>
                      Las contraseñas no coinciden
                    </span>
                  )}
                  {formUsuario.confirmarContrasena && formUsuario.contrasena === formUsuario.confirmarContrasena && formUsuario.contrasena.length >= 6 && (
                    <span style={{ color: '#27ae60', fontSize: '12px', marginTop: '4px' }}>
                      ✓ Las contraseñas coinciden
                    </span>
                  )}
                </div>
              </>
            )}
          </div>

          <div className="modal-footer-usuarios">
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

  if (loading) {
    return (
      <div className="gestion-usuarios">
        <div className="loading-spinner">
          <div className="spinner"></div>
        </div>
      </div>
    );
  }

  return (
    <div className="gestion-usuarios">
      {mensaje && (
        <div className={`mensaje mensaje-${mensaje.tipo}`}>
          {mensaje.texto}
        </div>
      )}

      <div className="usuarios-header">
        <button className="btn btn-primary" onClick={handleNuevoUsuario}>
          ➕ Nuevo Usuario
        </button>        <label className="checkbox-mostrar-inactivos" style={{ marginLeft: '20px', display: 'flex', alignItems: 'center', gap: '8px' }}>
          <input
            type="checkbox"
            checked={mostrarInactivos}
            onChange={(e) => setMostrarInactivos(e.target.checked)}
          />
          <span>Mostrar inactivos</span>
        </label>      </div>

      <div className="usuarios-tabla-container">
        <table className="usuarios-tabla">
          <thead>
            <tr>
              <th>RUT</th>
              <th>Nombre</th>
              <th>Apellido</th>
              <th>Estado</th>
              <th>Ingresos</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            {usuarios
              .filter(u => u.rol !== 'jefe')
              .filter(u => mostrarInactivos || u.activo)
              .map(usuario => (
              <tr key={usuario.rut} className={!usuario.activo ? 'usuario-inactivo' : ''}>
                <td>{usuario.rut}</td>
                <td>{usuario.nombre}</td>
                <td>{usuario.apellido}</td>
                <td>
                  <span className={`badge-estado ${usuario.activo ? 'badge-activo' : 'badge-inactivo'}`}>
                    {usuario.activo ? 'Activo' : 'Inactivo'}
                  </span>
                </td>
                <td>
                  <span className="badge-ingresos">{ingresosPorEjecutivo[usuario.rut] || 0}</span>
                </td>
                <td className="acciones-usuarios">
                  <button
                    className="btn-accion btn-password"
                    onClick={() => handleCambiarPassword(usuario)}
                    title="Cambiar contraseña"
                  >
                    Cambiar Clave
                  </button>
                  <button
                    className={`btn-accion ${usuario.activo ? 'btn-desactivar' : 'btn-activar'}`}
                    onClick={() => handleDesactivarUsuario(usuario)}
                    title={usuario.activo ? 'Desactivar usuario' : 'Activar usuario'}
                  >
                    {usuario.activo ? 'Desactivar' : 'Activar'}
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
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

export default GestionUsuarios;
