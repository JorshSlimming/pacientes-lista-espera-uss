import React, { useState, useEffect } from 'react';
import { pacientesService } from '../api';
import { catalogosService } from '../api/catalogos.service';
import { Especialidad, Comuna, Origen, Institucion } from '../types';
import { validarRut, validarFormatoRut, formatearRut, validarEmail, validarCelular, limpiarRut } from '../utils';
import Toast from './Toast';
import './NuevoPacienteForm.css';

interface Props {
  onSuccess: () => void;
}

// Validar formato dd/mm/yyyy y rango de fechas
const validarFechaFormato = (fecha: string): boolean => {
  const regex = /^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[0-2])\/\d{4}$/;
  if (!regex.test(fecha)) return false;
  
  const [dia, mes, anio] = fecha.split('/').map(Number);
  
  // Validar rango de años
  if (anio < 1800 || anio > 2100) return false;
  
  const fechaObj = new Date(anio, mes - 1, dia);
  return fechaObj.getFullYear() === anio && 
         fechaObj.getMonth() === mes - 1 && 
         fechaObj.getDate() === dia;
};

// Convertir dd/mm/yyyy a yyyy-mm-dd
const convertirFechaAISO = (fecha: string): string => {
  const [dia, mes, anio] = fecha.split('/');
  return `${anio}-${mes.padStart(2, '0')}-${dia.padStart(2, '0')}`;
};

