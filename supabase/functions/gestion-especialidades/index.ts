import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { verificarAutenticacion, verificarRol } from "../_shared/auth.ts";

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    );

    // Verificar autenticación
    const trabajador = await verificarAutenticacion(req, supabaseClient);

    const { action, id, data } = await req.json();

    if (action !== 'listar') {
      verificarRol(trabajador, ['jefe']);
    }

    let result;

    switch (action) {
      case 'listar':
        const { data: especialidades, error: listError } = await supabaseClient
          .from('especialidad')
          .select('*')
          .order('nivel')
          .order('nombre');
        
        if (listError) throw listError;
        
        // Organizar jerárquicamente
        const organizadas = organizarJerarquicamente(especialidades);
        result = { data: organizadas };
        break;

      case 'crear':
        if (!data?.nombre) {
          return new Response(
            JSON.stringify({ error: 'Nombre es requerido' }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }
        
        const { data: newEspecialidad, error: createError } = await supabaseClient
          .from('especialidad')
          .insert({
            nombre: data.nombre,
            parent_id: data.parent_id || null,
            nivel: data.nivel,
            archivado: data.archivado ?? false
          })
          .select()
          .single();
        
        if (createError) throw createError;
        result = { data: newEspecialidad };
        break;

      case 'actualizar':
        if (!id) {
          return new Response(
            JSON.stringify({ error: 'ID es requerido' }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }
        
        const { data: updatedEspecialidad, error: updateError } = await supabaseClient
          .from('especialidad')
          .update(data)
          .eq('id_especialidad', id)
          .select()
          .single();
        
        if (updateError) throw updateError;
        result = { data: updatedEspecialidad };
        break;

      case 'archivar':
        if (!id) {
          return new Response(
            JSON.stringify({ error: 'ID es requerido' }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }
        
        const { error: archivarError } = await supabaseClient
          .from('especialidad')
          .update({ archivado: true })
          .eq('id_especialidad', id);
        
        if (archivarError) throw archivarError;
        result = { message: 'Especialidad archivada exitosamente' };
        break;

      case 'desarchivar':
        if (!id) {
          return new Response(
            JSON.stringify({ error: 'ID es requerido' }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }
        
        const { error: desarchivarError } = await supabaseClient
          .from('especialidad')
          .update({ archivado: false })
          .eq('id_especialidad', id);
        
        if (desarchivarError) throw desarchivarError;
        result = { message: 'Especialidad desarchivada exitosamente' };
        break;

      case 'eliminar':
        if (!id) {
          return new Response(
            JSON.stringify({ error: 'ID es requerido' }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }
        
        // Verificar si tiene especialidades hijas
        const { data: hijas } = await supabaseClient
          .from('especialidad')
          .select('id_especialidad')
          .eq('parent_id', id);
        
        if (hijas && hijas.length > 0) {
          return new Response(
            JSON.stringify({ error: 'No se puede eliminar, tiene especialidades dependientes' }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }

        // Verificar si está en uso por pacientes
        const { count } = await supabaseClient
          .from('seguimiento')
          .select('*', { count: 'exact', head: true })
          .eq('id_especialidad', id);
        
        if (count && count > 0) {
          return new Response(
            JSON.stringify({ error: 'No se puede eliminar, está en uso por pacientes' }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }

        const { error: deleteError } = await supabaseClient
          .from('especialidad')
          .delete()
          .eq('id_especialidad', id);
        
        if (deleteError) throw deleteError;
        result = { message: 'Especialidad eliminada exitosamente' };
        break;

      default:
        return new Response(
          JSON.stringify({ error: 'Acción no válida' }),
          { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }

    return new Response(
      JSON.stringify(result),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );

  } catch (error) {
    return new Response(
      JSON.stringify({ error: error.message }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});

function organizarJerarquicamente(especialidades: any[]) {
  const nivel1 = especialidades.filter(e => e.nivel === 1);
  
  return nivel1.map(n1 => ({
    ...n1,
    hijos: especialidades
      .filter(e => e.nivel === 2 && e.parent_id === n1.id_especialidad)
      .map(n2 => ({
        ...n2,
        hijos: especialidades.filter(e => e.nivel === 3 && e.parent_id === n2.id_especialidad)
      }))
  }));
}
