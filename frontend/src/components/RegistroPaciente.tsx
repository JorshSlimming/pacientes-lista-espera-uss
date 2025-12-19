import React, { useState, useEffect } from 'react';
import { useAuth } from '../AuthContext';
import { Paciente, Seguimiento, Contacto } from '../types';
import { comunas, origenes, instituciones, especialidades, pacientes, seguimientos, contactos } from '../mockData';
import { validarRut, formatearRut, validarEmail, validarCelular } from '../utils';
import './RegistroPaciente.css';

interface Props {
  onClose: () => void;
  onSuccess: () => void;
}

const RegistroPaciente: React.FC<Props> = ({ onClose, onSuccess }) => {
  const { usuario } = useAuth();
  
  // Formulario principal
  const [rut, setRut] = useState('');
  const [nombre, setNombre] = useState('');
  const [primerApellido, setPrimerApellido] = useState('');
  const [segundoApellido, setSegundoApellido] = useState('');
  const [fechaNacimiento, setFechaNacimiento] = useState('');
  const [direccion, setDireccion] = useState('');
  const [idComuna, setIdComuna] = useState('');
  const [correo, setCorreo] = useState('');
  const [primerCelular, setPrimerCelular] = useState('');
  const [segundoCelular, setSegundoCelular] = useState('');
  const [idOrigen, setIdOrigen] = useState('');
  const [idInstitucion, setIdInstitucion] = useState('');
  const [idEspecialidad, setIdEspecialidad] = useState('');
  const [idSubespecialidad1, setIdSubespecialidad1] = useState('');
  const [idSubespecialidad2, setIdSubespecialidad2] = useState('');
  const [obs, setObs] = useState('');

  // Opciones dinámicas
  const [especialidadesPrincipales, setEspecialidadesPrincipales] = useState<typeof especialidades>([]);
  const [subespecialidades1, setSubespecialidades1] = useState<typeof especialidades>([]);
  const [subespecialidades2, setSubespecialidades2] = useState<typeof especialidades>([]);
  
  const [errores, setErrores] = useState<Record<string, string>>({});
  const [guardando, setGuardando] = useState(false);

  useEffect(() => {
    // Cargar especialidades principales (nivel 1)
    setEspecialidadesPrincipales(especialidades.filter(e => e.nivel === 1));
  }, []);

  useEffect(() => {
    // Cargar subespecialidades cuando se selecciona especialidad
    if (idEspecialidad) {
      const subs = especialidades.filter(e => e.parent_id === parseInt(idEspecialidad) && e.nivel === 2);
      setSubespecialidades1(subs);
      setIdSubespecialidad1('');
      setIdSubespecialidad2('');
      setSubespecialidades2([]);
    }
  }, [idEspecialidad]);

  useEffect(() => {
    // Cargar subespecialidades de nivel 3
    if (idSubespecialidad1) {
      const subs = especialidades.filter(e => e.parent_id === parseInt(idSubespecialidad1) && e.nivel === 3);
      setSubespecialidades2(subs);
      setIdSubespecialidad2('');
    }
  }, [idSubespecialidad1]);

  const origenSeleccionado = origenes.find(o => o.id === parseInt(idOrigen));
  const requiereInstitucion = origenSeleccionado?.requiere_ci || false;

  const validarFormulario = (): boolean => {
    const nuevosErrores: Record<string, string> = {};

    // Validar RUT
    if (!rut) {
      nuevosErrores.rut = 'RUT es obligatorio';
    } else if (!validarRut(rut)) {
      nuevosErrores.rut = 'RUT inválido';
    }

    // Validar nombres y apellidos
    if (!nombre) nuevosErrores.nombre = 'Nombre es obligatorio';
    if (!primerApellido) nuevosErrores.primerApellido = 'Primer apellido es obligatorio';
    if (!segundoApellido) nuevosErrores.segundoApellido = 'Segundo apellido es obligatorio';

    // Validar fecha de nacimiento
    if (!fechaNacimiento) {
      nuevosErrores.fechaNacimiento = 'Fecha de nacimiento es obligatoria';
    }

    // Validar dirección y comuna
    if (!direccion) nuevosErrores.direccion = 'Dirección es obligatoria';
    if (!idComuna) nuevosErrores.idComuna = 'Comuna es obligatoria';

    // Validar email
    if (!correo) {
      nuevosErrores.correo = 'Correo es obligatorio';
    } else if (!validarEmail(correo)) {
      nuevosErrores.correo = 'Correo inválido';
    }

    // Validar celulares
    if (!primerCelular) {
      nuevosErrores.primerCelular = 'Celular 1 es obligatorio';
    } else if (!validarCelular(primerCelular)) {
      nuevosErrores.primerCelular = 'Debe tener 9 dígitos';
    }

    if (!segundoCelular) {
      nuevosErrores.segundoCelular = 'Celular 2 es obligatorio';
    } else if (!validarCelular(segundoCelular)) {
      nuevosErrores.segundoCelular = 'Debe tener 9 dígitos';
    }

    // Validar origen
    if (!idOrigen) nuevosErrores.idOrigen = 'Origen es obligatorio';

    // Validar institución si es requerida
    if (requiereInstitucion && !idInstitucion) {
      nuevosErrores.idInstitucion = 'Institución es obligatoria para este origen';
    }

    // Validar especialidades
    if (!idEspecialidad) nuevosErrores.idEspecialidad = 'Especialidad es obligatoria';
    if (!idSubespecialidad1) nuevosErrores.idSubespecialidad1 = 'Subespecialidad 1 es obligatoria';

    setErrores(nuevosErrores);
    return Object.keys(nuevosErrores).length === 0;
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();

    if (!validarFormulario()) {
      return;
    }

    setGuardando(true);

    // Simular guardado
    setTimeout(() => {
      // Crear nuevo contacto
      const nuevoContacto: Contacto = {
        id: contactos.length + 1,
        correo,
        direccion,
        primer_celular: primerCelular,
        segundo_celular: segundoCelular,
      };
      contactos.push(nuevoContacto);

      // Crear nuevo paciente
      const nuevoPaciente: Paciente = {
        rut,
        nombre,
        primer_apellido: primerApellido,
        segundo_apellido: segundoApellido,
        fecha_nacimiento: fechaNacimiento,
        obs,
        id_comuna: parseInt(idComuna),
        id_origen: parseInt(idOrigen),
        id_institucion_convenio: idInstitucion ? parseInt(idInstitucion) : null,
        contacto: nuevoContacto,
      };
      pacientes.push(nuevoPaciente);

      // Crear seguimiento
      const nuevoSeguimiento: Seguimiento = {
        id: seguimientos.length + 1,
        fecha_ingreso: new Date().toISOString().split('T')[0],
        fecha_primera_llamada: null,
        fecha_segunda_llamada: null,
        fecha_tercera_llamada: null,
        fecha_citacion: null,
        agendado: 'no',
        numero_llamado: 0,
        id_paciente: rut,
        id_especialidad: parseInt(idSubespecialidad1 || idEspecialidad),
        rut_ejecutivo_ingreso: usuario?.rut || '',
      };
      seguimientos.push(nuevoSeguimiento);

      setGuardando(false);
      onSuccess();
      onClose();
    }, 1000);
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal-content" onClick={(e) => e.stopPropagation()}>
        <div className="modal-header">
          <h2>Registro de Nuevo Paciente</h2>
          <button className="btn-close" onClick={onClose}>×</button>
        </div>

        <form onSubmit={handleSubmit} className="registro-form">
          <div className="form-section">
            <h3>Información Personal</h3>
            <div className="form-row">
              <div className="form-group">
                <label>RUT <span className="required">*</span></label>
                <input
                  type="text"
                  value={rut}
                  onChange={(e) => setRut(formatearRut(e.target.value))}
                  placeholder="12345678-9"
                />
                {errores.rut && <span className="error">{errores.rut}</span>}
              </div>
            </div>

            <div className="form-row">
              <div className="form-group">
                <label>Nombre <span className="required">*</span></label>
                <input
                  type="text"
                  value={nombre}
                  onChange={(e) => setNombre(e.target.value)}
                />
                {errores.nombre && <span className="error">{errores.nombre}</span>}
              </div>
            </div>

            <div className="form-row">
              <div className="form-group">
                <label>Primer Apellido <span className="required">*</span></label>
                <input
                  type="text"
                  value={primerApellido}
                  onChange={(e) => setPrimerApellido(e.target.value)}
                />
                {errores.primerApellido && <span className="error">{errores.primerApellido}</span>}
              </div>
              <div className="form-group">
                <label>Segundo Apellido <span className="required">*</span></label>
                <input
                  type="text"
                  value={segundoApellido}
                  onChange={(e) => setSegundoApellido(e.target.value)}
                />
                {errores.segundoApellido && <span className="error">{errores.segundoApellido}</span>}
              </div>
            </div>

            <div className="form-row">
              <div className="form-group">
                <label>Fecha de Nacimiento <span className="required">*</span></label>
                <input
                  type="date"
                  value={fechaNacimiento}
                  onChange={(e) => setFechaNacimiento(e.target.value)}
                />
                {errores.fechaNacimiento && <span className="error">{errores.fechaNacimiento}</span>}
              </div>
            </div>
          </div>

          <div className="form-section">
            <h3>Información de Contacto</h3>
            <div className="form-row">
              <div className="form-group">
                <label>Dirección <span className="required">*</span></label>
                <input
                  type="text"
                  value={direccion}
                  onChange={(e) => setDireccion(e.target.value)}
                  placeholder="Calle, número, depto"
                />
                {errores.direccion && <span className="error">{errores.direccion}</span>}
              </div>
            </div>

            <div className="form-row">
              <div className="form-group">
                <label>Comuna <span className="required">*</span></label>
                <select value={idComuna} onChange={(e) => setIdComuna(e.target.value)}>
                  <option value="">Seleccionar...</option>
                  {comunas.map(c => (
                    <option key={c.id} value={c.id}>{c.nombre}</option>
                  ))}
                </select>
                {errores.idComuna && <span className="error">{errores.idComuna}</span>}
              </div>
            </div>

            <div className="form-row">
              <div className="form-group">
                <label>Correo Electrónico <span className="required">*</span></label>
                <input
                  type="email"
                  value={correo}
                  onChange={(e) => setCorreo(e.target.value)}
                  placeholder="ejemplo@email.com"
                />
                {errores.correo && <span className="error">{errores.correo}</span>}
              </div>
            </div>

            <div className="form-row">
              <div className="form-group">
                <label>Celular 1 <span className="required">*</span></label>
                <input
                  type="text"
                  value={primerCelular}
                  onChange={(e) => setPrimerCelular(e.target.value.replace(/\D/g, '').slice(0, 9))}
                  placeholder="987654321"
                  maxLength={9}
                />
                {errores.primerCelular && <span className="error">{errores.primerCelular}</span>}
              </div>
              <div className="form-group">
                <label>Celular 2 <span className="required">*</span></label>
                <input
                  type="text"
                  value={segundoCelular}
                  onChange={(e) => setSegundoCelular(e.target.value.replace(/\D/g, '').slice(0, 9))}
                  placeholder="912345678"
                  maxLength={9}
                />
                {errores.segundoCelular && <span className="error">{errores.segundoCelular}</span>}
              </div>
            </div>
          </div>

          <div className="form-section">
            <h3>Origen e Institución</h3>
            <div className="form-row">
              <div className="form-group">
                <label>Origen <span className="required">*</span></label>
                <select value={idOrigen} onChange={(e) => setIdOrigen(e.target.value)}>
                  <option value="">Seleccionar...</option>
                  {origenes.map(o => (
                    <option key={o.id} value={o.id}>{o.nombre}</option>
                  ))}
                </select>
                {errores.idOrigen && <span className="error">{errores.idOrigen}</span>}
              </div>

              {requiereInstitucion && (
                <div className="form-group">
                  <label>Institución/Convenio <span className="required">*</span></label>
                  <select value={idInstitucion} onChange={(e) => setIdInstitucion(e.target.value)}>
                    <option value="">Seleccionar...</option>
                    {instituciones.map(i => (
                      <option key={i.id} value={i.id}>{i.nombre} ({i.tipo})</option>
                    ))}
                  </select>
                  {errores.idInstitucion && <span className="error">{errores.idInstitucion}</span>}
                </div>
              )}
            </div>
          </div>

          <div className="form-section">
            <h3>Especialidad Médica</h3>
            <div className="form-row">
              <div className="form-group">
                <label>Especialidad <span className="required">*</span></label>
                <select value={idEspecialidad} onChange={(e) => setIdEspecialidad(e.target.value)}>
                  <option value="">Seleccionar...</option>
                  {especialidadesPrincipales.map(e => (
                    <option key={e.id} value={e.id}>{e.nombre}</option>
                  ))}
                </select>
                {errores.idEspecialidad && <span className="error">{errores.idEspecialidad}</span>}
              </div>

              {subespecialidades1.length > 0 && (
                <div className="form-group">
                  <label>Subespecialidad 1 <span className="required">*</span></label>
                  <select value={idSubespecialidad1} onChange={(e) => setIdSubespecialidad1(e.target.value)}>
                    <option value="">Seleccionar...</option>
                    {subespecialidades1.map(e => (
                      <option key={e.id} value={e.id}>{e.nombre}</option>
                    ))}
                  </select>
                  {errores.idSubespecialidad1 && <span className="error">{errores.idSubespecialidad1}</span>}
                </div>
              )}
            </div>

            {subespecialidades2.length > 0 && (
              <div className="form-row">
                <div className="form-group">
                  <label>Subespecialidad 2</label>
                  <select value={idSubespecialidad2} onChange={(e) => setIdSubespecialidad2(e.target.value)}>
                    <option value="">Seleccionar...</option>
                    {subespecialidades2.map(e => (
                      <option key={e.id} value={e.id}>{e.nombre}</option>
                    ))}
                  </select>
                </div>
              </div>
            )}
          </div>

          <div className="form-section">
            <h3>Observaciones</h3>
            <div className="form-row">
              <div className="form-group">
                <label>Observaciones</label>
                <textarea
                  value={obs}
                  onChange={(e) => setObs(e.target.value)}
                  rows={4}
                  placeholder="Información adicional sobre el paciente..."
                />
              </div>
            </div>
          </div>

          <div className="form-actions">
            <button type="button" onClick={onClose} className="btn-secondary">
              Cancelar
            </button>
            <button type="submit" className="btn-primary" disabled={guardando}>
              {guardando ? 'Guardando...' : 'Registrar Paciente'}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default RegistroPaciente;
