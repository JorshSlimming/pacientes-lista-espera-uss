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
        const { data: instituciones, error: listError } = await supabaseClient
          .from('institucion_convenio')
          .select('*')
          .order('nombre');
        
        if (listError) throw listError;
        result = { instituciones };
        break;

      case 'crear':
        const { data: newInstitucion, error: createError } = await supabaseClient
          .from('institucion_convenio')
          .insert({ tipo: data.tipo, nombre: data.nombre })
          .select()
          .single();
        
        if (createError) throw createError;
        result = { institucion: newInstitucion };
        break;

      case 'actualizar':
        const { data: updatedInstitucion, error: updateError } = await supabaseClient
          .from('institucion_convenio')
          .update({ tipo: data.tipo, nombre: data.nombre })
          .eq('id_institucion_convenio', data.id_institucion_convenio)
          .select()
          .single();
        
        if (updateError) throw updateError;
        result = { institucion: updatedInstitucion };
        break;

      case 'eliminar':
        const { count } = await supabaseClient
          .from('paciente')
          .select('*', { count: 'exact', head: true })
          .eq('id_institucion_convenio', data.id_institucion_convenio);
        
        if (count && count > 0) {
          return new Response(
            JSON.stringify({ error: 'No se puede eliminar, está en uso por pacientes' }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }

        const { error: deleteError } = await supabaseClient
          .from('institucion_convenio')
          .delete()
          .eq('id_institucion_convenio', data.id_institucion_convenio);
        
        if (deleteError) throw deleteError;
        result = { message: 'Institución eliminada exitosamente' };
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
