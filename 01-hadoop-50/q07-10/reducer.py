#! /usr/bin/python3

import sys
## Esta funcion ordena los elementos

if __name__ == '__main__':

    ## cada linea de texto recibida es una entrada clave \tabulador valor 
   
    for line in sys.stdin:
        line = line.strip()
        splits = line.split("\t")
        key, val, fecha = line.split("\t")
        val = int(val) # le quita el cero al inicio a los valores de 1 y 2 cifras que tienen cero al principio
        val = str(val)
        print(key + '\t' + fecha + '\t' + val)
