import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { verificarAutenticacion } from "../_shared/auth.ts";

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
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      {
        auth: {
          autoRefreshToken: false,
          persistSession: false
        },
        global: {
          headers: { Authorization: req.headers.get('Authorization')! }
        }
      }
    );

    // Verificar autenticación
    await verificarAutenticacion(req, supabaseClient);

    const { rut } = await req.json();

    // Limpiar RUT (quitar puntos y guiones)
    const rutLimpio = rut.replace(/\./g, '').replace(/-/g, '');
    
    console.log('🔍 Buscando paciente:', { rutOriginal: rut, rutLimpio });

    // Buscar paciente con todos sus datos relacionados
    const { data: paciente, error: pacienteError } = await supabaseClient
      .from('paciente')
      .select(`
        *,
        contacto:id_contacto (*),
        comuna:id_comuna (*),
        origen:id_origen (*),
        institucion:id_institucion_convenio (*),
        seguimiento (
          *,
          especialidad:id_especialidad (*),
          ejecutivo:id_ejecutivo_ingreso (
            id_trabajador,
            rut,
            nombre,
            apellido
          )
        )
      `)
      .eq('rut', rutLimpio)
      .single();

    console.log('📊 Resultado búsqueda:', { 
      encontrado: !!paciente, 
      error: pacienteError?.message,
      rut: rutLimpio 
    });

    if (pacienteError || !paciente) {
      return new Response(
        JSON.stringify({ error: 'Paciente no encontrado' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Devolver el paciente con TODOS sus seguimientos
    return new Response(
      JSON.stringify(paciente),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );

  } catch (error) {
    return new Response(
      JSON.stringify({ error: error.message }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});
