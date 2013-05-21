//////////////////////////////////////////////
/// Programa No.    -> 3
/// *Descripcion.   -> Hace operaciones
/// *Desarrollador. -> Alfonso Alvarez Sánchez
/// *Fecha.         -> 23 / 09 / 2011
/// Equipo          -> Individual
/// Notas           -> Lo dificil de este es más que nada el proceso. 
///////////////////////////////////////////////

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Programa3
{
    class Program
    {
        ///**************************************
        ///***  A partir de aqui Está la lista
        ///***
        ///***************************************

        //EMPIEZA CLASE NODO
        public class Nodo
        {
            public double valor;
            public Nodo siguiente;

            public Nodo(double valor)
            {
                this.valor = valor;
            }

            public Nodo(Nodo siguiente)
            {
                this.siguiente = null;
            }

            public Nodo()
            {
                this.siguiente = null;
            }
        }
        //TERMINA CLASE NODO


        //EMPIEZA CLASE LISTA
        public class Lista
        {
            public Nodo primero;

            //EMPIEZA METODO VERIFICAR VACIO
            public bool verificarVacio
            {
                get
                {
                    return primero == null;
                }
            }
            //TERMINA METODO VERIFICAR VACIO

            //EMPIEZA CONSTRUCTOR 
            public Lista()
            {
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
                while (temporal != null)
                {
                    temporal = temporal.siguiente;
                    total++;
                }
                return total;
            }
            //TERMINA METODOCALCULARELEMENTOS

            //EMPIEZA METODO CALCULAR DESVIACION ESTANDAR
            public double calcularDesvEstandar()
            {
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

                while (temporal != null)
                {
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
                desviacion = Math.Sqrt((sumatoria / (cantidadElementos() - 1)));

                return desviacion;
            }
            //TERMINA METODO CALCULARDESVIACIONESTANDAR

            //EMPIEZA METODO OBTENER PROMEDIO
            public double obtenerPromedio(Lista lst) {
                double sum = lst.obtenerSuma();
                double numDatos = lst.cantidadElementos();
                double promedio = sum/numDatos;
                return promedio;
            }
            //TERMINA METODO OBTENER PROMEDIO

            //EMPIEZA METODO SUMATORIA CUADRADA
            public double sumatoriaCuadrada(Lista lst)
            {
                double c = 0;
                Nodo nodoTemporal = lst.primero;
                while (nodoTemporal.siguiente != null) 
                {
                    c = c + (Math.Pow(nodoTemporal.valor, 2));
                    nodoTemporal = nodoTemporal.siguiente;
                }
                c = c + (Math.Pow(nodoTemporal.valor, 2));
                return c;
            }
            //TERMINA METODO SUMATORIA CUADRADA

            // EMPIEZA METODO SUMATORIA DE MULTIPLICACION
            public double sumaDeMultiplicacion(Lista DatosX, Lista DatosY) 
            {
                double c = 0;
                Nodo nodoTemporalX = DatosX.primero;
                Nodo nodoTemporalY = DatosY.primero;
                for (int i = 0; i < DatosX.cantidadElementos(); i ++) {
                    c = c + ((nodoTemporalX.valor)*(nodoTemporalY.valor));
                    nodoTemporalX = nodoTemporalX.siguiente;
                    nodoTemporalY = nodoTemporalY.siguiente;
                }
                return c;
            }
            // TERMINA METODO SUMATORIA DE MULTIPLICACION

            // EMPIEZA METODO OBTENER BETA1
            public double obtenerBeta1(Lista DatosX, Lista DatosY) 
            {
                double dato1 = sumaDeMultiplicacion(DatosX, DatosY);
                double dato2 = ((DatosX.cantidadElementos()) * (obtenerPromedio(DatosX) * obtenerPromedio(DatosY)));
                double dato3 = sumatoriaCuadrada(DatosX);
                double dato4 = (Math.Pow(obtenerPromedio(DatosX), 2) * DatosX.cantidadElementos());
                double beta1 = ((dato1 - dato2) / (dato3 - dato4));
                return beta1;
            }
            // TERMINA METODO OBTENER BETA1

            //EMPIEZA METODO OBTENER CORRELACION
            public double obtenerCorrelacion(Lista DatosX, Lista DatosY)
            {
                double dato1 = ((sumaDeMultiplicacion(DatosX, DatosY)) * DatosX.cantidadElementos());
                double dato2 = (DatosX.obtenerSuma() * DatosY.obtenerSuma());
                double dato3 = ((DatosX.cantidadElementos() * (sumatoriaCuadrada(DatosX))) - (Math.Pow(DatosX.obtenerSuma(), 2)));
                double dato4 = ((DatosY.cantidadElementos() * (sumatoriaCuadrada(DatosY))) - (Math.Pow(DatosY.obtenerSuma(), 2)));
                double dato5 = dato1 - dato2;
                double dato6 = Math.Pow((dato3 * dato4), .5);
                double correlacion = dato5 / dato6;
                return correlacion;            
            }
            //TERMINA METODO OBTENER CORRELACION

            //EMPIEZA METODO OBTENER BETA0
            public double obtenerBeta0(Lista DatosX, Lista DatosY) 
            {
                double dato1 = obtenerPromedio(DatosY);
                double dato2 = ((obtenerBeta1(DatosX, DatosY)) * obtenerPromedio(DatosX));
                double beta0 = dato1 - dato2;
                return beta0;
            }
            //TERMINA METODO OBTENER BETA0

            //void agregarNodo(double valor)
        }
        //TERMINA CLASE LISTA

        ///**************************************
        ///***  Aqui termina la lista.
        ///***
        ///***************************************


        static void Main(string[] args)
        {
            //Crear cada lista para cada datos
            Lista DatosProxy = new Lista();
            Lista DatosPlan = new Lista();
            Lista DatosActual = new Lista();
            Lista DatosHoras = new Lista();
            //Asignar el primer valor como null a cada lsita
            DatosProxy.primero = null;
            DatosPlan.primero = null;
            DatosActual.primero = null;
            DatosHoras.primero = null;
            //Datos del Proxy
            DatosProxy.agregarNodo(130);
            DatosProxy.agregarNodo(650);
            DatosProxy.agregarNodo(99);
            DatosProxy.agregarNodo(150);
            DatosProxy.agregarNodo(128);
            DatosProxy.agregarNodo(302);
            DatosProxy.agregarNodo(95);
            DatosProxy.agregarNodo(945);
            DatosProxy.agregarNodo(368);
            DatosProxy.agregarNodo(961);
            //Datos de Planeadas
            DatosPlan.agregarNodo(163);
            DatosPlan.agregarNodo(765);
            DatosPlan.agregarNodo(141);
            DatosPlan.agregarNodo(166);
            DatosPlan.agregarNodo(137);
            DatosPlan.agregarNodo(355);
            DatosPlan.agregarNodo(136);
            DatosPlan.agregarNodo(1206);
            DatosPlan.agregarNodo(433);
            DatosPlan.agregarNodo(1130);
            //datos de Actuales
            DatosActual.agregarNodo(186);
            DatosActual.agregarNodo(699);
            DatosActual.agregarNodo(132);
            DatosActual.agregarNodo(272);
            DatosActual.agregarNodo(291);
            DatosActual.agregarNodo(331);
            DatosActual.agregarNodo(199);
            DatosActual.agregarNodo(1890);
            DatosActual.agregarNodo(788);
            DatosActual.agregarNodo(1601);
            //Datosde Horas
            DatosHoras.agregarNodo(15.0);
            DatosHoras.agregarNodo(69.9);
            DatosHoras.agregarNodo(6.5);
            DatosHoras.agregarNodo(22.4);
            DatosHoras.agregarNodo(28.4);
            DatosHoras.agregarNodo(65.9);
            DatosHoras.agregarNodo(19.4);
            DatosHoras.agregarNodo(198.7);
            DatosHoras.agregarNodo(38.8);
            DatosHoras.agregarNodo(138.2);

            //Aqui van las pruebas



            Console.WriteLine("TEST 1: Las betas y correlacion entre tamaño de proxy y agregadas y modificadas es: ");
            double betaProxyVsActual = DatosProxy.obtenerBeta1(DatosProxy, DatosActual);
            double betaProxyVsActual2 = DatosProxy.obtenerBeta0(DatosProxy, DatosActual);
            double Correlacion = DatosProxy.obtenerCorrelacion(DatosProxy, DatosActual);
            Console.WriteLine("Beta 1 = "+betaProxyVsActual);
            Console.WriteLine("Beta 0 = " + betaProxyVsActual2);
            Console.WriteLine("Correlacion = " + Correlacion);
            Console.WriteLine("R cuadrada = " + Math.Pow(Correlacion,2));
            Console.WriteLine("Y = " + (betaProxyVsActual2 + betaProxyVsActual*386));

            Console.ReadLine();

            Console.WriteLine("TEST 2: Las betas y correlacion entre tamaño de proxy y tiempo actual de desarrollo es: ");
            double betaProxyVsTiempo = DatosProxy.obtenerBeta1(DatosProxy, DatosHoras);
            double betaProxyVsTiempo2 = DatosProxy.obtenerBeta0(DatosProxy, DatosHoras);
            double Correlacion2 = DatosProxy.obtenerCorrelacion(DatosProxy, DatosHoras);
            Console.WriteLine("Beta 1 = " + betaProxyVsTiempo);
            Console.WriteLine("Beta 0 = " + betaProxyVsTiempo2);
            Console.WriteLine("Correlacion = " + Correlacion2);
            Console.WriteLine("R cuadrada = " + Math.Pow(Correlacion2, 2));
            Console.WriteLine("Y = " + (betaProxyVsTiempo2 + betaProxyVsTiempo * 386));

            Console.ReadLine();

            Console.WriteLine("TEST 3: Las betas y correlacion entre planeadas y actuales agregadas y modificadas es: ");
            double betaPlanVsActuales = DatosProxy.obtenerBeta1(DatosPlan, DatosActual);
            double betaPlanVsActuales2 = DatosProxy.obtenerBeta0(DatosPlan, DatosActual);
            double Correlacion3 = DatosProxy.obtenerCorrelacion(DatosPlan, DatosActual);
            Console.WriteLine("Beta 1 = " + betaPlanVsActuales);
            Console.WriteLine("Beta 0 = " + betaPlanVsActuales2);
            Console.WriteLine("Correlacion = " + Correlacion3);
            Console.WriteLine("R cuadrada = " + Math.Pow(Correlacion3, 2));
            Console.WriteLine("Y = " + (betaPlanVsActuales2 + betaPlanVsActuales * 386));

            Console.ReadLine();

            Console.WriteLine("TEST 4: Las betas y correlacion entre planeadas y tiempo actual de desarrollo es: ");
            double betaPlaneadasVsActual = DatosProxy.obtenerBeta1(DatosPlan, DatosHoras);
            double betaPlaneadasVsActual2 = DatosProxy.obtenerBeta0(DatosPlan, DatosHoras);
            double Correlacion4 = DatosProxy.obtenerCorrelacion(DatosPlan, DatosHoras);
            Console.WriteLine("Beta 1 = " + betaPlaneadasVsActual);
            Console.WriteLine("Beta 0 = " + betaPlaneadasVsActual2);
            Console.WriteLine("Correlacion = " + Correlacion4);
            Console.WriteLine("R cuadrada = " + Math.Pow(Correlacion4, 2));
            Console.WriteLine("Y = " + (betaPlaneadasVsActual2 + betaPlaneadasVsActual * 386));

            Console.ReadLine();



        }
    }
}
