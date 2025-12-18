// Tipos de datos del sistema

export type Rol = 'usuario' | 'jefe';

export interface Trabajador {
  rut: string;
  rol: Rol;
  nombre: string;
  apellido: string;
  clave: string;
}

export interface Comuna {
  id: number;
  nombre: string;
  codigo?: string;
  region?: string;
  archivado?: boolean;
}

export interface Origen {
  id: number;
  nombre: string;
  requiere_ci: boolean;
  descripcion?: string;
  archivado?: boolean;
}

export interface InstitucionConvenio {
  id: number;
  tipo: string;
  nombre: string;
  telefono?: string;
  email?: string;
  archivado?: boolean;
}

export interface Contacto {
  id: number;
  correo: string;
  direccion: string;
  primer_celular: string;
  segundo_celular: string;
}

export interface Especialidad {
  id: number;
  nombre: string;
  parent_id: number | null;
  nivel: number;
  archivado?: boolean;
}

export interface Paciente {
  rut: string;
  nombre: string;
  primer_apellido: string;
  segundo_apellido: string;
  fecha_nacimiento: string;
  obs: string;
  id_comuna: number;
  id_origen: number;
  id_institucion_convenio: number | null;
  contacto: Contacto;
}

export interface Seguimiento {
  id: number;
  fecha_ingreso: string;
  fecha_primera_llamada: string | null;
  fecha_segunda_llamada: string | null;
  fecha_tercera_llamada: string | null;
  fecha_citacion: string | null;
  agendado: 'si' | 'no' | 'desiste';
  numero_llamado: number;
  id_paciente: string;
  id_especialidad: number;
  rut_ejecutivo_ingreso: string;
}

export interface Auditoria {
  id: number;
  fecha_modificacion: string;
  campo_modificado: string;
  valor_nuevo: string;
  valor_modificado: string;
  id_trabajador: string;
  id_paciente: string;
}

export interface PacienteCompleto extends Paciente {
  seguimiento: Seguimiento;
  comuna: Comuna;
  origen: Origen;
  institucion: InstitucionConvenio | null;
  especialidad: Especialidad;
  ejecutivo: Trabajador;
}
