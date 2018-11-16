using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.IO;
using BE;
using Helper;

namespace BL
{
    public class SearchManager
    {
        /// <summary>
        /// Realiza la búsqueda de una palabra o frase sobre todas las páginas.
        /// Si el usuario e sprovisto, incluye las páginas con permisos
        /// </summary>
        /// <param name="toFind"></param>
        /// <param name="user"></param>
        public void PerformSearch(string toFind, User user = null)
        {

            //1. recorrer el directorio de aspx
            //2. utilizar la función search y detectar una coincidencia
            //3. guardar las coincidencias
            //4. excluir según los permisos del usuario

            RoleManager roleManager = new RoleManager();
            List<Permission> permissions = roleManager.GetAllPermission();

            string[] fileArray = Directory.GetFiles(HttpContext.Current.Server.MapPath(""), "*.aspx");
            List<string> availableFile = new List<string>();

            foreach (string file in fileArray)
            {
                TextReader textReader = new StreamReader(file);
                string fileContent = textReader.ReadToEnd();
                int index = fileContent.IndexOf(toFind);

                string fileName = file.Substring(file.LastIndexOf("\\")+1);

                bool exist = index > -1;
                bool isPublic = permissions.Exists(x => x.UrlAccess != fileName);
                bool hasPermission = user != null && SecurityHelper.HasPermission(user, fileName);
                if (exist && (isPublic || hasPermission))
                {
                    availableFile.Add(file);
                }
            }

        }
    }
}
