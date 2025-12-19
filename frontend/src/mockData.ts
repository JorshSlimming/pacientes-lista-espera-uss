import { Trabajador, Comuna, Origen, InstitucionConvenio, Especialidad, Paciente, Seguimiento, Auditoria, Contacto } from './types';

// Trabajadores del sistema (ANEXO F)
export const trabajadores: Trabajador[] = [
  { rut: '23456789-0', rol: 'jefe', nombre: 'María', apellido: 'Pérez', clave: 'jefe123' },
  { rut: '34567890-1', rol: 'usuario', nombre: 'Juan', apellido: 'González', clave: 'user123' },
  { rut: '11111111-1', rol: 'usuario', nombre: 'Maricel', apellido: 'Fierro', clave: 'user123' },
  { rut: '22222222-2', rol: 'usuario', nombre: 'Jazmin', apellido: 'Alanes', clave: 'user123' },
  { rut: '33333333-3', rol: 'usuario', nombre: 'Veronica', apellido: 'Cifuentes', clave: 'user123' },
  { rut: '44444444-4', rol: 'usuario', nombre: 'Fernanda', apellido: 'Morales', clave: 'user123' },
  { rut: '55555555-5', rol: 'usuario', nombre: 'Ynsira', apellido: 'Gajardo', clave: 'user123' },
  { rut: '66666666-6', rol: 'usuario', nombre: 'Marta Elena', apellido: 'Muñoz', clave: 'user123' },
  { rut: '77777777-7', rol: 'usuario', nombre: 'Carla', apellido: 'Sanchez', clave: 'user123' },
  { rut: '88888888-8', rol: 'usuario', nombre: 'Alejandra', apellido: 'Leiva', clave: 'user123' },
  { rut: '99999999-9', rol: 'usuario', nombre: 'Maria', apellido: 'Contreras', clave: 'user123' },
];

// 33 Comunas de la Provincia de Concepción (ANEXO C)
export const comunas: Comuna[] = [
  { id: 1, nombre: 'Arauco' },
  { id: 2, nombre: 'Cañete' },
  { id: 3, nombre: 'Contulmo' },
  { id: 4, nombre: 'Curanilahue' },
  { id: 5, nombre: 'Lebu' },
  { id: 6, nombre: 'Los Alamos' },
  { id: 7, nombre: 'Tirua' },
  { id: 8, nombre: 'Alto Bíobio' },
  { id: 9, nombre: 'Antuco' },
  { id: 10, nombre: 'Cabrero' },
  { id: 11, nombre: 'Laja' },
  { id: 12, nombre: 'Los Ángeles' },
  { id: 13, nombre: 'Mulchen' },
  { id: 14, nombre: 'Nacimiento' },
  { id: 15, nombre: 'Negrete' },
  { id: 16, nombre: 'Quilaco' },
  { id: 17, nombre: 'Quilleco' },
  { id: 18, nombre: 'San Rosendo' },
  { id: 19, nombre: 'Santa Bárbara' },
  { id: 20, nombre: 'Tucapel' },
  { id: 21, nombre: 'Yumbel' },
  { id: 22, nombre: 'Concepción' },
  { id: 23, nombre: 'Coronel' },
  { id: 24, nombre: 'Chiguayante' },
  { id: 25, nombre: 'Florida' },
  { id: 26, nombre: 'Hualpen' },
  { id: 27, nombre: 'Hualqui' },
  { id: 28, nombre: 'Lota' },
  { id: 29, nombre: 'Penco' },
  { id: 30, nombre: 'San Pedro de la Paz' },
  { id: 31, nombre: 'Santa Juana' },
  { id: 32, nombre: 'Talcahuano' },
  { id: 33, nombre: 'Tomé' },
];

