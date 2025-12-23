import csv
import re
from datetime import datetime

def limpiar_rut(rut):
    """Limpia y valida el RUT - retorna sin puntos ni guiones"""
    if not rut or rut.strip() == '':
        return None
    # Remover espacios, puntos y guiones
    rut = rut.strip().replace(' ', '').replace('.', '').replace('-', '')
    # Validar que tenga entre 8 y 9 caracteres (7-8 dígitos + K)
    if not re.match(r'^\d{7,8}[\dkK]$', rut):
        return None
    # Retornar en formato limpio (ej: 123456789)
    return rut.upper()

def convertir_fecha(fecha_str):
    """Convierte fecha DD/MM/YYYY a YYYY-MM-DD, retorna NULL si vacía"""
    if not fecha_str or fecha_str.strip() == '':
        return 'NULL'
    try:
        fecha = datetime.strptime(fecha_str.strip(), '%d/%m/%Y')
        return f"'{fecha.strftime('%Y-%m-%d')}'"
    except:
        return 'NULL'

def limpiar_texto(texto):
    """Limpia texto, retorna 'vacio' si está vacío"""
    if not texto or texto.strip() == '':
        return 'vacio'
    # Escapar comillas simples para SQL
    return texto.strip().replace("'", "''")

def normalizar_nombre(texto):
    """Normaliza nombre/apellido: Primera letra mayúscula, resto minúscula"""
    if not texto or texto.strip() == '':
        return None
    
    # Limpiar espacios extras y caracteres extraños
    texto = texto.strip().replace('  ', ' ')
    
    # Casos especiales comunes
    # Si tiene guión o -  (con espacios), tratar como vacío
    if texto in ['-', '-  ', '  -']:
        return None
    
    # Convertir a título (primera letra de cada palabra en mayúscula)
    # Split por espacios y capitalizar cada parte
    partes = texto.split()
    normalizado = ' '.join([parte.capitalize() for parte in partes])
    
    # Escapar comillas simples para SQL
    return normalizado.replace("'", "''")

def contar_llamados(fecha1, fecha2, fecha3):
    """Cuenta cuántos llamados se han realizado (fechas no vacías)"""
    count = 0
    if fecha1 and fecha1.strip():
        count += 1
    if fecha2 and fecha2.strip():
        count += 1
    if fecha3 and fecha3.strip():
        count += 1
    return count

