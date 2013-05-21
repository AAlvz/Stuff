using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ListaEncadenada
{
    class Nodo
    {
        public double valor;
        public Nodo siguiente, ultimo;

        public Nodo(double valor, Nodo siguiente, Nodo ultimo)
        {
            this.valor = valor;
            this.siguiente = siguiente;
            this.ultimo = ultimo;
        }



        public Nodo(double valor) : this(valor, null) { }

        

        
    }
}
