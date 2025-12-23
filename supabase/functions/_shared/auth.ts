import { SupabaseClient } from "https://esm.sh/@supabase/supabase-js@2";

export interface TrabajadorAutenticado {
  id_trabajador: number;
  rut: string;
  rol: string;
  nombre: string;
  apellido: string;
  activo: boolean;
  auth_uid: string;
}

/**
 * Verifica que el request tenga un JWT válido de Supabase Auth
 * y que el usuario esté vinculado a un trabajador activo
 * @param req Request HTTP
 * @param supabaseClient Cliente de Supabase (ANON_KEY con JWT en header)
 * @returns Datos del trabajador autenticado
 * @throws Error si no hay JWT, es inválido, o usuario no es trabajador activo
 */
export async function verificarAutenticacion(
  req: Request,
  supabaseClient: SupabaseClient
): Promise<TrabajadorAutenticado> {
  // Extraer JWT del header Authorization
  const authHeader = req.headers.get('authorization');
  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    throw new Error('No autorizado: falta token de autenticación');
  }

  const jwt = authHeader.replace('Bearer ', '');
  
  // Decodificar JWT para obtener el user_id (sin verificar la firma, Supabase ya lo hizo)
  try {
    const payload = JSON.parse(atob(jwt.split('.')[1]));
    const userId = payload.sub;
    
    if (!userId) {
      throw new Error('JWT inválido: falta subject');
    }

    // Buscar trabajador vinculado a este auth_uid
    const { data: trabajador, error } = await supabaseClient
      .from('trabajador')
      .select('id_trabajador, rut, rol, nombre, apellido, activo, auth_uid')
      .eq('auth_uid', userId)
      .single();

    if (error || !trabajador) {
      throw new Error('Usuario no autorizado como trabajador');
    }

    if (!trabajador.activo) {
      throw new Error('Usuario deshabilitado');
    }

    return trabajador as TrabajadorAutenticado;
  } catch (error) {
    if (error instanceof Error && error.message.includes('autorizado')) {
      throw error;
    }
    throw new Error('No autorizado: token inválido');
  }
}

/**
 * Verifica que el trabajador tenga uno de los roles permitidos
 * @param trabajador Trabajador autenticado
 * @param rolesPermitidos Array de roles permitidos
 * @throws Error si el trabajador no tiene un rol permitido
 */
export function verificarRol(trabajador: TrabajadorAutenticado, rolesPermitidos: string[]) {
  if (!rolesPermitidos.includes(trabajador.rol)) {
    throw new Error(`Acceso denegado: se requiere rol ${rolesPermitidos.join(' o ')}`);
  }
}
