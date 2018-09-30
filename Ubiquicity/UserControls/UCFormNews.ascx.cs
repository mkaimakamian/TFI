using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;

namespace Ubiquicity.UserControls
{
    public partial class UCFormNews : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void CleanForm()
        {
            titleInput.Value = "";
            bodyInput.InnerText = "";
            fileImage.Src = "";
            imageInputBase64.Value = "";
            categoryInput.SelectedIndex = 0;
            sinceInput.Value = "";
            untilInput.Value = "";
        }

        public void FillForm(News news)
        {
            titleInput.Value = news.Title;
            bodyInput.InnerText = news.Body;
            fileImage.Src = news.Image;
            imageInputBase64.Value = news.Image;
            categoryInput.SelectedIndex = 0; //el que corresponda
            sinceInput.Value = news.Since.ToString();
            untilInput.Value = news.Until.ToString();
        }

        public void PopulateModel(News news)
        {
            news.Title = titleInput.Value;
            news.Body = bodyInput.InnerText;
            news.Image = imageInputBase64.Value;
            //news.Category = categoryInput.Items[categoryInput.SelectedIndex];
            news.Since = Convert.ToDateTime(sinceInput.Value);
            news.Until= Convert.ToDateTime(untilInput.Value);
        }
    }
}