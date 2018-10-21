using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using BE;
using Ubiquicity.Classes;

namespace Ubiquicity
{
    public partial class news_manager : BaseManager
    {
        protected override void PageLoad(object sender, EventArgs e)
        {
            GridView = UCcrudGrid;
            GridView.ShowThumbnail();
            Manager = new NewsManager();
        }

        /// <summary>
        /// Muestra el formulario para el alta de un nuevo elemento.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ShowNewForm(object sender, UbiquicityEventArg e)
        {
            // TODO - Agregar control de error
            CategoryManager newsCategoryManager = new CategoryManager();
            List<Category> newsCategories = newsCategoryManager.Get();
            UCFormNews.CleanForm(newsCategories);
            Session["Ubiquicity_action"] = CREATE;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalCreate", "window.onload = function() { $('#modalNews').modal('show'); }", true);
        }

        protected override bool AcceptCreate(BL.BaseManager manager)
        {
            News news = new News();
            UCFormNews.PopulateModel(news);
            return ((NewsManager)manager).Save(news);
        }


        /// <summary>
        /// Muestra el formulario para la edición de un elemento existente.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ShowEditForm(object sender, UbiquicityEventArg e)
        {
            int id = Convert.ToInt32(e.TheObject);
            Session["Ubiquicity_itemId"] = id;

            NewsManager newsManager = new NewsManager();
            News news = newsManager.Get(id);

            if (news == null && newsManager.HasErrors)
            {
                Alert.Show("Error", newsManager.ErrorDescription);
            }
            else
            {
                //TODO - controlar errores
                CategoryManager newsCategoryManager = new CategoryManager();
                List<Category> newsCategories = newsCategoryManager.Get();
                UCFormNews.CleanForm(newsCategories);
                UCFormNews.FillForm(news);
                Session["Ubiquicity_action"] = EDIT;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalEdit", "window.onload = function() { $('#modalNews').modal('show'); }", true);
            }
        }

        protected override bool AcceptModify(BL.BaseManager manager, int id)
        {
            News news = ((NewsManager)manager).Get(id);
            UCFormNews.PopulateModel(news);
            return ((NewsManager)manager).Edit(news);
        }

        /// <summary>
        /// Se establece la traducción de las columnas que quieren ser mostradas.
        /// </summary>
        /// <returns></returns>
        protected override Dictionary<string, string> ColumnsToShowAndTranslate()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("Title", "Título");
            columns.Add("Resume", "Cuerpo");
            columns.Add("Since", "Desde");
            columns.Add("Until", "Hasta");
            columns.Add("Sent", "Enviado");

            return columns;
        }
    }
}