import React, { useState, useEffect } from 'react';
import { useAuth } from '../AuthContext';
import './Login.css';

const Login: React.FC = () => {
  const [rut, setRut] = useState('');
  const [clave, setClave] = useState('');
  const [recordarSesion, setRecordarSesion] = useState(false);
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const { login } = useAuth();

  // Cargar credenciales guardadas al montar
  useEffect(() => {
    const credencialesGuardadas = localStorage.getItem('credenciales_guardadas');
    if (credencialesGuardadas) {
      try {
        const { rut: rutGuardado, clave: claveGuardada } = JSON.parse(credencialesGuardadas);
        setRut(rutGuardado || '');
        setClave(claveGuardada || '');
        setRecordarSesion(true);
      } catch (e) {
        console.error('Error al cargar credenciales:', e);
      }
    }
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');

    if (!rut || !clave) {
      setError('Por favor ingrese RUT y contraseña');
      return;
    }

    setLoading(true);
    const { success, error: loginError } = await login(rut, clave);
    setLoading(false);

    if (!success) {
      setError(loginError || 'Error al iniciar sesión');
    } else {
      // Guardar credenciales si está marcado
      if (recordarSesion) {
        localStorage.setItem('credenciales_guardadas', JSON.stringify({ rut, clave }));
      } else {
        localStorage.removeItem('credenciales_guardadas');
      }
    }
  };

  return (
    <div className="login-container">
      <div className="login-box">
        <h1>Sistema de Lista de Espera</h1>
        <h2>Universidad San Sebastián</h2>
        
        <form onSubmit={handleSubmit} className="login-form">
          <div className="form-group">
            <label htmlFor="rut">RUT</label>
            <input
              type="text"
              id="rut"
              value={rut}
              onChange={(e) => setRut(e.target.value)}
              placeholder="12345678-9"
              disabled={loading}
            />
          </div>

          <div className="form-group">
            <label htmlFor="clave">Contraseña</label>
            <input
              type="password"
              id="clave"
              value={clave}
              onChange={(e) => setClave(e.target.value)}
              placeholder="••••••••"
              disabled={loading}
            />
          </div>

          <div className="form-group checkbox-group">
            <label className="checkbox-label">
              <input
                type="checkbox"
                checked={recordarSesion}
                onChange={(e) => setRecordarSesion(e.target.checked)}
                disabled={loading}
              />
              <span>Recordar sesión</span>
            </label>
          </div>

          {error && <div className="error-message">{error}</div>}

          <button type="submit" className="btn-primary" disabled={loading}>
            {loading ? 'Iniciando sesión...' : 'Iniciar Sesión'}
          </button>
        </form>
      </div>
    </div>
  );
};

export default Login;