// Orígenes (ANEXO D)
export const origenes: Origen[] = [
  { id: 1, nombre: 'Espontaneo', requiere_ci: false },
  { id: 2, nombre: 'Operativo', requiere_ci: true },
  { id: 3, nombre: 'Campaña', requiere_ci: true },
  { id: 4, nombre: 'Convenio', requiere_ci: false },
  { id: 5, nombre: 'Otros', requiere_ci: false },
];

// Instituciones y Convenios (ANEXO E)
export const instituciones: InstitucionConvenio[] = [
  { id: 1, tipo: 'institucion', nombre: 'DOCENCIA ASISTENCIAL' },
  { id: 2, tipo: 'institucion', nombre: 'SODIMAC. S.A.' },
  { id: 3, tipo: 'institucion', nombre: 'BBOSCH' },
  { id: 4, tipo: 'institucion', nombre: 'COMUNIDAD USS' },
  { id: 5, tipo: 'institucion', nombre: 'CLUB SOCIAL COLO COLO' },
  { id: 6, tipo: 'institucion', nombre: 'JENABIEN PDI' },
  { id: 7, tipo: 'institucion', nombre: 'PARTICULAR' },
  { id: 8, tipo: 'institucion', nombre: 'HOSPITAL DE LOTA' },
  { id: 9, tipo: 'institucion', nombre: 'FUNDACION RED MIGRANTES' },
  { id: 10, tipo: 'institucion', nombre: 'JUNAEB' },
  { id: 11, tipo: 'institucion', nombre: 'COEMCO' },
  { id: 12, tipo: 'convenio', nombre: 'Copago Fonasa' },
  { id: 13, tipo: 'institucion', nombre: 'DEPORTISTAS USS' },
  { id: 14, tipo: 'institucion', nombre: 'AFAEB-JUNAEB' },
  { id: 15, tipo: 'institucion', nombre: 'SOMOS TAB' },
  { id: 16, tipo: 'institucion', nombre: 'CORAPEHI' },
  { id: 17, tipo: 'institucion', nombre: 'FUNDACION HONRA' },
  { id: 18, tipo: 'institucion', nombre: 'RED COLABORATIVA' },
  { id: 19, tipo: 'institucion', nombre: 'XFRAGIL' },
  { id: 20, tipo: 'institucion', nombre: 'DOWN UP' },
  { id: 21, tipo: 'institucion', nombre: 'SERNAMEG' },
  { id: 22, tipo: 'institucion', nombre: 'CLUB DEPORTIVO UDC' },
  { id: 23, tipo: 'institucion', nombre: 'BOMBEROS CHILE' },
  { id: 24, tipo: 'institucion', nombre: 'LICEO JORGE SANCHEZ UGARTE' },
  { id: 25, tipo: 'institucion', nombre: 'COLEGIO PROFESORES CORONEL' },
  { id: 26, tipo: 'institucion', nombre: 'BIENESTAR DE CARABINEROS' },
  { id: 27, tipo: 'institucion', nombre: 'SINDICATO RIPLEY' },
  { id: 28, tipo: 'institucion', nombre: 'ARAMARK' },
  { id: 29, tipo: 'institucion', nombre: 'GENDARMERIA' },
];

