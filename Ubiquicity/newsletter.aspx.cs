using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;

namespace Ubiquicity
{
    public partial class newsletter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNews(LoadCategory());
            }
        }

        private int LoadCategory()
        {
            try
            {
                NewsCategoryManager newsCategoryManager = new NewsCategoryManager();
                List<NewsCategory> newsCategories = newsCategoryManager.Get();
                dropCategoryInput.DataSource = newsCategories;
                dropCategoryInput.DataTextField = "Name";
                dropCategoryInput.DataValueField = "Id";
                dropCategoryInput.DataBind();

                //foreach (ListItem item in checksCategoryInput.Items)
                //{
                //    item.Selected = true;
                //}
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Excepción", exception.Message);
            }

            return Convert.ToInt32(dropCategoryInput.SelectedValue);
        }

        private void LoadNews(int categoryId)
        {
            try
            {
                //Se traspasa a una coleccion genérica
                //string[] ids = new string[items.Count];

                //for(int i=0; i < items.Count; ++i)
                //{
                //    ids[i] = items[i].Value;
                //}
   
                NewsManager newsmanager = new NewsManager();
                newsRepeater.DataSource = newsmanager.GetByCategory(categoryId);
                newsRepeater.DataBind();
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }


        protected void newsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            NewsManager newsmanager = new NewsManager();
            int id = Convert.ToInt32(e.CommandArgument);
            News news = newsmanager.Get(id);
            //
            ModalNewsletter.Show(news.Title, news.Body, news.Image);
        }

        protected void ChangeNewsCategory(object sender, EventArgs e)
        {
            int categoryId = Convert.ToInt32(((DropDownList)sender).SelectedValue);
            LoadNews(categoryId);
        }
    }
}