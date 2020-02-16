#! /usr/bin/python3

##
## Esta es la funcion que mapea la entrada a parejas (clave, valor)
##
import sys
if __name__ == "__main__":

    ##
    ## itera sobre cada linea de codigo recibida
    ## a traves del flujo de entrada
    ##
    
    for line in sys.stdin:
        line = line.strip()
        splits = line.split("  ")
        print(splits[0] + '\t' + splits[2])