// Especialidades jerárquicas según ANEXO B (nivel 1 = Especialidad, nivel 2 = Subespecialidad 1, nivel 3 = Subespecialidad 2)
export const especialidades: Especialidad[] = [
  // NIVEL 1: Especialidades
  { id: 1, nombre: 'Medicina', parent_id: null, nivel: 1 },
  { id: 2, nombre: 'Odontología', parent_id: null, nivel: 1 },
  
  // NIVEL 2: Subespecialidades Nivel 1 - Para Medicina
  { id: 3, nombre: 'Medicina General', parent_id: 1, nivel: 2 },
  { id: 4, nombre: 'Dermatología', parent_id: 1, nivel: 2 },
  { id: 5, nombre: 'Neurología Adulto', parent_id: 1, nivel: 2 },
  { id: 6, nombre: 'Neurología Pediátrica', parent_id: 1, nivel: 2 },
  { id: 7, nombre: 'Otorrinolaringología', parent_id: 1, nivel: 2 },
  { id: 8, nombre: 'Ginecología', parent_id: 1, nivel: 2 },
  { id: 9, nombre: 'Pediatría', parent_id: 1, nivel: 2 },
  { id: 10, nombre: 'Psiquiatría', parent_id: 1, nivel: 2 },
  { id: 11, nombre: 'Oftalmología', parent_id: 1, nivel: 2 },
  { id: 12, nombre: 'Fonoaudiología', parent_id: 1, nivel: 2 },
  { id: 13, nombre: 'TM.Oftalmología', parent_id: 1, nivel: 2 },
  { id: 14, nombre: 'T.Ocupacional', parent_id: 1, nivel: 2 },
  { id: 15, nombre: 'Kinesiología', parent_id: 1, nivel: 2 },
  
  // NIVEL 2: Subespecialidades Nivel 1 - Para Odontología
  { id: 16, nombre: 'O.General', parent_id: 2, nivel: 2 },
  { id: 17, nombre: 'O.Especialidades', parent_id: 2, nivel: 2 },
  
  // NIVEL 3: Subespecialidades Nivel 2 - Para Fonoaudiología
  { id: 18, nombre: 'Audición', parent_id: 12, nivel: 3 },
  { id: 19, nombre: 'Voz', parent_id: 12, nivel: 3 },
  { id: 20, nombre: 'Infantil', parent_id: 12, nivel: 3 },
  
  // NIVEL 3: Subespecialidades Nivel 2 - Para TM.Oftalmología
  { id: 21, nombre: 'Glaucoma', parent_id: 13, nivel: 3 },
  { id: 22, nombre: 'Refracción', parent_id: 13, nivel: 3 },
  { id: 23, nombre: 'Estrabismo', parent_id: 13, nivel: 3 },
  { id: 24, nombre: 'Evaluación', parent_id: 13, nivel: 3 },
  
  // NIVEL 3: Subespecialidades Nivel 2 - Para T.Ocupacional
  { id: 25, nombre: 'Adulto', parent_id: 14, nivel: 3 },
  { id: 26, nombre: 'Infantil', parent_id: 14, nivel: 3 },
  { id: 27, nombre: 'Psicosocial', parent_id: 14, nivel: 3 },
  
  // NIVEL 3: Subespecialidades Nivel 2 - Para Kinesiología
  { id: 28, nombre: 'Musculoesquelética', parent_id: 15, nivel: 3 },
  { id: 29, nombre: 'Neurorehabilitación', parent_id: 15, nivel: 3 },
  { id: 30, nombre: 'Cardiometabólico', parent_id: 15, nivel: 3 },
  
  // NIVEL 3: Subespecialidades Nivel 2 - Para O.General
  { id: 31, nombre: 'Adulto', parent_id: 16, nivel: 3 },
  { id: 32, nombre: 'Pediátrica', parent_id: 16, nivel: 3 },
  
  // NIVEL 3: Subespecialidades Nivel 2 - Para O.Especialidades
  { id: 33, nombre: 'Endodoncia', parent_id: 17, nivel: 3 },
  { id: 34, nombre: 'Ortodoncia', parent_id: 17, nivel: 3 },
  { id: 35, nombre: 'Rehabilitación Oral', parent_id: 17, nivel: 3 },
  { id: 36, nombre: 'Estética Orofacial', parent_id: 17, nivel: 3 },
  { id: 37, nombre: 'Implantología', parent_id: 17, nivel: 3 },
];

