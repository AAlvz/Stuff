using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

namespace ListaEncadenada
{
    class Program
    {
        
        /*
        class Nodo {
            
        }//fin clase nodo
        */
        public class Listisima {
            Nodo ultimo, siguiente;
            int contador;

            public Listisima() {
                ultimo = siguiente = new Nodo(0.0);
                contador = 0;
            }
        }
            
        static void Main(string[] args)
        {
            double media = 0;
            double acumulado = 0;
            double veces= 0;
           Console.WriteLine("Dame un valor: ");
           double numero = Convert.ToInt16(Console.ReadLine());
            acumulado = numero;
            veces++;
            Nodo nodo = new Nodo(numero, null);
            Cabeza.agregar(numero);
            Console.WriteLine("Dame otro valor: ");
            numero = Convert.ToInt16(Console.ReadLine());
            veces++;
            acumulado = acumulado + numero;
            while(numero.toString() != "00"){
                Cabeza.agregar(numero);
                Console.WriteLine("Dame otro valor: ");
                numero = Convert.ToInt16(Console.ReadLine());
                acumulado = acumulado + numero;
                veces++;
            }
                Console.WriteLine("Hemos Terminado");
                media = acumulado/ veces;
                Console.WriteLine("La media es: " + media);
                Console.ReadLine();
            
        }

        

        public void calcularDesvEst(){
        
        }
        /*
        public class crearLista : IList{
            public Nodo siguiente, ultimo;
            public int contador;

            public crearLista{
                ultimo = siguiente = new Nodo(null);
                contador = 0;
            }
         }//fin crearLista
         */ 
    }//fin clase program
}
