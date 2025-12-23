import React, { useState, useEffect } from 'react';
import { useAuth } from '../AuthContext';
import { Especialidad, Comuna, Origen, Institucion } from '../types';
import { validarRut, formatearRut, validarEmail, validarCelular, limpiarRut } from '../utils';
import { catalogosService } from '../api/catalogos.service';
import { pacientesService } from '../api/pacientes.service';
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

  // Catálogos
  const [especialidades, setEspecialidades] = useState<Especialidad[]>([]);
  const [comunas, setComunas] = useState<Comuna[]>([]);
  const [origenes, setOrigenes] = useState<Origen[]>([]);
  const [instituciones, setInstituciones] = useState<Institucion[]>([]);

  // Opciones dinámicas
  const [especialidadesPrincipales, setEspecialidadesPrincipales] = useState<Especialidad[]>([]);
  const [subespecialidades1, setSubespecialidades1] = useState<Especialidad[]>([]);
  const [subespecialidades2, setSubespecialidades2] = useState<Especialidad[]>([]);
  
  const [errores, setErrores] = useState<Record<string, string>>({});
  const [guardando, setGuardando] = useState(false);
  const [cargandoCatalogos, setCargandoCatalogos] = useState(true);

  // Cargar catálogos al montar
  useEffect(() => {
    const cargarCatalogos = async () => {
      setCargandoCatalogos(true);
      try {
        const { data, error } = await catalogosService.obtenerDatosAutocompletar();
        
        if (error) {
          console.error('Error cargando catálogos:', error);
        } else if (data) {
          setEspecialidades(data.especialidades || []);
          setComunas(data.comunas || []);
          setOrigenes(data.origenes || []);
          setInstituciones(data.instituciones || []);
        }
      } catch (error) {
        console.error('Error al cargar catálogos:', error);
      } finally {
        setCargandoCatalogos(false);
      }
    };
    cargarCatalogos();
  }, []);

  useEffect(() => {
    // Cargar especialidades principales (nivel 1)
    if (especialidades.length > 0) {
      setEspecialidadesPrincipales(especialidades.filter(e => e.nivel === 1 && !e.archivado));
    }
  }, [especialidades]);

  useEffect(() => {
    // Cargar subespecialidades cuando se selecciona especialidad
    if (idEspecialidad && especialidades.length > 0) {
      const subs = especialidades.filter(e => e.parent_id === parseInt(idEspecialidad) && e.nivel === 2 && !e.archivado);
      setSubespecialidades1(subs);
      setIdSubespecialidad1('');
      setIdSubespecialidad2('');
      setSubespecialidades2([]);
    }
  }, [idEspecialidad, especialidades]);

  useEffect(() => {
    // Cargar subespecialidades de nivel 3
    if (idSubespecialidad1 && especialidades.length > 0) {
      const subs = especialidades.filter(e => e.parent_id === parseInt(idSubespecialidad1) && e.nivel === 3 && !e.archivado);
      setSubespecialidades2(subs);
      setIdSubespecialidad2('');
    }
  }, [idSubespecialidad1, especialidades]);

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

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!validarFormulario()) {
      return;
    }

    setGuardando(true);

    // Determinar la especialidad final (nivel más bajo seleccionado)
    let especialidadFinal = parseInt(idEspecialidad);
    if (idSubespecialidad2) {
      especialidadFinal = parseInt(idSubespecialidad2);
    } else if (idSubespecialidad1) {
      especialidadFinal = parseInt(idSubespecialidad1);
    }

    const datosNuevoPaciente = {
      rut: limpiarRut(rut),
      nombre,
      primer_apellido: primerApellido,
      segundo_apellido: segundoApellido,
      fecha_nacimiento: fechaNacimiento,
      obs,
      id_comuna: parseInt(idComuna),
      id_origen: parseInt(idOrigen),
      id_institucion_convenio: idInstitucion ? parseInt(idInstitucion) : null,
      correo,
      direccion,
      primer_celular: primerCelular,
      segundo_celular: segundoCelular,
      id_especialidad: especialidadFinal
    };

    const { error } = await pacientesService.crearPaciente(datosNuevoPaciente);

    setGuardando(false);

    if (error) {
      alert(error);
    } else {
      onSuccess();
      onClose();
    }
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal-content" onClick={(e) => e.stopPropagation()}>
        <div className="modal-header">
          <h2>Registro de Nuevo Paciente</h2>
          <button className="btn-close" onClick={onClose}>×</button>
        </div>

        {cargandoCatalogos ? (
          <div className="registro-form" style={{ padding: '2rem' }}>
            <div className="loading-spinner">
              <div className="spinner"></div>
            </div>
          </div>
        ) : (
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
        )}
      </div>
    </div>
  );
};

export default RegistroPaciente;
