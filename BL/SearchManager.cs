using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.IO;
using BE;
using Helper;
using System.Text.RegularExpressions;

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
        public List<WebSearch> PerformSearch(string toFind, User user = null)
        {

            //1. recorrer el directorio de aspx
            //2. utilizar la función search y detectar una coincidencia
            //3. guardar las coincidencias
            //4. excluir según los permisos del usuario
            WebSearch result = null;
            RoleManager roleManager = new RoleManager();
            List<Permission> permissions = roleManager.GetAllPermission();

            string[] fileArray = Directory.GetFiles(HttpContext.Current.Server.MapPath(""), "*.aspx");
            List<WebSearch> searchResult = new List<WebSearch>();

            foreach (string file in fileArray)
            {
                TextReader textReader = new StreamReader(file);
                string fileContent = textReader.ReadToEnd();

                //Con la regex se pretende excluir los tags de html
                //fileContent = Regex.Replace(fileContent, @"<[^>]+?\/?>", m => {return String.Empty;});
                int index = fileContent.IndexOf(toFind);

                if (index > -1)
                {
                    string fileName = Path.GetFileName(file);
                    bool isPublic = !permissions.Exists(x => x.UrlAccess == fileName);
                    bool hasPermission = SessionHelper.IsSessionAlive() && SecurityHelper.HasPermission(user, fileName);

                    if (isPublic || hasPermission)
                    {
                        result = new WebSearch();
                        result.Url = fileName;
                        result.Description = fileName.Substring(0, fileName.Length -5);
                        searchResult.Add(result);
                    }

                }
            }
            return searchResult;
        }
    }
}
