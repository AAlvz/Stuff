using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Programa8
{
    class Gauss
    {
        //EMPIEZA METODO GAUSS
        public bool ResolverGauss(double[,] a, double[] r)
        {
            double t, s;
            int i, l, j, k, m, n;

            try
            {
                n = r.Length - 1;
                m = n + 1;
                for (l = 0; l <= n - 1; l++)
                {
                    j = l;
                    for (k = l + 1; k <= n; k++)
                    {
                        if (!(Math.Abs(a[j, l]) >= Math.Abs(a[k, l]))) j = k;
                    }
                    if (!(j == l))
                    {
                        for (i = 0; i <= m; i++)
                        {
                            t = a[l, i];
                            a[l, i] = a[j, i];
                            a[j, i] = t;
                        }
                    }
                    for (j = l + 1; j <= n; j++)
                    {
                        t = (a[j, l] / a[l, l]);
                        for (i = 0; i <= m; i++) a[j, i] -= t * a[l, i];
                    }
                }
                r[n] = a[n, m] / a[n, n];
                for (i = 0; i <= n - 1; i++)
                {
                    j = n - i - 1;
                    s = 0;
                    for (l = 0; l <= i; l++)
                    {
                        k = j + l + 1;
                        s += a[j, k] * r[k];
                    }
                    r[j] = ((a[j, m] - s) / a[j, j]);
                }
                return true;
            }
            catch
            {
                return false;
            }
        }
        //TERMINA METODO RESOLVER GAUSS

        //EMPIEZA METODO MUESTRA SOLUCIÓN
        public double[] ShowSolution(double[] r)
        {
            Console.WriteLine("Solución por Eliminación Gaussiana");
            double[] resultados = new double[r.GetLength(0)];
            for (int i = 0; i <= r.GetUpperBound(0); i++)
            {
                Console.WriteLine(ToStringSign(r[i]));
                resultados[i] = r[i];
            }
            Console.WriteLine("\n");
            return resultados;
        }
        //TERMINA METODO MUESTRA SOLUCIÓN 

        //EMPIEZA METODO SIGNO A STRING
        static private string ToStringSign(double v)
        {
            if (v < 0) return ' ' + v.ToString(); else return "  " + v.ToString();
        }
        //TERMINA METODO SIGNO A STRING

        //EMPIEZA METODO MUESTRA MATRIZ
        public void ShowMatrix(double[,] a, string Title)
        {
            Console.WriteLine(Title + '\n');
            for (int i = 0; i <= a.GetUpperBound(0); i++)
            {
                Console.Write('|');
                for (int j = 0; j <= a.GetUpperBound(1); j++)
                {
                    Console.Write(ToStringSign(a[i, j]));
                }
                Console.Write(" | \n");
            }
            Console.WriteLine('\n');
        }
        //TERMINA METODO MUESTRA MATRIZ
    }
}
