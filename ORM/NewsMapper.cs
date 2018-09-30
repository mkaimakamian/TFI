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

            news.Id = dal.Write(table, "spWriteNews");

            return news.Id > 0;
        }

        public List<News> Get()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<News> news = null;

            table.Add("@id", DBNull.Value);
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

        private News ConvertToModel(DataRow data)
        {
            return new News
            {
                Id = int.Parse(data["id"].ToString()),
                Title = data["title"].ToString(),
                Body = data["body"].ToString(),
                Image = data["image"].ToString(),
                Since = Convert.ToDateTime(data["since"].ToString()),
                Until = Convert.ToDateTime(data["until"].ToString()),
                Sent = Convert.ToBoolean(data["sent"].ToString())
            };
        }
    }
}
