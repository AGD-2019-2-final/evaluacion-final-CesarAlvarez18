-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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
words = FOREACH lines GENERATE FLATTEN(f3) AS word;
datos = FOREACH words GENERATE $0 as s;
grouped = GROUP datos BY s;
wordcount = FOREACH grouped GENERATE group, COUNT(datos);
STORE wordcount INTO 'output' using PigStorage(',');

fs -copyToLocal output;
fs -rm *.tsv;