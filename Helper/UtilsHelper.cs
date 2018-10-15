using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Helper
{
    public static class UtilsHelper
    {
        /// <summary>
        /// Toma una cadena de texto de ids separada por comas y la transforma en un array de int.
        /// </summary>
        /// <param name="idsString"></param>
        /// <returns></returns>
        public static int[] ToIntArray(string idsString)
        {
            return Array.ConvertAll(idsString.Split(','), item => Convert.ToInt32(item));
        }
    }
}
