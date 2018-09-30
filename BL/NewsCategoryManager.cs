using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class NewsCategoryManager: BaseManager
    {

        /// <summary>
        /// Recupera el listado de todos las categorías.
        /// </summary>
        /// <returns></returns>
        public List<NewsCategory> Get()
        {
            NewsCategoryMapper newsCategoryMapper = new NewsCategoryMapper();
            return newsCategoryMapper.Get();
        }

        /// <summary>
        /// Devuelve un diccionario de modo tal de poder recuperar el valor a través de una key y evitar iteraciones manuales.
        /// </summary>
        /// <returns></returns>
        public Dictionary<int, NewsCategory> GetDictinoray()
        {
            List<NewsCategory> newsCategories = Get();
            Dictionary<int, NewsCategory> categories = new Dictionary<int, NewsCategory>();

            foreach (NewsCategory category in newsCategories)
            {
                categories.Add(category.Id, category);
            }

            return categories;
        }
    }
}
