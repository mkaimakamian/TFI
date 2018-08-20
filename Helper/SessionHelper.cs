using System;
using System.Collections.Generic;
using BE;

namespace Helper
{
    // TODO - agregar a EA
    public class SessionHelper
    {

        private static SessionHelper instance;
        private User user;

       // private ProfileBM profileMdl;
        //private LanguageBM languageBm;
        private Dictionary<int, String> translations;
        private Dictionary<object, int> suscriptorsToTranslate;

        private SessionHelper()
        {
        }

        /// <summary>
        /// Inicia la sesión, lo que implica almacenar los datos del usuario y su configuración (idioma y permisos).
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public static SessionHelper StartSession(User user)
        {
            if (instance == null)
            {
                instance = new SessionHelper();
                instance.user = user;
                //instance.profileMdl = profileMdl;
                //instance.languageBm = languageBm;
                instance.suscriptorsToTranslate = new Dictionary<object, int>();
                ConvertIntoList(user.Language);
            }

            //No sé si se necesita porque no opero actualmente con la sesion
            return instance;
        }


        private static void ConvertIntoList(Language language)
        {
            instance.translations = new Dictionary<int, String>();
            foreach (Translation translation in language.Translations)
            {
                instance.translations.Add(translation.Id, translation.Translate);
            }
        }

        /// <summary>
        /// Devuelve el Business Model perteneciente al usuario loggeado
        /// </summary>
        /// <returns></returns>
        public static User GetLoggedUser()
        {
            return instance.user;
        }
        /// <summary>
        /// Finaliza la sesión.
        /// </summary>
        public static void EndSession()
        {
            instance = null;
        }

        /// <summary>
        /// Devuelve true si el usuario en sesión tiene permisos sobre el objeto cuyo código es pasado por parámetro.
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        //public static bool HasPermission(string code)
        //{
        //    return instance.profileMdl.HasPermission(code);
        //}

        /// <summary>
        /// Suscribe al componente de no estar registrado y le asigna la traducción correspondiente.
        /// Aunque no se define inerfaz, se espera que el objeto tenga propiedad text.
        /// </summary>
        /// <param name="suscriptor"></param>
        /// <param name="code"></param>
        public static void RegisterForTranslation(object suscriptor, int code)
        {
            if (!instance.suscriptorsToTranslate.ContainsKey(suscriptor))
            {
                instance.suscriptorsToTranslate.Add(suscriptor, code);
            }

            System.Reflection.PropertyInfo propertyText = suscriptor.GetType().GetProperty("Text");
            propertyText.SetValue(suscriptor, GetTranslation(code));
        }

        /// <summary>
        /// Settea el lenguage y actualiza los suscriptores con el nuevo idioma.
        /// </summary>
        /// <param name="languageBm"></param>
        //public static void SetLanguage(Language language)
        //{
        //    instance.user.Language = language;
        //    ConvertIntoList(language);

        //    foreach (KeyValuePair<object, string> obj in instance.suscriptorsToTranslate)
        //    {
        //        RegisterForTranslation(obj.Key, obj.Value);
        //    }
        //}

        /// <summary>
        /// Para un código en particular, devuelve las traducciones.
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        public static string GetTranslation(int code)
        {
            string value;
            instance.translations.TryGetValue(code, out value);

            // El valor default debería estar definido en la tabla de traducciones.
            if (value == null || value.Length == 0)
            {
                return "UNDEFINED";
            }
            else
            {
                return value;
            }
        }
    }
}