// Contactos
export const contactos: Contacto[] = [
  { id: 1, correo: 'juan.perez@email.com', direccion: 'Av. O\'Higgins 1234', primer_celular: '987654321', segundo_celular: '912345678' },
  { id: 2, correo: 'maria.gonzalez@email.com', direccion: 'Calle Freire 567', primer_celular: '923456789', segundo_celular: '987654322' },
  { id: 3, correo: 'pedro.sanchez@email.com', direccion: 'Pasaje Los Aromos 89', primer_celular: '934567890', segundo_celular: '987654323' },
  { id: 4, correo: 'ana.martinez@email.com', direccion: 'Av. Libertad 456', primer_celular: '945678901', segundo_celular: '987654324' },
  { id: 5, correo: 'carlos.lopez@email.com', direccion: 'Calle Rosas 234', primer_celular: '956789012', segundo_celular: '987654325' },
  { id: 6, correo: 'lucia.fernandez@email.com', direccion: 'Av. Collao 789', primer_celular: '967890123', segundo_celular: '987654326' },
  { id: 7, correo: 'roberto.diaz@email.com', direccion: 'Calle Lautaro 123', primer_celular: '978901234', segundo_celular: '987654327' },
  { id: 8, correo: 'carla.rojas@email.com', direccion: 'Av. Pedro de Valdivia 890', primer_celular: '989012345', segundo_celular: '987654328' },
  { id: 9, correo: 'diego.castro@email.com', direccion: 'Pasaje Chacabuco 345', primer_celular: '990123456', segundo_celular: '987654329' },
  { id: 10, correo: 'sofia.torres@email.com', direccion: 'Calle Barros Arana 678', primer_celular: '991234567', segundo_celular: '987654330' },
  { id: 11, correo: 'andres.vargas@email.com', direccion: 'Av. Paicaví 901', primer_celular: '992345678', segundo_celular: '987654331' },
  { id: 12, correo: 'valentina.reyes@email.com', direccion: 'Calle Caupolicán 234', primer_celular: '993456789', segundo_celular: '987654332' },
  { id: 13, correo: 'felipe.soto@email.com', direccion: 'Av. Arturo Prat 567', primer_celular: '994567890', segundo_celular: '987654333' },
  { id: 14, correo: 'camila.morales@email.com', direccion: 'Pasaje Cochrane 123', primer_celular: '995678901', segundo_celular: '987654334' },
  { id: 15, correo: 'manuel.herrera@email.com', direccion: 'Calle Anibal Pinto 456', primer_celular: '996789012', segundo_celular: '987654335' },
  { id: 16, correo: 'ricardo.molina@email.com', direccion: 'Av. Collao 891', primer_celular: '945678123', segundo_celular: '978123456' },
];

