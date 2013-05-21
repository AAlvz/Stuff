//////////////////////////////////////////////
/// CLASE DE FUNCIONES MATEMATICAS PARA PROGRAMA 4
/// Programa No.    -> 4
/// *Descripcion.   -> Programa 4
/// *Desarrollador. -> Alfonso Alvarez Sánchez
/// *Fecha.         -> 09 / 10 / 2011
/// Equipo          -> Individual
/// Notas           -> Evalúa parámentros para obtener desv estandar entre otros. 
///////////////////////////////////////////////

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace Programa4
{
    class ClaseFuncionesMatematicas
    {
        //EMPIEZA METODO OBTENER PROMEDIO
        public double obtenerPromedio(List<double> lst)
        {
            double sum = lst.Sum();
            double numDatos = lst.Count;
            double promedio = sum / numDatos;
            return promedio;
        }
        //TERMINA METODO OBTENER PROMEDIO

        //EMPIEZA METODO OBTENERSUMATORIADELOGARITMOS
        public double obtenerSumatoriaDeLogs(List<double> lst) 
        {
            double sum = 0;
            for (int i = 0; i < lst.Count; i++) 
            {
                sum = sum + Math.Log(lst[i]);
            }
            
            return sum;
        }
        //TERMINA METODO OBTENER SUMATORIA DE LOGARITMOS

        //EMPIEZA METODO CALCULARVARIANZA
        public double calcularVarianza(List<double> lst)
        {
            double sum = 0;
            double prom = obtenerSumatoriaDeLogs(lst) / lst.Count;
            for (int i = 0; i < lst.Count; i++) 
            {
                sum = sum + (Math.Pow((Math.Log(lst[i]) - prom), 2));
            }
            double var = (sum / (lst.Count - 1));
            return var;
        }
        //TERMINA METODO CALCULAR VARIAZA

    }
}
