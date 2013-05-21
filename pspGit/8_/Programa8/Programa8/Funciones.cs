using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Programa8
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

        //EMPIEZA METODO CALCULAR RANGO
        public double calcularRango(double Wk, double Xk, double Yk, double dof, List<double> DatosW, List<double> DatosX, List<double> DatosY, List<double> DatosZ, double B0, double B1, double B2, double B3)
        {
            EncontrarXdeIntegral Ex = new EncontrarXdeIntegral();
            double numeroDeDatos = Convert.ToDouble(DatosX.Count);
            double dato1 = Ex.obtenerX(.35, (numeroDeDatos - 4));
            //Console.WriteLine("X = "+dato1);
            double dato2 = calcularVarianza(DatosW, DatosX, DatosY, DatosZ, B0, B1, B2, B3);
            //Console.WriteLine("Varianza = "+dato2);
            dato2 = Math.Sqrt(dato2);
            double XProm = DatosX.Average();
            double WProm = DatosW.Average();
            double YProm = DatosY.Average();
            double var1W = Math.Pow((Wk -WProm), 2);
            double var1X = Math.Pow((Xk - XProm), 2);
            double var1Y = Math.Pow((Yk - YProm), 2);
            double var2W = 0;
            double var2X = 0;
            double var2Y = 0;
            for(int i = 0; i < numeroDeDatos; i++)
            {
                var2W = var2W + Math.Pow((DatosW[i] - XProm), 2);
                var2X = var2X + Math.Pow((DatosX[i] - WProm), 2);
                var2Y = var2Y + Math.Pow((DatosY[i] - YProm), 2);
            }
            double var3W = var1W / var2W;
            double var3X = var1X / var2X;
            double var3Y = var1Y / var2Y;
            double var4 = 1 + (1/numeroDeDatos) + var3W + var3X + var3Y;
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

        //EMPIEZA METODO LLENAR MATRIZ
        public double[,] llenarMatriz(List<double> DatosW, List<double> DatosX, List<double> DatosY, List<double> DatosZ)
        {
            double numDatos = Convert.ToDouble(DatosW.Count);
            double n = numDatos;
            double Wi = DatosW.Sum();
            double Xi = DatosX.Sum();
            double Yi = DatosY.Sum();
            double Zi = DatosZ.Sum();
            double Wi2 = 0;
            double Xi2 = 0;
            double Yi2 = 0;
            foreach (double d in DatosW)
                Wi2 = Wi2 + Math.Pow(d, 2);
            foreach (double d in DatosX)
                Xi2 = Xi2 + Math.Pow(d, 2);
            foreach (double d in DatosY)
                Yi2 = Yi2 + Math.Pow(d, 2);
            double WiXi = 0;
            double WiYi = 0;
            double WiZi = 0;
            double XiYi = 0;
            double XiZi = 0;
            double YiZi = 0;
            for (int i = 0; i < numDatos; i++) 
            {
                WiXi = WiXi + (DatosW[i] * DatosX[i]);
                WiYi = WiYi + (DatosW[i] * DatosY[i]);
                WiZi = WiZi + (DatosW[i] * DatosZ[i]);
                XiYi = XiYi + (DatosX[i] * DatosY[i]);
                XiZi = XiZi + (DatosX[i] * DatosZ[i]);
                YiZi = YiZi + (DatosY[i] * DatosZ[i]);
            }
            double[,] a = { { n, Wi, Xi, Yi, Zi }, { Wi, Wi2, WiXi, WiYi, WiZi }, { Xi, WiXi, Xi2, XiYi, XiZi }, { Yi, WiYi, XiYi, Yi2, YiZi } };
            return a;
        }
        //TERMINA METODO LLENAR MATRIZ

        //METODO CALCULAR VARIANZA
        public double calcularVarianza(List<double> DatosW, List<double> DatosX, List<double> DatosY, List<double> DatosZ, double B0, double B1, double B2, double B3) 
        {
            double sum = 0;
            double numDatos = DatosW.Count;
            for (int i = 0; i < numDatos; i++) 
            { 
                sum = sum + Math.Pow((DatosZ[i] - B0 - (B1*DatosW[i]) - (B2*DatosX[i]) - (B3 * DatosY[i])), 2);
            }
            double res = sum / (numDatos - 4);
            return res;
        }
        //METODO CALCULAR VARIANZA

        //EMPIEZA METODO OBTENER Z
        public double obtenerZ(double Wk, double Xk, double Yk, double B0, double B1, double B2, double B3) 
        {
            double z = B0 + (Wk * B1) + (Xk * B2) + (Yk * B3);
            return z;
        }
        //TERMINA METODO OBTENERZ

    }
}
