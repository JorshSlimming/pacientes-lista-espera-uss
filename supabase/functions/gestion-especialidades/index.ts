import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    const { action, data, userRole } = await req.json();

    if (action !== 'listar' && userRole !== 'jefe') {
      return new Response(
        JSON.stringify({ error: 'No tienes permisos para esta acción' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? ''
    );

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
        result = { especialidades: organizadas };
        break;

      case 'crear':
        const { data: newEspecialidad, error: createError } = await supabaseClient
          .from('especialidad')
          .insert({
            nombre: data.nombre,
            parent_id: data.parent_id || null,
            nivel: data.nivel
          })
          .select()
          .single();
        
        if (createError) throw createError;
        result = { especialidad: newEspecialidad };
        break;

      case 'actualizar':
        const { data: updatedEspecialidad, error: updateError } = await supabaseClient
          .from('especialidad')
          .update({
            nombre: data.nombre,
            parent_id: data.parent_id || null,
            nivel: data.nivel
          })
          .eq('id_especialidad', data.id_especialidad)
          .select()
          .single();
        
        if (updateError) throw updateError;
        result = { especialidad: updatedEspecialidad };
        break;

      case 'eliminar':
        // Verificar si tiene especialidades hijas
        const { data: hijas } = await supabaseClient
          .from('especialidad')
          .select('id_especialidad')
          .eq('parent_id', data.id_especialidad);
        
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
          .eq('id_especialidad', data.id_especialidad);
        
        if (count && count > 0) {
          return new Response(
            JSON.stringify({ error: 'No se puede eliminar, está en uso por pacientes' }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }

        const { error: deleteError } = await supabaseClient
          .from('especialidad')
          .delete()
          .eq('id_especialidad', data.id_especialidad);
        
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
      JSON.stringify({ success: true, ...result }),
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
