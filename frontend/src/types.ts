// Tipos de datos del sistema

export type Rol = 'usuario' | 'jefe';

export interface Trabajador {
  id_trabajador: number;
  rut: string;
  rol: Rol;
  nombre: string;
  apellido: string;
  clave?: string;
  activo?: boolean;
  archivado?: boolean;
}

export interface Comuna {
  id_comuna?: number;
  id?: number;
  nombre: string;
  codigo?: string;
  region?: string;
  archivado?: boolean;
}

export interface Origen {
  id_origen?: number;
  id?: number;
  nombre: string;
  requiere_ci: boolean;
  descripcion?: string;
  archivado?: boolean;
}

export interface InstitucionConvenio {
  id_institucion?: number;
  id?: number;
  tipo: string;
  nombre: string;
  telefono?: string;
  email?: string;
  archivado?: boolean;
}

// Alias para compatibilidad
export type Institucion = InstitucionConvenio;

export interface Contacto {
  id: number;
  correo: string;
  direccion: string;
  primer_celular: string;
  segundo_celular: string;
}

export interface Especialidad {
  id_especialidad?: number;
  id?: number;
  nombre: string;
  parent_id: number | null;
  nivel: number;
  archivado?: boolean;
}

export interface Paciente {
  id_paciente: number;
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
  id_paciente: number;
  id_especialidad: number;
  id_ejecutivo_ingreso: number;
}

export interface Auditoria {
  fecha_modificacion: string;
  trabajador?: {
    nombre: string;
    apellido: string;
  };
  campo_modificado: string;
  valor_modificado: string | null;
  valor_nuevo: string | null;
}

export interface PacienteCompleto extends Paciente {
  seguimiento: Seguimiento;
  comuna: Comuna;
  origen: Origen;
  institucion: InstitucionConvenio | null;
  especialidad: Especialidad;
  ejecutivo: Trabajador;
}
