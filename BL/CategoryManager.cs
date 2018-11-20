using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class CategoryManager: BaseManager
    {
        /// <summary>
        /// Persiste el elemento.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        public bool Save(Category category)
        {
            if (!IsValid(category)) return false;

            CategoryMapper categoryMapper = new CategoryMapper();

            if (!categoryMapper.Save(category))
            {
                string errorDescription = "No se ha podido guardar la categoría.";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        /// <summary>
        /// Guarda los cambios del recurso existente.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        public bool Edit(Category category)
        {
            if (!IsValid(category)) return false;

            CategoryMapper categoryMapper = new CategoryMapper();

            if (!categoryMapper.Edit(category))
            {
                string errorDescription = "No se ha podido modificar la categoría.";
                log.AddLogCritical("Edit", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        /// <summary>
        /// Elimina el elemento cuyo id es pasado por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(int id)
        {
            CategoryMapper categoryMapper = new CategoryMapper();

            if (!categoryMapper.InUse(id))
            {
                if (!categoryMapper.Delete(id))
                {
                    string errorDescription = "No se ha podido eliminar la categoría con id " + id + ".";
                    log.AddLogCritical("Delete", errorDescription, this);
                    AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                    return false;
                }
            }
            else
            {
                string errorDescription = "La categoría no s epuede eliminar porque está en uso.";
                log.AddLogCritical("Delete", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.RELATIONSHIP_ERROR, errorDescription));
            }

            return true;
        }

        /// <summary>
        /// Recupera el listado de todos las categorías.
        /// </summary>
        /// <returns></returns>
        public List<Category> Get()
        {
            CategoryMapper categoryMapper = new CategoryMapper();
            return categoryMapper.Get();
        }

        /// <summary>
        /// Recupera una categoría según el id provisto como parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Category Get(int id)
        {
            CategoryMapper categoryMapper = new CategoryMapper();
            return categoryMapper.Get(id);
        }

        /// <summary>
        /// Devuelve un diccionario de modo tal de poder recuperar el valor a través de una key y evitar iteraciones manuales.
        /// </summary>
        /// <returns></returns>
        public Dictionary<int, Category> GetDictinoray()
        {
            List<Category> categories = Get();
            Dictionary<int, Category> categoriesDict = new Dictionary<int, Category>();

            if (categories != null) { 
            foreach (Category category in categories)
            {
                categoriesDict.Add(category.Id, category);
            }
            }
            return categoriesDict;
        }

        private bool IsValid(Category category)
        {
            bool isValid = true;
            return isValid &= VLetterNumbers(category.Name, 1, 50, "Categoría", "IsValid");
           }
    }
}
