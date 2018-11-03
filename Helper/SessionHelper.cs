using System;
using System.Collections.Generic;
using BE;
using System.Web.SessionState;
using System.Web;


namespace Helper
{
    /// <summary>
    /// La intención de la clase es encapsular el modo en el que se crea la sesión y se opera sobre ella.
    /// </summary>
    public static class SessionHelper
    {
        private static HttpSessionState sessionState;

        /// <summary>
        /// Inicia la sesión al guardar el usuario en HttpSessionState.
        /// </summary>
        /// <param name="user"></param>
        /// <param name="session"></param>
        public static void StartSession(User user, HttpSessionState session)
        {
            if (sessionState == null) sessionState = session;
            sessionState["SessionCreated"] = user;
        }

        /// <summary>
        /// Devuelve el usuario guardado en sesión.
        /// </summary>
        /// <returns></returns>
        public static User GetUser()
        {
            
            return sessionState == null? null: (User)sessionState["SessionCreated"];
        }

        /// <summary>
        /// Elimina la referencia del usuario en sesión para finalizarla.
        /// </summary>
        public static void EndSession()
        {
            if (GetUser() != null) sessionState.Remove("SessionCreated");
        }

        /// <summary>
        /// Devuelve true cuando existe un usuario en sesión.
        /// </summary>
        /// <returns></returns>
        public static bool IsSessionAlive()
        {
            return GetUser() != null;
        }

        /// <summary>
        /// Redirige a la home de la plataforma en caso de que la seisón del usuario no exista.
        /// </summary>
        public static void ExecuteAutoStop()
        {
            if (!IsSessionAlive()) HttpContext.Current.Response.Redirect("/index.aspx");
        }
    }
}
