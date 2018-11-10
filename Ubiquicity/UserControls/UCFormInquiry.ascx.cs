using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using Helper;

namespace Ubiquicity.UserControls
{
    public partial class UCFormInquiry : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void CleanForm()
        {
            txtAnswer.Value = "";
            txtInquiry.Value = "";
        }

        public void FillForm(ItemComment itemComment)
        {
            //El formulario se llena con la pregunta.
            txtTitle.InnerText = "¡Hey! el usuario " +itemComment.User.Lastname + " realizó una consulta sobre el siguiente producto:";
            txtInquiry.Value = itemComment.Sentence;
            txtProduct.InnerText = "Producto: " + itemComment.Resource.Name;
            txtCategory.InnerText = "Categoría: " + itemComment.Resource.CategoryName;
            txtRanking.InnerText = "Ranking: " + itemComment.Resource.Ranking;

            //txtCategory.InnerText = itemComment.Resource.Id.ToString();
            //if (itemComment.SentenceReference != null) txtAnswer.Value = itemComment.SentenceReference.Sentence;
        }

        public void PopulateModel(ItemComment itemComment)
        {
            //Lo que interesa es la respuesta
            itemComment.Sentence = txtAnswer.Value;
            itemComment.User = SessionHelper.GetUser();
        }
    }
}