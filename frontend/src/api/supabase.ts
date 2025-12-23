// Cliente de Supabase para acceso directo y autenticación
import { createClient } from '@supabase/supabase-js';
import { SUPABASE_URL, SUPABASE_ANON_KEY } from '../config';

console.log('🔑 SUPABASE_URL:', SUPABASE_URL);
console.log('🔑 SUPABASE_ANON_KEY:', SUPABASE_ANON_KEY);

// Cliente de Supabase con persistencia de sesión
export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
  auth: {
    autoRefreshToken: true,
    persistSession: true,
    detectSessionInUrl: false
  }
});
