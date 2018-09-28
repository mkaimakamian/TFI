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
        public bool Save(Map map)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@name", map.Name);
            table.Add("@description", map.Description);
            table.Add("@imagePath", map.Image);
            table.Add("@sourcePath", map.SourcePath);
            map.Id = dal.Write(table, "spWriteMap");
            //test if the id coul be more than  < -1
            return map.Id > 0;
        }

        public List<Map> Get()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<Map> maps = null;

            table.Add("@id", DBNull.Value);

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

        public Map Get(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            Map map = null;

            table.Add("@id", id);

            DataSet result = dal.Read(table, "spReadMap");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                map = ConvertToModel(result.Tables[0].Rows[0]);
            }

            return map;
        }

        private Map ConvertToModel(DataRow data)
        {
            return new Map
            {
                Id = int.Parse(data["id"].ToString()),
                Name = data["name"].ToString(),
                Description = data["description"].ToString(),
                Image = data["image"].ToString(),
                SourcePath = data["sourcePath"].ToString()
            };
        }

    }
}
