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
        ##splits = line.split("\t")
        #val1, val2, val3 = line.split("\t")
        ###print(line)
        ###print(splits[0] + "\t1")
        #print(val1, val2, val3)
        
        purpose=""
        amount=0     
        splits = line.split("-")
        purpose=splits[0]
        #amount=splits[1]
        #suma = int(amount)
        #print(purpose + '\t' + amount)
        print(splits[1] + '\t1')
        ## genera las tuplas palabra \tabulador 1 ya que es un conteo de palabras
        #sys.stdout.write("{}\t1\n".format(splits[0]))       