// Pacientes simulados
export const pacientes: Paciente[] = [
  {
    rut: '11111111-1',
    nombre: 'Juan Carlos',
    primer_apellido: 'Pérez',
    segundo_apellido: 'López',
    fecha_nacimiento: '1985-03-15',
    obs: '',
    id_comuna: 1,
    id_origen: 1,
    id_institucion_convenio: 6,
    contacto: contactos[0],
  },
  {
    rut: '22222222-2',
    nombre: 'María Elena',
    primer_apellido: 'González',
    segundo_apellido: 'Ramírez',
    fecha_nacimiento: '1990-07-22',
    obs: '',
    id_comuna: 2,
    id_origen: 2,
    id_institucion_convenio: 1,
    contacto: contactos[1],
  },
  {
    rut: '33333333-3',
    nombre: 'Pedro Antonio',
    primer_apellido: 'Sánchez',
    segundo_apellido: 'Flores',
    fecha_nacimiento: '1978-11-08',
    obs: 'Paciente con urgencia médica',
    id_comuna: 1,
    id_origen: 3,
    id_institucion_convenio: 7,
    contacto: contactos[2],
  },
  {
    rut: '44444444-4',
    nombre: 'Ana María',
    primer_apellido: 'Martínez',
    segundo_apellido: 'Silva',
    fecha_nacimiento: '1995-02-14',
    obs: '',
    id_comuna: 4,
    id_origen: 1,
    id_institucion_convenio: 2,
    contacto: contactos[3],
  },
  {
    rut: '55555555-5',
    nombre: 'Carlos Eduardo',
    primer_apellido: 'López',
    segundo_apellido: 'Muñoz',
    fecha_nacimiento: '1982-09-30',
    obs: '',
    id_comuna: 3,
    id_origen: 4,
    id_institucion_convenio: 10,
    contacto: contactos[4],
  },
  {
    rut: '66666666-6',
    nombre: 'Lucía Fernanda',
    primer_apellido: 'Fernández',
    segundo_apellido: 'Carrasco',
    fecha_nacimiento: '1988-05-19',
    obs: '',
    id_comuna: 5,
    id_origen: 2,
    id_institucion_convenio: 3,
    contacto: contactos[5],
  },
  {
    rut: '77777777-7',
    nombre: 'Roberto Miguel',
    primer_apellido: 'Díaz',
    segundo_apellido: 'Vega',
    fecha_nacimiento: '1975-12-03',
    obs: 'Tratamiento de seguimiento',
    id_comuna: 2,
    id_origen: 1,
    id_institucion_convenio: 6,
    contacto: contactos[6],
  },
  {
    rut: '88888888-8',
    nombre: 'Carla Andrea',
    primer_apellido: 'Rojas',
    segundo_apellido: 'Pizarro',
    fecha_nacimiento: '1992-08-27',
    obs: '',
    id_comuna: 1,
    id_origen: 5,
    id_institucion_convenio: 11,
    contacto: contactos[7],
  },
  {
    rut: '99999999-9',
    nombre: 'Diego Andrés',
    primer_apellido: 'Castro',
    segundo_apellido: 'Bravo',
    fecha_nacimiento: '1980-01-17',
    obs: '',
    id_comuna: 6,
    id_origen: 2,
    id_institucion_convenio: 4,
    contacto: contactos[8],
  },
  {
    rut: '10101010-1',
    nombre: 'Sofía Alejandra',
    primer_apellido: 'Torres',
    segundo_apellido: 'Núñez',
    fecha_nacimiento: '1998-04-12',
    obs: '',
    id_comuna: 3,
    id_origen: 1,
    id_institucion_convenio: 5,
    contacto: contactos[9],
  },
  {
    rut: '20202020-2',
    nombre: 'Andrés Felipe',
    primer_apellido: 'Vargas',
    segundo_apellido: 'Campos',
    fecha_nacimiento: '1987-10-25',
    obs: 'Requiere exámenes previos',
    id_comuna: 7,
    id_origen: 3,
    id_institucion_convenio: 7,
    contacto: contactos[10],
  },
  {
    rut: '30303030-3',
    nombre: 'Valentina Isabel',
    primer_apellido: 'Reyes',
    segundo_apellido: 'Moreno',
    fecha_nacimiento: '1993-06-08',
    obs: '',
    id_comuna: 4,
    id_origen: 2,
    id_institucion_convenio: 1,
    contacto: contactos[11],
  },
  {
    rut: '40404040-4',
    nombre: 'Felipe Ignacio',
    primer_apellido: 'Soto',
    segundo_apellido: 'Herrera',
    fecha_nacimiento: '1979-03-21',
    obs: '',
    id_comuna: 8,
    id_origen: 1,
    id_institucion_convenio: 6,
    contacto: contactos[12],
  },
  {
    rut: '50505050-5',
    nombre: 'Camila Beatriz',
    primer_apellido: 'Morales',
    segundo_apellido: 'Espinoza',
    fecha_nacimiento: '1996-11-14',
    obs: '',
    id_comuna: 1,
    id_origen: 4,
    id_institucion_convenio: 12,
    contacto: contactos[13],
  },
  {
    rut: '60606060-6',
    nombre: 'Manuel Arturo',
    primer_apellido: 'Herrera',
    segundo_apellido: 'Acuña',
    fecha_nacimiento: '1983-07-29',
    obs: 'No contactable después de 3 intentos',
    id_comuna: 9,
    id_origen: 2,
    id_institucion_convenio: 2,
    contacto: contactos[14],
  },
  {
    rut: '21309172-7',
    nombre: 'Ricardo Andrés',
    primer_apellido: 'Molina',
    segundo_apellido: 'Vargas',
    fecha_nacimiento: '1988-05-12',
    obs: '',
    id_comuna: 22,
    id_origen: 1,
    id_institucion_convenio: 7,
    contacto: contactos[15],
  },
];

