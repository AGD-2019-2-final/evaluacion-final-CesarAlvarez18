#! /usr/bin/python3

import sys

## Esta funcion reduce los elementos que tienen la misma clave

if __name__ == '__main__':

    curkey = None
    cadena=""
    ## cada linea de texto recibida es una entrada clave \tabulador valor
    
    for line in sys.stdin:
        
        line = line.strip()
        splits = line.split("\t")      
        key, val = line.split("\t")
        val = int(val) # le quita el cero al inicio a los valores de 1 cifra que tienen cero al principio
        val = str(val)
        
        if key == curkey:
            ## No se ha cambiado de clave. Aca se acumulan los valores para la misma clave.
            cadena += ","
            cadena += val
        else:
            ## Se cambio de clave. Se reinicia el acumulador.
            if curkey is not None:                
                ## una vez se han reducido todos los elementos con la misma clave se imprime el resultado en el flujo de salida
                #sys.stdout.write("{}\t{}\t{}\n".format(curkey, total, total/cont))
                print(curkey + "\t" + cadena)
                
            curkey = key
            cadena = val
    #sys.stdout.write("{}\t{}\t{}\n".format(curkey, total, total/cont))
    print(curkey + "\t" + cadena)
