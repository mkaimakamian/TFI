using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;
using Helper;

namespace Ubiquicity.UserControls
{
    public partial class UCModalInvoiceItemSupport : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        //public String title
        //{
        //    set { ucModalInvoiceItemSupportLabel.InnerText = value; }
        //}


        /// <summary>
        /// Recupera todos los comentarios para el producto.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        public List<ItemComment> LoadCommentsSupport(int id)
        {
            try
            {
                ItemCommentSupportManager commentManager = new ItemCommentSupportManager();
                itemRepeater.DataSource = commentManager.GetByInoiceItem(id).Comments;
                itemRepeater.DataBind();
                commentInput.InnerText = "";
            }
            catch (Exception exception)
            {
                //((front) Master).Alert.Show("Exception", exception.Message);
            }

            return null;
        }

        /// <summary>
        /// Crea un comentario.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PerformComment(object sender, EventArgs e)
        {
            try
            {
                int invoiceItemId = Convert.ToInt32(SessionUtilHelper.GetIdFromSession(Session));

                ItemCommentSupportManager commentManager = new ItemCommentSupportManager();
                InvoiceItemSupport invoiceItemSupport = new InvoiceItemSupport();

                invoiceItemSupport.InvoiceItem.Id = invoiceItemId;
                ItemCommentSupport itemCommentSupport = new ItemCommentSupport();

                itemCommentSupport.Sentence = commentInput.InnerText;
                itemCommentSupport.User = SessionHelper.GetUser();
                itemCommentSupport.IsOperator = false;
                itemCommentSupport.Date = DateTime.Now;
                invoiceItemSupport.Comments.Add(itemCommentSupport);

                commentManager.Save(invoiceItemSupport);
            }
            catch (Exception exception)
            {
                //TODO - agregar control de error
                //((front)Master).Alert.Show("Exception", exception.Message);
            }
        }
    }
}