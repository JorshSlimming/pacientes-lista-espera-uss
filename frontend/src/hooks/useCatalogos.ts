// Hook personalizado para cargar y manejar catálogos
import { useState, useEffect } from 'react';
import { catalogosService, DatosAutocompletar } from '../api';
import { Comuna, Origen, InstitucionConvenio, Especialidad } from '../types';

export const useCatalogos = () => {
  const [catalogos, setCatalogos] = useState<DatosAutocompletar>({
    comunas: [],
    origenes: [],
    instituciones: [],
    especialidades: [],
  });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const cargarCatalogos = async () => {
      setLoading(true);
      const { data, error: err } = await catalogosService.obtenerDatosAutocompletar();
      
      if (err || !data) {
        setError(err || 'Error al cargar catálogos');
      } else {
        setCatalogos(data);
      }
      
      setLoading(false);
    };

    cargarCatalogos();
  }, []);

  return { catalogos, loading, error };
};
