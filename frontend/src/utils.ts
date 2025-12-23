// Validador de RUT chileno
export const validarRut = (rut: string): boolean => {
  // Eliminar puntos y guión
  const rutLimpio = rut.replace(/\./g, '').replace(/-/g, '');
  
  if (rutLimpio.length < 2) return false;
  
  const cuerpo = rutLimpio.slice(0, -1);
  const dv = rutLimpio.slice(-1).toUpperCase();
  
  // Calcular dígito verificador
  let suma = 0;
  let multiplicador = 2;
  
  for (let i = cuerpo.length - 1; i >= 0; i--) {
    suma += parseInt(cuerpo[i]) * multiplicador;
    multiplicador = multiplicador === 7 ? 2 : multiplicador + 1;
  }
  
  const dvCalculado = 11 - (suma % 11);
  let dvEsperado = '';
  
  if (dvCalculado === 11) {
    dvEsperado = '0';
  } else if (dvCalculado === 10) {
    dvEsperado = 'K';
  } else {
    dvEsperado = dvCalculado.toString();
  }
  
  return dv === dvEsperado;
};

// Validar formato de RUT con guion
export const validarFormatoRut = (rut: string): boolean => {
  // Debe tener el formato: numero-digito
  const regex = /^[0-9]+-[0-9kK]$/;
  return regex.test(rut);
};

// Limpiar RUT (eliminar puntos y guión) - para enviar a BD
export const limpiarRut = (rut: string): string => {
  return rut.replace(/\./g, '').replace(/-/g, '');
};

// Formatear RUT (solo con guion, sin puntos)
export const formatearRut = (rut: string): string => {
  const rutLimpio = limpiarRut(rut);
  
  if (rutLimpio.length <= 1) return rutLimpio;
  
  const cuerpo = rutLimpio.slice(0, -1);
  const dv = rutLimpio.slice(-1);
  
  return `${cuerpo}-${dv}`;
};

// Validar email
export const validarEmail = (email: string): boolean => {
  const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return regex.test(email);
};

// Validar celular (9 dígitos)
export const validarCelular = (celular: string): boolean => {
  const regex = /^[0-9]{9}$/;
  return regex.test(celular);
};

// Formatear fecha DD/MM/YYYY
export const formatearFecha = (fecha: string): string => {
  if (!fecha) return '';
  const [year, month, day] = fecha.split('-');
  return `${day}/${month}/${year}`;
};

// Convertir fecha DD/MM/YYYY a YYYY-MM-DD
export const convertirFecha = (fecha: string): string => {
  if (!fecha) return '';
  const [day, month, year] = fecha.split('/');
  return `${year}-${month}-${day}`;
};

// Calcular edad
export const calcularEdad = (fechaNacimiento: string): number => {
  const hoy = new Date();
  const nacimiento = new Date(fechaNacimiento);
  let edad = hoy.getFullYear() - nacimiento.getFullYear();
  const mes = hoy.getMonth() - nacimiento.getMonth();
  
  if (mes < 0 || (mes === 0 && hoy.getDate() < nacimiento.getDate())) {
    edad--;
  }
  
  return edad;
};