const NuevoPacienteForm: React.FC<Props> = ({ onSuccess }) => {
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

  const [especialidades, setEspecialidades] = useState<Especialidad[]>([]);
  const [comunas, setComunas] = useState<Comuna[]>([]);
  const [origenes, setOrigenes] = useState<Origen[]>([]);
  const [instituciones, setInstituciones] = useState<Institucion[]>([]);
  const [especialidadesPrincipales, setEspecialidadesPrincipales] = useState<Especialidad[]>([]);
  const [subespecialidades1, setSubespecialidades1] = useState<Especialidad[]>([]);
  const [subespecialidades2, setSubespecialidades2] = useState<Especialidad[]>([]);
  
  const [errores, setErrores] = useState<Record<string, string>>({});
  const [guardando, setGuardando] = useState(false);
  const [mensaje, setMensaje] = useState('');
  const [mensajeRutExistente, setMensajeRutExistente] = useState('');
  const [datosYaCargados, setDatosYaCargados] = useState(false);
  const [cargandoCatalogos, setCargandoCatalogos] = useState(true);

  // Cargar catálogos al montar
  useEffect(() => {
    const cargarCatalogos = async () => {
      setCargandoCatalogos(true);
      try {
        // Usar el endpoint que obtiene todos los catálogos de una vez
        const { data, error } = await catalogosService.obtenerDatosAutocompletar();
        
        if (error) {
          console.error('Error cargando catálogos:', error);
          setMensaje('Error al cargar catálogos. Por favor recargue la página.');
        } else if (data) {
          setEspecialidades(data.especialidades || []);
          setComunas(data.comunas || []);
          setOrigenes(data.origenes || []);
          setInstituciones(data.instituciones || []);
        }
      } catch (error) {
        console.error('Error al cargar catálogos:', error);
        setMensaje('Error al cargar catálogos. Por favor recargue la página.');
      } finally {
        setCargandoCatalogos(false);
      }
    };
    cargarCatalogos();
  }, []);

  useEffect(() => {
    if (especialidades.length > 0) {
      setEspecialidadesPrincipales(especialidades.filter(e => e.nivel === 1 && !e.archivado));
    }
  }, [especialidades]);

  useEffect(() => {
    if (idEspecialidad && especialidades.length > 0) {
      const idEsp = parseInt(idEspecialidad);
      const subs = especialidades.filter(e => {
        const parentId = e.parent_id;
        return parentId === idEsp && e.nivel === 2 && !e.archivado;
      });
      setSubespecialidades1(subs);
      setIdSubespecialidad1('');
      setIdSubespecialidad2('');
      setSubespecialidades2([]);
    }
  }, [idEspecialidad, especialidades]);

  useEffect(() => {
    if (idSubespecialidad1 && especialidades.length > 0) {
      const idSub1 = parseInt(idSubespecialidad1);
      const subs = especialidades.filter(e => {
        const parentId = e.parent_id;
        return parentId === idSub1 && e.nivel === 3 && !e.archivado;
      });
      setSubespecialidades2(subs);
      setIdSubespecialidad2('');
    }
  }, [idSubespecialidad1, especialidades]);

  // Función para cargar datos de un paciente existente
  const cargarDatosPacienteExistente = async (rutPaciente: string) => {
    if (!datosYaCargados) {
      const rutLimpio = limpiarRut(rutPaciente);
      const { data: pacienteExistente } = await pacientesService.buscarPorRut(rutLimpio);
      
      if (pacienteExistente) {
        setDatosYaCargados(true);
        setMensajeRutExistente('✓ Paciente existente. Puede registrar una nueva especialidad o actualizar datos.');
        // Cargar datos del paciente
        setNombre(pacienteExistente.nombre);
        setPrimerApellido(pacienteExistente.primer_apellido);
        setSegundoApellido(pacienteExistente.segundo_apellido);
        
        // Convertir fecha de yyyy-mm-dd a dd/mm/yyyy
        if (pacienteExistente.fecha_nacimiento) {
          const [anio, mes, dia] = pacienteExistente.fecha_nacimiento.split('-');
          setFechaNacimiento(`${dia}/${mes}/${anio}`);
        }
        
        if (pacienteExistente.id_comuna) setIdComuna(pacienteExistente.id_comuna.toString());
        
        // Cargar datos de contacto desde el objeto contacto
        if (pacienteExistente.contacto?.correo) setCorreo(pacienteExistente.contacto.correo);
        if (pacienteExistente.contacto?.direccion) setDireccion(pacienteExistente.contacto.direccion);
        if (pacienteExistente.contacto?.primer_celular) setPrimerCelular(pacienteExistente.contacto.primer_celular);
        if (pacienteExistente.contacto?.segundo_celular) setSegundoCelular(pacienteExistente.contacto.segundo_celular);
        
        // Cargar datos del paciente (origen e institución están en el objeto paciente)
        if (pacienteExistente.id_origen) setIdOrigen(pacienteExistente.id_origen.toString());
        if (pacienteExistente.id_institucion_convenio) setIdInstitucion(pacienteExistente.id_institucion_convenio.toString());
        if (pacienteExistente.obs) setObs(pacienteExistente.obs);
        
        // Cargar especialidad y sus padres desde el objeto especialidad
        if (pacienteExistente.especialidad?.id && especialidades.length > 0) {
          const espActual = especialidades.find(e => e.id === pacienteExistente.especialidad?.id);
          if (espActual) {
            if (espActual.nivel === 1) {
              setIdEspecialidad(espActual.id?.toString() || '');
            } else if (espActual.nivel === 2) {
              setIdEspecialidad(espActual.parent_id?.toString() || '');
              setIdSubespecialidad1(espActual.id?.toString() || '');
            } else if (espActual.nivel === 3) {
              const subesp1 = especialidades.find(e => e.id === espActual.parent_id);
              if (subesp1) {
                setIdEspecialidad(subesp1.parent_id?.toString() || '');
                setIdSubespecialidad1(subesp1.id?.toString() || '');
                setIdSubespecialidad2(espActual.id?.toString() || '');
              }
            }
          }
        }
        
        setMensajeRutExistente('✓ Paciente existente. Puede registrar una nueva especialidad o actualizar datos.');
        setTimeout(() => setMensajeRutExistente(''), 6000);
      }
    }
  };

  const origenSeleccionado = origenes.find(o => {
    const id = o.id_origen || o.id;
    return id === parseInt(idOrigen);
  });
  const requiereInstitucion = origenSeleccionado?.requiere_ci || false;

  const validarFormulario = (): boolean => {
    const nuevosErrores: Record<string, string> = {};

    if (!rut) {
      nuevosErrores.rut = 'RUT es obligatorio';
    } else if (!validarFormatoRut(rut)) {
      nuevosErrores.rut = 'Formato inválido. Use: numero-digito (ej: 12345678-9)';
    } else if (!validarRut(rut)) {
      nuevosErrores.rut = 'Dígito verificador incorrecto';
    }

    if (!nombre) nuevosErrores.nombre = 'Nombre es obligatorio';
    if (!primerApellido) nuevosErrores.primerApellido = 'Primer apellido es obligatorio';
    if (!segundoApellido) nuevosErrores.segundoApellido = 'Segundo apellido es obligatorio';
    if (!fechaNacimiento) {
      nuevosErrores.fechaNacimiento = 'Fecha de nacimiento es obligatoria';
    } else if (!validarFechaFormato(fechaNacimiento)) {
      nuevosErrores.fechaNacimiento = 'Formato inválido. Use dd/mm/yyyy (año entre 1800-2100)';
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

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!validarFormulario()) {
      setMensaje('Por favor complete todos los campos obligatorios correctamente');
      setTimeout(() => setMensaje(''), 3000);
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
      fecha_nacimiento: convertirFechaAISO(fechaNacimiento),
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

    const { data, error } = await pacientesService.crearPaciente(datosNuevoPaciente);

    setGuardando(false);

    if (error || !data) {
      setMensaje(error || 'Error al crear paciente');
      setTimeout(() => setMensaje(''), 4000);
    } else {
      // Mostrar mensaje de éxito sin refresh
      const mensajeExito = data.message || '✅ Paciente registrado exitosamente';
      setMensaje(mensajeExito);
      limpiarFormulario();
      setTimeout(() => {
        setMensaje('');
        onSuccess(); // Llamar onSuccess después de mostrar el mensaje
      }, 3000);
    }
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

  if (cargandoCatalogos) {
    return (
      <div className="nuevo-paciente-form">
        <div className="loading-spinner">
          <div className="spinner"></div>
        </div>
      </div>
    );
  }

  return (
    <div className="nuevo-paciente-form">
      <form onSubmit={handleSubmit} className="form-compacto">
        {/* No mostrar mensaje de paciente existente aquí */}

        {/* Sección de Especialidad - Arriba */}
        <div className="seccion-especialidad">
          <div className="form-grid-3col">
            <div className="form-group-compact">
              <label>Especialidad <span className="required">*</span></label>
              <select value={idEspecialidad} onChange={(e) => setIdEspecialidad(e.target.value)}>
                <option value="">Seleccionar...</option>
                {[...especialidadesPrincipales].sort((a, b) => a.nombre.localeCompare(b.nombre)).map(e => (
                  <option key={e.id_especialidad || e.id} value={e.id_especialidad || e.id}>{e.nombre}</option>
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
                    <option key={e.id_especialidad || e.id} value={e.id_especialidad || e.id}>{e.nombre}</option>
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
                    <option key={e.id_especialidad || e.id} value={e.id_especialidad || e.id}>{e.nombre}</option>
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
                setDatosYaCargados(false);
                setMensajeRutExistente('');
                
                if (valor && valor.length > 1) {
                  if (!validarFormatoRut(valor)) {
                    setErrores(prev => ({ ...prev, rut: 'Use formato: numero-digito (ej: 12345678-9)' }));
                  } else if (!validarRut(valor)) {
                    setErrores(prev => ({ ...prev, rut: 'Dígito verificador incorrecto' }));
                  } else {
                    setErrores(prev => ({ ...prev, rut: '' }));
                  }
                }
              }}
              onBlur={(e) => {
                if (e.target.value && validarFormatoRut(e.target.value) && validarRut(e.target.value)) {
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
                <option key={c.id_comuna || c.id} value={c.id_comuna || c.id}>{c.nombre}</option>
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
                <option key={o.id_origen || o.id} value={o.id_origen || o.id}>{o.nombre}</option>
              ))}
            </select>
            {errores.idOrigen && <span className="error">{errores.idOrigen}</span>}
          </div>

          {requiereInstitucion && (
            <div className="form-group-compact">
              <label>Institución/Convenio <span className="required">*</span></label>
              <select value={idInstitucion} onChange={(e) => setIdInstitucion(e.target.value)}>
                <option value="">Seleccionar...</option>
                {[...instituciones].sort((a, b) => a.nombre.localeCompare(b.nombre)).map((i, index) => (
                  <option key={i.id_institucion_convenio || i.id_institucion || i.id || `inst-${index}`} value={i.id_institucion_convenio || i.id_institucion || i.id}>{i.nombre}</option>
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

      {/* Toast de notificaciones */}
      {mensaje && (
        <Toast 
          message={mensaje} 
          type={mensaje.includes('Error') || mensaje.includes('error') ? 'error' : mensaje.includes('complete todos los campos') ? 'warning' : 'success'} 
          onClose={() => setMensaje('')} 
        />
      )}
      
      {/* Toast para paciente existente */}
      {mensajeRutExistente && (
        <Toast 
          message={mensajeRutExistente} 
          type="info" 
          onClose={() => setMensajeRutExistente('')} 
        />
      )}
    </div>
  );
};

export default NuevoPacienteForm;
