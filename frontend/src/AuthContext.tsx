import React, { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import { Trabajador, Rol } from './types';
import { authService } from './api';

interface AuthContextType {
  usuario: Trabajador | null;
  login: (rut: string, clave: string) => Promise<{ success: boolean; error?: string }>;
  logout: () => Promise<void>;
  isAuthenticated: boolean;
  hasRole: (roles: Rol[]) => boolean;
  loading: boolean;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth debe ser usado dentro de AuthProvider');
  }
  return context;
};

interface AuthProviderProps {
  children: ReactNode;
}

export const AuthProvider: React.FC<AuthProviderProps> = ({ children }) => {
  const [usuario, setUsuario] = useState<Trabajador | null>(null);
  const [loading, setLoading] = useState<boolean>(true);

  // Verificar sesión al cargar
  useEffect(() => {
    const verificarSesion = async () => {
      const jwt = localStorage.getItem('supabase_jwt');
      const usuarioGuardado = localStorage.getItem('usuario_actual');
      
      // Si hay JWT y usuario guardado, restaurar sesión directamente
      if (jwt && usuarioGuardado) {
        try {
          const usuario = JSON.parse(usuarioGuardado);
          
          // Verificar si el token no está expirado
          const payload = JSON.parse(atob(jwt.split('.')[1]));
          const tokenExpirado = payload.exp && payload.exp < Date.now() / 1000;
          
          if (tokenExpirado) {
            // Token expirado, limpiar todo
            localStorage.removeItem('supabase_jwt');
            localStorage.removeItem('supabase_refresh_token');
            localStorage.removeItem('usuario_actual');
            setUsuario(null);
            console.log('❌ Token expirado, sesión limpiada');
          } else {
            // Token válido, restaurar sesión
            setUsuario(usuario);
            console.log('✅ Sesión restaurada desde localStorage');
          }
        } catch (e) {
          // Error al parsear, limpiar
          console.error('Error al restaurar sesión:', e);
          localStorage.removeItem('usuario_actual');
          setUsuario(null);
        }
      } else {
        // No hay sesión guardada
        setUsuario(null);
        console.log('ℹ️ No hay sesión guardada');
      }
      
      setLoading(false);
    };

    verificarSesion();
  }, []);

  const login = async (rut: string, clave: string): Promise<{ success: boolean; error?: string }> => {
    console.log('🔐 Intentando login...');
    const { data, error } = await authService.login(rut, clave);
    
    if (error || !data || !data.success) {
      console.error('❌ Error en login:', error);
      return { success: false, error: error || 'Error al iniciar sesión' };
    }
    
    console.log('✅ Login exitoso, usuario:', data.user);
    setUsuario(data.user);
    localStorage.setItem('usuario_actual', JSON.stringify(data.user));
    return { success: true };
  };

  const logout = async () => {
    await authService.logout();
    setUsuario(null);
    localStorage.removeItem('usuario_actual');
  };

  const hasRole = (roles: Rol[]): boolean => {
    if (!usuario) return false;
    return roles.includes(usuario.rol);
  };

  return (
    <AuthContext.Provider
      value={{
        usuario,
        login,
        logout,
        isAuthenticated: !!usuario,
        hasRole,
        loading,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
};
