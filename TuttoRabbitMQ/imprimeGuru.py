#!/usr/bin/python
import subprocess
import os
import threading

#print impresoras
estado = subprocess.Popen(["lpstat", "-p"], stdout=subprocess.PIPE)
out, err = estado.communicate()

if "inactiva" in out:
    print "DICE EL PROGRAMA QUE LA IMPRESORA ESTA INACTIVA"
else:
    print "DICE EL PROGRAMA QUE LA IMPRESORA NO ESTA INACTIVA"

def func_imprimir():
    if err is None:
        if "Ready to print" or "Lista para imprimir" in out:
            print "YA ESTA LISTA. MANDA OTRO"
            return(0)
        elif "inactiva" in out:
            print "ESPERA.. AUN NO.. VUELVE EN 2 SEGUNDOS.... "
            t=threading.Timer(2.0, func_imprimir).start()
        else:
            print "Sucede otra cosa pero no es error"
    else:
        print "Ha ocurrido un error"

func_imprimir()
