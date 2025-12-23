// Servicio para estadísticas y administración
import { apiClient } from './client';
import { Trabajador } from '../types';

export interface EstadisticasHistoricas {
  total_ingresos: number;
  pendientes: number;
  agendados: number;
  desistidos: number;
}

export interface IngresosPorEjecutivo {
  id_trabajador: number;
  rut: string;
  nombre_completo: string;
  total_ingresos: number;
}

export const adminService = {
  async obtenerEstadisticasHistoricas(): Promise<{ data?: EstadisticasHistoricas; error?: string }> {
    const response = await apiClient.get<any>('estadisticas-historicas');
    if (response.error) return response;
    return { data: response.data?.estadisticas, error: response.error };
  },

  async obtenerIngresosPorEjecutivo(): Promise<{ data?: IngresosPorEjecutivo[]; error?: string }> {
    const response = await apiClient.get<any>('ingresos-por-ejecutivo');
    if (response.error) return response;
    return { data: response.data?.ingresos_por_ejecutivo, error: response.error };
  },

  // Gestión de usuarios (solo para jefe)
  async listarUsuarios(): Promise<{ data?: Trabajador[]; error?: string }> {
    return await apiClient.get<Trabajador[]>('listar-usuarios');
  },

  async registrarUsuario(datos: { rut: string; nombre: string; apellido: string; email: string; rol: 'usuario' | 'jefe'; clave: string }): Promise<{ data?: Trabajador; error?: string }> {
    return await apiClient.post<Trabajador>('registrar-usuario', datos);
  },

  async archivarUsuario(id_trabajador: number): Promise<{ error?: string }> {
    return await apiClient.post('archivar-usuario', { id_trabajador, action: 'archivar' });
  },

  async activarUsuario(id_trabajador: number): Promise<{ error?: string }> {
    return await apiClient.post('archivar-usuario', { id_trabajador, action: 'activar' });
  },

  async cambiarContrasena(id_trabajador: number, nueva_clave: string): Promise<{ error?: string }> {
    return await apiClient.post('cambiar-contrasena', { id_trabajador, nueva_clave });
  }
};
