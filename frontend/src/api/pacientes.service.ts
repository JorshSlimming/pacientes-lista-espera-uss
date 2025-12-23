// Servicio para gestión de pacientes
import { apiClient } from './client';
import { Paciente, PacienteCompleto, Auditoria } from '../types';

export interface CrearPacienteRequest {
  // Datos personales
  rut: string;
  nombre: string;
  primer_apellido: string;
  segundo_apellido: string;
  fecha_nacimiento: string;
  obs: string;
  id_comuna: number;
  id_origen: number;
  id_institucion_convenio: number | null;
  
  // Contacto
  correo: string;
  direccion: string;
  primer_celular: string;
  segundo_celular: string;
  
  // Seguimiento inicial
  id_especialidad: number;
}

export interface ActualizarSeguimientoRequest {
  id_seguimiento?: number;
  id_paciente: number;
  fecha_primera_llamada?: string | null;
  fecha_segunda_llamada?: string | null;
  fecha_tercera_llamada?: string | null;
  fecha_citacion?: string | null;
  agendado?: 'si' | 'no' | 'desiste';
  obs?: string;
}

export interface BuscarPacientesFiltros {
  id_especialidad?: number;
  id_comuna?: number;
  agendado?: 'si' | 'no' | 'desiste';
  fecha_inicio?: string;
  fecha_fin?: string;
  nombre?: string;
  rut?: string;
  paginacion?: {
    page: number;
    per_page: number;
  };
}

export const pacientesService = {
  async crearPaciente(datos: CrearPacienteRequest): Promise<{ data?: Paciente; error?: string }> {
    // Obtener rut del ejecutivo del localStorage (desde el JWT)
    const jwt = localStorage.getItem('supabase_jwt');
    let rut_ejecutivo = null;
    
    if (jwt) {
      try {
        const payload = JSON.parse(atob(jwt.split('.')[1]));
        rut_ejecutivo = payload.rut || null;
      } catch (e) {
        console.warn('⚠️ No se pudo obtener rut del JWT');
      }
    }
    
    return await apiClient.post<Paciente>('crear-paciente', {
      paciente: datos,
      rut_ejecutivo
    });
  },

  async buscarPorRut(rut: string): Promise<{ data?: PacienteCompleto; error?: string }> {
    return await apiClient.post<PacienteCompleto>('buscar-paciente-rut', { rut });
  },

  async buscarConFiltros(filtros: BuscarPacientesFiltros): Promise<{ data?: PacienteCompleto[]; error?: string }> {
    // Extraer paginacion si existe
    const { paginacion, ...filtrosLimpios } = filtros;
    return await apiClient.post<PacienteCompleto[]>('buscar-pacientes-filtros', { 
      filtros: filtrosLimpios,
      paginacion 
    });
  },

  async actualizarSeguimiento(datos: ActualizarSeguimientoRequest): Promise<{ data?: any; error?: string }> {
    return await apiClient.post('actualizar-seguimiento', datos);
  },

  async obtenerHistorialCambios(id_paciente: number, id_seguimiento?: number): Promise<{ data?: Auditoria[]; error?: string }> {
    return await apiClient.post<Auditoria[]>('historial-cambios-paciente', { id_paciente, id_seguimiento });
  },

  async verificarRut(rut: string): Promise<{ data?: { existe: boolean }; error?: string }> {
    return await apiClient.post('verificar-rut', { rut });
  }
};
