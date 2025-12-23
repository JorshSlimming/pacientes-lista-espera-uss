"""
Script mejorado para importar CSV de pacientes a SQL
Versión: 2.0
Mejoras:
- Usa NULL real donde es posible
- Agrega "CORREGIR DATOS" en OBS cuando hay datos vacíos
- Registra en tabla auditoria cada importación
- Mejor manejo de errores
- Validación de trabajador id=1
"""

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
    """Limpia texto, retorna None si está vacío"""
    if not texto or texto.strip() == '':
        return None
    # Escapar comillas simples para SQL
    return texto.strip().replace("'", "''")

def normalizar_nombre(texto):
    """Normaliza nombre/apellido: Primera letra mayúscula, resto minúscula"""
    if not texto or texto.strip() == '':
        return None
    
    # Limpiar espacios extras y caracteres extraños
    texto = texto.strip().replace('  ', ' ')
    
    # Casos especiales comunes
    if texto in ['-', '-  ', '  -']:
        return None
    
    # Convertir a título (primera letra de cada palabra en mayúscula)
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
    
    # Estructura de especialidades de la BD (con jerarquía)
    # Formato: 'nombre': {'id': X, 'parent_id': Y, 'nivel': Z}
    especialidades_bd = {
        # Nivel 1
        'medicina': {'id': 1, 'parent_id': None, 'nivel': 1},
        'odontología': {'id': 2, 'parent_id': None, 'nivel': 1},
        'odontologia': {'id': 2, 'parent_id': None, 'nivel': 1},
        
        # Nivel 2 - Medicina (parent_id=1)
        'medicina general': {'id': 3, 'parent_id': 1, 'nivel': 2},
        'dermatología': {'id': 4, 'parent_id': 1, 'nivel': 2},
        'dermatologia': {'id': 4, 'parent_id': 1, 'nivel': 2},
        'neurología adulto': {'id': 5, 'parent_id': 1, 'nivel': 2},
        'neurologia adulto': {'id': 5, 'parent_id': 1, 'nivel': 2},
        'neurología pediátrica': {'id': 6, 'parent_id': 1, 'nivel': 2},
        'neurologia pediatrica': {'id': 6, 'parent_id': 1, 'nivel': 2},
        'otorrinolaringología': {'id': 7, 'parent_id': 1, 'nivel': 2},
        'otorrinolaringologia': {'id': 7, 'parent_id': 1, 'nivel': 2},
        'ginecología': {'id': 8, 'parent_id': 1, 'nivel': 2},
        'ginecologia': {'id': 8, 'parent_id': 1, 'nivel': 2},
        'pediatría': {'id': 9, 'parent_id': 1, 'nivel': 2},
        'pediatria': {'id': 9, 'parent_id': 1, 'nivel': 2},
        'psiquiatría': {'id': 10, 'parent_id': 1, 'nivel': 2},
        'psiquiatria': {'id': 10, 'parent_id': 1, 'nivel': 2},
        'oftalmología': {'id': 11, 'parent_id': 1, 'nivel': 2},
        'oftalmologia': {'id': 11, 'parent_id': 1, 'nivel': 2},
        'fonoaudiología': {'id': 12, 'parent_id': 1, 'nivel': 2},
        'fonoaudiologia': {'id': 12, 'parent_id': 1, 'nivel': 2},
        'tm.oftalmología': {'id': 13, 'parent_id': 1, 'nivel': 2},
        'tm.oftalmologia': {'id': 13, 'parent_id': 1, 'nivel': 2},
        't.ocupacional': {'id': 14, 'parent_id': 1, 'nivel': 2},
        'kinesiología': {'id': 15, 'parent_id': 1, 'nivel': 2},
        'kinesiologia': {'id': 15, 'parent_id': 1, 'nivel': 2},
        
        # Nivel 2 - Odontología (parent_id=2)
        'o.general': {'id': 16, 'parent_id': 2, 'nivel': 2},
        'o.especialidades': {'id': 17, 'parent_id': 2, 'nivel': 2},
        
        # Nivel 3 - Fonoaudiología (parent_id=12)
        'audición': {'id': 18, 'parent_id': 12, 'nivel': 3},
        'audicion': {'id': 18, 'parent_id': 12, 'nivel': 3},
        'voz': {'id': 19, 'parent_id': 12, 'nivel': 3},
        'infantil': {'id': 20, 'parent_id': 12, 'nivel': 3},
        
        # Nivel 3 - TM.Oftalmología (parent_id=13)
        'glaucoma': {'id': 21, 'parent_id': 13, 'nivel': 3},
        'refracción': {'id': 22, 'parent_id': 13, 'nivel': 3},
        'refraccion': {'id': 22, 'parent_id': 13, 'nivel': 3},
        'estrabismo': {'id': 23, 'parent_id': 13, 'nivel': 3},
        'evaluación': {'id': 24, 'parent_id': 13, 'nivel': 3},
        'evaluacion': {'id': 24, 'parent_id': 13, 'nivel': 3},
        
        # Nivel 3 - T.Ocupacional (parent_id=14)
        'adulto': {'id': 25, 'parent_id': 14, 'nivel': 3},
        'infantil (to)': {'id': 26, 'parent_id': 14, 'nivel': 3},
        'psicosocial': {'id': 27, 'parent_id': 14, 'nivel': 3},
        
        # Nivel 3 - Kinesiología (parent_id=15)
        'musculoesquelética': {'id': 28, 'parent_id': 15, 'nivel': 3},
        'musculoesqueletica': {'id': 28, 'parent_id': 15, 'nivel': 3},
        'neurorehabilitación': {'id': 29, 'parent_id': 15, 'nivel': 3},
        'neurorehabilitacion': {'id': 29, 'parent_id': 15, 'nivel': 3},
        'cardiometabólico': {'id': 30, 'parent_id': 15, 'nivel': 3},
        'cardiometabolico': {'id': 30, 'parent_id': 15, 'nivel': 3},
        
        # Nivel 3 - O.General (parent_id=16)
        'adulto (og)': {'id': 31, 'parent_id': 16, 'nivel': 3},
        'pediátrica': {'id': 32, 'parent_id': 16, 'nivel': 3},
        'pediatrica': {'id': 32, 'parent_id': 16, 'nivel': 3},
        
        # Nivel 3 - O.Especialidades (parent_id=17)
        'endodoncia': {'id': 33, 'parent_id': 17, 'nivel': 3},
        'ortodoncia': {'id': 34, 'parent_id': 17, 'nivel': 3},
        'rehabilitación oral': {'id': 35, 'parent_id': 17, 'nivel': 3},
        'rehabilitacion oral': {'id': 35, 'parent_id': 17, 'nivel': 3},
        'estética orofacial': {'id': 36, 'parent_id': 17, 'nivel': 3},
        'estetica orofacial': {'id': 36, 'parent_id': 17, 'nivel': 3},
        'implantología': {'id': 37, 'parent_id': 17, 'nivel': 3},
        'implantologia': {'id': 37, 'parent_id': 17, 'nivel': 3},
    }
    
    # Mapeo inverso: id -> nombre (para mostrar en reportes)
    especialidades_por_id = {
        1: 'Medicina', 2: 'Odontología',
        3: 'Medicina General', 4: 'Dermatología', 5: 'Neurología Adulto',
        6: 'Neurología Pediátrica', 7: 'Otorrinolaringología', 8: 'Ginecología',
        9: 'Pediatría', 10: 'Psiquiatría', 11: 'Oftalmología',
        12: 'Fonoaudiología', 13: 'TM.Oftalmología', 14: 'T.Ocupacional',
        15: 'Kinesiología', 16: 'O.General', 17: 'O.Especialidades',
        18: 'Audición', 19: 'Voz', 20: 'Infantil',
        21: 'Glaucoma', 22: 'Refracción', 23: 'Estrabismo', 24: 'Evaluación',
        25: 'Adulto', 26: 'Infantil (TO)', 27: 'Psicosocial',
        28: 'Musculoesquelética', 29: 'Neurorehabilitación', 30: 'Cardiometabólico',
        31: 'Adulto (OG)', 32: 'Pediátrica',
        33: 'Endodoncia', 34: 'Ortodoncia', 35: 'Rehabilitación Oral',
        36: 'Estética Orofacial', 37: 'Implantología'
    }
    
    # Mapeo de especialidades del CSV a BD (solo nombres, para compatibilidad)
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
        'infantil': 'Infantil',
        
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
    especialidades_csv_todas = {}  # Para reportar TODAS las del CSV
    jerarquias_encontradas = {}  # Para reportar jerarquías completas
    
    with open('Documentos/bd_uss.csv', 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        
        sql_statements = []
        errores = []
        pacientes_con_errores = []  # Para CSV de errores
        
        for idx, row in enumerate(reader, start=2):
            try:
                # Validar RUT
                rut = limpiar_rut(row['Rut'])
                if not rut:
                    errores.append(f"Línea {idx}: RUT inválido o vacío - {row['Rut']}")
                    pacientes_con_errores.append({
                        'linea': idx,
                        'error': 'RUT inválido o vacío',
                        **row
                    })
                    continue
                
                # Flag para detectar datos vacíos
                tiene_datos_vacios = False
                
                # Datos de contacto
                celular1_raw = row['Celular 1'].strip().replace(' ', '')
                celular2_raw = row['Celular 2'].strip().replace(' ', '')
                
                # Validar celulares (pueden ser NULL)
                if not celular1_raw or len(celular1_raw) != 9 or not celular1_raw.isdigit():
                    celular1 = '000000000'
                    tiene_datos_vacios = True
                else:
                    celular1 = celular1_raw
                
                if not celular2_raw or len(celular2_raw) != 9 or not celular2_raw.isdigit():
                    celular2 = '000000000'
                    tiene_datos_vacios = True
                else:
                    celular2 = celular2_raw
                
                # Correo (NOT NULL, usar default)
                correo_raw = row['Correo'].strip()
                if not correo_raw:
                    correo = 'sin-correo@vacio.cl'
                    tiene_datos_vacios = True
                else:
                    correo = correo_raw.replace("'", "''")
                
                # Dirección (NOT NULL, usar default)
                direccion_raw = row['Direccion'].strip()
                if not direccion_raw:
                    direccion = 'Vacio'
                    tiene_datos_vacios = True
                else:
                    direccion = direccion_raw.replace("'", "''")
                
                # Datos de paciente (usar "vacio" si están vacíos)
                nombre = normalizar_nombre(row['Nombre'])
                if not nombre:
                    nombre = 'Vacio'
                    tiene_datos_vacios = True
                    # NO registrar como error crítico
                    
                primer_apellido = normalizar_nombre(row['Primer_Apellido'])
                if not primer_apellido:
                    primer_apellido = 'Vacio'
                    tiene_datos_vacios = True
                    # NO registrar como error crítico
                
                # Segundo apellido (puede ser NULL)
                segundo_apellido_raw = normalizar_nombre(row['Segundo_Apellido'])
                segundo_apellido = f"'{segundo_apellido_raw}'" if segundo_apellido_raw else 'NULL'
                if not segundo_apellido_raw:
                    tiene_datos_vacios = True
                
                # Fecha de nacimiento (NOT NULL, usar default 1900-01-01)
                fecha_nacimiento = convertir_fecha(row['Fecha_Nacimiento'])
                if fecha_nacimiento == 'NULL':
                    fecha_nacimiento = "'1900-01-01'"
                    tiene_datos_vacios = True
                
                # Comuna (NOT NULL, usar "vacio")
                comuna_nombre_raw = row['Comuna'].strip()
                if not comuna_nombre_raw:
                    comuna_nombre = 'vacio'
                    tiene_datos_vacios = True
                else:
                    comuna_nombre = comuna_nombre_raw.replace("'", "''")
                
                # Origen (NOT NULL, usar "vacio")
                origen_nombre_raw = row['Origen'].strip()
                if not origen_nombre_raw:
                    origen_nombre = 'vacio'
                    tiene_datos_vacios = True
                else:
                    origen_nombre = origen_nombre_raw.replace("'", "''")
                
                # Institución (puede ser NULL)
                institucion_nombre_raw = row['Institución_Convenio'].strip()
                if not institucion_nombre_raw:
                    institucion_nombre = 'vacio'
                    tiene_datos_vacios = True
                else:
                    institucion_nombre = institucion_nombre_raw.replace("'", "''")
                
                # Especialidad (procesar jerarquía completa)
                especialidad_texto = row['Especialidad'].strip()
                subesp1_texto = row['Subespecialidad_1'].strip()
                subesp2_texto = row['Subespecialidad_2'].strip()
                
                # Registrar TODAS las especialidades del CSV para el reporte
                if especialidad_texto:
                    esp_lower = especialidad_texto.lower().strip()
                    if esp_lower in especialidades_bd:
                        esp_id = especialidades_bd[esp_lower]['id']
                        esp_nombre = especialidades_por_id[esp_id]
                        especialidades_csv_todas[esp_nombre] = especialidades_csv_todas.get(esp_nombre, 0) + 1
                
                if subesp1_texto:
                    esp_lower = subesp1_texto.lower().strip()
                    if esp_lower in especialidades_bd:
                        esp_id = especialidades_bd[esp_lower]['id']
                        esp_nombre = especialidades_por_id[esp_id]
                        especialidades_csv_todas[esp_nombre] = especialidades_csv_todas.get(esp_nombre, 0) + 1
                
                if subesp2_texto:
                    esp_lower = subesp2_texto.lower().strip()
                    if esp_lower in especialidades_bd:
                        esp_id = especialidades_bd[esp_lower]['id']
                        esp_nombre = especialidades_por_id[esp_id]
                        especialidades_csv_todas[esp_nombre] = especialidades_csv_todas.get(esp_nombre, 0) + 1
                
                # Usar la subespecialidad más específica disponible para guardar en BD
                especialidad_raw = subesp2_texto or subesp1_texto or especialidad_texto
                
                # Validar y obtener datos de la especialidad
                especialidad_id = None
                especialidad_nombre = None
                if especialidad_raw:
                    especialidad_lower = especialidad_raw.lower().strip()
                    if especialidad_lower in especialidades_bd:
                        esp_data = especialidades_bd[especialidad_lower]
                        especialidad_id = esp_data['id']
                        especialidad_nombre = especialidades_por_id[especialidad_id]
                        
                        # Registrar para estadísticas de lo que se guardará
                        especialidades_usadas[especialidad_nombre] = especialidades_usadas.get(especialidad_nombre, 0) + 1
                        
                        # Registrar jerarquía completa
                        jerarquia_key = f"{especialidad_texto} > {subesp1_texto} > {subesp2_texto}"
                        jerarquias_encontradas[jerarquia_key] = jerarquias_encontradas.get(jerarquia_key, 0) + 1
                    else:
                        especialidades_no_encontradas.add(especialidad_raw)
                        errores.append(f"Línea {idx}: Especialidad '{especialidad_raw}' no mapeada - RUT {rut}")
                        pacientes_con_errores.append({
                            'linea': idx,
                            'error': f"Especialidad '{especialidad_raw}' no mapeada",
                            **row
                        })
                        continue
                else:
                    errores.append(f"Línea {idx}: Especialidad vacía - RUT {rut}")
                    pacientes_con_errores.append({
                        'linea': idx,
                        'error': 'Especialidad vacía',
                        **row
                    })
                    continue
                
                # Validar jerarquía (opcional, para detectar inconsistencias)
                if subesp1_texto and especialidad_texto:
                    esp1_lower = especialidad_texto.lower().strip()
                    sub1_lower = subesp1_texto.lower().strip()
                    if esp1_lower in especialidades_bd and sub1_lower in especialidades_bd:
                        parent_esperado = especialidades_bd[esp1_lower]['id']
                        parent_real = especialidades_bd[sub1_lower].get('parent_id')
                        if parent_real != parent_esperado:
                            errores.append(f"Línea {idx}: Jerarquía inconsistente - '{subesp1_texto}' no es hijo de '{especialidad_texto}'")
                
                especialidad_nombre = especialidad_nombre.replace("'", "''")
                
                # Datos de seguimiento
                fecha_ingreso = convertir_fecha(row['Fecha_Ingreso'])
                if fecha_ingreso == 'NULL':
                    fecha_ingreso = 'CURRENT_DATE'
                    tiene_datos_vacios = True
                
                fecha_llamado1 = convertir_fecha(row['Fecha_Primera_Llamada'])
                fecha_llamado2 = convertir_fecha(row['Fecha_Segunda_Llamada'])
                fecha_llamado3 = convertir_fecha(row['Fecha_Tercera_Llamada'])
                
                numero_llamados = contar_llamados(
                    row['Fecha_Primera_Llamada'], 
                    row['Fecha_Segunda_Llamada'], 
                    row['Fecha_Tercera_Llamada']
                )
                
                agendado_raw = row['Agendado'].strip().lower()
                agendado = 'si' if agendado_raw == 'si' else 'no'
                
                # Fecha de citación (puede ser NULL)
                fecha_citacion = convertir_fecha(row['Fecha_Citacion'])
                
                # Observaciones
                observaciones_raw = limpiar_texto(row['OBS'])
                if observaciones_raw:
                    observaciones = observaciones_raw
                else:
                    observaciones = ''
                    tiene_datos_vacios = True
                
                # Agregar "CORREGIR DATOS" si hay datos vacíos
                if tiene_datos_vacios:
                    if observaciones:
                        observaciones += ' - CORREGIR DATOS'
                    else:
                        observaciones = 'CORREGIR DATOS'
                    # NO agregar a CSV de errores, solo es advertencia
                
                # Escapar observaciones para SQL
                observaciones = observaciones.replace("'", "''")
                
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
    v_id_seguimiento INT;
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
    
    -- Obtener ID de especialidad (debe existir)
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
        segundo_apellido = EXCLUDED.segundo_apellido,
        obs = EXCLUDED.obs
    RETURNING id_paciente INTO v_id_paciente;
    
    -- Insertar seguimiento con id_ejecutivo_ingreso = 1
    INSERT INTO seguimiento (id_paciente, fecha_ingreso, fecha_primera_llamada, fecha_segunda_llamada, 
                            fecha_tercera_llamada, numero_llamado, agendado, fecha_citacion, 
                            id_especialidad, id_ejecutivo_ingreso)
    VALUES (v_id_paciente, {fecha_ingreso}, {fecha_llamado1}, {fecha_llamado2}, 
            {fecha_llamado3}, {numero_llamados}, '{agendado}', {fecha_citacion}, 
            v_id_especialidad, 1)
    ON CONFLICT DO NOTHING
    RETURNING id_seguimiento INTO v_id_seguimiento;
    
    -- Registrar en auditoría
    IF v_id_seguimiento IS NOT NULL THEN
        INSERT INTO auditoria (fecha_modificacion, campo_modificado, valor_nuevo, valor_modificado, id_trabajador, id_seguimiento)
        VALUES (CURRENT_TIMESTAMP, 'importacion excel', 'registro', 'registro', 1, v_id_seguimiento);
    END IF;
            
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error en paciente {rut}: %', SQLERRM;
        RAISE;
END $$;
"""
                sql_statements.append(sql)
                
            except Exception as e:
                errores.append(f"Línea {idx}: Error inesperado - {str(e)}")
                pacientes_con_errores.append({
                    'linea': idx,
                    'error': f"Error inesperado: {str(e)}",
                    **row
                })
        
        # Guardar errores en TXT (solo errores críticos)
        if errores:
            with open('scripts/errores_importacion.txt', 'w', encoding='utf-8') as f:
                f.write("ERRORES CRÍTICOS ENCONTRADOS DURANTE EL PROCESAMIENTO\n")
                f.write("=" * 80 + "\n")
                f.write("Estos pacientes NO se procesarán o tienen problemas graves\n")
                f.write("=" * 80 + "\n\n")
                f.write('\n'.join(errores))
                f.write("\n\n" + "=" * 80 + "\n")
                f.write(f"Total de errores críticos: {len(errores)}\n")
                f.write("\nNOTA: Pacientes con datos vacíos (nombre/apellido 'Vacio', etc.)\n")
                f.write("      se procesan normalmente con 'CORREGIR DATOS' en OBS.\n")
        
        # Guardar pacientes con errores en CSV (solo errores críticos)
        if pacientes_con_errores:
            with open('scripts/pacientes_con_errores.csv', 'w', encoding='utf-8', newline='') as f:
                # Obtener todas las columnas (linea, error + columnas del CSV original)
                fieldnames = ['linea', 'error'] + list(pacientes_con_errores[0].keys())[2:]
                writer = csv.DictWriter(f, fieldnames=fieldnames)
                writer.writeheader()
                writer.writerows(pacientes_con_errores)
                
            print(f"\n⚠️  IMPORTANTE: El CSV de errores contiene {len(pacientes_con_errores)} pacientes")
            print("    que NO se procesarán debido a errores críticos (RUT inválido,")
            print("    especialidad no encontrada, etc.)")
        
        # Mostrar reporte
        print("\n" + "="*80)
        print("📊 REPORTE DE PROCESAMIENTO CSV → SQL (VERSIÓN MEJORADA)")
        print("="*80)
        
        print(f"\n✅ Pacientes procesados exitosamente: {len(sql_statements)}")
        print(f"❌ Errores críticos encontrados: {len(errores)}")
        print(f"⚠️  Pacientes con errores críticos (no procesados): {len(pacientes_con_errores)}")
        
        if especialidades_csv_todas:
            print("\n📋 TODAS las especialidades encontradas en el CSV:")
            for esp, count in sorted(especialidades_csv_todas.items()):
                nivel = 'N1' if esp in ['Medicina', 'Odontología'] else 'N2/N3'
                print(f"  • {esp} ({nivel}): {count} menciones")
        
        if especialidades_usadas:
            print("\n📊 Especialidades que se guardarán en BD (más específicas):")
            for esp, count in sorted(especialidades_usadas.items()):
                print(f"  • {esp}: {count} pacientes")
        
        if especialidades_no_encontradas:
            print("\n⚠️  ESPECIALIDADES NO MAPEADAS:")
            for esp in sorted(especialidades_no_encontradas):
                print(f"  • {esp}")
            print("\nEstas especialidades deben agregarse al mapeo o crearse en la BD.")
        
        if errores:
            print("\n⚠️  Ver errores críticos en: scripts/errores_importacion.txt")
        
        if pacientes_con_errores:
            print("📄 Ver pacientes con errores críticos en: scripts/pacientes_con_errores.csv")
        else:
            print("\n✅ No hay errores críticos. Todos los pacientes se procesarán.")
        
        print("\n" + "="*80)
        print("CARACTERÍSTICAS DEL SQL GENERADO:")
        print("="*80)
        print("  ✓ Nombres y apellidos normalizados (Formato Título)")
        print("  ✓ Nombres/apellidos vacíos: 'Vacio' (se procesan, no son error)")
        print("  ✓ Datos vacíos: agregan 'CORREGIR DATOS' en OBS")
        print("  ✓ Fechas convertidas: DD/MM/YYYY → YYYY-MM-DD")
        print("  ✓ Celulares vacíos: 000000000")
        print("  ✓ Correo vacío: sin-correo@vacio.cl")
        print("  ✓ Dirección vacía: Vacio")
        print("  ✓ Comuna/Origen vacíos: vacio")
        print("  ✓ Institución vacía: vacio")
        print("  ✓ Fecha nacimiento vacía: 1900-01-01")
        print("  ✓ Segundo apellido vacío: NULL")
        print("  ✓ Fecha citación: desde CSV o NULL")
        print("  ✓ OBS con datos vacíos: agrega ' - CORREGIR DATOS'")
        print("  ✓ ID ejecutivo ingreso: 1 (hardcoded)")
        print("  ✓ Número de llamados: calculado automáticamente")
        print("  ✓ Registro en auditoría: 'importacion excel'")
        print("  ✓ Subespecialidades: solo usa la más específica")
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
            f.write("-- Importación de datos desde bd_uss.csv (VERSIÓN MEJORADA)\n")
            f.write(f"-- Total de registros: {len(sql_statements)}\n")
            f.write(f"-- Fecha: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write("-- \n")
            f.write("-- MEJORAS:\n")
            f.write("--   - Agrega 'CORREGIR DATOS' en OBS cuando hay datos vacíos\n")
            f.write("--   - Registra en tabla auditoria cada importación\n")
            f.write("--   - Usa NULL real donde es posible\n")
            f.write("--   - Mejor manejo de errores\n")
            f.write("--   - Validación de trabajador id=1\n")
            f.write("-- \n\n")
            
            # Agregar validación inicial
            f.write("-- Validar que existe trabajador con id=1\n")
            f.write("DO $$\n")
            f.write("BEGIN\n")
            f.write("    IF NOT EXISTS (SELECT 1 FROM trabajador WHERE id_trabajador = 1) THEN\n")
            f.write("        RAISE EXCEPTION 'No existe trabajador con id=1. Debe existir antes de importar.';\n")
            f.write("    END IF;\n")
            f.write("END $$;\n\n")
            
            f.write('\n'.join(sql_statements))
        
        print(f"\n✅ Archivo SQL generado exitosamente!")
        print(f"📁 Ubicación: {filename}")
        print(f"\n📤 Para ejecutarlo en Supabase:")
        print(f"   1. Abre SQL Editor en tu proyecto Supabase")
        print(f"   2. Copia y pega el contenido del archivo")
        print(f"   3. Ejecuta el script")
        print(f"\n⚠️  IMPORTANTE: Debe existir un trabajador con id=1 antes de ejecutar")
        print("\n" + "="*80)

if __name__ == '__main__':
    procesar_csv()
