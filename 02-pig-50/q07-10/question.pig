-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

fs -copyFromLocal data.tsv;

lines = LOAD './data.tsv' USING PigStorage('\t') AS 
(f1:CHARARRAY, f2:BAG{t:TUPLE(p:CHARARRAY)}, f3:MAP[]);
words = FOREACH lines GENERATE f1, SIZE(f2) as word1 , SIZE(f3) as word2;
final = ORDER words BY f1, word1, word2;
STORE final INTO 'output' using PigStorage(',');

fs -copyToLocal output;
fs -rm *.tsv;
