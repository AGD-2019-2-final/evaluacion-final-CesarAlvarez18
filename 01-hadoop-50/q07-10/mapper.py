#! /usr/bin/python3

## Esta es la funcion que mapea la entrada a parejas (clave, valor)

import sys
if __name__ == "__main__":

    ## itera sobre cada linea de codigo recibida a traves del flujo de entrada
    
    for line in sys.stdin:
        line = line.strip()
        splits = line.split("  ")
        numero=splits[2]
        numero=int(numero)
        numero=str(numero)
        if len(numero) == 1:
            a='00'
            a+=numero
            numero=a
        if len(numero) == 2:
            a='0'
            a+=numero
            numero=a
        print(splits[0] + '\t' + numero + '\t' + splits[1])
