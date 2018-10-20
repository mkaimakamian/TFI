using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Collections;
using BE;
using DA;

namespace ORM
{
    public class CategoryMapper
    {
        /// <summary>
        /// Guarda los datos modelados, en la base.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        public bool Save(Category category)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@name", category.Name);
            category.Id = dal.Write(table, "spWriteNewsCategory");

            return category.Id > 0;
        }

        /// <summary>
        /// Ejecuta la actualización del modelo de datos.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        public bool Edit(Category category)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@id", category.Id);
            table.Add("@name", category.Name);
            return dal.Write(table, "spModifyNewsCategory") > 0;
        }

        /// <summary>
        /// Elimina el elemento del sistema.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            table.Add("@id", id);
            return dal.Write(table, "spDeleteNewsCategory") > 0;
        }

        public Category Get(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            Category category = null;

            table.Add("@id",id);
            DataSet result = dal.Read(table, "spReadNewsCategory");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                category = ConvertToModel(result.Tables[0].Rows[0]);
            }

            return category;
        }

        public bool InUse(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@id", id);
            table.Add("@inUse", true);
            DataSet result = dal.Read(table, "spReadNewsCategory");

            return result != null && result.Tables[0].Rows.Count > 0;
        }

        /// <summary>
        /// Recupera el listado de elementos.
        /// </summary>
        /// <returns></returns>
        public List<Category> Get()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<Category> newsCategories = null;

            DataSet result = dal.Read(table, "spReadNewsCategory");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                newsCategories = new List<Category>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    newsCategories.Add(ConvertToModel(data));
                }
            }

            return newsCategories;
        }

        /// <summary>
        /// Modela en objetos del sistema los datos obtenidos de la base.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private Category ConvertToModel(DataRow data)
        {
            return new Category
            {
                Id = int.Parse(data["id"].ToString()),
                Name = data["name"].ToString()
            };
        }
    }
}
