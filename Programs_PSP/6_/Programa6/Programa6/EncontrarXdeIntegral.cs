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
    class EncontrarXdeIntegral
    {
        //EMPIEZA METODO OBTENERX
        //public double terminos(double x, double num_seg, double dof)
        public double obtenerX(double pBusc, double dof)
        {
            CalcularIntegral C = new CalcularIntegral();
            double x = 1;
            double var = .5;
            double num_seg = 10;
            double p = C.terminos(x, num_seg, dof);
            //while ((p - .00001) != pBusc || (p + .00001) != pBusc || c < 20)
            while (Math.Round(p, 5) != pBusc)
            {
                while(p < pBusc)
                {
                    x = x + var;
                    p = C.terminos(x, num_seg, dof);
                }
                if(p > pBusc)
                {
                    var = var/2;
                    while(p > pBusc)
                    {
                        x = x - var;
                        p = C.terminos(x, num_seg, dof);
                    }
                    var = var/2;
                }else
                {
                    var = var/2;
                }
                
            }
            return Math.Round(x, 5);
        }
        //TERMINA METODO OBTENERX
        
    }
}
