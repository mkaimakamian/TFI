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

        /// <summary>
        /// Craga las categorías y devuelve el listado con todos los elementos seleccionados
        /// </summary>
        /// <returns></returns>
        private ListItemCollection LoadCategory()
        {
            try
            {
                CategoryManager newsCategoryManager = new CategoryManager();
                List<Category> newsCategories = newsCategoryManager.Get();
                checksCategoryInput.DataSource = newsCategories;
                checksCategoryInput.DataTextField = "Name";
                checksCategoryInput.DataValueField = "Id";
                checksCategoryInput.DataBind();

                // Selección de todos los check para que el filtrado inicial muestre todos los items
                foreach (ListItem item in checksCategoryInput.Items)
                {
                    item.Selected = true;
                }
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Excepción", exception.Message);
            }

            return checksCategoryInput.Items;
        }

        private void LoadNews(ListItemCollection categories)
        {
            try
            {
                //Se traspasa a un array para que la capa de negocios reciba una etsructura más genérica.
                int[] categoriesId = new int[categories.Count];
                //List<ListItem> selected = checkCreditNotes.Items.Cast<ListItem>().Where(li => li.Selected).ToArray();
                for (int i = 0; i < categories.Count; ++i)
                {
                    if (categories[i].Selected) categoriesId[i] = Convert.ToInt32(categories[i].Value);
                }

                NewsManager newsmanager = new NewsManager();
                newsRepeater.DataSource = newsmanager.GetByCategory(categoriesId);
                newsRepeater.DataBind();
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

        /// <summary>
        /// Muestra la noticia en un modal para que pueda ser leída.
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void newsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                NewsManager newsmanager = new NewsManager();
                int id = Convert.ToInt32(e.CommandArgument);
                News news = newsmanager.Get(id);

                //Ejecuta el modal
                ModalNewsletter.Show(news.Title, news.Body, news.Image);
            } catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }

        }

        protected void ChangeNewsCategory(object sender, EventArgs e)
        {
            LoadNews(checksCategoryInput.Items);
        }
    }
}