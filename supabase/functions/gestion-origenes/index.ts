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
        const { data: origenes, error: listError } = await supabaseClient
          .from('origen')
          .select('*')
          .order('nombre');
        
        if (listError) throw listError;
        result = { origenes };
        break;

      case 'crear':
        const { data: newOrigen, error: createError } = await supabaseClient
          .from('origen')
          .insert({ nombre: data.nombre, requiere_ci: data.requiere_ci })
          .select()
          .single();
        
        if (createError) throw createError;
        result = { origen: newOrigen };
        break;

      case 'actualizar':
        const { data: updatedOrigen, error: updateError } = await supabaseClient
          .from('origen')
          .update({ nombre: data.nombre, requiere_ci: data.requiere_ci })
          .eq('id_origen', data.id_origen)
          .select()
          .single();
        
        if (updateError) throw updateError;
        result = { origen: updatedOrigen };
        break;

      case 'eliminar':
        const { count } = await supabaseClient
          .from('paciente')
          .select('*', { count: 'exact', head: true })
          .eq('id_origen', data.id_origen);
        
        if (count && count > 0) {
          return new Response(
            JSON.stringify({ error: 'No se puede eliminar, está en uso por pacientes' }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }

        const { error: deleteError } = await supabaseClient
          .from('origen')
          .delete()
          .eq('id_origen', data.id_origen);
        
        if (deleteError) throw deleteError;
        result = { message: 'Origen eliminado exitosamente' };
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
