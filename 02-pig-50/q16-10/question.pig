-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT
--        firstname,
--        color
--    FROM 
--        u
--    WHERE color = 'blue' OR firstname LIKE 'K%';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
fs -copyFromLocal data.csv;

u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
col = FOREACH u GENERATE firstname, color, SUBSTRING(firstname, 0 ,1) as letra;
c = FILTER col BY  color MATCHES 'blue' or letra MATCHES 'K'  ;
d = FOREACH c GENERATE $0, $1 ;
STORE d INTO 'output' USING PigStorage(',');

fs -copyToLocal output;
fs -rm *.csv;