def procesar_csv():
    """Procesa el CSV y genera SQL para importar"""
    
    # Mapeo de especialidades del CSV a BD
    # Este mapeo debe coincidir EXACTAMENTE con los nombres en tu BD
    especialidades_map = {
        # Nivel 1
        'medicina': 'Medicina',
        'odontología': 'Odontología',
        'odontologia': 'Odontología',
        
        # Nivel 2 - Medicina
        'medicina general': 'Medicina General',
        'dermatología': 'Dermatología',
        'dermatologia': 'Dermatología',
        'neurología adulto': 'Neurología Adulto',
        'neurologia adulto': 'Neurología Adulto',
        'neurología pediátrica': 'Neurología Pediátrica',
        'neurologia pediatrica': 'Neurología Pediátrica',
        'otorrinolaringología': 'Otorrinolaringología',
        'otorrinolaringologia': 'Otorrinolaringología',
        'ginecología': 'Ginecología',
        'ginecologia': 'Ginecología',
        'pediatría': 'Pediatría',
        'pediatria': 'Pediatría',
        'psiquiatría': 'Psiquiatría',
        'psiquiatria': 'Psiquiatría',
        'oftalmología': 'Oftalmología',
        'oftalmologia': 'Oftalmología',
        'fonoaudiología': 'Fonoaudiología',
        'fonoaudiologia': 'Fonoaudiología',
        'tm.oftalmología': 'TM.Oftalmología',
        'tm.oftalmologia': 'TM.Oftalmología',
        't.ocupacional': 'T.Ocupacional',
        'kinesiología': 'Kinesiología',
        'kinesiologia': 'Kinesiología',
        
        # Nivel 2 - Odontología
        'o.general': 'O.General',
        'o.especialidades': 'O.Especialidades',
        
        # Nivel 3 - Fonoaudiología
        'audición': 'Audición',
        'audicion': 'Audición',
        'voz': 'Voz',
        'infantil': 'Infantil',  # Fonoaudiología nivel 3
        
        # Nivel 3 - TM.Oftalmología
        'glaucoma': 'Glaucoma',
        'refracción': 'Refracción',
        'refraccion': 'Refracción',
        'estrabismo': 'Estrabismo',
        'evaluación': 'Evaluación',
        'evaluacion': 'Evaluación',
        
        # Nivel 3 - T.Ocupacional
        'adulto': 'Adulto',
        'infantil (to)': 'Infantil (TO)',
        'psicosocial': 'Psicosocial',
        
        # Nivel 3 - Kinesiología
        'musculoesquelética': 'Musculoesquelética',
        'musculoesqueletica': 'Musculoesquelética',
        'neurorehabilitación': 'Neurorehabilitación',
        'neurorehabilitacion': 'Neurorehabilitación',
        'cardiometabólico': 'Cardiometabólico',
        'cardiometabolico': 'Cardiometabólico',
        
        # Nivel 3 - O.General
        'adulto (og)': 'Adulto (OG)',
        'pediátrica': 'Pediátrica',
        'pediatrica': 'Pediátrica',
        
        # Nivel 3 - O.Especialidades
        'endodoncia': 'Endodoncia',
        'ortodoncia': 'Ortodoncia',
        'rehabilitación oral': 'Rehabilitación Oral',
        'rehabilitacion oral': 'Rehabilitación Oral',
        'estética orofacial': 'Estética Orofacial',
        'estetica orofacial': 'Estética Orofacial',
        'implantología': 'Implantología',
        'implantologia': 'Implantología',
    }
    
    especialidades_no_encontradas = set()
    especialidades_usadas = {}
    
    with open('Documentos/bd_uss.csv', 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        
        sql_statements = []
        errores = []
        
        for idx, row in enumerate(reader, start=2):  # start=2 porque línea 1 es header
            try:
                # Validar RUT
                rut = limpiar_rut(row['Rut'])
                if not rut:
                    errores.append(f"Línea {idx}: RUT inválido o vacío - {row['Rut']}")
                    continue
                
                # Datos de contacto
                celular1 = row['Celular 1'].strip().replace(' ', '') if row['Celular 1'].strip() else '000000000'
                celular2 = row['Celular 2'].strip().replace(' ', '') if row['Celular 2'].strip() else '000000000'
                # Validar que tengan exactamente 9 dígitos
                if len(celular1) != 9 or not celular1.isdigit():
                    celular1 = '000000000'
                if len(celular2) != 9 or not celular2.isdigit():
                    celular2 = '000000000'
                correo = row['Correo'].strip() if row['Correo'].strip() else 'correo@vacio.cl'
                correo = correo.replace("'", "''")  # Escapar comillas
                direccion = row['Direccion'].strip() if row['Direccion'].strip() else 'vacio'
                direccion = direccion.replace("'", "''")  # Escapar comillas
                
                # Datos de paciente (normalizar nombres)
                nombre = normalizar_nombre(row['Nombre'])
                if not nombre:
                    errores.append(f"Línea {idx}: Nombre vacío - RUT {rut}")
                    continue
                    
                primer_apellido = normalizar_nombre(row['Primer_Apellido'])
                if not primer_apellido:
                    errores.append(f"Línea {idx}: Primer apellido vacío - RUT {rut}")
                    continue
                
                segundo_apellido_raw = normalizar_nombre(row['Segundo_Apellido'])
                segundo_apellido = f"'{segundo_apellido_raw}'" if segundo_apellido_raw else 'NULL'
                    
                fecha_nacimiento = convertir_fecha(row['Fecha_Nacimiento'])
                # Si no hay fecha de nacimiento, usar 1900-01-01 como default
                if fecha_nacimiento == 'NULL':
                    fecha_nacimiento = "'1900-01-01'"
                comuna_nombre = row['Comuna'].strip() if row['Comuna'].strip() else 'vacio'
                origen_nombre = row['Origen'].strip() if row['Origen'].strip() else 'otros'
                institucion_nombre = row['Institución_Convenio'].strip() if row['Institución_Convenio'].strip() else 'otros'
                
                # Especialidad (usar la más específica: Sub2 > Sub1 > Especialidad)
                especialidad_texto = row['Especialidad'].strip()
                subesp1_texto = row['Subespecialidad_1'].strip()
                subesp2_texto = row['Subespecialidad_2'].strip()
                
                # Usar la subespecialidad más específica disponible
                especialidad_raw = subesp2_texto or subesp1_texto or especialidad_texto
                
                # Normalizar nombre de especialidad
                especialidad_nombre = None
                if especialidad_raw:
                    especialidad_lower = especialidad_raw.lower().strip()
                    # Buscar en el mapa
                    if especialidad_lower in especialidades_map:
                        especialidad_nombre = especialidades_map[especialidad_lower]
                        especialidades_usadas[especialidad_nombre] = especialidades_usadas.get(especialidad_nombre, 0) + 1
                    else:
                        # Registrar como no encontrada
                        especialidades_no_encontradas.add(especialidad_raw)
                        errores.append(f"Línea {idx}: Especialidad '{especialidad_raw}' no mapeada - RUT {rut}")
                        continue
                else:
                    errores.append(f"Línea {idx}: Especialidad vacía - RUT {rut}")
                    continue
                
                # Limpiar y escapar
                especialidad_nombre = limpiar_texto(especialidad_nombre)
                
                # Datos de seguimiento
                fecha_ingreso = convertir_fecha(row['Fecha_Ingreso'])
                # Si no hay fecha de ingreso, usar fecha actual
                if fecha_ingreso == 'NULL':
                    fecha_ingreso = 'CURRENT_DATE'
                # Guardar fechas de llamadas del CSV (convertir de DD/MM/YYYY a YYYY-MM-DD)
                fecha_llamado1 = convertir_fecha(row['Fecha_Primera_Llamada'])
                fecha_llamado2 = convertir_fecha(row['Fecha_Segunda_Llamada'])
                fecha_llamado3 = convertir_fecha(row['Fecha_Tercera_Llamada'])
                # Contar llamados basándose en las fechas del CSV
                numero_llamados = contar_llamados(
                    row['Fecha_Primera_Llamada'], 
                    row['Fecha_Segunda_Llamada'], 
                    row['Fecha_Tercera_Llamada']
                )
                agendado = 'si' if row['Agendado'].strip().lower() == 'si' else 'no'
                # Fecha de citación vacía (NULL)
                fecha_citacion = 'NULL'
                observaciones = limpiar_texto(row['OBS'])
                
                # Generar SQL
                sql = f"""
-- Paciente {idx-1}: {nombre} {primer_apellido} (RUT: {rut})
DO $$
DECLARE
    v_id_contacto INT;
    v_id_paciente INT;
    v_id_comuna INT;
    v_id_origen INT;
    v_id_institucion INT;
    v_id_especialidad INT;
BEGIN
    -- Insertar contacto
    INSERT INTO contacto (correo, direccion, primer_celular, segundo_celular)
    VALUES ('{correo}', '{direccion}', '{celular1}', '{celular2}')
    RETURNING id_contacto INTO v_id_contacto;
    
    -- Obtener ID de comuna (crear si no existe)
    SELECT id_comuna INTO v_id_comuna FROM comuna WHERE nombre ILIKE '{comuna_nombre}' LIMIT 1;
    IF v_id_comuna IS NULL THEN
        INSERT INTO comuna (nombre) VALUES ('{comuna_nombre}') 
        ON CONFLICT (nombre) DO UPDATE SET nombre = EXCLUDED.nombre
        RETURNING id_comuna INTO v_id_comuna;
    END IF;
    
    -- Obtener ID de origen (crear si no existe)
    SELECT id_origen INTO v_id_origen FROM origen WHERE nombre ILIKE '{origen_nombre}' LIMIT 1;
    IF v_id_origen IS NULL THEN
        INSERT INTO origen (nombre, requiere_ci) VALUES ('{origen_nombre}', false) 
        ON CONFLICT (nombre) DO UPDATE SET nombre = EXCLUDED.nombre
        RETURNING id_origen INTO v_id_origen;
    END IF;
    
    -- Obtener ID de institución (crear si no existe)
    SELECT id_institucion_convenio INTO v_id_institucion FROM institucion_convenio WHERE nombre ILIKE '{institucion_nombre}' LIMIT 1;
    IF v_id_institucion IS NULL THEN
        INSERT INTO institucion_convenio (nombre, tipo) VALUES ('{institucion_nombre}', 'institucion') 
        ON CONFLICT (nombre) DO UPDATE SET nombre = EXCLUDED.nombre
        RETURNING id_institucion_convenio INTO v_id_institucion;
    END IF;
    
    -- Obtener ID de especialidad (buscar por nombre exacto, case insensitive)
    -- IMPORTANTE: NO usar default si no encuentra, fallar explícitamente
    SELECT id_especialidad INTO v_id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE '{especialidad_nombre}' 
    LIMIT 1;
    
    IF v_id_especialidad IS NULL THEN
        RAISE EXCEPTION 'Especialidad no encontrada: {especialidad_nombre}';
    END IF;
    
    -- Insertar paciente
    INSERT INTO paciente (rut, nombre, primer_apellido, segundo_apellido, fecha_nacimiento, 
                         obs, id_comuna, id_origen, id_institucion_convenio, id_contacto)
    VALUES ('{rut}', '{nombre}', '{primer_apellido}', {segundo_apellido}, {fecha_nacimiento},
            '{observaciones}', v_id_comuna, v_id_origen, v_id_institucion, v_id_contacto)
    ON CONFLICT (rut) DO UPDATE 
    SET nombre = EXCLUDED.nombre,
        primer_apellido = EXCLUDED.primer_apellido,
        segundo_apellido = EXCLUDED.segundo_apellido
    RETURNING id_paciente INTO v_id_paciente;
    
    -- Insertar seguimiento con id_ejecutivo_ingreso = 1 (tu usuario)
    INSERT INTO seguimiento (id_paciente, fecha_ingreso, fecha_primera_llamada, fecha_segunda_llamada, 
                            fecha_tercera_llamada, numero_llamado, agendado, fecha_citacion, 
                            id_especialidad, id_ejecutivo_ingreso)
    VALUES (v_id_paciente, {fecha_ingreso}, {fecha_llamado1}, {fecha_llamado2}, 
            {fecha_llamado3}, {numero_llamados}, '{agendado}', {fecha_citacion}, 
            v_id_especialidad, 1)
    ON CONFLICT DO NOTHING;
            
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error en paciente {rut}: %', SQLERRM;
        RAISE;
END $$;
"""
                sql_statements.append(sql)
                
            except Exception as e:
                errores.append(f"Línea {idx}: Error - {str(e)}")
        
        # Guardar errores
        if errores:
            with open('scripts/errores_importacion.txt', 'w', encoding='utf-8') as f:
                f.write("ERRORES ENCONTRADOS DURANTE EL PROCESAMIENTO\n")
                f.write("=" * 80 + "\n\n")
                f.write('\n'.join(errores))
                f.write("\n\n" + "=" * 80 + "\n")
                f.write(f"Total de errores: {len(errores)}\n")
        
        # Mostrar reporte
        print("\n" + "="*80)
        print("📊 REPORTE DE PROCESAMIENTO CSV → SQL")
        print("="*80)
        
        print(f"\n✅ Pacientes procesados exitosamente: {len(sql_statements)}")
        print(f"❌ Errores encontrados: {len(errores)}")
        
        if especialidades_usadas:
            print("\n📋 Especialidades utilizadas:")
            for esp, count in sorted(especialidades_usadas.items()):
                print(f"  • {esp}: {count} pacientes")
        
        if especialidades_no_encontradas:
            print("\n⚠️  ESPECIALIDADES NO MAPEADAS:")
            for esp in sorted(especialidades_no_encontradas):
                print(f"  • {esp}")
            print("\nEstas especialidades deben agregarse al mapeo en el script")
            print("o crearse primero en la BD antes de importar.")
        
        if errores:
            print("\n⚠️  Ver detalles de errores en: scripts/errores_importacion.txt")
        
        print("\n" + "="*80)
        print("CARACTERÍSTICAS DEL SQL GENERADO:")
        print("="*80)
        print("  ✓ Nombres y apellidos con formato de título (Primera Letra Mayúscula)")
        print("  ✓ Fechas de llamadas: Desde CSV (DD/MM/YYYY → YYYY-MM-DD)")
        print("  ✓ Fechas de citación: NULL (vacías)")
        print("  ✓ Fecha de nacimiento default: 1900-01-01 (si está vacía)")
        print("  ✓ ID ejecutivo ingreso: 1 (tu usuario)")
        print("  ✓ Número de llamados: Calculado desde CSV")
        print("  ✓ Sin defaults para especialidades - falla si no existe")
        print("="*80)
        
        if len(sql_statements) == 0:
            print("\n❌ No se generó ningún registro SQL. Revisa los errores.")
            return
        
        print(f"\n¿Deseas generar el archivo SQL con {len(sql_statements)} pacientes? (s/n): ", end='')
        respuesta = input().lower()
        
        if respuesta != 's':
            print("❌ Generación cancelada")
            return
        
        # Guardar SQL
        timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
        filename = f'supabase/migrations/{timestamp}_importar_datos_csv.sql'
        
        with open(filename, 'w', encoding='utf-8') as f:
            f.write("-- Importación de datos desde bd_uss.csv\n")
            f.write(f"-- Total de registros: {len(sql_statements)}\n")
            f.write(f"-- Fecha: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write("-- \n")
            f.write("-- CARACTERÍSTICAS:\n")
            f.write("--   - Nombres y apellidos en formato título (Primera Letra Mayúscula)\n")
            f.write("--   - Fechas de llamadas: Desde CSV (DD/MM/YYYY → YYYY-MM-DD)\n")
            f.write("--   - Fechas de citación: NULL\n")
            f.write("--   - Fecha nacimiento default: 1900-01-01 (si vacía)\n")
            f.write("--   - ID ejecutivo ingreso: 1\n")
            f.write("--   - Sin defaults de especialidad (falla si no existe)\n")
            f.write("-- \n\n")
            
            f.write('\n'.join(sql_statements))
        
        print(f"\n✅ Archivo SQL generado exitosamente!")
        print(f"📁 Ubicación: {filename}")
        print(f"\n📤 Para ejecutarlo en Supabase:")
        print(f"   1. Abre SQL Editor en tu proyecto Supabase")
        print(f"   2. Copia y pega el contenido del archivo")
        print(f"   3. Ejecuta el script")
        print("\n" + "="*80)

if __name__ == '__main__':
    procesar_csv()
