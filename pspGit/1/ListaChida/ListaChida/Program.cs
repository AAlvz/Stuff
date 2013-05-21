using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ListaChida
{
    //EMPIEZA CLASE PROGRAMA
    class Program
    {
        //EMPIEZA CLASE NODO
        public class Nodo {
            public double valor;
            public Nodo siguiente;

            public Nodo(double valor) {
                this.valor = valor;
            }

            public Nodo(Nodo siguiente) {
                this.siguiente = null;
            }

            public Nodo()
            {
                this.siguiente = null;
            }
        }
        //TERMINA CLASE NODO
        

        //EMPIEZA CLASE LISTA
        public class Lista {
            public Nodo primero;

            //EMPIEZA METODO VERIFICAR VACIO
            public bool verificarVacio {
                get {
                    return primero == null;
                }
            }
            //TERMINA METODO VERIFICAR VACIO

            //EMPIEZA CONSTRUCTOR 
            public Lista() {
                primero = null;
            }
            //TERMINA CONSTRUCTOR

            //EMPIEZA METODO AGREGAR NODO
            public void agregarNodo(double valor)
            {
                Nodo nodo = new Nodo(valor);
                nodo.valor = valor;
                nodo.siguiente = primero;
                primero = nodo;
            }
            //TERMINA METODO AGREGAR NODO

            //EMPIEZA METODO OBTENERSUMA
            public double obtenerSuma()
            {
                Nodo nodoTemporal = new Nodo();
                nodoTemporal = primero;
                double suma = 0;
                while (nodoTemporal != null)
                {
                    double i = nodoTemporal.valor;
                    nodoTemporal = nodoTemporal.siguiente;
                    suma = suma + i;
                }
                return suma;
            }
            //TERMINA METODO OBTENERSUMA

            //EMPIEZA METODO CANTIDADEMELENTOS
            public int cantidadElementos() 
            {
                int total = 0;
                Nodo temporal = new Nodo();
                temporal = primero;
                while (temporal != null) {
                    temporal = temporal.siguiente;
                    total++;
                }
                return total;
            }
            //TERMINA METODOCALCULARELEMENTOS

            //EMPIEZA METODO CALCULAR DESVIACION ESTANDAR
            public double calcularDesvEstandar() {
                double desviacion = 0;
                Nodo temporal = new Nodo();
                temporal = primero;
                int cantidad = this.cantidadElementos();
                double[] vector;
                vector = new double[cantidad];
                int i = 0;
                double promedio = obtenerSuma() / cantidadElementos();
                Console.WriteLine("El promedio es: " + promedio);
                //Recorro los valores
                //llenar el vector
                              
                while (temporal != null) {
                    vector[i] = temporal.valor;
                    temporal = temporal.siguiente;
                    i++;
                }
                double sumatoria = 0;
                for (int j = 0; j < cantidad; j++)
                {
                    Console.WriteLine(vector[j]);
                    double numeroActual = vector[j];
                    sumatoria = sumatoria + Math.Pow((numeroActual - promedio), 2);
                    Console.WriteLine("La sumatoria es: " + sumatoria);
                }
                desviacion = Math.Sqrt((sumatoria/(cantidadElementos()-1)));

                return desviacion;
            }
            //TERMINA METODO CALCULARDESVIACIONESTANDAR

            //void agregarNodo(double valor)
        }
        //TERMINA CLASE LISTA

        public static void Main(string[] args)
        {
            Console.WriteLine("Aqui empieza todo. ojala no truene");
            Console.ReadLine();
            Lista Listilla = new Lista();
            Listilla.primero = null;
            /*
             //PRUEBA UNO
              
            Listilla.agregarNodo(186);
            Listilla.agregarNodo(699);
            Listilla.agregarNodo(132);
            Listilla.agregarNodo(272);
            Listilla.agregarNodo(291);
            Listilla.agregarNodo(331);
            Listilla.agregarNodo(199);
            Listilla.agregarNodo(1890);
            Listilla.agregarNodo(788);
            Listilla.agregarNodo(1601);
            double suma = Listilla.obtenerSuma();
            double totalElementos = Listilla.cantidadElementos();
            Console.WriteLine("La suma de tus productos es: " + suma);
            Console.ReadLine();
            Console.WriteLine("El total de elementos es: " + totalElementos);
            Console.WriteLine("Por lo tanto, la media es: " + suma/totalElementos);
            Console.ReadLine();
            Console.WriteLine("Yeah");
            Console.ReadLine();
            Console.WriteLine("La desv estandar es: " + Listilla.calcularDesvEstandar());
            Console.ReadLine();
            Console.WriteLine("Yeah");
            Console.ReadLine();
            */

            /*
             // PRUEBA DOS
            Console.WriteLine("Ahi van las otras 2 Pruebas");
            Listilla.agregarNodo(160);
            Listilla.agregarNodo(591);
            Listilla.agregarNodo(114);
            Listilla.agregarNodo(229);
            Listilla.agregarNodo(230);
            Listilla.agregarNodo(270);
            Listilla.agregarNodo(128);
            Listilla.agregarNodo(1657);
            Listilla.agregarNodo(624);
            Listilla.agregarNodo(1503);
            Console.WriteLine("La desv estandar es: " + Listilla.calcularDesvEstandar());
            
             */
            
            // * PRUEBA TRES
            Console.WriteLine("Ahi van la otra Prueba");
            Listilla.agregarNodo(15.0);
            Listilla.agregarNodo(69.9);
            Listilla.agregarNodo(6.5);
            Listilla.agregarNodo(22.4);
            Listilla.agregarNodo(28.4);
            Listilla.agregarNodo(65.9);
            Listilla.agregarNodo(19.4);
            Listilla.agregarNodo(198.7);
            Listilla.agregarNodo(38.8);
            Listilla.agregarNodo(138.2);
            Console.WriteLine("La desv estandar es: " + Listilla.calcularDesvEstandar());
            Console.ReadLine();
             


        }
        //TERMINA METODO MAIN

        

        //public void agregarValor(double valor)

        

        //para agregar
        //Listilla.agregarNodo(valor);


    }//TERMINA CLASE PROGRAMA
}