// Seguimientos de pacientes
export const seguimientos: Seguimiento[] = [
  {
    id: 1,
    fecha_ingreso: '2025-12-01',
    fecha_primera_llamada: '2025-12-02',
    fecha_segunda_llamada: '2025-12-05',
    fecha_tercera_llamada: null,
    fecha_citacion: null,
    agendado: 'no',
    numero_llamado: 2,
    id_paciente: '11111111-1',
    id_especialidad: 4, // Dermatología (Medicina)
    rut_ejecutivo_ingreso: '11111111-1', // Maricel Fierro
  },
  {
    id: 2,
    fecha_ingreso: '2025-12-03',
    fecha_primera_llamada: '2025-12-04',
    fecha_segunda_llamada: null,
    fecha_tercera_llamada: null,
    fecha_citacion: '2025-12-20',
    agendado: 'si',
    numero_llamado: 1,
    id_paciente: '22222222-2',
    id_especialidad: 11, // Oftalmología (Medicina)
    rut_ejecutivo_ingreso: '22222222-2', // Jazmin Alanes
  },
  {
    id: 3,
    fecha_ingreso: '2025-12-05',
    fecha_primera_llamada: '2025-12-06',
    fecha_segunda_llamada: '2025-12-08',
    fecha_tercera_llamada: '2025-12-10',
    fecha_citacion: null,
    agendado: 'no',
    numero_llamado: 3,
    id_paciente: '33333333-3',
    id_especialidad: 15, // Kinesiología (Medicina)
    rut_ejecutivo_ingreso: '33333333-3', // Veronica Cifuentes
  },
  {
    id: 4,
    fecha_ingreso: '2025-12-07',
    fecha_primera_llamada: '2025-12-08',
    fecha_segunda_llamada: null,
    fecha_tercera_llamada: null,
    fecha_citacion: '2025-12-22',
    agendado: 'si',
    numero_llamado: 1,
    id_paciente: '44444444-4',
    id_especialidad: 9, // Pediatría (Medicina)
    rut_ejecutivo_ingreso: '44444444-4', // Fernanda Morales
  },
  {
    id: 5,
    fecha_ingreso: '2025-12-08',
    fecha_primera_llamada: null,
    fecha_segunda_llamada: null,
    fecha_tercera_llamada: null,
    fecha_citacion: null,
    agendado: 'no',
    numero_llamado: 0,
    id_paciente: '55555555-5',
    id_especialidad: 16, // O.General (Odontología)
    rut_ejecutivo_ingreso: '55555555-5', // Ynsira Gajardo
  },
  {
    id: 6,
    fecha_ingreso: '2025-12-09',
    fecha_primera_llamada: '2025-12-10',
    fecha_segunda_llamada: null,
    fecha_tercera_llamada: null,
    fecha_citacion: null,
    agendado: 'no',
    numero_llamado: 1,
    id_paciente: '66666666-6',
    id_especialidad: 12, // Fonoaudiología (Medicina)
    rut_ejecutivo_ingreso: '66666666-6', // Marta Elena Muñoz
  },
  {
    id: 7,
    fecha_ingreso: '2025-12-10',
    fecha_primera_llamada: '2025-12-11',
    fecha_segunda_llamada: '2025-12-13',
    fecha_tercera_llamada: null,
    fecha_citacion: '2025-12-25',
    agendado: 'si',
    numero_llamado: 2,
    id_paciente: '77777777-7',
    id_especialidad: 7, // Otorrinolaringología (Medicina)
    rut_ejecutivo_ingreso: '77777777-7', // Carla Sanchez
  },
  {
    id: 8,
    fecha_ingreso: '2025-12-11',
    fecha_primera_llamada: '2025-12-12',
    fecha_segunda_llamada: null,
    fecha_tercera_llamada: null,
    fecha_citacion: null,
    agendado: 'desiste',
    numero_llamado: 1,
    id_paciente: '88888888-8',
    id_especialidad: 8, // Ginecología (Medicina)
    rut_ejecutivo_ingreso: '88888888-8', // Alejandra Leiva
  },
  {
    id: 9,
    fecha_ingreso: '2025-12-12',
    fecha_primera_llamada: '2025-12-13',
    fecha_segunda_llamada: null,
    fecha_tercera_llamada: null,
    fecha_citacion: '2025-12-28',
    agendado: 'si',
    numero_llamado: 1,
    id_paciente: '99999999-9',
    id_especialidad: 10, // Psiquiatría (Medicina)
    rut_ejecutivo_ingreso: '99999999-9', // Maria Contreras
  },
  {
    id: 10,
    fecha_ingreso: '2025-12-13',
    fecha_primera_llamada: null,
    fecha_segunda_llamada: null,
    fecha_tercera_llamada: null,
    fecha_citacion: null,
    agendado: 'no',
    numero_llamado: 0,
    id_paciente: '10101010-1',
    id_especialidad: 3, // Medicina General
    rut_ejecutivo_ingreso: '11111111-1', // Maricel Fierro
  },
  {
    id: 11,
    fecha_ingreso: '2025-12-14',
    fecha_primera_llamada: '2025-12-15',
    fecha_segunda_llamada: '2025-12-16',
    fecha_tercera_llamada: null,
    fecha_citacion: null,
    agendado: 'no',
    numero_llamado: 2,
    id_paciente: '20202020-2',
    id_especialidad: 5, // Neurología Adulto (Medicina)
    rut_ejecutivo_ingreso: '22222222-2', // Jazmin Alanes
  },
  {
    id: 12,
    fecha_ingreso: '2025-12-15',
    fecha_primera_llamada: '2025-12-16',
    fecha_segunda_llamada: null,
    fecha_tercera_llamada: null,
    fecha_citacion: '2025-12-30',
    agendado: 'si',
    numero_llamado: 1,
    id_paciente: '30303030-3',
    id_especialidad: 17, // O.Especialidades (Odontología)
    rut_ejecutivo_ingreso: '33333333-3', // Veronica Cifuentes
  },
  {
    id: 13,
    fecha_ingreso: '2025-12-16',
    fecha_primera_llamada: '2025-12-17',
    fecha_segunda_llamada: null,
    fecha_tercera_llamada: null,
    fecha_citacion: null,
    agendado: 'no',
    numero_llamado: 1,
    id_paciente: '40404040-4',
    id_especialidad: 13, // TM.Oftalmología (Medicina)
    rut_ejecutivo_ingreso: '44444444-4', // Fernanda Morales
  },
  {
    id: 14,
    fecha_ingreso: '2025-12-17',
    fecha_primera_llamada: null,
    fecha_segunda_llamada: null,
    fecha_tercera_llamada: null,
    fecha_citacion: null,
    agendado: 'no',
    numero_llamado: 0,
    id_paciente: '50505050-5',
    id_especialidad: 14, // T.Ocupacional (Medicina)
    rut_ejecutivo_ingreso: '55555555-5', // Ynsira Gajardo
  },
  {
    id: 15,
    fecha_ingreso: '2025-12-10',
    fecha_primera_llamada: '2025-12-11',
    fecha_segunda_llamada: '2025-12-13',
    fecha_tercera_llamada: '2025-12-15',
    fecha_citacion: null,
    agendado: 'desiste',
    numero_llamado: 3,
    id_paciente: '60606060-6',
    id_especialidad: 6, // Neurología Pediátrica (Medicina)
    rut_ejecutivo_ingreso: '66666666-6', // Marta Elena Muñoz
  },
  {
    id: 16,
    fecha_ingreso: '2025-11-15',
    fecha_primera_llamada: '2025-11-16',
    fecha_segunda_llamada: '2025-11-18',
    fecha_tercera_llamada: null,
    fecha_citacion: '2025-12-20',
    agendado: 'si',
    numero_llamado: 2,
    id_paciente: '21309172-7',
    id_especialidad: 4, // Dermatología
    rut_ejecutivo_ingreso: '11111111-1', // Maricel Fierro
  },
  {
    id: 17,
    fecha_ingreso: '2025-10-05',
    fecha_primera_llamada: '2025-10-06',
    fecha_segunda_llamada: null,
    fecha_tercera_llamada: null,
    fecha_citacion: '2025-10-25',
    agendado: 'si',
    numero_llamado: 1,
    id_paciente: '21309172-7',
    id_especialidad: 11, // Oftalmología
    rut_ejecutivo_ingreso: '22222222-2', // Jazmin Alanes
  },
  {
    id: 18,
    fecha_ingreso: '2025-09-20',
    fecha_primera_llamada: '2025-09-21',
    fecha_segunda_llamada: '2025-09-23',
    fecha_tercera_llamada: '2025-09-25',
    fecha_citacion: '2025-10-10',
    agendado: 'si',
    numero_llamado: 3,
    id_paciente: '21309172-7',
    id_especialidad: 15, // Kinesiología
    rut_ejecutivo_ingreso: '33333333-3', // Veronica Cifuentes
  },
  {
    id: 19,
    fecha_ingreso: '2025-12-12',
    fecha_primera_llamada: '2025-12-13',
    fecha_segunda_llamada: null,
    fecha_tercera_llamada: null,
    fecha_citacion: null,
    agendado: 'no',
    numero_llamado: 1,
    id_paciente: '21309172-7',
    id_especialidad: 17, // O.Especialidades (Odontología)
    rut_ejecutivo_ingreso: '44444444-4', // Fernanda Morales
  },
];

