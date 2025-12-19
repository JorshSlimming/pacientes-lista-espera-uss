import React, { useState, useEffect } from 'react';
import { useAuth } from '../AuthContext';
import { Paciente, Seguimiento, Contacto } from '../types';
import { comunas, origenes, instituciones, especialidades, pacientes, seguimientos, contactos } from '../mockData';
import { validarRut, formatearRut, validarEmail, validarCelular } from '../utils';
import './NuevoPacienteForm.css';

interface Props {
  onSuccess: () => void;
}

// Validar formato dd/mm/yyyy
const validarFechaFormato = (fecha: string): boolean => {
  const regex = /^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[0-2])\/\d{4}$/;
  if (!regex.test(fecha)) return false;
  
  const [dia, mes, anio] = fecha.split('/').map(Number);
  const fechaObj = new Date(anio, mes - 1, dia);
  return fechaObj.getFullYear() === anio && 
         fechaObj.getMonth() === mes - 1 && 
         fechaObj.getDate() === dia;
};

// Convertir dd/mm/yyyy a yyyy-mm-dd
const convertirFechaAISO = (fecha: string): string => {
  const [dia, mes, anio] = fecha.split('/');
  return `${anio}-${mes}-${dia}`;
};

const NuevoPacienteForm: React.FC<Props> = ({ onSuccess }) => {
  const { usuario } = useAuth();
  
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

  const [especialidadesPrincipales, setEspecialidadesPrincipales] = useState<typeof especialidades>([]);
  const [subespecialidades1, setSubespecialidades1] = useState<typeof especialidades>([]);
  const [subespecialidades2, setSubespecialidades2] = useState<typeof especialidades>([]);
  
  const [errores, setErrores] = useState<Record<string, string>>({});
  const [guardando, setGuardando] = useState(false);
  const [mensaje, setMensaje] = useState('');
  const [datosYaCargados, setDatosYaCargados] = useState(false);

  useEffect(() => {
    setEspecialidadesPrincipales(especialidades.filter(e => e.nivel === 1));
  }, []);

  useEffect(() => {
    if (idEspecialidad) {
      const subs = especialidades.filter(e => e.parent_id === parseInt(idEspecialidad) && e.nivel === 2);
      setSubespecialidades1(subs);
      setIdSubespecialidad1('');
      setIdSubespecialidad2('');
      setSubespecialidades2([]);
    }
  }, [idEspecialidad]);

  useEffect(() => {
    if (idSubespecialidad1) {
      const subs = especialidades.filter(e => e.parent_id === parseInt(idSubespecialidad1) && e.nivel === 3);
      setSubespecialidades2(subs);
      setIdSubespecialidad2('');
    }
  }, [idSubespecialidad1]);

  // Función para cargar datos de un paciente existente
  const cargarDatosPacienteExistente = (rutPaciente: string) => {
    if (!datosYaCargados) {
      const pacienteExistente = pacientes.find(p => p.rut === rutPaciente);
      if (pacienteExistente) {
        setDatosYaCargados(true);
        // Cargar datos del paciente
        setNombre(pacienteExistente.nombre);
        setPrimerApellido(pacienteExistente.primer_apellido);
        setSegundoApellido(pacienteExistente.segundo_apellido);
        
        // Convertir fecha de yyyy-mm-dd a dd/mm/yyyy
        const [anio, mes, dia] = pacienteExistente.fecha_nacimiento.split('-');
        setFechaNacimiento(`${dia}/${mes}/${anio}`);
        
        setIdComuna(pacienteExistente.id_comuna.toString());
        
        // Cargar datos de contacto
        const contactoExistente = contactos.find(c => c.id === pacienteExistente.id_contacto);
        if (contactoExistente) {
          setCorreo(contactoExistente.correo);
          setDireccion(contactoExistente.direccion);
          setPrimerCelular(contactoExistente.primer_celular);
          setSegundoCelular(contactoExistente.segundo_celular);
        }
        
        // Cargar datos del seguimiento
        const seguimientoExistente = seguimientos.find(s => s.id_paciente === rutPaciente);
        if (seguimientoExistente) {
          setIdOrigen(seguimientoExistente.id_origen.toString());
          setIdInstitucion(seguimientoExistente.id_institucion_convenio?.toString() || '');
          setObs(seguimientoExistente.observaciones || '');
          
          // Cargar especialidad y sus padres
          const espActual = especialidades.find(e => e.id === seguimientoExistente.id_especialidad);
          if (espActual) {
            if (espActual.nivel === 1) {
              setIdEspecialidad(espActual.id.toString());
            } else if (espActual.nivel === 2) {
              setIdEspecialidad(espActual.parent_id?.toString() || '');
              setIdSubespecialidad1(espActual.id.toString());
            } else if (espActual.nivel === 3) {
              const subesp1 = especialidades.find(e => e.id === espActual.parent_id);
              if (subesp1) {
                setIdEspecialidad(subesp1.parent_id?.toString() || '');
                setIdSubespecialidad1(subesp1.id.toString());
                setIdSubespecialidad2(espActual.id.toString());
              }
            }
          }
        }
        
        setMensaje('Paciente existente cargado. Puede modificar los datos.');
        setTimeout(() => setMensaje(''), 4000);
      }
    }
  };

  const origenSeleccionado = origenes.find(o => o.id === parseInt(idOrigen));
  const requiereInstitucion = origenSeleccionado?.requiere_ci || false;

  const validarFormulario = (): boolean => {
    const nuevosErrores: Record<string, string> = {};

    if (!rut) {
      nuevosErrores.rut = 'RUT es obligatorio';
    } else if (!validarRut(rut)) {
      nuevosErrores.rut = 'RUT inválido';
    }

    if (!nombre) nuevosErrores.nombre = 'Nombre es obligatorio';
    if (!primerApellido) nuevosErrores.primerApellido = 'Primer apellido es obligatorio';
    if (!segundoApellido) nuevosErrores.segundoApellido = 'Segundo apellido es obligatorio';
    if (!fechaNacimiento) {
      nuevosErrores.fechaNacimiento = 'Fecha de nacimiento es obligatoria';
    } else if (!validarFechaFormato(fechaNacimiento)) {
      nuevosErrores.fechaNacimiento = 'Formato inválido. Use dd/mm/yyyy';
    }
    if (!direccion) nuevosErrores.direccion = 'Dirección es obligatoria';
    if (!idComuna) nuevosErrores.idComuna = 'Comuna es obligatoria';

    if (!correo) {
      nuevosErrores.correo = 'Correo es obligatorio';
    } else if (!validarEmail(correo)) {
      nuevosErrores.correo = 'Correo inválido';
    }

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

    if (!idOrigen) nuevosErrores.idOrigen = 'Origen es obligatorio';

    if (requiereInstitucion && !idInstitucion) {
      nuevosErrores.idInstitucion = 'Institución es obligatoria para este origen';
    }

    if (!idEspecialidad) nuevosErrores.idEspecialidad = 'Especialidad es obligatoria';
    if (!idSubespecialidad1) nuevosErrores.idSubespecialidad1 = 'Subespecialidad 1 es obligatoria';

    setErrores(nuevosErrores);
    return Object.keys(nuevosErrores).length === 0;
  };

  const limpiarFormulario = () => {
    setRut('');
    setNombre('');
    setPrimerApellido('');
    setSegundoApellido('');
    setFechaNacimiento('');
    setDireccion('');
    setIdComuna('');
    setCorreo('');
    setPrimerCelular('');
    setSegundoCelular('');
    setIdOrigen('');
    setIdInstitucion('');
    setIdEspecialidad('');
    setIdSubespecialidad1('');
    setIdSubespecialidad2('');
    setObs('');
    setErrores({});
    setDatosYaCargados(false);
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();

    if (!validarFormulario()) {
      setMensaje('Por favor complete todos los campos obligatorios correctamente');
      setTimeout(() => setMensaje(''), 3000);
      return;
    }

    setGuardando(true);

    setTimeout(() => {
      const nuevoContacto: Contacto = {
        id: contactos.length + 1,
        correo,
        direccion,
        primer_celular: primerCelular,
        segundo_celular: segundoCelular,
      };
      contactos.push(nuevoContacto);

      const nuevoPaciente: Paciente = {
        rut,
        nombre,
        primer_apellido: primerApellido,
        segundo_apellido: segundoApellido,
        fecha_nacimiento: convertirFechaAISO(fechaNacimiento),
        obs,
        id_comuna: parseInt(idComuna),
        id_origen: parseInt(idOrigen),
        id_institucion_convenio: idInstitucion ? parseInt(idInstitucion) : null,
        contacto: nuevoContacto,
      };
      pacientes.push(nuevoPaciente);

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
      setMensaje('¡Paciente registrado exitosamente!');
      limpiarFormulario();
      onSuccess();
      setTimeout(() => setMensaje(''), 3000);
    }, 500);
  };

  // Calcular edad a partir de fecha de nacimiento
  const calcularEdadReferencial = (fecha: string): number | null => {
    if (fecha.length !== 10 || !validarFechaFormato(fecha)) return null;
    const [dia, mes, anio] = fecha.split('/').map(Number);
    const fechaNac = new Date(anio, mes - 1, dia);
    const hoy = new Date();
    let edad = hoy.getFullYear() - fechaNac.getFullYear();
    const mesActual = hoy.getMonth();
    const diaActual = hoy.getDate();
    if (mesActual < mes - 1 || (mesActual === mes - 1 && diaActual < dia)) {
      edad--;
    }
    return edad;
  };

  // Auto-formatear fecha con /
  const formatearFechaInput = (valor: string): string => {
    const numeros = valor.replace(/\D/g, '');
    if (numeros.length <= 2) return numeros;
    if (numeros.length <= 4) return `${numeros.slice(0, 2)}/${numeros.slice(2)}`;
    return `${numeros.slice(0, 2)}/${numeros.slice(2, 4)}/${numeros.slice(4, 8)}`;
  };

  const edadReferencial = calcularEdadReferencial(fechaNacimiento);

  return (
    <div className="nuevo-paciente-form">
      {mensaje && (
        <div className={`mensaje ${mensaje.includes('exitosamente') ? 'mensaje-success' : 'mensaje-error'}`}>
          {mensaje}
        </div>
      )}

      <form onSubmit={handleSubmit} className="form-compacto">
        {/* Sección de Especialidad - Arriba */}
        <div className="seccion-especialidad">
          <div className="form-grid-3col">
            <div className="form-group-compact">
              <label>Especialidad <span className="required">*</span></label>
              <select value={idEspecialidad} onChange={(e) => setIdEspecialidad(e.target.value)}>
                <option value="">Seleccionar...</option>
                {[...especialidadesPrincipales].sort((a, b) => a.nombre.localeCompare(b.nombre)).map(e => (
                  <option key={e.id} value={e.id}>{e.nombre}</option>
                ))}
              </select>
              {errores.idEspecialidad && <span className="error">{errores.idEspecialidad}</span>}
            </div>

            {subespecialidades1.length > 0 && (
              <div className="form-group-compact">
                <label>Subespecialidad 1 <span className="required">*</span></label>
                <select value={idSubespecialidad1} onChange={(e) => setIdSubespecialidad1(e.target.value)}>
                  <option value="">Seleccionar...</option>
                  {[...subespecialidades1].sort((a, b) => a.nombre.localeCompare(b.nombre)).map(e => (
                    <option key={e.id} value={e.id}>{e.nombre}</option>
                  ))}
                </select>
                {errores.idSubespecialidad1 && <span className="error">{errores.idSubespecialidad1}</span>}
              </div>
            )}

            {subespecialidades2.length > 0 && (
              <div className="form-group-compact">
                <label>Subespecialidad 2</label>
                <select value={idSubespecialidad2} onChange={(e) => setIdSubespecialidad2(e.target.value)}>
                  <option value="">Seleccionar...</option>
                  {[...subespecialidades2].sort((a, b) => a.nombre.localeCompare(b.nombre)).map(e => (
                    <option key={e.id} value={e.id}>{e.nombre}</option>
                  ))}
                </select>
              </div>
            )}
          </div>
        </div>

        {/* Sección de Datos del Paciente */}
        <div className="seccion-datos-paciente">
          <h3 className="seccion-titulo">Datos del Paciente</h3>
          <div className="form-grid-3col">
            <div className="form-group-compact">
            <label>RUT <span className="required">*</span></label>
            <input
              type="text"
              value={rut}
              onChange={(e) => {
                const valor = e.target.value.replace(/[^0-9kK-]/g, '');
                setRut(valor);
                setDatosYaCargados(false); // Permitir cargar datos de otro RUT
                
                if (valor && valor.length > 1) {
                  if (!validarRut(valor)) {
                    setErrores(prev => ({ ...prev, rut: 'RUT inválido o dígito verificador incorrecto' }));
                  } else {
                    setErrores(prev => ({ ...prev, rut: '' }));
                  }
                }
              }}
              onBlur={(e) => {
                if (e.target.value && validarRut(e.target.value)) {
                  const rutFormateado = formatearRut(e.target.value);
                  setRut(rutFormateado);
                  cargarDatosPacienteExistente(rutFormateado);
                }
              }}
              placeholder="12345678-9"
            />
            {errores.rut && <span className="error">{errores.rut}</span>}
          </div>

          <div className="form-group-compact">
            <label>Nombre <span className="required">*</span></label>
            <input
              type="text"
              value={nombre}
              onChange={(e) => {
                const valor = e.target.value.replace(/[^a-zA-ZáéíóúÁÉÍÓÚñÑ\s]/g, '');
                setNombre(valor);
              }}
            />
            {errores.nombre && <span className="error">{errores.nombre}</span>}
          </div>

          <div className="form-group-compact">
            <label>Primer Apellido <span className="required">*</span></label>
            <input
              type="text"
              value={primerApellido}
              onChange={(e) => {
                const valor = e.target.value.replace(/[^a-zA-ZáéíóúÁÉÍÓÚñÑ\s]/g, '');
                setPrimerApellido(valor);
              }}
            />
            {errores.primerApellido && <span className="error">{errores.primerApellido}</span>}
          </div>

          <div className="form-group-compact">
            <label>Segundo Apellido <span className="required">*</span></label>
            <input
              type="text"
              value={segundoApellido}
              onChange={(e) => {
                const valor = e.target.value.replace(/[^a-zA-ZáéíóúÁÉÍÓÚñÑ\s]/g, '');
                setSegundoApellido(valor);
              }}
            />
            {errores.segundoApellido && <span className="error">{errores.segundoApellido}</span>}
          </div>

          <div className="form-group-compact">
            <label>Fecha de Nacimiento <span className="required">*</span></label>
            <div className="input-con-edad">
              <input
                type="text"
                value={fechaNacimiento}
                onChange={(e) => setFechaNacimiento(formatearFechaInput(e.target.value))}
                placeholder="dd/mm/yyyy"
                maxLength={10}
                className="input-fecha"
              />
              {edadReferencial !== null && (
                <span className="edad-dentro-input">Edad: {edadReferencial}</span>
              )}
            </div>
            {errores.fechaNacimiento && <span className="error">{errores.fechaNacimiento}</span>}
          </div>

          <div className="form-group-compact">
            <label>Comuna <span className="required">*</span></label>
            <select value={idComuna} onChange={(e) => setIdComuna(e.target.value)}>
              <option value="">Seleccionar...</option>
              {[...comunas].sort((a, b) => a.nombre.localeCompare(b.nombre)).map(c => (
                <option key={c.id} value={c.id}>{c.nombre}</option>
              ))}
            </select>
            {errores.idComuna && <span className="error">{errores.idComuna}</span>}
          </div>

          <div className="form-group-compact">
            <label>Dirección <span className="required">*</span></label>
            <input
              type="text"
              value={direccion}
              onChange={(e) => setDireccion(e.target.value)}
              placeholder="Calle, número"
            />
            {errores.direccion && <span className="error">{errores.direccion}</span>}
          </div>

          <div className="form-group-compact">
            <label>Correo <span className="required">*</span></label>
            <input
              type="email"
              value={correo}
              onChange={(e) => {
                setCorreo(e.target.value);
                if (e.target.value && !validarEmail(e.target.value)) {
                  setErrores(prev => ({ ...prev, correo: 'Formato de correo inválido' }));
                } else {
                  setErrores(prev => ({ ...prev, correo: '' }));
                }
              }}
              placeholder="ejemplo@email.com"
            />
            {errores.correo && <span className="error">{errores.correo}</span>}
          </div>

          <div className="form-group-compact">
            <label>Celular 1 <span className="required">*</span></label>
            <input
              type="text"
              value={primerCelular}
              onChange={(e) => {
                const valor = e.target.value.replace(/\D/g, '').slice(0, 9);
                setPrimerCelular(valor);
                if (valor && valor.length !== 9) {
                  setErrores(prev => ({ ...prev, primerCelular: 'Debe tener exactamente 9 dígitos' }));
                } else {
                  setErrores(prev => ({ ...prev, primerCelular: '' }));
                }
              }}
              placeholder="987654321"
              maxLength={9}
            />
            {errores.primerCelular && <span className="error">{errores.primerCelular}</span>}
          </div>

          <div className="form-group-compact">
            <label>Celular 2 <span className="required">*</span></label>
            <input
              type="text"
              value={segundoCelular}
              onChange={(e) => {
                const valor = e.target.value.replace(/\D/g, '').slice(0, 9);
                setSegundoCelular(valor);
                if (valor && valor.length !== 9) {
                  setErrores(prev => ({ ...prev, segundoCelular: 'Debe tener exactamente 9 dígitos' }));
                } else {
                  setErrores(prev => ({ ...prev, segundoCelular: '' }));
                }
              }}
              placeholder="912345678"
              maxLength={9}
            />
            {errores.segundoCelular && <span className="error">{errores.segundoCelular}</span>}
          </div>

          <div className="form-group-compact">
            <label>Origen <span className="required">*</span></label>
            <select value={idOrigen} onChange={(e) => setIdOrigen(e.target.value)}>
              <option value="">Seleccionar...</option>
              {[...origenes].sort((a, b) => a.nombre.localeCompare(b.nombre)).map(o => (
                <option key={o.id} value={o.id}>{o.nombre}</option>
              ))}
            </select>
            {errores.idOrigen && <span className="error">{errores.idOrigen}</span>}
          </div>

          {requiereInstitucion && (
            <div className="form-group-compact">
              <label>Institución/Convenio <span className="required">*</span></label>
              <select value={idInstitucion} onChange={(e) => setIdInstitucion(e.target.value)}>
                <option value="">Seleccionar...</option>
                {[...instituciones].sort((a, b) => a.nombre.localeCompare(b.nombre)).map(i => (
                  <option key={i.id} value={i.id}>{i.nombre}</option>
                ))}
              </select>
              {errores.idInstitucion && <span className="error">{errores.idInstitucion}</span>}
            </div>
          )}
          </div>

          {/* Campo de observaciones al final, fuera del grid */}
          <div className="form-group-compact observaciones-final">
            <label>Observaciones</label>
            <textarea
              value={obs}
              onChange={(e) => setObs(e.target.value)}
              rows={3}
              placeholder="Información adicional..."
            />
          </div>
        </div>

        <div className="form-actions-inline">
          <button type="button" onClick={limpiarFormulario} className="btn-secondary">
            Limpiar Formulario
          </button>
          <button type="submit" className="btn-primary" disabled={guardando}>
            {guardando ? 'Guardando...' : 'Registrar Paciente'}
          </button>
        </div>
      </form>
    </div>
  );
};

export default NuevoPacienteForm;
