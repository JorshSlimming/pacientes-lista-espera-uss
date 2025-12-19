import React, { useState } from 'react';
import { useAuth } from '../AuthContext';
import './Login.css';

const Login: React.FC = () => {
  const [rut, setRut] = useState('');
  const [clave, setClave] = useState('');
  const [error, setError] = useState('');
  const { login } = useAuth();

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setError('');

    if (!rut || !clave) {
      setError('Por favor ingrese RUT y contraseña');
      return;
    }

    const success = login(rut, clave);
    if (!success) {
      setError('RUT o contraseña incorrectos');
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
            />
          </div>

          {error && <div className="error-message">{error}</div>}

          <button type="submit" className="btn-primary">
            Iniciar Sesión
          </button>
        </form>

        <div className="login-help">
          <p><strong>Usuarios de prueba:</strong></p>
          <ul>
            <li>Jefe: 23456789-0 / jefe123</li>
            <li>Usuario: 34567890-1 / user123</li>
          </ul>
        </div>
      </div>
    </div>
  );
};

export default Login;
