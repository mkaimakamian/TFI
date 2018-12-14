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
    public class ItemCommentSupportMapper: MessageMapper
    {

        /// <summary>
        /// Devuelve todos los mensajs pertenecientes a un recurso / producto.
        /// </summary>
        /// <param name="reourseId"></param>
        /// <returns></returns>
        public List<ItemCommentSupport> GetByInvoiceItem(int invoiceItemId)
        {
            //Como se está consultando una lista, es preferible que sp devuelva todos los
            //valores y no optar por una estrategia que discrimine entre la recuperación 
            //de los datos de la clase padre por un lado, y los hijos por otro.
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<ItemCommentSupport> comments = null;

            table.Add("@invoiceItemId", invoiceItemId);
            DataSet result = dal.Read(table, "spReadItemCommentSupport");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                comments = new List<ItemCommentSupport>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    comments.Add(ConvertToModel(data));
                }
            }

            return comments;
        }

        public List<ItemCommentSupport> Get()
        {
            //Como se está consultando una lista, es preferible que sp devuelva todos los
            //valores y no optar por una estrategia que discrimine entre la recuperación 
            //de los datos de la clase padre por un lado, y los hijos por otro.
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<ItemCommentSupport> comments = null;

            DataSet result = dal.Read(table, "spReadItemCommentSupport");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                comments = new List<ItemCommentSupport>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    comments.Add(ConvertToModel(data));
                }
            }

            return comments;
        }

        public bool Save(InvoiceItemSupport invoiceItemSupport)
        {
            ItemCommentSupport itemCommentSupport = invoiceItemSupport.Comments[0];
            base.Save(itemCommentSupport);

            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@messageId", itemCommentSupport.Id);
            table.Add("@isOperator", itemCommentSupport.IsOperator);
            table.Add("@invoiceItemId", invoiceItemSupport.InvoiceItem.Id);

            return dal.Write(table, "spWriteItemCommentSupport") > 0;
        }

        public bool ChangeTopicStatus(int invoiceItemid, bool close=false)
        {
           
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@invoiceItemid", invoiceItemid);
            table.Add("@isClosed", close);
            
            return dal.Write(table, "spModifyItemCommentSupport") > 0;
        }

        public List<QueryFilter> GetSupport(Dictionary<String, QueryFilter> filters)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<QueryFilter> queryFilters = null;

            table.Add("@key", filters["Type"].Value);
            table.Add("@month", filters["Month"].Value);
            table.Add("@year", filters["Year"].Value);

            DataSet result = dal.Read(table, "spReadSupportReport");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                queryFilters = new List<QueryFilter>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    queryFilters.Add(ConvertToQFModel(data));
                }
            }

            return queryFilters;
        }

        private ItemCommentSupport ConvertToModel(DataRow data)
        {
            ItemCommentSupport itemComment = new ItemCommentSupport();
            itemComment.Id = int.Parse(data["id"].ToString());
            itemComment.Sentence = data["sentence"].ToString();
            itemComment.Date = Convert.ToDateTime(data["date"]);
            itemComment.User.Id = int.Parse(data["userid"].ToString());
            itemComment.IsOperator = Convert.ToBoolean(data["isOperator"]);
            itemComment.IsClosed = Convert.ToBoolean(data["isClosed"]);
            itemComment.InvoiceItemId = int.Parse(data["invoiceItemid"].ToString());

            return itemComment;
        }

        /// <summary>
        /// Usado para los reportes.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private QueryFilter ConvertToQFModel(DataRow data)
        {
            QueryFilter queryFilter = new QueryFilter();
            queryFilter.Key = data["key"].ToString();
            queryFilter.Value = data["value"].ToString();

            return queryFilter;
        }
    }
}
