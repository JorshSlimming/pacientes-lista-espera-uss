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
        const { data: instituciones, error: listError } = await supabaseClient
          .from('institucion_convenio')
          .select('*')
          .order('nombre');
        
        if (listError) throw listError;
        result = { data: instituciones };
        break;

      case 'crear':
        if (!data?.nombre) {
          return new Response(
            JSON.stringify({ error: 'Nombre es requerido' }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }
        
        const { data: newInstitucion, error: createError } = await supabaseClient
          .from('institucion_convenio')
          .insert({ tipo: data.tipo, nombre: data.nombre, archivado: data.archivado ?? false })
          .select()
          .single();
        
        if (createError) throw createError;
        result = { data: newInstitucion };
        break;

      case 'actualizar':
        if (!id) {
          return new Response(
            JSON.stringify({ error: 'ID es requerido' }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }
        
        const { data: updatedInstitucion, error: updateError } = await supabaseClient
          .from('institucion_convenio')
          .update(data)
          .eq('id_institucion_convenio', id)
          .select()
          .single();
        
        if (updateError) throw updateError;
        result = { data: updatedInstitucion };
        break;

      case 'archivar':
        if (!id) {
          return new Response(
            JSON.stringify({ error: 'ID es requerido' }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }
        
        const { error: archivarError } = await supabaseClient
          .from('institucion_convenio')
          .update({ archivado: true })
          .eq('id_institucion_convenio', id);
        
        if (archivarError) throw archivarError;
        result = { message: 'Institución archivada exitosamente' };
        break;

      case 'desarchivar':
        if (!id) {
          return new Response(
            JSON.stringify({ error: 'ID es requerido' }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }
        
        const { error: desarchivarError } = await supabaseClient
          .from('institucion_convenio')
          .update({ archivado: false })
          .eq('id_institucion_convenio', id);
        
        if (desarchivarError) throw desarchivarError;
        result = { message: 'Institución desarchivada exitosamente' };
        break;

      case 'eliminar':
        if (!id) {
          return new Response(
            JSON.stringify({ error: 'ID es requerido' }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }
        
        const { count } = await supabaseClient
          .from('paciente')
          .select('*', { count: 'exact', head: true })
          .eq('id_institucion_convenio', id);
        
        if (count && count > 0) {
          return new Response(
            JSON.stringify({ error: 'No se puede eliminar, está en uso por pacientes' }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }

        const { error: deleteError } = await supabaseClient
          .from('institucion_convenio')
          .delete()
          .eq('id_institucion_convenio', id);
        
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
