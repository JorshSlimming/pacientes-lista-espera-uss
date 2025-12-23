-- Limpiar datos anteriores de la importacion

-- PASO 1: Eliminar registros de seguimiento con id_ejecutivo_ingreso = 1
DELETE FROM seguimiento WHERE id_ejecutivo_ingreso = 1;

-- PASO 2: Eliminar pacientes que ya no tienen seguimientos asociados
DELETE FROM paciente 
WHERE id_paciente NOT IN (SELECT DISTINCT id_paciente FROM seguimiento);

-- PASO 3: Eliminar contactos huerfanos (sin pacientes asociados)
DELETE FROM contacto 
WHERE id_contacto NOT IN (SELECT DISTINCT id_contacto FROM paciente WHERE id_contacto IS NOT NULL);
