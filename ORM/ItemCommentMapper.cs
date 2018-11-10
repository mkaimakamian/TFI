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
    public class ItemCommentMapper: MessageMapper
    {

        public bool Save(ItemComment comment)
        {
            base.Save(comment);
        
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@messageId", comment.Id);
            table.Add("@resourceId", comment.Resource.Id);
            if (comment.SentenceReference != null) table.Add("@messageRefId", comment.SentenceReference.Id);
            comment.Id = dal.Write(table, "spWriteItemComment");
            return comment.Id > 0;
        }

        /// <summary>
        /// Devuelve todos los mensajs pertenecientes a un recurso / producto.
        /// </summary>
        /// <param name="reourseId"></param>
        /// <returns></returns>
        public List<ItemComment> GetByResource(int reourseId)
        {
            //Como se está consultando una lista, es preferible que sp devuelva todos los
            //valores y no optar por una estrategia que discrimine entre la recuperación 
            //de los datos de la clase padre por un lado, y los hijos por otro.
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


        public List<ItemComment> Get()
        {
            //Como se está consultando una lista, es preferible que sp devuelva todos los
            //valores y no optar por una estrategia que discrimine entre la recuperación 
            //de los datos de la clase padre por un lado, y los hijos por otro.
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<ItemComment> comments = null;

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
        /// Elimina el elemento del sistema.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            table.Add("@itemCommentId", id);
            return dal.Write(table, "spDeleteItemComment") > 0;
        }

        /// <summary>
        /// Recupera el elemento cuyo id coincida con el provisto por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ItemComment Get(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            ItemComment itemComment = null;

            table.Add("@messageId", id);

            DataSet result = dal.Read(table, "spReadItemComment");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                itemComment = ConvertToModel(result.Tables[0].Rows[0]);
            }

            return itemComment;
        }

        public ItemComment GetReference(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            ItemComment itemComment = null;

            table.Add("@messageRefId", id);

            DataSet result = dal.Read(table, "spReadItemComment");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                itemComment = ConvertToModel(result.Tables[0].Rows[0]);
            }

            return itemComment;
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
            itemComment.Sentence = data["sentence"].ToString();
            itemComment.Date = Convert.ToDateTime(data["date"]);
            itemComment.User.Id = int.Parse(data["userid"].ToString());
            itemComment.Resource.Id = int.Parse(data["resourceId"].ToString());
            if (data["messageRefId"] != DBNull.Value)
            {
                itemComment.SentenceReference = new ItemComment();
                itemComment.SentenceReference.Id = int.Parse(data["messageRefId"].ToString());
            }

            return itemComment;
        }
    }
}
