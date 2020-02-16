#! /usr/bin/python3

## Esta es la funcion que mapea la entrada a parejas (clave, valor)
import sys
if __name__ == "__main__":

    ## itera sobre cada linea de codigo recibida a traves del flujo de entrada
    
    for line in sys.stdin:
        ##line = line.strip()
        ##print(line)
        ##credit_history = ""
        ##splits = line.split(",")
        ##credit_history = splits[2]   
        ##print(splits[2] + '\t' + '1')
        ##print(credit_history + '\t'+ '1')
        
        purpose=""
        amount=0     
        splits = line.split(",")
        purpose=splits[3]
        amount=splits[4]
        suma = int(amount)
        print(purpose + '\t' + amount)
        ##print(len(splits[4]))
        ##print(len(amount))
        ##print(type(amount))
 
    ## genera las tuplas palabra \tabulador 1 ya que es un conteo de palabras
    ##sys.stdout.write("{}\t1\n".format(splits[2]))
