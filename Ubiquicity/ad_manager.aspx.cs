using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;
using Ubiquicity.Classes;

namespace Ubiquicity
{
    public partial class ad_manager : BaseManager
    {
        protected override void PageLoad(object sender, EventArgs e)
        {
            GridView = UCcrudGrid;
            GridView.ShowThumbnail();
            GridView.HideEditButton();
            Manager = new AdImageManager();
        }

        /// <summary>
        /// Muestra el formulairo para el alta de un nuevo mapa.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ShowNewForm(object sender, UbiquicityEventArg e)
        {
            AdImageManager adImageManager = new AdImageManager();
            List<Ad> adImages = adImageManager.Get();
            UCFormAd.CleanForm();
            Session["Ubiquicity_action"] = CREATE;
            ScriptManager.RegisterStartupScript(upUCModalForm, upUCModalForm.GetType(), "openModalCreate", "$('#modalAdImage').modal('show');", true);
            upUCModalForm.Update();
        }

        protected override bool AcceptCreate(BL.BaseManager manager)
        {
            Ad adImage = new Ad();
            UCFormAd.PopulateModel(adImage);
            return ((AdImageManager)manager).Save(adImage);
        }

        /// <summary>
        /// Se establece la traducción de las columnas que quieren ser mostradas.
        /// </summary>
        /// <returns></returns>
        protected override Dictionary<string, string> ColumnsToShowAndTranslate()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("NavigateUrl", "Url destino");
            return columns;
        }
    }
}