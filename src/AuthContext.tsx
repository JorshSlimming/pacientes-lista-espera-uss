import React, { createContext, useContext, useState, ReactNode } from 'react';
import { Trabajador, Rol } from './types';
import { trabajadores } from './mockData';

interface AuthContextType {
  usuario: Trabajador | null;
  login: (rut: string, clave: string) => boolean;
  logout: () => void;
  isAuthenticated: boolean;
  hasRole: (roles: Rol[]) => boolean;
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

  const login = (rut: string, clave: string): boolean => {
    const user = trabajadores.find(
      (t) => t.rut === rut && t.clave === clave
    );
    if (user) {
      setUsuario(user);
      return true;
    }
    return false;
  };

  const logout = () => {
    setUsuario(null);
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
      }}
    >
      {children}
    </AuthContext.Provider>
  );
};
