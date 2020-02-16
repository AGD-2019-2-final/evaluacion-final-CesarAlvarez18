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
--    WHERE 
--        color REGEXP 'blue|green';
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
        
col = FOREACH u GENERATE  firstname, color ;
c = FILTER col BY  color MATCHES  '.*blue.*' or color MATCHES  '.*green.*';
STORE c INTO 'output' USING PigStorage('\t');
fs -copyToLocal output;
fs -rm *.csv;