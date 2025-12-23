// Cliente HTTP para comunicarse con las edge functions de Supabase
import { EDGE_FUNCTIONS_URL, SUPABASE_ANON_KEY } from '../config';
import { supabase } from './supabase';

export interface ApiResponse<T = any> {
  data?: T;
  error?: string;
}

class ApiClient {
  private baseUrl: string;
  private headers: HeadersInit;

  constructor() {
    this.baseUrl = EDGE_FUNCTIONS_URL;
    this.headers = {
      'Content-Type': 'application/json',
      'apikey': SUPABASE_ANON_KEY,
    };
  }

  private async getHeaders(): Promise<HeadersInit> {
    const headers: Record<string, string> = { ...this.headers as any };
    
    // Obtener JWT de localStorage
    const jwt = localStorage.getItem('supabase_jwt');
    console.log('🔑 JWT:', jwt ? 'Presente ✅' : 'Ausente ❌');
    if (jwt) {
      headers['Authorization'] = `Bearer ${jwt}`;
    }
    
    return headers;
  }

  async post<T = any>(endpoint: string, data?: any): Promise<ApiResponse<T>> {
    try {
      const response = await fetch(`${this.baseUrl}/${endpoint}`, {
        method: 'POST',
        headers: await this.getHeaders(),
        body: data ? JSON.stringify(data) : undefined,
      });

      const result = await response.json();

      if (!response.ok) {
        return { error: result.error || 'Error en la petición' };
      }

      // Si el resultado tiene un campo "data", extraerlo
      if (result.data !== undefined) {
        return { data: result.data };
      }

      return { data: result };
    } catch (error) {
      console.error(`Error en ${endpoint}:`, error);
      return { error: error instanceof Error ? error.message : 'Error desconocido' };
    }
  }

  async get<T = any>(endpoint: string): Promise<ApiResponse<T>> {
    try {
      const response = await fetch(`${this.baseUrl}/${endpoint}`, {
        method: 'GET',
        headers: await this.getHeaders(),
      });

      const result = await response.json();

      if (!response.ok) {
        return { error: result.error || 'Error en la petición' };
      }

      // Si el resultado tiene un campo "data", extraerlo
      if (result.data !== undefined) {
        return { data: result.data };
      }

      return { data: result };
    } catch (error) {
      console.error(`Error en ${endpoint}:`, error);
      return { error: error instanceof Error ? error.message : 'Error desconocido' };
    }
  }

  async put<T = any>(endpoint: string, data?: any): Promise<ApiResponse<T>> {
    try {
      const response = await fetch(`${this.baseUrl}/${endpoint}`, {
        method: 'PUT',
        headers: await this.getHeaders(),
        body: data ? JSON.stringify(data) : undefined,
      });

      const result = await response.json();

      if (!response.ok) {
        return { error: result.error || 'Error en la petición' };
      }

      // Si el resultado tiene un campo "data", extraerlo
      if (result.data !== undefined) {
        return { data: result.data };
      }

      return { data: result };
    } catch (error) {
      console.error(`Error en ${endpoint}:`, error);
      return { error: error instanceof Error ? error.message : 'Error desconocido' };
    }
  }

  async delete<T = any>(endpoint: string): Promise<ApiResponse<T>> {
    try {
      const response = await fetch(`${this.baseUrl}/${endpoint}`, {
        method: 'DELETE',
        headers: await this.getHeaders(),
      });

      const result = await response.json();

      if (!response.ok) {
        return { error: result.error || 'Error en la petición' };
      }

      // Si el resultado tiene un campo "data", extraerlo
      if (result.data !== undefined) {
        return { data: result.data };
      }

      return { data: result };
    } catch (error) {
      console.error(`Error en ${endpoint}:`, error);
      return { error: error instanceof Error ? error.message : 'Error desconocido' };
    }
  }
}

export const apiClient = new ApiClient();
