using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Programa7
{
    class Funciones
    {
        //EMPIEZA METODO OBTENER BETA0
        public double obtenerBeta0(List<double> DatosX, List<double> DatosY)
        {
            double dato1 = DatosY.Average(); //promedio de variables en la lista de DatosY
            double dato2 = ((obtenerBeta1(DatosX, DatosY)) * DatosX.Average());
            double beta0 = dato1 - dato2;
            return beta0;
        }
        //TERMINA METODO OBTENER BETA0

        // EMPIEZA METODO OBTENER BETA1
        public double obtenerBeta1(List<double> DatosX, List<double> DatosY)
        {
            double dato1 = sumaDeMultiplicacion(DatosX, DatosY);
            double dato2 = ((DatosX.Count) * (DatosX.Average() * DatosY.Average()));
            double dato3 = sumatoriaCuadrada(DatosX);
            double dato4 = (Math.Pow(DatosX.Average(), 2) * DatosX.Count);
            double beta1 = ((dato1 - dato2) / (dato3 - dato4));
            return beta1;
        }
        // TERMINA METODO OBTENER BETA1

        // EMPIEZA METODO SUMATORIA DE MULTIPLICACION
        public double sumaDeMultiplicacion(List<double> DatosX, List<double> DatosY)
        {
            double c = 0;
            for (int i = 0; i < DatosX.Count; i++)
            {
                c = c + (DatosX[i] * DatosY[i]);
            }
            return c;
        }
        // TERMINA METODO SUMATORIA DE MULTIPLICACION

        //EMPIEZA METODO SUMATORIA CUADRADA
        public double sumatoriaCuadrada(List<double> lst)
        {
            double c = 0;
            int i = 0;
            //while (lst[i+1] != null)
            while(i < lst.Count)
            {
                c = c + (Math.Pow(lst[i], 2));
                i++;
            }
            //c = c + (Math.Pow(lst[i], 2));
            return c;
        }
        //TERMINA METODO SUMATORIA CUADRADA

        //EMPIEZA METODO CALCULAR YK
        public double calcularYk(double Xk, List<double> DatosX, List<double> DatosY) 
        {
            return (obtenerBeta0(DatosX, DatosY) + (obtenerBeta1(DatosX, DatosY) * Xk));
        }
        //TERMINA METODO CALCULAR YK

        //EMPIEZA METODO CALCULAR COLA
        public double calcularCola(double x, double numeroDeDatos) //esta x se calcula con calcular X
        {
            CalcularIntegral C = new CalcularIntegral();
            double valorP = C.Integra(x, 10, numeroDeDatos - 2);
            double cola = (1 - (2 * valorP));
            return cola;
        }
        //TERMINA METODO CALCULAR COLA

        //EMPIEZA METODO OBTENER CORRELACION
        public double obtenerCorrelacion(List<double> DatosX, List<double> DatosY)
        {
            double dato1 = ((sumaDeMultiplicacion(DatosX, DatosY)) * DatosX.Count);
            double dato2 = (DatosX.Sum() * DatosY.Sum());
            double dato3 = ((DatosX.Count * (sumatoriaCuadrada(DatosX))) - (Math.Pow(DatosX.Sum(), 2)));
            double dato4 = ((DatosY.Count * (sumatoriaCuadrada(DatosY))) - (Math.Pow(DatosY.Sum(), 2)));
            double dato5 = dato1 - dato2;
            double dato6 = Math.Sqrt(dato3 * dato4);
            double correlacion = dato5 / dato6;
            return correlacion;
        }
        //TERMINA METODO OBTENER CORRELACION

        //EMPIEZA METODO CALCULAR DESVIACION ESTANDAR
        public double calcularDesvEstandar(List<double> DatosX, List<double> DatosY)
        {
            double sumatoria = 0;
            double Beta0 = obtenerBeta0(DatosX, DatosY);
            double Beta1 = obtenerBeta1(DatosX, DatosY);
            double cantidad = DatosX.Count;
            for (int j = 0; j < cantidad; j++)
            {
                sumatoria = sumatoria + Math.Pow((DatosY[j] - Beta0 - (Beta1*DatosX[j])), 2);
            }
            double desviacion = Math.Sqrt((sumatoria / (DatosX.Count - 2)));

            return desviacion;
        }
        //TERMINA METODO CALCULARDESVIACIONESTANDAR

        //EMPIEZA METODO CALCULAR X
        public double calcularX(List<double> DatosX, List<double> DatosY)
        {
            double dato1 = Math.Abs(obtenerCorrelacion(DatosX, DatosY));
            double dato2 = Math.Sqrt((DatosX.Count - 2));
            double dato3 = Math.Pow(dato1, 2);
            double dato4 = Math.Sqrt(1-dato3);
            double x = (dato1*dato2)/(dato4);
            return x;
        }
        //TERMINA METODO CALCULAR X

        //EMPIEZA METODO CALCULAR RANGO
        public double calcularRango(double Xk, double dof, List<double> DatosX, List<double> DatosY)
        {
            EncontrarXdeIntegral Ex = new EncontrarXdeIntegral();
            double numeroDeDatos = Convert.ToDouble(DatosX.Count);
            double dato1 = Ex.obtenerX(.35, (numeroDeDatos - 2));
            double dato2 = calcularDesvEstandar(DatosX, DatosY);
            double XProm = DatosX.Average();
            double var1 = Math.Pow((Xk -XProm), 2);
            double var2 = 0;
            for(int i = 0; i < numeroDeDatos; i++)
            {
                var2 = var2 + Math.Pow((DatosX[i] - XProm), 2);
            }
            double var3 = var1 / var2;
            double var4 = 1 + (1/numeroDeDatos) + var3;
            double dato3 = Math.Sqrt(var4);
            double Rango = dato1*dato2*dato3;
            return Rango;
        }
        //TERMINA METODO CALCULAR RANGO

        //EMPIEZA METODO CALCULAR UPI
        public double calcularUPI(double Xk, List<double> DatosX, List<double> DatosY, double dof)
        {
            double Yk = calcularYk(Xk, DatosX, DatosY);
            double rango = calcularRango(Xk, dof, DatosX, DatosY);
            double UPI = Yk + rango;
            return UPI;
        }
        //TERMINA METODO CALCULAR UPI

        //EMPIEZA METODO CALCULAR UPI
        public double calcularLPI(double Xk, List<double> DatosX, List<double> DatosY, double dof)
        {
            double Yk = calcularYk(Xk, DatosX, DatosY);
            double rango = calcularRango(Xk, dof, DatosX, DatosY);
            double LPI = Yk - rango;
            return LPI;
        }
        //TERMINA METODO CALCULAR UPI

    }
}
