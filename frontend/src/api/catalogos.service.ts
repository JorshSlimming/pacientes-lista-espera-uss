// Servicio para manejo de catálogos (comunas, orígenes, instituciones, especialidades)
import { apiClient } from './client';
import { Comuna, Origen, InstitucionConvenio, Especialidad } from '../types';

export interface DatosAutocompletar {
  comunas: Comuna[];
  origenes: Origen[];
  instituciones: InstitucionConvenio[];
  especialidades: Especialidad[];
}

export const catalogosService = {
  // Obtener todos los datos para autocompletar en formularios
  // Usa edge function que maneja SERVICE_ROLE_KEY internamente
  async obtenerDatosAutocompletar(): Promise<{ data?: DatosAutocompletar; error?: string }> {
    return await apiClient.get<DatosAutocompletar>('obtener-datos-autocompletar');
  },

  // Gestión de comunas
  comunas: {
    async listar(): Promise<{ data?: Comuna[]; error?: string }> {
      return await apiClient.post('gestion-comunas', { action: 'listar' });
    },
    
    async crear(comuna: Omit<Comuna, 'id'>): Promise<{ data?: Comuna; error?: string }> {
      return await apiClient.post('gestion-comunas', { action: 'crear', data: comuna });
    },
    
    async actualizar(id: number, comuna: Partial<Comuna>): Promise<{ data?: Comuna; error?: string }> {
      return await apiClient.post('gestion-comunas', { action: 'actualizar', id, data: comuna });
    },
    
    async archivar(id: number): Promise<{ error?: string }> {
      return await apiClient.post('gestion-comunas', { action: 'archivar', id });
    },
    
    async desarchivar(id: number): Promise<{ error?: string }> {
      return await apiClient.post('gestion-comunas', { action: 'desarchivar', id });
    }
  },

  // Gestión de orígenes
  origenes: {
    async listar(): Promise<{ data?: Origen[]; error?: string }> {
      return await apiClient.post('gestion-origenes', { action: 'listar' });
    },
    
    async crear(origen: Omit<Origen, 'id'>): Promise<{ data?: Origen; error?: string }> {
      return await apiClient.post('gestion-origenes', { action: 'crear', data: origen });
    },
    
    async actualizar(id: number, origen: Partial<Origen>): Promise<{ data?: Origen; error?: string }> {
      return await apiClient.post('gestion-origenes', { action: 'actualizar', id, data: origen });
    },
    
    async archivar(id: number): Promise<{ error?: string }> {
      return await apiClient.post('gestion-origenes', { action: 'archivar', id });
    },
    
    async desarchivar(id: number): Promise<{ error?: string }> {
      return await apiClient.post('gestion-origenes', { action: 'desarchivar', id });
    }
  },

  // Gestión de instituciones
  instituciones: {
    async listar(): Promise<{ data?: InstitucionConvenio[]; error?: string }> {
      return await apiClient.post('gestion-instituciones', { action: 'listar' });
    },
    
    async crear(institucion: Omit<InstitucionConvenio, 'id'>): Promise<{ data?: InstitucionConvenio; error?: string }> {
      return await apiClient.post('gestion-instituciones', { action: 'crear', data: institucion });
    },
    
    async actualizar(id: number, institucion: Partial<InstitucionConvenio>): Promise<{ data?: InstitucionConvenio; error?: string }> {
      return await apiClient.post('gestion-instituciones', { action: 'actualizar', id, data: institucion });
    },
    
    async archivar(id: number): Promise<{ error?: string }> {
      return await apiClient.post('gestion-instituciones', { action: 'archivar', id });
    },
    
    async desarchivar(id: number): Promise<{ error?: string }> {
      return await apiClient.post('gestion-instituciones', { action: 'desarchivar', id });
    }
  },

  // Gestión de especialidades
  especialidades: {
    async listar(): Promise<{ data?: Especialidad[]; error?: string }> {
      return await apiClient.post('gestion-especialidades', { action: 'listar' });
    },
    
    async crear(especialidad: Omit<Especialidad, 'id'>): Promise<{ data?: Especialidad; error?: string }> {
      return await apiClient.post('gestion-especialidades', { action: 'crear', data: especialidad });
    },
    
    async actualizar(id: number, especialidad: Partial<Especialidad>): Promise<{ data?: Especialidad; error?: string }> {
      return await apiClient.post('gestion-especialidades', { action: 'actualizar', id, data: especialidad });
    },
    
    async archivar(id: number): Promise<{ error?: string }> {
      return await apiClient.post('gestion-especialidades', { action: 'archivar', id });
    },
    
    async desarchivar(id: number): Promise<{ error?: string }> {
      return await apiClient.post('gestion-especialidades', { action: 'desarchivar', id });
    }
  },

  // Métodos simplificados para componentes
  async obtenerComunas(): Promise<{ data?: Comuna[]; error?: string }> {
    return await apiClient.post('gestion-comunas', { action: 'listar' });
  },

  async agregarComuna(nombre: string): Promise<{ data?: Comuna; error?: string }> {
    return await apiClient.post('gestion-comunas', { action: 'crear', data: { nombre } });
  },

  async obtenerOrigenes(): Promise<{ data?: Origen[]; error?: string }> {
    return await apiClient.post('gestion-origenes', { action: 'listar' });
  },

  async agregarOrigen(nombre: string): Promise<{ data?: Origen; error?: string }> {
    return await apiClient.post('gestion-origenes', { action: 'crear', data: { nombre } });
  },

  async obtenerInstituciones(): Promise<{ data?: InstitucionConvenio[]; error?: string }> {
    return await apiClient.post('gestion-instituciones', { action: 'listar' });
  },

  async agregarInstitucion(nombre: string): Promise<{ data?: InstitucionConvenio; error?: string }> {
    return await apiClient.post('gestion-instituciones', { action: 'crear', data: { nombre } });
  },

  async obtenerEspecialidades(): Promise<{ data?: Especialidad[]; error?: string }> {
    return await apiClient.post('gestion-especialidades', { action: 'listar' });
  },

  async agregarEspecialidad(nombre: string): Promise<{ data?: Especialidad; error?: string }> {
    return await apiClient.post('gestion-especialidades', { action: 'crear', data: { nombre } });
  }
};
