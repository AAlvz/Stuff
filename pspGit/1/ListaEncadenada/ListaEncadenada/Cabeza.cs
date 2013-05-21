using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ListaEncadenada
{
    class Cabeza
    {
            Nodo primero;
	        public Cabeza(){
			    primero = null;
		    }
	
	        public int cantidadNodos(){
		    int i=0;
		    Nodo actual = primero;
		    while(actual!=null){
			    i++;
			    actual=actual.siguiente;
		    }
		    return i;
	        }

            public void agregar(double valor)
            {
                Nodo nuevo = new Nodo(valor);
                nuevo.next = primero;
                primero = nuevo;
            
            }
	
	    public float getData(int i){
		    Nodo actual = primero;
		    int j=0;
		    while(actual !=null){
			    if(j==i)
				    return actual.valor;
			    actual=actual.siguiente;
			    j++;
		    }
		    return 0;
	    }
    }
}
