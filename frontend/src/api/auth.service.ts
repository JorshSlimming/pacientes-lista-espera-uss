// Servicio de autenticación con Supabase Auth
import { Trabajador } from '../types';
import { SUPABASE_URL, SUPABASE_ANON_KEY } from '../config';
import { apiClient } from './client';

export interface LoginResponse {
  success: boolean;
  user: Trabajador;
  message: string;
}

export const authService = {
  async login(rut: string, clave: string): Promise<{ data?: LoginResponse; error?: string }> {
    try {
      // Llamar a la función edge que maneja todo el flujo
      const response = await fetch(`${SUPABASE_URL}/functions/v1/autenticar-usuario`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'apikey': SUPABASE_ANON_KEY,
          'Authorization': `Bearer ${SUPABASE_ANON_KEY}`
        },
        body: JSON.stringify({ rut, clave })
      });

      const result = await response.json();
      console.log('📦 Respuesta completa del backend:', result);
      console.log('📦 result.session:', result.session);
      console.log('📦 result.session?.access_token:', result.session?.access_token);

      if (!response.ok || result.error) {
        return { error: result.error || 'Error en autenticación' };
      }

      // Guardar JWT manualmente en localStorage
      if (result.session?.access_token) {
        console.log('💾 Guardando JWT en localStorage');
        localStorage.setItem('supabase_jwt', result.session.access_token);
        localStorage.setItem('supabase_refresh_token', result.session.refresh_token);
        console.log('✅ JWT guardado correctamente');
      } else {
        console.warn('⚠️ No se recibió sesión del backend');
      }

      return {
        data: {
          success: true,
          user: result.user as Trabajador,
          message: result.message
        }
      };
    } catch (error: any) {
      return { error: error.message || 'Error al iniciar sesión' };
    }
  },

  // Verificar si hay una sesión activa
  async verificarSesion(): Promise<{ data?: Trabajador; error?: string }> {
    try {
      const jwt = localStorage.getItem('supabase_jwt');
      
      if (!jwt) {
        return { error: 'No hay sesión activa' };
      }

      // Decodificar JWT para obtener datos básicos (temporal, hasta que funcione obtener-datos-usuario)
      try {
        const payload = JSON.parse(atob(jwt.split('.')[1]));
        
        // Verificar si el token está expirado
        if (payload.exp && payload.exp < Date.now() / 1000) {
          localStorage.removeItem('supabase_jwt');
          localStorage.removeItem('supabase_refresh_token');
          return { error: 'Sesión expirada' };
        }

        // Obtener datos del trabajador desde la base de datos
        const response = await apiClient.get<Trabajador>('obtener-datos-usuario');
        
        if (response.error || !response.data) {
          // Si falla, limpiar JWT inválido
          localStorage.removeItem('supabase_jwt');
          localStorage.removeItem('supabase_refresh_token');
          return { error: response.error || 'Sesión inválida' };
        }

        return { data: response.data };
      } catch (decodeError) {
        localStorage.removeItem('supabase_jwt');
        localStorage.removeItem('supabase_refresh_token');
        return { error: 'Token inválido' };
      }
    } catch (error: any) {
      return { error: error.message || 'Error al verificar sesión' };
    }
  },

  // Cerrar sesión
  async logout(): Promise<{ error?: string }> {
    try {
      const jwt = localStorage.getItem('supabase_jwt');
      
      // Llamar al edge function de cerrar sesión si hay un JWT
      if (jwt) {
        try {
          await apiClient.post('cerrar-sesion', {});
        } catch (e) {
          // Ignorar errores del edge function, igual limpiamos local
          console.warn('Error al llamar cerrar-sesion:', e);
        }
      }
      
      // Limpiar JWT del localStorage
      localStorage.removeItem('supabase_jwt');
      localStorage.removeItem('supabase_refresh_token');
      localStorage.removeItem('usuario_actual');
      
      return {};
    } catch (error: any) {
      return { error: error.message || 'Error al cerrar sesión' };
    }
  },

  // Obtener el token de acceso actual
  async getAccessToken(): Promise<string | null> {
    return localStorage.getItem('supabase_jwt');
  }
};
