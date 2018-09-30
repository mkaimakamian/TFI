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
    public class NewsCategoryMapper
    {

        public List<NewsCategory> Get()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<NewsCategory> newsCategories = null;

            table.Add("@id", DBNull.Value);
            DataSet result = dal.Read(table, "spReadNewsCategory");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                newsCategories = new List<NewsCategory>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    newsCategories.Add(ConvertToModel(data));
                }
            }

            return newsCategories;
        }

        private NewsCategory ConvertToModel(DataRow data)
        {
            return new NewsCategory
            {
                Id = int.Parse(data["id"].ToString()),
                Name = data["name"].ToString()
            };
        }
    }
}
