// Configuración de Supabase
export const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL || '';
export const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY || '';

// URL base para las edge functions
export const EDGE_FUNCTIONS_URL = `${SUPABASE_URL}/functions/v1`;