// Auditoría de cambios
export const auditorias: Auditoria[] = [
  {
    id: 1,
    fecha_modificacion: '2025-12-05 10:30:00',
    campo_modificado: 'obs',
    valor_nuevo: 'Paciente con urgencia médica',
    valor_modificado: '',
    id_trabajador: '23456789-0',
    id_paciente: '33333333-3',
  },
  {
    id: 2,
    fecha_modificacion: '2025-12-10 14:15:00',
    campo_modificado: 'fecha_segunda_llamada',
    valor_nuevo: '2025-12-13',
    valor_modificado: 'null',
    id_trabajador: '89012345-6',
    id_paciente: '77777777-7',
  },
  {
    id: 3,
    fecha_modificacion: '2025-12-11 09:45:00',
    campo_modificado: 'obs',
    valor_nuevo: 'Requiere exámenes previos',
    valor_modificado: '',
    id_trabajador: '23456789-0',
    id_paciente: '20202020-2',
  },
  {
    id: 4,
    fecha_modificacion: '2025-12-15 16:20:00',
    campo_modificado: 'obs',
    valor_nuevo: 'No contactable después de 3 intentos',
    valor_modificado: '',
    id_trabajador: '90123456-7',
    id_paciente: '60606060-6',
  },
  {
    id: 5,
    fecha_modificacion: '2025-12-05 11:30:00',
    campo_modificado: 'fecha_segunda_llamada',
    valor_nuevo: '2025-12-05',
    valor_modificado: 'null',
    id_trabajador: '34567890-1',
    id_paciente: '11111111-1',
  },
];

// Alias para compatibilidad
export const institucionesConvenio = instituciones;
