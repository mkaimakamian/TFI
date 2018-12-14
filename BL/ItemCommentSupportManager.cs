using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class ItemCommentSupportManager: BaseManager
    {

        public List<ItemCommentSupport> Get()
        {
            UserManager userManager = new UserManager();
            //InvoiceItemSupport invoiceItemSupport = new InvoiceItemSupport();
            //InvoiceItemMapper invoiceItemMapper = new InvoiceItemMapper();
            ItemCommentSupportMapper itemCommentSupportMapper = new ItemCommentSupportMapper();

            //InvoiceItem invoiceItem = invoiceItemMapper.Get(invoiceItemId);

            //if (invoiceItem == null)
            //{
            //    string errorDescription = "No se ha podido recuperar el artículo comprado con id " + invoiceItemId + ".";
            //    log.AddLogCritical("GetByInoiceItem", errorDescription, this);
            //    AddError(new ResultBE(ResultBE.Type.NULL, errorDescription));
            //    return null;
            //}

            List<ItemCommentSupport> comments = itemCommentSupportMapper.Get();

            if (comments == null || comments.Count == 0) return null;

            foreach (ItemCommentSupport comment in comments)
            {
                comment.User = userManager.Get(comment.User.Id);
                comment.Id = comment.InvoiceItemId;//dngr!
            }

            //invoiceItemSupport.InvoiceItem = invoiceItem;
            //invoiceItemSupport.Comments = comments;

            return comments;
        }



        /// <summary>
        /// Recupera los comentarios asociados a un producto.
        /// </summary>
        /// <param name="resourceId"></param>
        /// <returns></returns>
        public InvoiceItemSupport GetByInoiceItem(int invoiceItemId)
        {
            UserManager userManager = new UserManager();
            InvoiceItemSupport invoiceItemSupport = new InvoiceItemSupport();
            InvoiceItemMapper invoiceItemMapper = new InvoiceItemMapper();
            ItemCommentSupportMapper itemCommentSupportMapper = new ItemCommentSupportMapper();

            InvoiceItem invoiceItem = invoiceItemMapper.Get(invoiceItemId);

            if (invoiceItem == null)
            {
                string errorDescription = "No se ha podido recuperar el artículo comprado con id " + invoiceItemId + ".";
                log.AddLogCritical("GetByInoiceItem", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.NULL, errorDescription));
                return null;
            }

            List<ItemCommentSupport> comments = itemCommentSupportMapper.GetByInvoiceItem(invoiceItemId);

            if (comments != null)
            {
                foreach (ItemCommentSupport comment in comments)
                {
                    comment.User = userManager.Get(comment.User.Id);
                }
            }

            invoiceItemSupport.InvoiceItem = invoiceItem;
            invoiceItemSupport.Comments = comments;

            return invoiceItemSupport;
        }


        public bool Save(InvoiceItemSupport invoiceItemSupport)
        {
            if (!IsValid(invoiceItemSupport.Comments[0])) return false;

            ItemCommentSupportMapper itemCommentSupportMapper = new ItemCommentSupportMapper();

            if (!itemCommentSupportMapper.Save(invoiceItemSupport))
            {
                string errorDescription = "No se ha podido guardar el comentario de soporte para el id de producto "+ invoiceItemSupport.InvoiceItem.Id+ ".";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            if (!itemCommentSupportMapper.ChangeTopicStatus(invoiceItemSupport.InvoiceItem.Id, false))
            {
                string errorDescription = "No se ha podido cerrar la consulta de soporte para el invoiceItemId" + invoiceItemSupport.InvoiceItem.Id + ".";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        public bool CloseTopic(int invoiceItemId)
        {
            ItemCommentSupportMapper itemCommentSupportMapper = new ItemCommentSupportMapper();

            if (!itemCommentSupportMapper.ChangeTopicStatus(invoiceItemId, true))
            {
                string errorDescription = "No se ha podido cerrar la consulta de soporte para el invoiceItemId" + invoiceItemId + ".";
                log.AddLogCritical("CloseTopic", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        public Dictionary<string, ArrayList[]> GetReportForSupport(Dictionary<String, QueryFilter> filters)
        {
            QueryFilter queryFilter = filters["Type"];
            ItemCommentSupportMapper itemCommentSupportMapper = new ItemCommentSupportMapper();
            List<QueryFilter> qfResult = itemCommentSupportMapper.GetSupport(filters);

            if (qfResult == null) return null;

            Dictionary<string, ArrayList[]> chartSeries = new Dictionary<string, ArrayList[]>();

            chartSeries.Add(queryFilter.Key, new ArrayList[2] { new ArrayList(), new ArrayList() });

            foreach (QueryFilter qf in qfResult)
            {
                chartSeries[queryFilter.Key][0].Add(qf.Key);
                chartSeries[queryFilter.Key][1].Add(Convert.ToDouble(qf.Value));
            }

            return chartSeries;
        }

        private bool IsValid(ItemCommentSupport itemCommentSupport)
        {
            return VLetterNumbers(itemCommentSupport.Sentence, 1, 250, "Comentario", "IsValid");
        }

        public override string ToString() { return "ItemCommentSupport"; }
    }
}
