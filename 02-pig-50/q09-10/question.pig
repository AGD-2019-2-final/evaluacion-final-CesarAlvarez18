-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.csv` escriba una consulta en Pig que genere la 
-- siguiente salida:
-- 
--   Vivian@Hamilton
--   Karen@Holcomb
--   Cody@Garrett
--   Roth@Fry
--   Zoe@Conway
--   Gretchen@Kinney
--   Driscoll@Klein
--   Karyn@Diaz
--   Merritt@Guy
--   Kylan@Sexton
--   Jordan@Estes
--   Hope@Coffey
--   Vivian@Crane
--   Clio@Noel
--   Hope@Silva
--   Ayanna@Jarvis
--   Chanda@Boyer
--   Chadwick@Knight
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
fs -copyFromLocal data.csv;

lines = LOAD './data.csv' USING PigStorage(',') AS 
(f1:INT ,
f2:CHARARRAY ,
f3:CHARARRAY,
f4:INT,
f5:CHARARRAY,
f6:INT);
mail = FOREACH lines GENERATE  CONCAT (f2,'@', f3) as correo;
STORE mail INTO 'output';

fs -copyToLocal output;
fs -rm *.csv;