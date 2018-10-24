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
    public partial class category_manager : BaseManager
    {
        protected override void PageLoad(object sender, EventArgs e)
        {
            GridView = UCcrudGrid;
            Manager = new CategoryManager();
        }

        /// <summary>
        /// Muestra el formulairo para el alta de un nuevo elemento.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ShowNewForm(object sender, UbiquicityEventArg e)
        {
            UCFormCategory.CleanForm();
            Session["Ubiquicity_action"] = CREATE;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalCreate", "window.onload = function() { $('#modalCategory').modal('show'); }", true);
            ScriptManager.RegisterStartupScript(upUCModalForm, upUCModalForm.GetType(), "openModalCreate", "$('#modalCategory').modal('show');", true);
            upUCModalForm.Update();
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

            CategoryManager categoryManager = new CategoryManager();
            Category category = categoryManager.Get(id);

            if (category == null && categoryManager.HasErrors)
            {
                Alert.Show("Error", categoryManager.ErrorDescription);
            }
            else
            {
                UCFormCategory.FillForm(category);
                Session["Ubiquicity_action"] = EDIT;
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalEdit", "window.onload = function() { $('#modalCategory').modal('show'); }", true);
                ScriptManager.RegisterStartupScript(upUCModalForm, upUCModalForm.GetType(), "openModalEdit", "$('#modalCategory').modal('show');", true);
                upUCModalForm.Update();
            }
        }

        protected override bool AcceptCreate(BL.BaseManager manager)
        {
            Category category = new Category();
            UCFormCategory.PopulateModel(category);
            return ((CategoryManager)manager).Save(category);
        }

        protected override bool AcceptModify(BL.BaseManager manager, int id)
        {
            Category category = ((CategoryManager)manager).Get(id);
            UCFormCategory.PopulateModel(category);
            return ((CategoryManager)manager).Edit(category);
        }

        /// <summary>
        /// Se establece la traducción de las columnas que quieren ser mostradas.
        /// </summary>
        /// <returns></returns>
        protected override Dictionary<string, string> ColumnsToShowAndTranslate()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("Name", "Nombre");
            return columns;
        }
    }
}