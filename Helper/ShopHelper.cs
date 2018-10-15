using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using System.Web.SessionState;

namespace Helper
{
    public static class ShopHelper
    {
        /// <summary>
        /// Trata de abstraer el uso de la sesión para el manejo de los artículos a comprar.
        /// Recibe un Id de producto y la referencia de la sesión.
        /// </summary>
        /// <param name="resourceId"></param>
        /// <param name="state"></param>
        public static void AddToCart(int resourceId, HttpSessionState session)
        {
            GetSessionState(session).Add(resourceId);
        }

        /// <summary>
        /// Devuelve la cantidad de ítems almacenados
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        public static int GetQuantity(HttpSessionState session)
        {
           return GetSessionState(session).Count();
        }
     
        /// <summary>
        /// Se encarga de devolver una estructura (hashset) referenciada a la sesión.
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        private static HashSet<int> GetSessionState(HttpSessionState session)
        {
            if (session["ItemShopsCheckout"] == null) session["ItemShopsCheckout"] = new HashSet<int>();
            return (HashSet<int>)session["ItemShopsCheckout"];
        }
    }
}
