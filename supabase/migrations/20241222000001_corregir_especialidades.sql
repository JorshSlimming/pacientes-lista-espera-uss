-- Corrección de especialidades en seguimientos
-- Total de actualizaciones: 2160
-- Descripción: Asigna la subespecialidad más específica a cada seguimiento

-- Deshabilitar triggers temporalmente
ALTER TABLE seguimiento DISABLE TRIGGER trigger_auditoria_seguimiento;


-- Corregir especialidad para paciente 223564380
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223564380')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 191570294
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '191570294')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213101625
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213101625')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167633943
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167633943')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210698582
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210698582')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208337343
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208337343')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 143735974
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '143735974')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208668056
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208668056')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 59397605
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '59397605')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 203216599
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '203216599')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218630707
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218630707')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220228169
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220228169')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 129223774
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '129223774')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 197145242
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '197145242')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208364197
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208364197')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 204883815
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '204883815')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209596725
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209596725')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245819382
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psicosocial' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245819382')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psicosocial' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261362562
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261362562')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 276860100
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '276860100')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 273985352
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '273985352')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 24700663K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '24700663K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 274056363
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '274056363')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255531018
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255531018')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258387848
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258387848')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272581320
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272581320')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 268066438
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '268066438')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 267083118
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '267083118')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 224611056
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '224611056')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266165498
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266165498')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 269506792
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '269506792')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 271148313
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '271148313')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272478422
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272478422')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255024191
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255024191')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 279774825
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '279774825')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 276712023
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '276712023')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 282527653
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '282527653')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253811749
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253811749')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 267170363
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '267170363')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245350015
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245350015')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 260349600
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '260349600')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 279829263
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '279829263')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272039577
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272039577')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 24067954K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '24067954K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 268491643
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '268491643')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 277850680
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '277850680')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 259013178
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '259013178')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 254451592
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '254451592')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 264886201
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '264886201')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 263814436
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '263814436')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 273397051
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '273397051')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211620926
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211620926')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209781905
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209781905')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 274217936
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '274217936')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261006979
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261006979')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 251796432
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '251796432')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272562288
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272562288')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 248776862
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '248776862')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 234628577
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '234628577')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 25550455K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '25550455K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 271999003
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '271999003')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 247470336
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '247470336')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 26878263K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '26878263K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 267999686
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '267999686')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 176459085
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '176459085')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272661316
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272661316')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 27267971K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '27267971K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 275690376
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '275690376')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213860011
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213860011')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202773478
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202773478')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 28094646K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '28094646K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261362562
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261362562')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 263744411
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '263744411')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253439807
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253439807')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 25537625K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '25537625K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222770637
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222770637')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 25496042K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '25496042K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 251079927
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '251079927')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 264170990
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '264170990')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 274190213
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '274190213')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221024311
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221024311')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 259769833
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '259769833')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 259891248
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '259891248')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258092791
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258092791')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 265069134
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '265069134')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 269183667
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '269183667')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 236639193
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '236639193')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 275629081
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '275629081')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253272244
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253272244')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 250455216
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '250455216')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 259470161
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '259470161')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245381174
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245381174')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 59397605
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '59397605')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 259266955
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '259266955')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 247653228
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '247653228')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 27227276K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '27227276K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 273985352
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '273985352')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 26601709K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '26601709K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 256663988
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '256663988')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255618113
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255618113')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 276182854
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '276182854')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272795592
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272795592')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 276484117
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '276484117')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 277647494
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '277647494')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 277013037
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '277013037')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 273127755
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '273127755')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 269654384
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '269654384')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 254772488
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '254772488')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 274958359
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '274958359')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 26853024K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '26853024K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272541167
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272541167')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 244903436
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '244903436')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266617496
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266617496')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 96864132
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '96864132')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255024191
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255024191')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266187998
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266187998')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 257126722
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '257126722')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 282483424
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '282483424')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195100101
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195100101')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255307142
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255307142')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255501658
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255501658')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 275907715
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '275907715')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195982163
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195982163')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255695061
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255695061')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 232172592
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '232172592')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 205158944
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '205158944')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 186124022
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '186124022')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261504294
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261504294')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220097854
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220097854')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 27267941K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '27267941K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 275671657
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '275671657')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209494515
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209494515')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 273065903
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '273065903')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 254076244
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '254076244')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 249058572
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '249058572')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 271096666
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '271096666')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 25994774K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '25994774K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 242758234
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '242758234')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 25884629K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '25884629K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258326822
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258326822')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 233043699
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '233043699')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 286794181
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '286794181')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 257403114
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '257403114')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255567977
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255567977')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 27200627K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '27200627K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 282653877
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '282653877')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 281297090
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '281297090')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 413895081
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '413895081')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 275220221
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '275220221')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 285949513
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '285949513')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 270720196
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '270720196')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213895516
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213895516')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 230696152
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '230696152')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 276412809
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '276412809')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 274269412
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '274269412')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208344129
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208344129')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 234190903
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '234190903')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 26110203K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '26110203K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 279517733
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '279517733')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 277197928
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '277197928')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 276733702
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '276733702')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261374749
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'T.Ocupacional' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261374749')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'T.Ocupacional' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 159450651
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'TM.Oftalmología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '159450651')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'TM.Oftalmología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 9594213K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'TM.Oftalmología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '9594213K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'TM.Oftalmología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216324986
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'TM.Oftalmología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216324986')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'TM.Oftalmología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 76534144
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'TM.Oftalmología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '76534144')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'TM.Oftalmología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 80878710
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'TM.Oftalmología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '80878710')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'TM.Oftalmología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213650076
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'TM.Oftalmología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213650076')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'TM.Oftalmología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214298309
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'TM.Oftalmología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214298309')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'TM.Oftalmología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238227232
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'TM.Oftalmología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238227232')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'TM.Oftalmología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 103256615
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'TM.Oftalmología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '103256615')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'TM.Oftalmología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 65635607
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'TM.Oftalmología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '65635607')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'TM.Oftalmología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 92461122
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'TM.Oftalmología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '92461122')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'TM.Oftalmología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 142493268
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'TM.Oftalmología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '142493268')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'TM.Oftalmología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 61594132
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'TM.Oftalmología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '61594132')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'TM.Oftalmología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 68298431
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'TM.Oftalmología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '68298431')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'TM.Oftalmología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 151821510
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'TM.Oftalmología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '151821510')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'TM.Oftalmología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 125278183
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'TM.Oftalmología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '125278183')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'TM.Oftalmología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 24363032
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '24363032')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 262300455
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '262300455')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 287163705
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '287163705')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 5003321K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '5003321K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 109818260
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '109818260')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 63757772
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '63757772')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 243681944
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '243681944')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 86370905
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '86370905')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 155294639
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '155294639')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 285667550
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '285667550')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 63757772
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '63757772')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 274269412
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '274269412')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 277436353
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '277436353')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272254443
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272254443')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 77350969
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '77350969')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 42491128
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '42491128')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 95462545
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '95462545')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 168229291
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '168229291')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 181456647
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '181456647')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 175694625
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '175694625')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 86777320
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '86777320')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 64352946
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '64352946')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 93379683
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Kinesiologia' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '93379683')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Kinesiologia' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 242648838
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '242648838')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 271440057
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '271440057')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 232737980
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '232737980')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238255422
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238255422')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 250479018
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '250479018')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 251116857
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '251116857')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 27434671K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '27434671K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261183137
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261183137')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 241185907
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '241185907')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245417594
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245417594')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 252190902
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '252190902')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253361379
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253361379')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 271060076
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '271060076')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212621919
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212621919')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 274398574
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '274398574')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 415768605
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '415768605')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 274974249
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '274974249')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261479656
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261479656')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 269170743
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '269170743')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253116137
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253116137')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 25311651K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '25311651K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 271723288
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '271723288')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255232584
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255232584')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255380789
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255380789')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 267605971
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '267605971')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 280475726
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '280475726')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 267798826
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '267798826')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 264903483
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '264903483')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 270921442
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '270921442')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 254616141
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '254616141')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 256630389
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '256630389')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 263761928
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '263761928')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 276129090
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '276129090')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272879052
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272879052')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 259426952
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '259426952')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258834739
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258834739')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258835018
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258835018')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 243634032
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '243634032')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255114123
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255114123')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 248487682
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '248487682')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 276338757
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '276338757')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272489211
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272489211')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 267082871
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '267082871')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272643245
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272643245')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 250803427
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '250803427')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 248841885
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '248841885')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 254189375
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '254189375')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266542127
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266542127')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 25139640K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '25139640K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253040014
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253040014')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238602866
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238602866')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253195541
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253195541')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 265145663
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '265145663')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 257866076
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '257866076')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 233860468
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '233860468')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 260968912
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '260968912')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 246523525
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '246523525')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 235804468
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '235804468')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 24221711K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '24221711K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258283813
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258283813')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 256448661
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '256448661')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 267536651
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '267536651')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 271158084
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '271158084')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261006979
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261006979')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 243537320
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '243537320')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 268937234
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '268937234')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 234808648
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '234808648')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261362562
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261362562')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 256616912
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '256616912')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 276860100
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '276860100')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 252357615
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '252357615')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 274056363
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '274056363')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258387848
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258387848')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 411593614
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '411593614')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 277009153
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '277009153')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261355620
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261355620')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 240613743
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '240613743')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261946785
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261946785')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195336695
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195336695')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 270230032
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '270230032')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 276149245
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '276149245')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 278107426
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '278107426')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 280144622
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '280144622')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 250760884
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '250760884')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21585275K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21585275K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213741691
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213741691')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 274958359
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '274958359')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 236351416
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '236351416')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 256479737
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '256479737')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 260835955
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '260835955')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258137744
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258137744')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253811749
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253811749')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 27326406K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '27326406K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 267170363
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '267170363')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245422705
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245422705')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272739595
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272739595')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 250803427
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '250803427')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 247470336
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '247470336')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212753939
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212753939')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222367344
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222367344')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 254932671
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '254932671')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213860011
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213860011')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202672094
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202672094')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 254088366
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '254088366')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 281806947
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '281806947')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 269240326
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '269240326')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222792819
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222792819')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 257248356
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '257248356')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272997373
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272997373')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 280720119
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '280720119')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 277095904
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '277095904')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 267340978
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '267340978')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 271827407
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '271827407')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 271827083
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '271827083')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 27856052K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '27856052K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253040017
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253040017')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272767033
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272767033')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 280111414
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '280111414')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208667890
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208667890')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255942222
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255942222')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 269112166
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '269112166')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245452705
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245452705')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 276528262
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '276528262')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212042218
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212042218')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 262442322
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '262442322')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255279254
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255279254')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272674043
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272674043')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266189664
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266189664')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255618113
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255618113')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 268377832
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '268377832')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 262842800
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '262842800')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 275977292
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '275977292')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 273127755
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '273127755')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 249146641
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '249146641')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 241835707
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '241835707')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 263827236
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '263827236')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258500644
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258500644')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272541167
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272541167')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 259521750
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '259521750')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221277740
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221277740')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 246501874
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '246501874')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266187998
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266187998')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 28492875K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '28492875K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 186124022
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '186124022')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 191090993
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '191090993')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 282423901
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '282423901')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 280345352
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '280345352')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 26668729K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '26668729K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 278825450
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '278825450')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245452705
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245452705')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266521162
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266521162')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 25588915K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '25588915K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 27477200K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '27477200K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 281057545
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '281057545')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238579538
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238579538')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255617982
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255617982')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 257248356
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '257248356')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258500864
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258500864')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 23879806K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '23879806K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261861291
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261861291')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 274454326
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '274454326')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 180063285
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '180063285')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 228589721
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '228589721')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 274269412
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '274269412')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 277584506
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '277584506')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 230696152
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '230696152')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 276412809
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '276412809')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 251765642
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '251765642')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 249327948
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '249327948')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 135107387
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '135107387')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 282224720
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '282224720')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 279517733
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '279517733')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21622017K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21622017K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 276733702
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '276733702')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 91738996
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '91738996')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 256446936
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '256446936')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261374749
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261374749')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 243634032
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '243634032')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 242394860
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '242394860')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 410793369
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '410793369')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 27338801K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '27338801K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 273358439
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '273358439')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261355620
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261355620')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 52346363
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '52346363')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 277848031
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '277848031')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212384216
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Infantil' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212384216')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Infantil' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 19768013K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '19768013K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21037552K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21037552K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219888376
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219888376')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210131256
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210131256')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 198146846
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '198146846')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 186835165
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '186835165')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 215200434
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '215200434')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 136238841
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '136238841')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 204875561
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '204875561')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213177753
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213177753')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212780189
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212780189')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221687779
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221687779')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214069504
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214069504')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211806761
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211806761')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 94481228
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '94481228')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223985033
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223985033')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 215711749
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '215711749')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202572413
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202572413')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216047354
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216047354')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184183528
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184183528')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 205156119
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '205156119')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 201100550
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '201100550')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 18671394K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '18671394K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 183612190
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '183612190')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220463966
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220463966')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216964349
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Psiquiatría' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216964349')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Psiquiatría' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 48775462
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '48775462')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220032426
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220032426')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 196990054
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '196990054')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218506143
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218506143')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 187848636
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '187848636')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 205718672
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '205718672')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 24993321K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '24993321K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210922563
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210922563')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 180693238
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '180693238')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 13599720K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '13599720K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208337343
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208337343')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202570364
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202570364')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216386329
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216386329')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 205165959
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '205165959')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 10222776K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '10222776K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 89930928
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '89930928')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206188286
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206188286')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195311358
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195311358')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 81851328
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '81851328')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 137237849
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '137237849')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 178968444
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '178968444')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206536489
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206536489')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207751480
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207751480')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 6534548K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '6534548K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 201100550
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '201100550')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 19962187K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '19962187K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 204874433
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '204874433')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210922318
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210922318')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21365070K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21365070K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 204390517
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '204390517')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 233228184
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '233228184')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222903939
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222903939')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 180063285
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '180063285')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 46446208
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '46446208')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 235910012
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '235910012')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 198684988
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '198684988')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207751480
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207751480')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218543111
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218543111')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 17569739K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '17569739K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 78576669
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '78576669')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 22160539K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '22160539K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 165993772
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '165993772')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 203864736
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '203864736')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 188008925
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '188008925')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212477214
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212477214')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21365070K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21365070K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 233532002
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '233532002')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 200785894
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '200785894')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208489143
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208489143')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218529321
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218529321')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214760967
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214760967')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 230206996
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '230206996')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213895516
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213895516')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167689701
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167689701')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 101751325
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '101751325')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 180063285
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '180063285')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212991465
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212991465')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 97871140
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '97871140')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 204705410
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '204705410')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207063665
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207063665')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 187464765
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '187464765')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 177294845
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '177294845')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 152153252
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '152153252')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213265679
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213265679')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211499249
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211499249')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206494255
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206494255')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220356949
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220356949')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207057053
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207057053')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 175735372
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '175735372')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 176400781
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '176400781')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214929511
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214929511')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 99262729
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '99262729')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 67842995
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '67842995')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 198342874
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '198342874')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220678911
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220678911')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213901109
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213901109')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 204375291
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '204375291')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21969900K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21969900K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 16613269K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '16613269K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 188008925
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '188008925')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167382266
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167382266')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 198124710
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '198124710')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222475546
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222475546')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 65281791
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '65281791')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 104720269
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '104720269')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21209726K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21209726K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208846752
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208846752')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219080263
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219080263')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 224528760
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '224528760')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206133589
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206133589')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207767158
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207767158')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221376471
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221376471')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216677722
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216677722')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222206863
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222206863')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 183693247
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '183693247')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207206342
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207206342')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208668056
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208668056')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 215861465
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '215861465')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 173164750
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '173164750')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 161550728
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '161550728')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219304501
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219304501')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167661920
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167661920')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209238047
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209238047')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 54928491
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '54928491')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238851181
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238851181')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 256894068
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '256894068')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 240331594
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '240331594')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255162179
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255162179')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 244696961
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '244696961')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272757208
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272757208')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 254800813
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '254800813')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 24381345K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '24381345K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 257347036
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '257347036')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 270230032
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '270230032')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272541167
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272541167')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 240672642
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '240672642')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 251351317
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '251351317')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 264002699
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '264002699')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261149060
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261149060')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 275998052
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '275998052')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 26623547K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '26623547K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238607795
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238607795')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 241697118
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '241697118')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 243411726
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '243411726')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 264746574
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '264746574')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 260349600
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '260349600')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 234955780
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '234955780')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266339801
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266339801')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 278393240
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '278393240')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 256990318
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '256990318')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 24115968K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '24115968K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 270854362
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '270854362')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272739595
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272739595')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 242977092
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '242977092')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 24381345K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '24381345K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266544960
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266544960')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 237154797
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '237154797')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266154615
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266154615')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 241075233
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '241075233')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 275129399
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '275129399')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 270547052
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '270547052')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 246223580
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '246223580')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 254800813
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '254800813')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 248459476
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '248459476')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 246958254
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '246958254')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 263135113
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '263135113')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258889843
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258889843')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 264749574
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '264749574')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 243951232
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '243951232')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 247951539
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '247951539')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238677645
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238677645')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 129217197
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '129217197')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255636456
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255636456')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266316623
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266316623')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 236280594
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '236280594')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 244212603
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '244212603')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 281915983
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '281915983')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 278034070
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '278034070')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 246880662
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '246880662')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255022374
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255022374')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 247514066
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '247514066')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 231109536
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '231109536')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253928263
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253928263')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272153094
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272153094')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 257248356
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '257248356')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266003927
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266003927')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 27169041K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '27169041K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253407905
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253407905')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 411909911
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '411909911')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 246500355
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '246500355')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 274750464
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '274750464')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 277572028
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '277572028')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 243226422
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '243226422')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255019422
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255019422')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245109741
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245109741')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 256990318
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '256990318')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 274468386
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '274468386')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 248972196
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '248972196')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 243735858
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '243735858')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 236970949
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '236970949')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 24898869K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '24898869K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 252863397
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '252863397')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 24225953K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '24225953K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 282584603
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '282584603')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 275139483
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '275139483')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 267239924
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '267239924')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 250821670
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '250821670')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 27336014K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '27336014K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 241452980
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '241452980')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 247171835
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '247171835')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266163630
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266163630')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 257649997
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '257649997')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 240218968
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '240218968')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 259597641
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '259597641')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 270795218
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '270795218')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 240331594
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '240331594')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261804956
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261804956')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238426820
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238426820')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 248459476
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '248459476')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255650033
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255650033')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245452705
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245452705')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 239558976
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '239558976')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 277177726
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '277177726')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 256790343
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '256790343')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266842287
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266842287')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 277413264
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '277413264')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253084154
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253084154')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 267346984
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '267346984')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 26075114K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '26075114K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253878827
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253878827')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 265613756
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '265613756')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245702655
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245702655')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 264549418
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '264549418')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 254773204
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '254773204')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 243645158
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '243645158')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 248112956
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '248112956')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 257248356
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '257248356')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 256922800
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '256922800')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 259266955
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '259266955')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261389886
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261389886')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245419252
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245419252')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 236970949
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '236970949')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 235271079
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '235271079')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253716673
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253716673')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245218737
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245218737')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 24521894K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '24521894K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255805401
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255805401')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 259308534
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '259308534')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 257248356
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '257248356')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 26623547K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '26623547K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 267383359
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '267383359')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219894678
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219894678')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 275139483
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '275139483')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 272541167
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '272541167')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 256972816
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '256972816')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 251179867
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '251179867')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 244903436
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '244903436')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266617496
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266617496')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 239953972
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '239953972')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 25375270K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '25375270K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255647555
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255647555')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 259156688
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '259156688')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253716673
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253716673')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253791314
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253791314')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 250633785
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '250633785')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 287953720
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '287953720')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 27267941K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '27267941K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 249035383
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '249035383')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 243286603
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '243286603')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 259488036
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '259488036')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 259907241
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '259907241')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261980819
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261980819')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 282540029
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '282540029')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261080982
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261080982')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245452705
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245452705')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 256023148
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '256023148')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253307625
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253307625')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 270692346
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '270692346')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258326822
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258326822')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 265543642
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '265543642')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 263200640
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '263200640')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 250595948
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '250595948')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 233434507
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '233434507')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 273184759
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '273184759')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 242861217
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '242861217')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 262431789
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '262431789')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 26535470K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '26535470K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 270854362
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '270854362')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258404580
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258404580')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 25509095K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '25509095K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238092574
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238092574')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 23972129K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '23972129K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 288979952
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '288979952')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255567977
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255567977')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 260250469
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '260250469')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 287072066
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '287072066')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 499943369
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '499943369')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 244839088
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '244839088')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261775867
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261775867')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238052467
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238052467')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 271096666
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '271096666')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 249058572
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '249058572')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258634330
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258634330')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 24162790K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '24162790K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 413895081
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '413895081')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 257411664
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '257411664')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261861291
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261861291')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 270181317
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '270181317')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 264371341
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '264371341')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 289644105
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '289644105')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 247266305
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '247266305')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258082397
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258082397')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 252843671
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '252843671')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 282540029
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '282540029')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266144482
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266144482')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266144482
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266144482')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 256972816
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '256972816')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 259193690
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '259193690')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 252490124
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '252490124')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 273555048
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '273555048')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 279121902
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '279121902')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 279022076
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '279022076')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 263200640
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '263200640')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 279498127
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Neurología Pediátrica' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '279498127')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Neurología Pediátrica' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 284798031
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '284798031')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 224528760
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '224528760')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261804956
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261804956')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 186838645
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '186838645')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 241452980
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '241452980')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 18142897K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '18142897K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 142130076
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '142130076')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 198148539
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '198148539')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 204391955
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '204391955')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207758493
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207758493')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219999739
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219999739')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 115805290
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '115805290')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213592270
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213592270')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 234096699
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '234096699')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210741593
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210741593')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214332787
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214332787')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 57770066
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '57770066')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 65405865
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '65405865')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 264308801
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '264308801')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 142087316
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '142087316')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 74202306
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '74202306')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210877363
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210877363')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 230693730
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '230693730')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 241183590
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '241183590')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 90379275
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '90379275')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 231693189
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '231693189')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 259446287
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '259446287')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 178984314
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '178984314')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213899945
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213899945')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 86663406
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '86663406')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 257082237
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '257082237')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 200229630
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '200229630')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 191103491
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '191103491')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 235089394
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '235089394')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 112143033
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '112143033')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 160377496
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '160377496')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 242404025
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '242404025')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 231307540
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '231307540')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 18957195K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '18957195K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 200188888
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '200188888')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 215522512
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '215522512')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221303997
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221303997')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213718126
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213718126')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213880055
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213880055')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 194573340
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '194573340')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 259772922
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '259772922')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 129752823
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '129752823')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 239237592
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '239237592')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 235323168
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '235323168')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 215535568
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '215535568')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222782252
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222782252')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223241425
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223241425')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 160663014
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '160663014')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 225918872
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '225918872')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 231324119
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '231324119')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 12867635K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '12867635K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 274449845
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '274449845')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 106462836
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '106462836')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 204705410
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '204705410')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219104464
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219104464')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210422331
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210422331')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 42654809
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '42654809')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221207777
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221207777')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 228328618
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '228328618')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 106003793
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '106003793')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 18142897K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '18142897K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 40354921
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '40354921')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 285823544
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '285823544')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 186839846
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '186839846')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217966884
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217966884')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 201148642
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '201148642')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 143544419
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '143544419')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 227946989
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '227946989')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 81671567
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '81671567')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 111585571
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '111585571')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 224197446
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '224197446')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 178427067
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '178427067')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 145244986
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '145244986')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 131374895
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '131374895')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222666031
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222666031')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214298309
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214298309')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 225766002
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '225766002')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220871886
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220871886')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 78576669
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '78576669')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223135919
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223135919')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184358948
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184358948')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 133795855
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '133795855')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 235288885
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '235288885')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 160378093
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '160378093')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 135085057
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '135085057')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 203414056
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '203414056')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 143250261
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '143250261')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 18451379K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '18451379K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 278206548
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '278206548')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210590471
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210590471')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 229638211
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '229638211')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 175726128
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '175726128')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 236511626
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '236511626')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 200592557
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '200592557')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210061703
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210061703')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 133082239
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '133082239')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218232205
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218232205')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 135100714
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '135100714')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 188090214
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '188090214')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 200785894
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '200785894')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 22218262K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '22218262K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 286028721
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '286028721')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 191222482
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '191222482')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208090518
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208090518')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218018416
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218018416')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212321702
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212321702')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211073519
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211073519')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 203624204
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '203624204')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 140633038
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '140633038')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 227006196
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '227006196')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 234996207
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '234996207')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 91360802
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '91360802')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 19087463K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '19087463K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 161385700
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '161385700')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 14074350K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '14074350K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 151622968
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '151622968')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 11790377K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '11790377K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184046644
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184046644')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 127963088
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '127963088')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 99526653
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '99526653')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220642259
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220642259')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 22160539K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '22160539K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 116798522
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '116798522')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207387878
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207387878')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21206596K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21206596K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 233434507
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '233434507')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 137245094
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '137245094')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 7619680K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '7619680K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 204539324
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '204539324')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 231598031
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '231598031')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 119847303
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '119847303')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 168953925
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '168953925')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216511743
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216511743')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 203741472
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '203741472')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 18171414K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '18171414K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219235615
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219235615')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 17145854K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '17145854K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 200210735
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '200210735')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 177895288
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '177895288')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 187458609
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '187458609')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 246472736
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '246472736')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217280893
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217280893')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 20891765K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '20891765K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195310998
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195310998')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 156473715
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '156473715')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216199766
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216199766')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 120714589
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '120714589')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 181454369
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '181454369')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202577970
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202577970')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202554652
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202554652')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213485407
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213485407')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 11495263K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '11495263K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 168233620
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '168233620')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 192969344
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '192969344')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214917483
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214917483')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 119613566
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '119613566')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 239816711
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '239816711')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 143015378
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '143015378')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 175570195
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '175570195')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 117791246
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '117791246')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209406284
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209406284')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 215915980
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '215915980')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 151631622
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '151631622')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 25558829K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '25558829K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208668277
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208668277')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 191085876
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '191085876')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 246246335
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '246246335')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 225542228
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '225542228')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 18684131K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '18684131K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207867837
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207867837')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214521466
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214521466')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210532455
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210532455')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214665980
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214665980')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 201937698
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '201937698')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 229638211
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '229638211')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216280512
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216280512')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209815702
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209815702')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 156783943
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '156783943')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 159287025
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '159287025')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184058928
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184058928')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 131377134
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '131377134')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 187897300
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '187897300')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 133097724
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '133097724')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223692060
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223692060')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 224106904
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '224106904')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184197219
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184197219')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219689896
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219689896')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 203526237
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '203526237')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 119313120
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '119313120')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 244148077
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '244148077')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 235201046
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '235201046')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 114938025
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '114938025')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 165038061
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '165038061')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266923821
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266923821')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209549972
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209549972')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195091218
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195091218')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206863617
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206863617')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 19598798K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '19598798K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221895495
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221895495')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 287876335
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '287876335')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217706602
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217706602')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221899687
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221899687')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 99022019
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '99022019')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 98649604
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '98649604')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 144339193
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '144339193')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 287303173
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '287303173')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 133824693
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '133824693')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 176865288
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '176865288')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 230206996
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '230206996')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 201536332
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '201536332')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 204873194
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '204873194')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 181427124
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '181427124')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202086993
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202086993')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21855426K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21855426K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 127673470
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '127673470')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206118369
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206118369')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207209171
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207209171')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 274223553
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '274223553')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 234904280
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '234904280')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223868517
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223868517')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202585337
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202585337')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 99419229
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '99419229')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210199853
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210199853')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 67842995
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '67842995')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 20613366K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '20613366K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 282162903
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '282162903')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 151893570
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '151893570')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 22218262K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '22218262K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210390065
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210390065')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21209726K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21209726K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 116134705
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '116134705')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 226769412
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '226769412')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 227156937
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '227156937')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220368866
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220368866')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222354455
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222354455')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 139525752
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '139525752')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 111485569
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '111485569')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208918281
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208918281')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 190910202
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '190910202')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 20515924K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '20515924K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 172901891
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '172901891')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 23194771K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '23194771K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 198372565
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '198372565')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21096598K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21096598K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216384032
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216384032')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 278110338
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '278110338')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 41179198K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '41179198K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 41494938K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '41494938K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 234081314
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '234081314')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 15945844K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '15945844K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 143920313
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '143920313')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 282483513
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '282483513')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245556411
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245556411')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 246182205
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '246182205')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217930871
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217930871')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 156171662
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '156171662')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209584638
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209584638')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222204720
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222204720')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213251074
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Dermatología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213251074')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Dermatología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 250143575
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '250143575')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 228435236
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '228435236')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212818690
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212818690')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213851888
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213851888')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238729629
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238729629')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217842727
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217842727')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 172242421
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '172242421')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 20155814K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '20155814K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 201495148
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '201495148')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214581000
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214581000')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 073853435
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '073853435')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 224361491
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '224361491')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207209023
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207209023')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220132226
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220132226')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 205170146
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '205170146')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 227278676
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '227278676')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 226346058
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '226346058')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 10309111K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '10309111K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 233175250
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '233175250')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 102304772
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '102304772')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 160389656
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '160389656')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 199643851
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '199643851')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 284850793
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '284850793')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219935218
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219935218')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211711175
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211711175')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221208870
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221208870')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212491934
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212491934')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253967285
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253967285')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214518961
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214518961')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 181099224
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '181099224')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 200329406
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '200329406')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 131375298
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '131375298')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 133071768
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '133071768')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 47412803
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '47412803')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220047938
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220047938')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 126976712
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '126976712')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 188458106
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '188458106')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 98718583
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '98718583')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 237935772
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '237935772')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 268408738
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '268408738')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206188022
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206188022')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 144667026
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '144667026')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 169199108
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '169199108')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 201540216
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '201540216')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 20019893K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '20019893K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 139570847
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '139570847')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21451222K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21451222K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210242708
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210242708')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221076567
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221076567')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 114934038
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '114934038')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 111833338
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '111833338')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 156131598
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '156131598')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207509248
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207509248')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21232695K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21232695K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 54953720
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '54953720')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238291070
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238291070')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 239395503
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '239395503')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 235528940
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '235528940')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266824246
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266824246')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 250103476
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '250103476')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 112130152
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '112130152')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 200203232
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '200203232')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167643914
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167643914')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 119645158
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '119645158')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 199121863
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '199121863')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211539259
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211539259')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 135107417
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '135107417')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213520482
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213520482')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 269648821
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '269648821')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 269653868
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '269653868')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 95367666
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '95367666')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21305631K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21305631K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 227587392
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '227587392')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 122997952
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '122997952')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 142802236
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '142802236')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 084293083
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '084293083')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 229683810
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '229683810')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 125266916
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '125266916')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184144387
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184144387')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 237985893
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '237985893')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 82064877
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '82064877')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 124227704
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '124227704')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 17348464K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '17348464K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 82472428
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '82472428')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 156135844
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '156135844')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 133101659
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '133101659')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255705644
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255705644')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 200495012
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '200495012')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 22805612K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '22805612K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 143523616
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '143523616')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167628273
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167628273')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238984777
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238984777')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 101764044
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '101764044')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 121811219
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '121811219')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 155189096
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '155189096')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266690584
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266690584')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 232883480
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '232883480')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 93714695
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '93714695')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 52643929
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '52643929')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 178531611
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '178531611')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 103213126
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '103213126')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202586317
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202586317')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213860011
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213860011')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 241990222
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '241990222')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 271096666
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '271096666')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 247519386
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '247519386')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 229305670
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '229305670')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 246660662
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '246660662')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 246013128
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '246013128')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 76177414
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '76177414')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 112400478
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '112400478')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 112391800
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '112391800')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 129775890
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '129775890')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 215549429
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '215549429')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 233743712
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '233743712')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 97178941
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '97178941')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 74698301
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '74698301')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 224976623
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '224976623')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 23929457K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '23929457K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 114973696
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '114973696')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 155189096
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '155189096')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 156172294
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '156172294')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209918501
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209918501')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 114487244
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '114487244')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 119862825
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '119862825')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 10599639K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '10599639K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 286155766
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '286155766')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 140635030
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '140635030')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184358948
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184358948')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218529283
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218529283')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 227058137
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '227058137')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 81023662
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '81023662')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 129236930
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '129236930')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 10655174K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '10655174K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217388678
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217388678')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209915693
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209915693')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202586317
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202586317')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213860011
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213860011')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 232029625
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '232029625')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 191107810
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '191107810')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206128674
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206128674')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 168387822
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '168387822')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 88004620
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '88004620')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 127032793
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '127032793')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 80842686
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '80842686')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 203620977
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '203620977')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 178980602
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '178980602')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 105435894
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '105435894')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212758981
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212758981')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214612771
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214612771')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207388319
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207388319')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 153410437
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '153410437')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206977272
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206977272')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 161385433
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '161385433')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 268615245
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '268615245')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21323255K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21323255K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 231253793
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '231253793')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 176721286
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '176721286')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 108883359
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '108883359')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 105015631
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '105015631')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217354293
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217354293')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 82714219
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '82714219')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184177889
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184177889')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 162847635
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '162847635')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 165994205
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '165994205')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 235145324
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '235145324')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21910877K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21910877K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 231706720
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '231706720')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 83041374
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '83041374')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 125274919
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '125274919')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 126072945
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '126072945')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 191079981
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '191079981')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 156716995
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '156716995')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 182303151
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '182303151')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 181445335
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '181445335')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 143069184
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '143069184')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 126294468
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '126294468')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 64157752
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '64157752')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 19120025K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '19120025K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 102125215
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '102125215')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207315893
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207315893')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 177142336
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '177142336')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209233088
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209233088')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217854695
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217854695')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 252089144
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '252089144')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 108876131
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '108876131')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 09873032K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '09873032K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 178436694
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '178436694')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 069440827
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '069440827')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 097637032
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '097637032')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207511706
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207511706')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209236516
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209236516')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 121349493
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '121349493')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220781372
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220781372')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217312302
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217312302')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219411944
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219411944')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 73853435
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '73853435')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212728993
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212728993')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223620116
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223620116')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 101278115
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '101278115')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 117920356
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '117920356')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 215196666
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '215196666')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 198358452
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '198358452')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 76720673
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '76720673')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 138082180
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '138082180')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 227387971
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '227387971')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 201067618
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '201067618')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 144046218
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '144046218')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 16038493K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '16038493K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 136036262
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '136036262')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 412033698
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '412033698')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 224370083
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '224370083')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219198248
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219198248')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211953853
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211953853')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218312233
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218312233')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216560876
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216560876')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 183648543
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '183648543')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210242708
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210242708')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210784608
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210784608')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 119133440
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '119133440')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 169934029
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '169934029')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184183528
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184183528')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216613643
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216613643')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 143691950
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '143691950')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216877381
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216877381')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 20102395K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '20102395K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 173489447
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '173489447')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220840387
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220840387')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 200300173
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '200300173')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221206347
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221206347')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 136905457
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '136905457')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 163287218
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '163287218')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223422829
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223422829')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 169199108
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '169199108')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 151813836
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '151813836')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212749001
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212749001')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 165344189
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '165344189')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 183339566
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '183339566')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 125274919
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '125274919')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 106912255
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '106912255')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216472071
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216472071')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 123845927
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '123845927')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219280033
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219280033')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 101764044
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '101764044')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 155183012
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '155183012')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 181098775
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '181098775')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216032438
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216032438')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 93344049
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '93344049')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 12528549K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '12528549K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 95233589
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '95233589')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 175400370
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '175400370')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 55980616
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '55980616')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 162829076
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '162829076')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 282698870
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '282698870')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202588328
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202588328')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 186862074
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '186862074')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 284003624
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '284003624')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195159424
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195159424')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 17218183K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '17218183K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 91444143
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '91444143')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212359203
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212359203')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 9226985K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '9226985K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 123809823
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '123809823')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220451046
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220451046')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 100488841
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '100488841')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 188063675
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '188063675')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 160092645
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '160092645')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 4419774K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '4419774K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 239395503
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '239395503')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217971209
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217971209')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 6984510K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '6984510K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210987193
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210987193')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 233100463
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '233100463')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 175416757
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '175416757')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219839359
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219839359')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 173935021
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '173935021')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 16222459K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '16222459K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 74899781
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '74899781')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 96389760
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '96389760')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 155909773
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '155909773')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218086616
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218086616')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212511099
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212511099')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206131098
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206131098')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213708260
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213708260')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 23341400K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '23341400K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210798072
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210798072')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 8252066K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '8252066K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216261240
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216261240')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 104604420
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '104604420')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214565226
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214565226')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 118095898
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '118095898')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 125483275
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '125483275')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 20316582K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '20316582K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 18806020K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '18806020K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 109999296
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '109999296')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 181433302
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '181433302')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208302841
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208302841')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216147952
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216147952')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 80169086
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '80169086')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 191208579
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '191208579')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 103839688
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '103839688')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 227462078
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '227462078')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 22237913K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '22237913K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 87921883
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '87921883')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216560876
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216560876')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167679129
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167679129')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 108664274
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '108664274')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 239964885
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '239964885')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 62957301
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '62957301')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 233231215
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '233231215')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 190883965
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '190883965')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 151808352
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '151808352')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202557740
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202557740')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 10599639K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '10599639K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 82074597
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '82074597')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 198368725
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '198368725')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167637019
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167637019')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 86560801
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '86560801')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21375193K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21375193K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 17896853K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '17896853K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 81006652
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '81006652')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 186854098
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '186854098')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211910267
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211910267')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 260293079
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '260293079')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 158720590
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '158720590')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 171962730
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '171962730')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 235377845
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '235377845')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 15590691K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '15590691K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 12888291K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '12888291K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 107983570
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '107983570')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 15855819K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '15855819K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 249789372
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '249789372')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 248079452
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '248079452')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214209187
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214209187')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 240736829
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '240736829')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21199259K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21199259K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 22805612K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '22805612K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 176136383
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '176136383')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 105645848
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '105645848')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 108051140
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '108051140')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 62033266
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '62033266')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 136248596
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '136248596')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 276850849
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '276850849')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 224210388
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '224210388')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206977272
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206977272')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217787505
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217787505')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213721038
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213721038')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 161526029
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '161526029')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 86734464
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '86734464')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 248266511
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '248266511')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218168949
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218168949')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195090068
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195090068')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 160372443
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '160372443')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 161403822
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '161403822')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213755870
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213755870')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212399434
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212399434')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 93317777
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '93317777')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214586614
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214586614')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 118660307
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '118660307')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 126998317
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '126998317')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 173459107
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '173459107')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 142522004
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '142522004')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219008120
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219008120')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 105015631
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '105015631')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 108883359
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '108883359')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 415816812
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '415816812')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 55980616
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '55980616')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 137243695
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '137243695')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 181022418
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '181022418')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 121603713
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '121603713')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 200232178
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '200232178')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207205699
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207205699')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218199402
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218199402')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217645824
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217645824')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 73573866
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '73573866')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 9928403K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '9928403K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 279181514
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '279181514')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216110587
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216110587')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 173789009
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '173789009')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216455274
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216455274')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217522455
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217522455')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209543222
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209543222')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 161388092
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '161388092')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214673487
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214673487')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 95577547
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '95577547')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 230348391
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '230348391')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218202225
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218202225')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 136039040
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '136039040')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209859157
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209859157')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 108978732
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '108978732')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 168632037
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '168632037')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 158908514
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '158908514')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 181449489
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '181449489')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 76773327
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '76773327')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212065943
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212065943')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 114661902
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '114661902')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 82734643
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '82734643')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 58244201
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '58244201')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 197411422
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '197411422')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 233542741
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '233542741')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211390182
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211390182')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209690985
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209690985')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 176176385
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '176176385')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219981066
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219981066')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 188574491
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '188574491')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 60474060
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '60474060')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211365617
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211365617')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212585440
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212585440')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 193248144
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '193248144')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221886097
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221886097')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217604753
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217604753')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 92662160
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '92662160')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 96917805
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '96917805')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 182891819
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '182891819')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 152698593
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '152698593')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 226728465
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '226728465')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 20491956
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '20491956')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223572588
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223572588')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223826334
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223826334')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 102699513
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '102699513')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217510910
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217510910')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220167496
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220167496')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 22855653K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '22855653K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 247720979
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '247720979')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208113240
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208113240')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 215917223
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '215917223')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 106916055
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '106916055')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 254903086
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '254903086')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219179774
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219179774')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212804819
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212804819')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 20489793K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '20489793K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195984204
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195984204')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 169999422
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '169999422')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 58229725
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '58229725')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209112965
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209112965')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220097854
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220097854')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 131334362
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '131334362')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221502639
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221502639')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21898827K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21898827K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 74202306
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '74202306')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 279089243
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '279089243')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 170755944
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '170755944')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 61891013
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '61891013')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 20487624K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '20487624K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 180668810
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '180668810')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222850088
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222850088')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 176176385
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '176176385')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238735653
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238735653')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 67703707
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '67703707')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 160096209
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '160096209')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 161385433
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '161385433')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217825946
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217825946')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 160379677
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '160379677')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 101024334
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '101024334')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 104772595
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '104772595')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 225370303
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '225370303')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223913512
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223913512')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 168952082
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '168952082')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 158531747
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '158531747')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222398975
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222398975')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 107120637
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '107120637')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 19511255K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '19511255K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 09873032K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '09873032K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 160120827
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '160120827')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209407906
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209407906')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 191200675
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '191200675')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 107603816
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '107603816')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 87240983
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '87240983')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21210387K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21210387K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212534994
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212534994')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 169923078
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '169923078')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 51577949
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '51577949')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 105482353
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '105482353')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 56972986
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '56972986')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 243537959
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '243537959')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216620151
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216620151')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 205151435
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '205151435')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216982762
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216982762')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 180675442
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '180675442')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 112130152
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '112130152')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 239559859
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '239559859')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 244704425
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '244704425')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211435437
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211435437')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 144550072
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '144550072')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206218651
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206218651')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 93611799
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '93611799')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195095175
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195095175')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 173952341
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '173952341')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222407087
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222407087')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 78099976
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '78099976')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 131334362
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '131334362')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211287381
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211287381')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 231134980
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '231134980')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 16763981K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '16763981K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 153876657
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '153876657')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 20487025K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '20487025K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 204390320
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '204390320')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221373855
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221373855')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210061703
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210061703')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 151936067
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '151936067')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 110374208
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '110374208')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 193323367
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '193323367')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 185662764
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '185662764')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 263855868
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '263855868')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 282038463
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '282038463')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 282038455
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '282038455')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 152198531
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '152198531')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202569943
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202569943')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 242978021
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '242978021')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 282161591
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '282161591')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245053703
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245053703')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 10692290K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '10692290K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 178975668
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '178975668')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 161802735
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '161802735')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184183528
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184183528')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 191101278
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '191101278')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219132204
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219132204')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 22807585K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '22807585K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221892003
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221892003')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 199071491
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '199071491')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 88733738
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '88733738')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 99403446
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '99403446')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 23202125K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '23202125K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209915693
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209915693')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209191865
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209191865')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221885120
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221885120')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222711355
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222711355')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 95905609
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '95905609')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21212706K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21212706K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213409131
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213409131')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 22173887K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '22173887K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 115714945
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '115714945')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 76062064
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '76062064')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210861246
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210861246')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 178008625
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '178008625')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 14062652K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '14062652K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 178426257
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '178426257')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 173679033
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '173679033')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258877861
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258877861')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 201552001
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '201552001')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 102014006
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '102014006')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 66647366
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '66647366')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 140602825
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '140602825')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 69464149
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '69464149')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 131339178
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '131339178')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 49271492
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '49271492')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 161555266
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '161555266')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 156246042
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '156246042')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 180698767
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '180698767')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 100538814
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '100538814')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 108024305
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '108024305')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 18971940K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '18971940K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 107274979
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '107274979')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 96449429
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '96449429')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 115754793
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '115754793')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 55113998
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '55113998')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 121149745
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '121149745')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 12700742K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '12700742K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 40573887
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '40573887')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210977449
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210977449')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 121814722
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '121814722')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184059185
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184059185')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 109743992
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '109743992')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 133961151
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '133961151')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210934197
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210934197')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 94561647
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '94561647')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 8210075K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '8210075K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 66736756
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '66736756')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 92249913
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '92249913')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 138054535
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '138054535')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 145513979
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '145513979')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 126978014
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '126978014')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 152220995
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '152220995')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 53874584
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '53874584')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 95483127
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '95483127')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 70051143
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '70051143')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 97794413
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '97794413')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 11493349K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '11493349K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212873039
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212873039')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207391050
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207391050')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 6423742K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '6423742K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 95903215
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '95903215')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 73012570
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '73012570')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 49215002
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '49215002')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 107059508
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '107059508')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 228530719
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '228530719')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 200769090
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '200769090')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 68727448
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '68727448')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 249388688
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '249388688')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 201965012
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '201965012')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209616408
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209616408')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219044860
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219044860')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 124415217
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '124415217')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195865167
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195865167')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167610598
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167610598')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222048532
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222048532')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 123026462
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '123026462')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 137570491
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '137570491')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218099181
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218099181')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 95234496
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '95234496')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 18545701K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '18545701K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 162852396
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '162852396')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219743912
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219743912')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 284960521
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '284960521')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213755870
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213755870')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 20316842K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '20316842K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213856286
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213856286')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 80938969
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '80938969')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 143735974
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '143735974')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 67674375
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '67674375')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 191100239
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '191100239')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216594487
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216594487')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213924761
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213924761')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 180675442
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '180675442')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184133458
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184133458')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209410087
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209410087')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 104636519
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '104636519')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 191208870
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '191208870')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 175406476
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '175406476')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 158069180
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '158069180')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 16993987K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '16993987K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214896834
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214896834')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 129231661
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '129231661')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 88094220
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '88094220')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195345228
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195345228')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 99413875
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '99413875')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 105303068
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '105303068')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 106335974
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '106335974')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 197176350
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '197176350')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 19952187K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '19952187K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 133104917
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '133104917')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 135140457
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '135140457')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 233077070
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '233077070')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 120912666
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '120912666')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223335349
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223335349')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 196633642
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '196633642')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 125474659
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '125474659')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 22087561K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '22087561K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 20482400K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '20482400K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 227621141
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '227621141')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 205501126
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '205501126')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 13896466K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '13896466K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 115735578
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '115735578')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 248198613
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '248198613')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 265700918
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '265700918')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 268615245
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '268615245')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195968055
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195968055')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 190880230
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '190880230')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195120897
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195120897')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 279818822
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '279818822')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216261240
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216261240')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 76074054
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '76074054')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 235290235
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '235290235')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 24278779K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '24278779K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 159282686
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '159282686')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184137909
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184137909')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217133750
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217133750')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 139366506
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '139366506')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218529321
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218529321')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 142708868
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '142708868')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 224068557
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '224068557')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 226394885
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '226394885')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216472861
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216472861')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 82714308
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '82714308')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 257302946
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '257302946')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221994329
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221994329')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 73907897
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '73907897')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 242858743
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '242858743')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195314861
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195314861')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 250474784
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '250474784')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 282038463
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '282038463')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 282038455
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '282038455')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 151850650
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '151850650')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 129728000
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '129728000')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 19508484K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '19508484K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 262842800
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '262842800')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 131451946
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '131451946')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219404107
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219404107')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208435582
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208435582')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 244491650
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '244491650')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 19109610K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '19109610K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 250334206
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '250334206')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 254962007
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '254962007')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 24542387K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '24542387K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 236167496
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '236167496')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 66661288
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '66661288')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 265029876
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '265029876')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 411155528
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '411155528')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 142310090
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '142310090')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 116818272
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '116818272')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253705108
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253705108')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 225487715
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '225487715')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218927564
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218927564')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 18180954K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '18180954K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 103368332
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '103368332')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218557902
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218557902')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221207777
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221207777')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 228328618
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '228328618')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 132467854
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '132467854')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 191074300
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '191074300')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 415924259
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '415924259')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 26176217K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '26176217K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 114036366
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '114036366')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 97557551
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '97557551')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 106763461
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '106763461')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 275393711
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '275393711')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 14319745K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '14319745K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255665189
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255665189')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 176162759
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '176162759')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195954399
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195954399')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223368875
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223368875')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 133083197
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '133083197')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219099665
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219099665')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 109781290
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '109781290')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 224370636
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '224370636')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 205156366
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '205156366')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167637019
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167637019')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 95559745
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '95559745')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 178432095
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '178432095')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202753523
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202753523')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 093015886
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '093015886')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 176137975
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '176137975')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222535123
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222535123')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211770805
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211770805')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 158792869
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '158792869')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219179774
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219179774')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167310974
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167310974')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 27250931K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '27250931K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 15179629K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '15179629K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 163295962
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '163295962')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 116316005
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '116316005')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206313994
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206313994')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167742548
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167742548')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 127003988
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '127003988')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 108332298
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '108332298')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 101699455
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '101699455')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 143908364
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '143908364')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238868793
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238868793')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222798507
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222798507')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 61567275
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '61567275')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 119129109
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '119129109')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219457677
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219457677')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 201968194
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '201968194')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 16282693K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '16282693K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 175713484
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '175713484')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 263300238
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '263300238')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220971244
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220971244')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 140889822
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '140889822')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218075606
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218075606')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 86206351
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '86206351')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 242282078
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '242282078')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218818749
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218818749')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 178427067
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '178427067')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 107910530
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '107910530')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 127003988
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '127003988')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 229428330
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '229428330')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208808516
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208808516')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 82563970
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '82563970')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210943477
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210943477')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 138002233
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '138002233')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 129736801
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '129736801')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 264950988
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '264950988')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 103115191
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '103115191')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 136245384
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '136245384')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21681004K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21681004K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 200231856
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '200231856')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 229212141
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '229212141')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 246976848
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '246976848')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195103038
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195103038')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 236641945
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '236641945')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 177368687
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '177368687')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 161087025
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '161087025')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 165132742
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '165132742')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 201947391
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '201947391')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 118386558
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '118386558')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 70653516
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '70653516')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219392311
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219392311')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 118979974
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '118979974')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219146175
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219146175')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 287123760
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '287123760')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 190894444
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '190894444')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 252666370
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '252666370')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253725273
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253725273')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 193315232
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '193315232')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 161566101
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '161566101')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209593238
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209593238')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209534916
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209534916')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 101864448
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '101864448')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 61117768
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '61117768')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 145763878
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '145763878')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167609694
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167609694')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 52960231
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '52960231')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 19595075K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '19595075K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 92931714
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '92931714')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209780674
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209780674')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238614252
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238614252')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238348692
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238348692')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 239757707
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '239757707')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216788702
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216788702')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 96459130
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '96459130')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 173942273
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '173942273')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 215066592
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '215066592')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 61825908
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '61825908')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 127042372
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '127042372')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 87245209
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '87245209')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 283990559
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '283990559')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209779862
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209779862')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 208849964
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '208849964')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 20480793K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '20480793K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 237268326
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '237268326')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 137248360
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '137248360')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 144146301
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '144146301')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 109781290
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '109781290')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184183528
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184183528')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195103038
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195103038')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 76423555
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '76423555')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 188167979
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '188167979')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 246976848
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '246976848')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238563135
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238563135')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 17207331K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '17207331K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219803230
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219803230')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216614372
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216614372')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 143901653
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '143901653')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 153831440
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '153831440')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255849387
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255849387')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221695100
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221695100')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 15681010K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '15681010K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214501619
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214501619')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 235377845
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '235377845')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 190895602
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '190895602')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 244491650
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '244491650')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 161675865
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '161675865')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213778072
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213778072')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261362562
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261362562')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 190893294
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '190893294')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210757147
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210757147')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220039064
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220039064')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 173947720
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '173947720')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212134988
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212134988')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 109268801
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '109268801')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211563028
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211563028')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 90120522
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '90120522')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 115708724
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '115708724')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219037597
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219037597')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 215205568
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '215205568')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 239346200
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '239346200')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 127019029
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '127019029')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 84169196
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '84169196')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 232467649
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '232467649')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211288728
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211288728')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 201550130
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '201550130')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 217281784
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '217281784')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 162851284
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '162851284')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 19155647K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '19155647K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 106631603
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '106631603')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 23562155K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '23562155K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261221764
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261221764')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 800902832
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '800902832')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219835590
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219835590')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 24054833K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '24054833K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 100168235
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '100168235')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 181085363
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '181085363')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 22242755K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '22242755K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245988516
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245988516')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 111498733
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '111498733')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 224260628
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '224260628')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218818749
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218818749')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 86500787
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '86500787')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206128089
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206128089')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 201501504
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '201501504')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 17208110K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '17208110K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 76714398
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '76714398')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 88499417
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '88499417')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184105076
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184105076')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 79488550
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '79488550')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 107329595
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '107329595')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 255537717
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '255537717')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 188168426
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '188168426')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 191113225
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '191113225')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218450946
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218450946')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216330823
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216330823')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 101174581
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '101174581')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 286237940
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '286237940')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 91320665
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '91320665')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 16600490K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '16600490K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 118978749
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '118978749')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 7554135K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '7554135K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 131469454
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '131469454')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 191208579
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '191208579')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 103839688
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '103839688')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 123807545
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '123807545')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 251290342
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '251290342')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 267164312
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '267164312')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 232887044
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '232887044')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 172226698
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '172226698')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 118386558
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '118386558')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 123293320
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '123293320')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219206526
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219206526')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202752233
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202752233')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 205192557
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '205192557')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 248220325
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '248220325')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219547854
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219547854')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211356995
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211356995')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 192006104
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '192006104')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 81520135
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '81520135')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 22928276K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '22928276K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 258326822
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '258326822')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 54953720
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '54953720')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 49820836
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '49820836')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206836512
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206836512')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 257782484
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '257782484')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222066808
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222066808')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206582928
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206582928')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202579337
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202579337')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 153831440
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '153831440')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211515759
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211515759')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223489419
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223489419')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 122994023
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '122994023')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218744494
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218744494')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222066808
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222066808')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 63379937
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '63379937')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 237753089
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '237753089')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 74564100
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '74564100')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 181063939
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '181063939')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 151876773
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '151876773')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184150093
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184150093')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214200538
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214200538')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 131333994
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '131333994')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 79009822
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '79009822')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 161526029
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '161526029')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 118966945
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '118966945')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167682588
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167682588')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 177502731
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '177502731')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 11315876K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '11315876K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 76534144
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '76534144')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 20489793K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '20489793K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 5554994K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '5554994K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 234452150
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '234452150')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 163301733
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '163301733')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 15158828K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '15158828K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211401710
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211401710')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 106610851
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '106610851')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 161543713
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '161543713')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 135081477
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '135081477')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223804411
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223804411')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 87005585
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '87005585')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223137156
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223137156')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 147843599
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '147843599')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 62838590
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '62838590')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 16600795K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '16600795K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 79432601
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '79432601')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214565099
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214565099')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 233486043
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '233486043')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 247132279
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '247132279')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 42654809
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '42654809')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 262268535
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '262268535')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214727560
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214727560')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 253811749
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '253811749')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214727560
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214727560')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221872770
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221872770')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 229745247
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '229745247')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 168961057
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '168961057')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167632122
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167632122')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 106685177
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '106685177')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 191202651
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '191202651')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21602415K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21602415K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 183752758
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '183752758')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 12698202K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '12698202K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 108588934
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '108588934')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 176479655
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '176479655')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 75450044
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '75450044')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 132242256
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '132242256')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 142060752
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '142060752')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 173957548
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '173957548')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220834115
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220834115')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 53850030
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '53850030')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214956292
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214956292')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 264015111
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '264015111')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 270529305
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '270529305')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 178977350
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '178977350')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 096546734
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '096546734')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 88868994
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '88868994')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 188104517
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '188104517')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 224432550
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '224432550')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 80118600
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '80118600')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 160372826
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '160372826')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 94135249
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '94135249')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 172088090
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '172088090')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 28346380K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '28346380K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 158750635
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '158750635')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 16993987K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '16993987K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 17615022K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '17615022K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167397417
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167397417')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 16764354K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '16764354K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 60453004
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '60453004')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 146070361
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '146070361')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222407087
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222407087')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 57732954
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '57732954')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 15614889K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '15614889K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 263255682
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '263255682')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 10006023K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '10006023K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 210989390
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '210989390')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 77170227
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '77170227')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 52944775
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '52944775')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 254612197
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '254612197')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 262842800
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '262842800')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219280033
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219280033')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220174964
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220174964')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221914775
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221914775')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 158984202
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '158984202')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 270003761
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '270003761')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 110340923
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '110340923')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222092604
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222092604')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 207211036
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '207211036')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211672935
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211672935')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167627420
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167627420')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 415628528
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '415628528')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 155933720
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '155933720')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 151836763
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '151836763')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 76111960
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '76111960')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 23533075K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '23533075K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 266971257
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '266971257')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 271854854
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '271854854')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 200880706
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '200880706')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 204413185
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '204413185')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 246052646
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '246052646')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 158087170
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '158087170')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 17240948
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '17240948')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 247265023
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '247265023')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 261869667
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '261869667')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219468660
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219468660')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 229867875
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '229867875')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 175713492
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '175713492')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 151844235
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '151844235')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 158545152
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '158545152')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 215698629
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '215698629')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 214549735
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '214549735')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 203635621
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '203635621')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 25271636K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '25271636K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 80811098
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '80811098')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 139531809
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '139531809')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 245062915
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '245062915')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 111025126
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '111025126')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 265463568
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '265463568')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206436433
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206436433')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 232467649
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '232467649')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 235159996
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '235159996')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 142143453
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '142143453')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 123019059
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '123019059')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 112389997
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '112389997')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184095734
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184095734')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 78045507
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '78045507')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 10950100K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '10950100K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 170764536
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '170764536')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 122999769
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '122999769')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 40749004
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '40749004')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 65073525
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '65073525')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 285983347
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '285983347')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 201953146
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '201953146')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 186836782
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '186836782')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 256869357
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '256869357')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 221502639
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '221502639')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212725447
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212725447')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209829495
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209829495')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223679005
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223679005')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 231014306
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '231014306')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223308465
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223308465')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 176162759
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '176162759')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 25592639
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '25592639')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 105255543
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '105255543')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 131340680
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '131340680')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 201552583
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '201552583')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 198355372
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '198355372')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 205163344
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '205163344')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21791955K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21791955K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 151909744
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '151909744')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 237268326
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '237268326')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 167682588
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '167682588')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 129738642
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '129738642')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 138081346
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '138081346')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 90120891
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '90120891')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 234061186
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '234061186')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 18806020K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '18806020K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 174961646
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '174961646')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 269762861
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '269762861')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209829495
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209829495')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 135092754
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '135092754')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 172225314
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '172225314')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 232807296
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '232807296')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 263922980
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '263922980')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 96126700
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '96126700')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 264015111
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '264015111')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 82362177
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '82362177')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 75366582
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '75366582')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 231044116
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '231044116')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 225976503
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '225976503')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 108022701
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '108022701')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 219184042
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '219184042')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 72153375
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '72153375')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 136039563
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '136039563')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 232004258
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '232004258')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202431585
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202431585')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 206953705
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '206953705')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 222367344
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '222367344')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 138878392
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '138878392')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 176179155
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '176179155')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 131356269
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '131356269')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 13107011K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '13107011K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 183609955
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '183609955')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 265832458
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '265832458')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 279072669
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '279072669')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21622017K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21622017K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220127419
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220127419')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21306925K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21306925K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 184124521
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '184124521')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 81569487
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '81569487')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 11959846K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '11959846K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 81385378
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '81385378')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 85649639
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '85649639')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 68055377
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '68055377')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 209390426
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '209390426')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 275017051
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '275017051')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 180759743
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '180759743')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 178443518
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '178443518')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 114964271
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '114964271')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 93382935
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '93382935')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 228950556
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '228950556')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 175710485
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '175710485')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 102211367
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '102211367')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 142708868
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '142708868')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 205151435
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '205151435')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 158482290
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '158482290')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 195338795
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '195338795')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 9540975K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '9540975K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 91766434
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '91766434')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 199276743
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '199276743')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 155022396
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '155022396')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 11074398K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '11074398K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 137260042
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '137260042')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 97937656
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '97937656')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 160222298
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '160222298')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 85746588
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '85746588')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 101706443
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '101706443')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 220509443
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '220509443')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 252088466
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '252088466')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 119645158
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '119645158')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 96942990
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '96942990')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 211466162
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '211466162')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223583121
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223583121')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218786693
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218786693')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 212316687
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '212316687')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 177779431
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '177779431')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 182065331
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '182065331')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 186839781
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '186839781')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 268233407
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '268233407')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 143556484
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '143556484')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 218430759
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '218430759')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 194259492
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '194259492')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 166051657
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '166051657')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 223811086
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '223811086')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 250353596
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '250353596')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 84118904
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '84118904')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 257528030
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '257528030')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 238763207
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '238763207')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 216622952
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '216622952')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 231457259
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '231457259')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 202590314
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '202590314')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 79640247
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '79640247')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 70463129
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '70463129')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 10025882K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '10025882K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 156467413
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '156467413')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 242812042
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '242812042')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 256869357
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '256869357')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 21555127K
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '21555127K')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 129180552
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '129180552')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 105382081
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '105382081')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 181106751
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Odontología' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '181106751')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Odontología' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213091727
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Adulto' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213091727')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Adulto' LIMIT 1) IS NOT NULL;


-- Corregir especialidad para paciente 213091727
UPDATE seguimiento s
SET id_especialidad = (
    SELECT id_especialidad 
    FROM especialidad 
    WHERE nombre ILIKE 'Medicina General' 
    LIMIT 1
)
WHERE s.id_paciente = (SELECT id_paciente FROM paciente WHERE rut = '213091727')
  AND (SELECT id_especialidad FROM especialidad WHERE nombre ILIKE 'Medicina General' LIMIT 1) IS NOT NULL;


-- Rehabilitar trigger
ALTER TABLE seguimiento ENABLE TRIGGER trigger_auditoria_seguimiento;
