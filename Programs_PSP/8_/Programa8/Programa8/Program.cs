using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Programa8
{
    class Program
    {
        static void Main(string[] args)
        {
            List<double> DatosW = new List<double>();
            List<double> DatosX = new List<double>();
            List<double> DatosY = new List<double>();
            List<double> DatosZ = new List<double>();

            DatosW.Add(345); DatosW.Add(168); DatosW.Add(94); DatosW.Add(187); DatosW.Add(621); DatosW.Add(255);
            DatosX.Add(65); DatosX.Add(18); DatosX.Add(0); DatosX.Add(185); DatosX.Add(87); DatosX.Add(0);
            DatosY.Add(23); DatosY.Add(18); DatosY.Add(0); DatosY.Add(98); DatosY.Add(10); DatosY.Add(0);
            DatosZ.Add(31.4); DatosZ.Add(14.6); DatosZ.Add(6.4); DatosZ.Add(28.3); DatosZ.Add(42.1); DatosZ.Add(15.3); 

            Gauss G = new Gauss();
            Funciones F = new Funciones();
            double[,] a = F.llenarMatriz(DatosW, DatosX, DatosY, DatosZ);
            double[] r = new double[a.GetLength(0)];
            double[] resultados = new double[a.GetLength(0)];
            G.ShowMatrix(a, "Ejemplo 1");
            if (G.ResolverGauss(a, r))
                resultados = G.ShowSolution(r);
            else
                Console.WriteLine("No es un sistema de ecuaciones lineales");
            double B0 = resultados[0];
            double B1 = resultados[1];
            double B2 = resultados[2];
            double B3 = resultados[3];
            double Wk = 185; double Xk = 150; double Yk = 45;
            double z = F.obtenerZ(Wk, Xk, Yk, B0, B1, B2, B3);
            Console.WriteLine("La z = " + z);
            double rango = F.calcularRango(Wk, Xk, Yk, DatosW.Count - 4 , DatosW, DatosX, DatosY, DatosZ, B0, B1, B2, B3);
            Console.WriteLine("UPI = " + (z + rango));
            Console.WriteLine("LPI = " + (z - rango));

            Console.ReadLine();
            ////////////////////////////////////////////////////
            List<double> DatosW2 = new List<double>();
            List<double> DatosX2 = new List<double>();
            List<double> DatosY2 = new List<double>();
            List<double> DatosZ2 = new List<double>();

            DatosW2.Add(1142); DatosW2.Add(863); DatosW2.Add(1065); DatosW2.Add(554); DatosW2.Add(983); DatosW2.Add(256);
            DatosX2.Add(1060); DatosX2.Add(995); DatosX2.Add(3205); DatosX2.Add(120); DatosX2.Add(2896); DatosX2.Add(485);
            DatosY2.Add(325); DatosY2.Add(98); DatosY2.Add(23); DatosY2.Add(0); DatosY2.Add(120); DatosY2.Add(88);
            DatosZ2.Add(201); DatosZ2.Add(98); DatosZ2.Add(162); DatosZ2.Add(54); DatosZ2.Add(138); DatosZ2.Add(61);

            double[,] a2 = F.llenarMatriz(DatosW2, DatosX2, DatosY2, DatosZ2);
            double[] r2 = new double[a2.GetLength(0)];
            double[] resultados2 = new double[a2.GetLength(0)];
            G.ShowMatrix(a, "Ejemplo 1");
            if (G.ResolverGauss(a2, r2))
                resultados2 = G.ShowSolution(r2);
            else
                Console.WriteLine("No es un sistema de ecuaciones lineales");
            double B02 = resultados2[0];
            double B12 = resultados2[1];
            double B22 = resultados2[2];
            double B32 = resultados2[3];
            double Wk2 = 650; double Xk2 = 3000; double Yk2 = 155;
            double z2 = F.obtenerZ(Wk2, Xk2, Yk2, B02, B12, B22, B32);
            Console.WriteLine("La z = " + z2);
            double rango2 = F.calcularRango(Wk2, Xk2, Yk2, DatosW2.Count - 4, DatosW2, DatosX2, DatosY2, DatosZ2, B02, B12, B22, B32);
            Console.WriteLine("UPI = " + (z2 + rango2));
            Console.WriteLine("LPI = " + (z2 - rango2));

            Console.ReadLine();
            
        }
    }
}
