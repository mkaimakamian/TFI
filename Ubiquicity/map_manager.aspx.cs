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
                        //if (Session["Ubiquicity_itemId"] != null)
                        //{
                        //    user = userManager.Get(Convert.ToInt32(Session["Ubiquicity_itemId"]));
                        //    UCFormNewMember.PopulateModel(user);
                        //    userManager.Edit(user);

                        //}
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

        /// <summary>
        /// Se establece la traducción de las columnas que quieren ser mostradas.
        /// </summary>
        /// <returns></returns>
        private Dictionary<string, string> ColumnsToShowAndTranslate()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("Name", "Nombre");
            columns.Add("Description", "Descripción");
            columns.Add("Image", "Imagen");
            return columns;
        }
    }
}