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
    public partial class map_manager : BaseManager
    {
        protected override void PageLoad(object sender, EventArgs e)
        {
            GridView = UCcrudGrid;
            GridView.ShowThumbnail();
            Manager = new MapManager();
        }

        /// <summary>
        /// Muestra el formulairo para el alta de un nuevo mapa.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ShowNewForm(object sender, UbiquicityEventArg e)
        {
            CategoryManager categoryManager = new CategoryManager();
            List<Category> categories = categoryManager.Get();
            UCFormMap.CleanForm(categories);
            Session["Ubiquicity_action"] = CREATE;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalCreate", "window.onload = function() { $('#modalMap').modal('show'); }", true);
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

            MapManager mapManager = new MapManager();
            Map map = mapManager.Get(id);

            if (map == null && mapManager.HasErrors)
            {
                Alert.Show("Error", mapManager.ErrorDescription);
            }
            else
            {
                //TODO - agregar controles de error
                CategoryManager newsCategoryManager = new CategoryManager();
                List<Category> newsCategories = newsCategoryManager.Get();
                UCFormMap.CleanForm(newsCategories);
                UCFormMap.FillForm(map);
                Session["Ubiquicity_action"] = EDIT;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalEdit", "window.onload = function() { $('#modalMap').modal('show'); }", true);
            }
        }

        protected override bool AcceptCreate(BL.BaseManager manager)
        {
            Map map = new Map();
            UCFormMap.PopulateModel(map);
            return ((MapManager) manager).Save(map);
        }

        protected override bool AcceptModify(BL.BaseManager manager, int id)
        {
            Map map = ((MapManager)manager).Get(id);
            UCFormMap.PopulateModel(map);
            return ((MapManager) manager).Edit(map);
        }

        /// <summary>
        /// Se establece la traducción de las columnas que quieren ser mostradas.
        /// </summary>
        /// <returns></returns>
        protected override Dictionary<string, string> ColumnsToShowAndTranslate()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("CategoryName", "Categoría");
            columns.Add("Name", "Nombre");
            columns.Add("Description", "Descripción");
            columns.Add("Price", "Precio");
            columns.Add("Resource", "Recurso");
            return columns;
        }
    }
}