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
        }

        protected override void LoadGridView()
        {
            try
            {
                MapManager mapManager = new MapManager();
                List<Map> maps = mapManager.Get();

                if (mapManager.HasErrors)
                {
                    Alert.Show("Error", mapManager.ErrorDescription);
                }
                else
                {
                    GridView.ColumnsToShow = ColumnsToShowAndTranslate();
                    GridView.LoadGrid(maps);
                }
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }

        /// <summary>
        /// Muestra el formulairo para el alta de un nuevo mapa.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ShowNewForm(object sender, UbiquicityEventArg e)
        {
            UCFormMap.CleanForm();
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
                UCFormMap.FillForm(map);
                Session["Ubiquicity_action"] = EDIT;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalEdit", "window.onload = function() { $('#modalMap').modal('show'); }", true);
            }
        }

        // Atiende la llamada del botón aceptar del form de creación.
        //En lo particular, como la edición y la creación usan el mismo botón, los dos eventos son atendidos por este handler.
        protected void modalMap_btnAccept_Click(object sender, EventArgs e)
        {
            try
            {
                int action = Convert.ToInt32(Session["Ubiquicity_action"]);

                //TODO - Validar los campos
                MapManager mapManager = new MapManager();
                Map map = null;
                bool success = true;

                switch (action)
                {
                    case CREATE:
                        map = new Map();
                        UCFormMap.PopulateModel(map);
                        success = mapManager.Save(map);
                        break;

                    case EDIT:
                        if (Session["Ubiquicity_itemId"] != null)
                        {
                            map = mapManager.Get(Convert.ToInt32(Session["Ubiquicity_itemId"]));
                            UCFormMap.PopulateModel(map);
                            success = mapManager.Edit(map);
                        }
                        break;
                }

                Session.Remove("Ubiquicity_itemId");

                if (!success && mapManager.HasErrors)
                {
                    Alert.Show("Error", mapManager.ErrorDescription);
                } else
                {
                    LoadGridView();
                }
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }

        protected override void AskForDelete(object sender, UbiquicityEventArg e)
        {
            Session["Ubiquicity_itemId"] = Convert.ToInt32(e.TheObject);
            Alert.Show("Eliminar registro", "¿Está seguro de querer eliminar el registro?", "Si");
        }

        protected override void PerformDeleteItem(object sender, UbiquicityEventArg e)
        {
            if (Session["Ubiquicity_itemId"] != null)
            {
                MapManager mapManager = new MapManager();
                mapManager.Delete(Convert.ToInt32(Session["Ubiquicity_itemId"]));
                LoadGridView();
                Session.Remove("Ubiquicity_itemId");
            }
        }

        /// <summary>
        /// Se establece la traducción de las columnas que quieren ser mostradas.
        /// </summary>
        /// <returns></returns>
        private Dictionary<string, string> ColumnsToShowAndTranslate()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("Name", "Nombre");
            columns.Add("Description", "Descripción");
            columns.Add("Resource", "Recurso");
            return columns;
        }
    }
}