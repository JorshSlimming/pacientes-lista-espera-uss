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
    """Convierte fecha DD/MM/YYYY a YYYY-MM-DD, retorna '1900-01-01' si vacía"""
    if not fecha_str or fecha_str.strip() == '':
        return '1900-01-01'
    try:
        fecha = datetime.strptime(fecha_str.strip(), '%d/%m/%Y')
        return fecha.strftime('%Y-%m-%d')
    except:
        return '1900-01-01'

def limpiar_texto(texto):
    """Limpia texto, retorna 'vacio' si está vacío"""
    if not texto or texto.strip() == '':
        return 'vacio'
    # Escapar comillas simples para SQL
    return texto.strip().replace("'", "''")

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
                
                # Datos de paciente
                nombre = limpiar_texto(row['Nombre'])
                primer_apellido = limpiar_texto(row['Primer_Apellido'])
                segundo_apellido = limpiar_texto(row['Segundo_Apellido']) if row['Segundo_Apellido'].strip() else 'NULL'
                if segundo_apellido != 'NULL':
                    segundo_apellido = f"'{segundo_apellido}'"
                fecha_nacimiento = convertir_fecha(row['Fecha_Nacimiento'])
                comuna_nombre = row['Comuna'].strip() if row['Comuna'].strip() else 'vacio'
                origen_nombre = row['Origen'].strip() if row['Origen'].strip() else 'otros'
                institucion_nombre = row['Institución_Convenio'].strip() if row['Institución_Convenio'].strip() else 'otros'
                
                # Especialidad (mapear a la estructura jerárquica)
                especialidad_texto = limpiar_texto(row['Especialidad'])
                subesp1 = limpiar_texto(row['Subespecialidad_1'])
                subesp2 = limpiar_texto(row['Subespecialidad_2'])
                
                # Mapear especialidad
                if 'T.Ocupacional' in subesp1 or 'ocupacional' in especialidad_texto.lower():
                    especialidad_nombre = 'Terapia Ocupacional'
                else:
                    especialidad_nombre = 'Medicina General'
                
                # Datos de seguimiento
                fecha_ingreso = convertir_fecha(row['Fecha_Ingreso'])
                fecha_llamado1 = convertir_fecha(row['Fecha_Primera_Llamada'])
                fecha_llamado2 = convertir_fecha(row['Fecha_Segunda_Llamada'])
                fecha_llamado3 = convertir_fecha(row['Fecha_Tercera_Llamada'])
                numero_llamados = contar_llamados(row['Fecha_Primera_Llamada'], row['Fecha_Segunda_Llamada'], row['Fecha_Tercera_Llamada'])
                agendado = 'si' if row['Agendado'].lower() == 'si' else 'no'
                fecha_citacion = convertir_fecha(row['Fecha_Citacion'])
                observaciones = limpiar_texto(row['OBS'])
                
                # Generar SQL
                sql = f"""
-- Paciente {idx-1}: {nombre} {primer_apellido}
DO $$
DECLARE
    v_id_contacto INT;
    v_id_comuna INT;
    v_id_origen INT;
    v_id_institucion INT;
    v_id_especialidad INT;
    v_ejecutivo_rut VARCHAR(12);
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
    
    -- Obtener ID de especialidad
    SELECT id_especialidad INTO v_id_especialidad FROM especialidad WHERE nombre = '{especialidad_nombre}' LIMIT 1;
    IF v_id_especialidad IS NULL THEN
        SELECT id_especialidad INTO v_id_especialidad FROM especialidad WHERE nivel = 1 LIMIT 1;
    END IF;
    
    -- Obtener RUT del ejecutivo admin
    SELECT rut_trabajador INTO v_ejecutivo_rut FROM trabajador WHERE rut_trabajador = '21309172-7' LIMIT 1;
    IF v_ejecutivo_rut IS NULL THEN
        SELECT rut_trabajador INTO v_ejecutivo_rut FROM trabajador WHERE rol = 'jefe' LIMIT 1;
    END IF;
    
    -- Insertar paciente
    INSERT INTO paciente (rut_paciente, nombre, primer_apellido, segundo_apellido, fecha_nacimiento, 
                         obs, id_comuna, id_origen, id_institucion_convenio, id_contacto)
    VALUES ('{rut}', '{nombre}', '{primer_apellido}', {segundo_apellido}, '{fecha_nacimiento}',
            '{observaciones}', v_id_comuna, v_id_origen, v_id_institucion, v_id_contacto)
    ON CONFLICT (rut_paciente) DO UPDATE SET nombre = EXCLUDED.nombre;
    
    -- Insertar seguimiento
    INSERT INTO seguimiento (id_paciente, fecha_ingreso, fecha_primera_llamada, fecha_segunda_llamada, 
                            fecha_tercera_llamada, numero_llamado, agendado, fecha_citacion, 
                            id_especialidad, rut_ejecutivo_ingreso)
    VALUES ('{rut}', '{fecha_ingreso}', '{fecha_llamado1}', '{fecha_llamado2}', 
            '{fecha_llamado3}', {numero_llamados}, '{agendado}', '{fecha_citacion}', 
            v_id_especialidad, v_ejecutivo_rut)
    ON CONFLICT (id_paciente, id_especialidad) DO NOTHING;
            
EXCEPTION
    WHEN OTHERS THEN
        -- Ignorar errores individuales para continuar con el resto
        RAISE NOTICE 'Error en paciente {rut}: %', SQLERRM;
END $$;
"""
                sql_statements.append(sql)
                
            except Exception as e:
                errores.append(f"Línea {idx}: Error - {str(e)}")
        
        # Guardar SQL
        with open('supabase/migrations/20241221000001_importar_datos.sql', 'w', encoding='utf-8') as f:
            f.write("-- Importación de datos desde bd_uss.csv\n")
            f.write(f"-- Total de registros: {len(sql_statements)}\n")
            f.write(f"-- Fecha: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
            
            # Deshabilitar triggers de auditoría durante importación
            f.write("-- Deshabilitar triggers temporalmente\n")
            f.write("ALTER TABLE paciente DISABLE TRIGGER trigger_auditoria_paciente;\n")
            f.write("ALTER TABLE seguimiento DISABLE TRIGGER trigger_auditoria_seguimiento;\n\n")
            
            f.write('\n'.join(sql_statements))
            
            # Rehabilitar triggers al finalizar
            f.write("\n\n-- Rehabilitar triggers\n")
            f.write("ALTER TABLE paciente ENABLE TRIGGER trigger_auditoria_paciente;\n")
            f.write("ALTER TABLE seguimiento ENABLE TRIGGER trigger_auditoria_seguimiento;\n")
        
        # Guardar errores
        if errores:
            with open('scripts/errores_importacion.txt', 'w', encoding='utf-8') as f:
                f.write('\n'.join(errores))
        
        print(f"✅ SQL generado: {len(sql_statements)} pacientes")
        print(f"❌ Errores encontrados: {len(errores)}")
        if errores:
            print("Ver scripts/errores_importacion.txt para detalles")

if __name__ == '__main__':
    procesar_csv()
