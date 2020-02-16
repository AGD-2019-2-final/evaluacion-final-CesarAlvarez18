#! /usr/bin/python3

## Esta es la funcion que mapea la entrada a parejas (clave, valor)
import sys
    
if __name__ == "__main__":
    
    for line in sys.stdin:
        
        line = line.strip()
        splits1 = line.split("\t")
        #splits2 = line.split(",")
        numero=splits1[0]
        letras=splits1[1]
        for i in range(0, len(letras), 2):
            numero=str(numero)
            if len(numero) == 1:
                a='0'
                a+=numero
                numero=a
            print(letras[i] + "\t" + numero)
