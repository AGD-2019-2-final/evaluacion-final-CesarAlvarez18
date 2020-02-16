#! /usr/bin/python3

## Esta es la funcion que mapea la entrada a parejas (clave, valor)
import sys
    
if __name__ == "__main__":

    ## itera sobre cada linea de codigo recibida a traves del flujo de entrada
    for line in sys.stdin:
        line = line.strip()
        splits = line.split(",")
        columna1=splits[0]
        columna2=splits[1]
        print(columna2 + '\t' + columna1) ## se invierte el orden de las columnas para poder ordenarlo antes por la segunda columna antes de aplicar el reducer
