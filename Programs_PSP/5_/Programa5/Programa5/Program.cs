//////////////////////////////////////////////
/// CLASE PARA CALCULAR INTEGRAL PROGRAMA 5
/// Programa No.    -> 5
/// *Descripcion.   -> Hace un calculo de intgral de cero a un limite. 
/// *Desarrollador. -> Alfonso Alvarez Sánchez
/// *Fecha.         -> 20 / 10 / 2011
/// Equipo          -> Individual
/// Notas           -> Calcula integral en ciertos parámetros.  
///////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Programa5
{
    class Program
    {
        //EMPIEZA CLASE PRINCIPAL
        static void Main(string[] args)
        {
            CalcularIntegral C = new CalcularIntegral();
            double total = C.terminos(0.55338, 10, 6);
            total = Math.Round(total, 5);
            Console.WriteLine(total);
            
            CalcularIntegral C1 = new CalcularIntegral();
            double total2 = C1.terminos(1.1812, 10, 10);
            total2 = Math.Round(total2, 5);
            Console.WriteLine(total2);
            
            CalcularIntegral C2 = new CalcularIntegral();
            double total3 = C2.terminos(2.750, 10, 30);
            total3 = Math.Round(total3, 5);
            Console.WriteLine(total3);
            Console.ReadLine();
        }
        //TERMINA CLASE PRINCIPAL
    }
}
