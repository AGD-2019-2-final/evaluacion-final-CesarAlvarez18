#! /usr/bin/python3

import sys
## Esta funcion ordena los elementos

if __name__ == '__main__':
    ## cada linea de texto recibida es una entrada clave \tabulador valor 
        
    for line in sys.stdin:
        line = line.strip()
        splits = line.split("\t")
        valor, clave = line.split()
        print(clave + ',' + valor)
