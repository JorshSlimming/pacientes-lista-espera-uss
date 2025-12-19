import React, { useState, useMemo } from 'react';
import { trabajadores, seguimientos } from '../mockData';
import type { Trabajador } from '../types';
import './GestionUsuarios.css';

const GestionUsuarios: React.FC = () => {
  const [mostrarModal, setMostrarModal] = useState(false);
  const [modalTipo, setModalTipo] = useState<'nuevo' | 'editar' | 'cambiarPassword'>('nuevo');
  const [usuarioSeleccionado, setUsuarioSeleccionado] = useState<Trabajador | null>(null);
  const [mensaje, setMensaje] = useState<{ tipo: 'success' | 'error'; texto: string } | null>(null);

  // Estados del formulario
  const [formUsuario, setFormUsuario] = useState({
    rut: '',
    nombre: '',
    apellido: '',
    rol: 'usuario' as 'usuario' | 'jefe',
    contrasena: '',
    confirmarContrasena: '',
    activo: true
  });

  // Calcular ingresos por ejecutivo
  const ingresosPorEjecutivo = useMemo(() => {
    const ingresos: Record<string, number> = {};
    
    seguimientos.forEach(s => {
      const ejec = trabajadores.find(t => t.rut === s.rut_ejecutivo_ingreso);
      if (ejec) {
        ingresos[ejec.rut] = (ingresos[ejec.rut] || 0) + 1;
      }
    });
    
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
      rol: 'usuario',
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

  const handleDesactivarUsuario = (usuario: Trabajador) => {
    const confirmar = window.confirm(
      `¿Está seguro de ${usuario.activo !== false ? 'desactivar' : 'activar'} al usuario ${usuario.nombre} ${usuario.apellido}?`
    );
    if (!confirmar) return;

    const trabajador = trabajadores.find(t => t.rut === usuario.rut);
    if (trabajador) {
      trabajador.activo = trabajador.activo === false ? true : false;
      mostrarMensaje('success', `Usuario ${trabajador.activo ? 'activado' : 'desactivado'} exitosamente`);
    }
  };

  const validarRut = (rut: string): boolean => {
    // Validación simple de formato RUT chileno
    const rutRegex = /^\d{7,8}-[\dkK]$/;
    return rutRegex.test(rut);
  };

  const handleGuardar = () => {
    if (modalTipo === 'nuevo') {
      // Validar campos obligatorios
      if (!formUsuario.rut || !formUsuario.nombre || !formUsuario.apellido || !formUsuario.contrasena) {
        mostrarMensaje('error', 'Complete todos los campos obligatorios');
        return;
      }

      if (!validarRut(formUsuario.rut)) {
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
      if (trabajadores.some(t => t.rut === formUsuario.rut)) {
        mostrarMensaje('error', 'El RUT ya está registrado');
        return;
      }

      // Crear nuevo usuario
      const nuevoUsuario: Trabajador = {
        rut: formUsuario.rut,
        nombre: formUsuario.nombre,
        apellido: formUsuario.apellido,
        rol: formUsuario.rol,
        activo: true
      };

      trabajadores.push(nuevoUsuario);
      mostrarMensaje('success', 'Usuario creado exitosamente');
      
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
                  <label>Rol <span className="required">*</span></label>
                  <select
                    value={formUsuario.rol}
                    onChange={(e) => setFormUsuario({ ...formUsuario, rol: e.target.value as 'usuario' | 'jefe' })}
                  >
                    <option value="usuario">Usuario</option>
                    <option value="jefe">Jefe</option>
                  </select>
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
                  />
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
        </button>
      </div>

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
            {trabajadores.filter(u => u.rol !== 'jefe').map(usuario => (
              <tr key={usuario.rut} className={usuario.activo === false ? 'usuario-inactivo' : ''}>
                <td>{usuario.rut}</td>
                <td>{usuario.nombre}</td>
                <td>{usuario.apellido}</td>
                <td>
                  <span className={`badge-estado ${usuario.activo !== false ? 'badge-activo' : 'badge-inactivo'}`}>
                    {usuario.activo !== false ? 'Activo' : 'Inactivo'}
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
                    className={`btn-accion ${usuario.activo !== false ? 'btn-desactivar' : 'btn-activar'}`}
                    onClick={() => handleDesactivarUsuario(usuario)}
                    title={usuario.activo !== false ? 'Desactivar usuario' : 'Activar usuario'}
                  >
                    {usuario.activo !== false ? 'Desactivar' : 'Activar'}
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {renderModal()}
    </div>
  );
};

export default GestionUsuarios;
