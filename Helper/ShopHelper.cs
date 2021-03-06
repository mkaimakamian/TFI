﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.SessionState;

namespace Helper
{
    public static class ShopHelper
    {
        private static HttpSessionState sessionState;

        /// <summary>
        /// Trata de abstraer el uso de la sesión para el manejo de los artículos a comprar.
        /// Recibe un Id de producto y la referencia de la sesión.
        /// </summary>
        /// <param name="resourceId"></param>
        /// <param name="state"></param>
        public static void AddToCart(int resourceId, HttpSessionState session)
        {
            if (sessionState == null)
            {
                sessionState = session;
                session["ItemShopsCheckout"] = new HashSet<int>();
            }
            GetSessionState().Add(resourceId);
        }

        public static void RemoveFromCart(int resourceId, HttpSessionState session)
        {
            if (sessionState == null)
            {
                sessionState = session;
                session["ItemShopsCheckout"] = new HashSet<int>();
            }
            GetSessionState().Remove(resourceId);
        }

        public static void DropCart(HttpSessionState session)
        {
            if (sessionState == null)
            {
                sessionState = session;
            }
            GetSessionState().Clear();
        }

        /// <summary>
        /// Devuelve la cantidad de ítems almacenados
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        public static int GetQuantity()
        {
            return GetSessionState() != null ? GetSessionState().Count() : 0;
        }

        /// <summary>
        /// Devuelve un array de int con lo ids de los productos seleccionados
        /// </summary>
        /// <returns></returns>
        public static int[] GetItemsId()
        {
            if (GetSessionState() == null) return null;
           return GetSessionState().ToArray();
        }

        /// <summary>
        /// Se encarga de devolver una estructura (hashset) referenciada a la sesión.
        /// </summary>
        /// <returns></returns>
        private static HashSet<int> GetSessionState()
        {
            if (sessionState == null) return null;
            if(sessionState["ItemShopsCheckout"] == null) sessionState["ItemShopsCheckout"] = new HashSet<int>();
            return (HashSet<int>)sessionState["ItemShopsCheckout"];
        }
    }
}
