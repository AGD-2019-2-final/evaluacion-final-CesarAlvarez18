-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;

fs -copyFromLocal data.tsv

u = LOAD 'data.tsv' AS (f1:CHARARRAY, f2:CHARARRAY, f3:INT);
s = GROUP u BY f1;
d = FOREACH s GENERATE group, COUNT(u.f1);
STORE d INTO 'output';

fs -copyToLocal output
fs -rm *.tsv
