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
            UCFormNews.CleanForm();
            Session["Ubiquicity_action"] = CREATE;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalCreate", "window.onload = function() { $('#modalNews').modal('show'); }", true);
        }

        protected override bool AcceptCreate(BL.BaseManager manager)
        {
            News news = new News();
            UCFormNews.PopulateModel(news);
            return ((NewsManager)manager).Save(news);
        }

        //protected override bool AcceptModify(BL.BaseManager manager, int id)
        //{
        //    Map map = ((MapManager)manager).Get(id);
        //    UCFormMap.PopulateModel(map);
        //    return ((MapManager)manager).Edit(map);
        //}

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