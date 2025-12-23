"""
Divide el archivo SQL grande en archivos más pequeños que el SQL Editor de Supabase pueda manejar.
Cada archivo tendrá máximo 500 pacientes.
"""

def dividir_sql():
    # Leer el archivo SQL completo
    with open('supabase/migrations/20251222023855_importar_datos_csv.sql', 'r', encoding='utf-8') as f:
        contenido = f.read()
    
    # Separar por cada bloque DO $$
    bloques = contenido.split('\n\n-- Paciente ')
    
    # El primer elemento tiene el encabezado
    encabezado = bloques[0]
    
    # El resto son pacientes
    pacientes = bloques[1:]
    
    print(f"Total de pacientes en el archivo: {len(pacientes)}")
    
    # Dividir en lotes de 500
    lote_size = 500
    num_lotes = (len(pacientes) + lote_size - 1) // lote_size
    
    print(f"Se crearán {num_lotes} archivos")
    
    for i in range(num_lotes):
        inicio = i * lote_size
        fin = min((i + 1) * lote_size, len(pacientes))
        
        lote_pacientes = pacientes[inicio:fin]
        
        # Crear archivo para este lote
        nombre_archivo = f'supabase/migrations/lote_{i+1}_de_{num_lotes}.sql'
        
        with open(nombre_archivo, 'w', encoding='utf-8') as f:
            # Escribir encabezado modificado
            f.write(f"-- Importación de datos - LOTE {i+1} de {num_lotes}\n")
            f.write(f"-- Pacientes {inicio + 1} al {fin} de {len(pacientes)}\n")
            f.write(f"-- Fecha: 2025-12-22\n\n")
            
            # Escribir pacientes
            for paciente in lote_pacientes:
                f.write('\n\n-- Paciente ' + paciente)
        
        print(f"✓ Creado: {nombre_archivo} ({len(lote_pacientes)} pacientes)")
    
    print(f"\n✅ Archivos creados exitosamente!")
    print(f"\n📋 Para ejecutar en Supabase:")
    print(f"   1. Abre SQL Editor en tu proyecto Supabase")
    for i in range(num_lotes):
        print(f"   {i+2}. Ejecuta: lote_{i+1}_de_{num_lotes}.sql")

if __name__ == '__main__':
    dividir_sql()
