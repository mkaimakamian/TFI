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
    public class ItemCommenMapper
    {

        public bool Save(ItemComment comment)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@resourceId", comment.Resource.Id);
            table.Add("@userId", comment.User.Id);
            table.Add("@comment", comment.Comment);
            table.Add("@date", comment.Date);
            comment.Id = dal.Write(table, "spWriteItemComment");

            return comment.Id > 0;
        }

        /// <summary>
        /// Devuelve todos los mensajs pertenecientes a un recurso / producto.
        /// </summary>
        /// <param name="reourseId"></param>
        /// <returns></returns>
        public List<ItemComment> Get(int reourseId)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<ItemComment> comments = null;

            table.Add("@resourceId", reourseId);
            DataSet result = dal.Read(table, "spReadItemComment");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                comments = new List<ItemComment>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    comments.Add(ConvertToModel(data));
                }
            }

            return comments;
        }

        /// <summary>
        /// Devuelve un objeto modelado con los valores del dataRow que recibe por parámetro.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private ItemComment ConvertToModel(DataRow data)
        {
            ItemComment itemComment = new ItemComment();
            itemComment.Id = int.Parse(data["id"].ToString());
            itemComment.User.Id = int.Parse(data["userid"].ToString());
            itemComment.Resource.Id = int.Parse(data["resourceId"].ToString());
            itemComment.Date = Convert.ToDateTime(data["date"]);
            itemComment.Comment = data["comment"].ToString();

            return itemComment;
        }
    }
}
