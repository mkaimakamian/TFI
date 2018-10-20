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
    public class MapMapper
    {
        /// <summary>
        /// Guarda los datos modelados, en la base.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        public bool Save(Map map)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@name", map.Name);
            table.Add("@description", map.Description);
            table.Add("@price", map.Price);
            table.Add("@imageB64", map.Image);
            table.Add("@sourcePath", map.Resource);
            table.Add("@categoryId", map.Category.Id);
            map.Id = dal.Write(table, "spWriteMap");

            return map.Id > 0;
        }

        /// <summary>
        /// Ejecuta la actualización del modelo de datos.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        public bool Edit(Map map)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@resourceId", map.Id);
            table.Add("@name", map.Name);
            table.Add("@description", map.Description);
            table.Add("@price", map.Price);
            table.Add("@imageB64", map.Image);
            table.Add("@sourcePath", map.Resource);
            table.Add("@categoryId", map.Category.Id);
            return dal.Write(table, "spModifyMap") > 0;
        }

        /// <summary>
        /// Recupera el listado de elementos de la base.
        /// </summary>
        /// <returns></returns>
        public List<Map> Get()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<Map> maps = null;

            DataSet result = dal.Read(table, "spReadMap");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                maps = new List<Map>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    maps.Add(ConvertToModel(data));
                }
            }

            return maps;
        }

        /// <summary>
        /// Recupera el elemento cuyo id coincida con el provisto por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Map Get(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            Map map = null;

            table.Add("@resourceId", id);

            DataSet result = dal.Read(table, "spReadMap");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                map = ConvertToModel(result.Tables[0].Rows[0]);
            }

            return map;
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
            table.Add("@resourceId", id);
            return dal.Write(table, "spDeleteMap") > 0;
        }

        /// <summary>
        /// Devuelve un objeto modelado con los valores del dataRow que recibe por parámetro.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private Map ConvertToModel(DataRow data)
        {
            Map map = new Map();
            map.Id = int.Parse(data["sourceId"].ToString());
            map.Name = data["name"].ToString();
            map.Description = data["description"].ToString();
            map.Price = Convert.ToDouble(data["price"]);
            map.Image = data["image"].ToString();
            map.Resource = data["sourcePath"].ToString();
            map.Category.Id = int.Parse(data["categoryId"].ToString());
            map.Category.Name = data["categoryName"].ToString();

            return map;
        }

    }
}
