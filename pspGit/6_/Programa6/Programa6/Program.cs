//////////////////////////////////////////////
/// CLASE PARA ENCONTRAR X DE UNA INTEGRAL
/// Programa No.    -> 6
/// *Descripcion.   -> Encuentra la X necesaria del resultado de una integral 
/// *Desarrollador. -> Alfonso Alvarez Sánchez
/// *Fecha.         -> 28 / 10 / 2011
/// Equipo          -> Individual
/// Notas           -> Calcula la x en una integral  
///////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Programa6
{
    class Program
    {
        static void Main(string[] args)
        {
            EncontrarXdeIntegral Enc = new EncontrarXdeIntegral();
            double x = Enc.obtenerX(.20, 6);
            Console.WriteLine("El resultado es:" + x);
            Console.ReadLine();

            double x2 = Enc.obtenerX(.45, 15);
            Console.WriteLine("El resultado es:" + x2);
            Console.ReadLine();

            double x3 = Enc.obtenerX(.495, 4);
            Console.WriteLine("El resultado es:" + x3);
            Console.ReadLine();
        }
    }
}
