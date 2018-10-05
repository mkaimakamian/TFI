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
    public class NewsMapper
    {
        public bool Save(News news)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@title", news.Title);
            table.Add("@body", news.Body);
            table.Add("@image", news.Image);
            table.Add("@since", news.Since);
            table.Add("@until", news.Until);
            table.Add("@sent", news.Sent);
            table.Add("@categoryId", news.Category.Id);

            news.Id = dal.Write(table, "spWriteNews");

            return news.Id > 0;
        }

        public bool Edit(News news)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@id", news.Id);
            table.Add("@title", news.Title);
            table.Add("@body", news.Body);
            table.Add("@image", news.Image);
            table.Add("@since", news.Since);
            table.Add("@until", news.Until);
            table.Add("@sent", news.Sent);
            table.Add("@categoryId", news.Category.Id);
            return dal.Write(table, "spModifyNews") > 0;
        }

        public News Get(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            News news = null;

            table.Add("@id", id);
            table.Add("@categoryId", DBNull.Value);
            DataSet result = dal.Read(table, "spReadNews");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                news = ConvertToModel(result.Tables[0].Rows[0]);
            }

            return news;
        }

        public List<News> Get()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<News> news = null;

            table.Add("@id", DBNull.Value);
            table.Add("@categoryId", DBNull.Value);
            DataSet result = dal.Read(table, "spReadNews");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                news = new List<News>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    news.Add(ConvertToModel(data));
                }
            }

            return news;
        }

        /// <summary>
        /// Recupera el listado filtrando por categoría
        /// </summary>
        /// <returns></returns>
        public List<News> GetByCategory(int categoryId)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<News> news = null;

            //string categoryIds = String.Join(",", ids);

            table.Add("@id", DBNull.Value);
            table.Add("@categoryId", categoryId);
            DataSet result = dal.Read(table, "spReadNews");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                news = new List<News>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    news.Add(ConvertToModel(data));
                }
            }

            return news;
        }
        

        public bool Delete(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            table.Add("@id", id);
            return dal.Write(table, "spDeleteNews") > 0;
        }

        private News ConvertToModel(DataRow data)
        {
            News news = new News();
            news.Id = Convert.ToInt32(data["id"]);
            news.Title = data["title"].ToString();
            news.Body = data["body"].ToString();
            news.Image = data["image"].ToString();
            news.Since = Convert.ToDateTime(data["since"]);
            news.Until = Convert.ToDateTime(data["until"]);
            news.Sent = Convert.ToBoolean(data["sent"]);
            news.Category.Id = Convert.ToInt32(data["newsCategoryId"]);

            return news;
        }
    }
}
