-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
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
        
per = FOREACH u GENERATE SUBSTRING(birthday, 0 ,4) as pri;
grouped = GROUP per BY pri;
wordcount = FOREACH grouped GENERATE group, COUNT(per);
STORE wordcount INTO 'output'  USING PigStorage(',');

fs -copyToLocal output;
fs -rm *.csv;
