using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Programa7
{
    class Program
    {
        static void Main(string[] args)
        {
            //PUREBAS
            //Crear cada lista para cada datos
            List<double> DatosProxy = new List<double>();
            List<double> DatosPlan = new List<double>();
            List<double> DatosActual = new List<double>();
            List<double> DatosHoras = new List<double>();
            List<double> MisHoras = new List<double>();
            List<double> MisEstimados = new List<double>();
            List<double> MiActual = new List<double>();
            //Asignar el primer valor como null a cada lsita
            //Datos del Proxy
            DatosProxy.Add(130);
            DatosProxy.Add(650);
            DatosProxy.Add(99);
            DatosProxy.Add(150);
            DatosProxy.Add(128);
            DatosProxy.Add(302);
            DatosProxy.Add(95);
            DatosProxy.Add(945);
            DatosProxy.Add(368);
            DatosProxy.Add(961);
            //Datos de Planeadas
            DatosPlan.Add(163);
            DatosPlan.Add(765);
            DatosPlan.Add(141);
            DatosPlan.Add(166);
            DatosPlan.Add(137);
            DatosPlan.Add(355);
            DatosPlan.Add(136);
            DatosPlan.Add(1206);
            DatosPlan.Add(433);
            DatosPlan.Add(1130);
            //datos de Actuales
            DatosActual.Add(186);
            DatosActual.Add(699);
            DatosActual.Add(132);
            DatosActual.Add(272);
            DatosActual.Add(291);
            DatosActual.Add(331);
            DatosActual.Add(199);
            DatosActual.Add(1890);
            DatosActual.Add(788);
            DatosActual.Add(1601);
            //Datosde Horas
            DatosHoras.Add(15.0);
            DatosHoras.Add(69.9);
            DatosHoras.Add(6.5);
            DatosHoras.Add(22.4);
            DatosHoras.Add(28.4);
            DatosHoras.Add(65.9);
            DatosHoras.Add(19.4);
            DatosHoras.Add(198.7);
            DatosHoras.Add(38.8);
            DatosHoras.Add(138.2);

            Funciones F = new Funciones();
            double Correlacion = F.obtenerCorrelacion(DatosProxy, DatosActual);
            Console.WriteLine("Correlación: " + Correlacion);
            Console.WriteLine("Correlación cuadrada: " + Math.Pow(Correlacion, 2));
            double X = F.calcularX(DatosProxy, DatosActual);
            double cola = F.calcularCola(X, DatosProxy.Count);
            Console.WriteLine("Cola: " + "{0:#.#####e+00}", cola);
            double B0 = F.obtenerBeta0(DatosProxy, DatosActual);
            Console.WriteLine("Beta0: " + B0);
            double B1 = F.obtenerBeta1(DatosProxy, DatosActual);
            Console.WriteLine("Beta1: " + B1);
            double Yk = F.calcularYk(386, DatosProxy, DatosActual);
            Console.WriteLine("Yk: " + Yk);
            double Rango = F.calcularRango(386, (DatosProxy.Count - 2), DatosProxy, DatosActual);
            Console.WriteLine("Rango: " + Rango);
            double UPI = F.calcularUPI(386, DatosProxy, DatosActual, (DatosProxy.Count - 2));
            Console.WriteLine("UPI: " + UPI);
            double LPI = F.calcularLPI(386, DatosProxy, DatosActual, (DatosProxy.Count - 2));
            Console.WriteLine("LPI: " + LPI);
            Console.ReadLine();

            double Correlacion2 = F.obtenerCorrelacion(DatosProxy, DatosHoras);
            Console.WriteLine("Correlación: " + Correlacion2);
            Console.WriteLine("Correlación cuadrada: " + Math.Pow(Correlacion2, 2));
            double X2 = F.calcularX(DatosProxy, DatosHoras);
            double cola2 = F.calcularCola(X2, DatosProxy.Count);
            Console.WriteLine("Cola: " + "{0:#.#####e+00}", cola2);
            double B02 = F.obtenerBeta0(DatosProxy, DatosHoras);
            Console.WriteLine("Beta0: " + B02);
            double B12 = F.obtenerBeta1(DatosProxy, DatosHoras);
            Console.WriteLine("Beta1: " + B12);
            double Yk2 = F.calcularYk(386, DatosProxy, DatosHoras);
            Console.WriteLine("Yk: " + Yk2);
            double Rango2 = F.calcularRango(386, (DatosProxy.Count - 2), DatosProxy, DatosHoras);
            Console.WriteLine("Rango: " + Rango2);
            double UPI2 = F.calcularUPI(386, DatosProxy, DatosHoras, (DatosProxy.Count - 2));
            Console.WriteLine("UPI: " + UPI2);
            double LPI2 = F.calcularLPI(386, DatosProxy, DatosHoras, (DatosProxy.Count - 2));
            Console.WriteLine("LPI: " + LPI2);
            Console.ReadLine();
            //FIN PRUEBAS

            //test estimado con actual
            MisEstimados.Add(189);
            MisEstimados.Add(94);
            MisEstimados.Add(66);
            MisEstimados.Add(154);

            MiActual.Add(112);
            MiActual.Add(95);
            MiActual.Add(83);
            MiActual.Add(99);

            MisHoras.Add(152);
            MisHoras.Add(140);
            MisHoras.Add(184);
            MisHoras.Add(102);

            Console.WriteLine("_______________Mis resultados____________");
            double MiCorrelacion = F.obtenerCorrelacion(MisEstimados, MiActual);
            Console.WriteLine("Correlación: " + MiCorrelacion);
            Console.WriteLine("Correlación cuadrada: " + Math.Pow(MiCorrelacion, 2));
            double MiX = F.calcularX(MisEstimados, MiActual);
            double Micola = F.calcularCola(MiX, DatosProxy.Count);
            Console.WriteLine("Cola: " + "{0:#.#####e+00}", Micola);
            double MiB0 = F.obtenerBeta0(MisEstimados, MiActual);
            Console.WriteLine("Beta0: " + MiB0);
            double MiB1 = F.obtenerBeta1(MisEstimados, MiActual);
            Console.WriteLine("Beta1: " + MiB1);
            double MiYk = F.calcularYk(386, MisEstimados, MiActual);
            Console.WriteLine("Yk: " + MiYk);
            double MiRango = F.calcularRango(386, (MisEstimados.Count - 2), MisEstimados, MiActual);
            Console.WriteLine("Rango: " + MiRango);
            double MiUPI = F.calcularUPI(386, MisEstimados, MiActual, (MisEstimados.Count - 2));
            Console.WriteLine("UPI: " + MiUPI);
            double MiLPI = F.calcularLPI(386, MisEstimados, MiActual, (MisEstimados.Count - 2));
            Console.WriteLine("LPI: " + MiLPI);
            Console.ReadLine();

            Console.WriteLine("_______________Mis resultados____________");
            double MiCorrelacion2 = F.obtenerCorrelacion(MisEstimados, MisHoras);
            Console.WriteLine("Correlación: " + MiCorrelacion2);
            Console.WriteLine("Correlación cuadrada: " + Math.Pow(MiCorrelacion2, 2));
            double MiX2 = F.calcularX(MisEstimados, MisHoras);
            double Micola2 = F.calcularCola(MiX, DatosProxy.Count);
            Console.WriteLine("Cola: " + "{0:#.#####e+00}", Micola2);
            double MiB02 = F.obtenerBeta0(MisEstimados, MisHoras);
            Console.WriteLine("Beta0: " + MiB02);
            double MiB12 = F.obtenerBeta1(MisEstimados, MisHoras);
            Console.WriteLine("Beta1: " + MiB12);
            double MiYk2 = F.calcularYk(386, MisEstimados, MisHoras);
            Console.WriteLine("Yk: " + MiYk2);
            double MiRango2 = F.calcularRango(386, (MisEstimados.Count - 2), MisEstimados, MisHoras);
            Console.WriteLine("Rango: " + MiRango2);
            double MiUPI2 = F.calcularUPI(386, MisEstimados, MisHoras, (MisEstimados.Count - 2));
            Console.WriteLine("UPI: " + MiUPI2);
            double MiLPI2 = F.calcularLPI(386, MisEstimados, MisHoras, (MisEstimados.Count - 2));
            Console.WriteLine("LPI: " + MiLPI2);
            Console.ReadLine();
        }
    }
}
