using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;

namespace Ubiquicity.UserControls
{
    public partial class UCcrudGrid : System.Web.UI.UserControl
    {
        private UCModalMessageBox customAlertBox;
        public event EventHandler EditActionClick;
        public event EventHandler DeleteActionClick;
        public event EventHandler NewActionClick;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// Guarda la referencia del alert box que empleará
        /// </summary>
        public UCModalMessageBox AlertBox
        {
            set
            {
                customAlertBox = value;
            }
        }

        /// <summary>
        /// Settea el handler para el botón principal del alert box
        /// </summary>
        public EventHandler PerformAlertBoxMainAction
        {
            set
            {
                customAlertBox.PerformMainAction += value;
            }
        }

        /// <summary>
        /// Settea el handler para el botón secundario de alert box
        /// </summary>
        public EventHandler PerformAlertBoxSecondAction
        {
            set
            {
                customAlertBox.PerformSecondAction += value;
            }
        }

        /// <summary>
        /// Carga el datasource y establece el binding con los objetos a mostrar
        /// </summary>
        /// <param name="manager"></param>
        /// <param name="objetcs"></param>
        public void LoadGrid(BaseManager manager, object objetcs)
        {
            if (manager.HasErrors)
            {
                ShowAlert("Error", manager.Errors[0].description);
            }
            else
            {
                gvItem.DataSource = objetcs;
                gvItem.DataBind();
            }
        }

        /// <summary>
        /// Emplea el alert box definido para mostrar información en pantalla.
        /// </summary>
        /// <param name="title"></param>
        /// <param name="message"></param>
        /// <param name="button1Label"></param>
        /// <param name="button2Label"></param>
        public void ShowAlert(string title, string message, String button1Label = "", String button2Label = "")
        {
            customAlertBox.title = title;
            customAlertBox.message = message;
            customAlertBox.MainActionLabel = button1Label;
            customAlertBox.SecondActionLabel = button2Label;

            customAlertBox.MainActionVisible = !String.IsNullOrEmpty(button1Label);
            customAlertBox.SecondActionVisible = !String.IsNullOrEmpty(button2Label);

            //TODO - a lo mejor es preferible que tenga su propio alert box
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalMessageGVItem", "window.onload = function() { $('#ucModalMessageBox').modal('show'); }", true);
        }

        /// <summary>
        /// Dependiendo si se presionó el botón de editar o de eliminación, dispara uno u otro evento.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvItem_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            //int id = Convert.ToInt32(e.CommandArgument);
            Session["Ubiquicity_itemId"] = e.CommandArgument;
            if (e.CommandName == "EditItem")
            {
                if (EditActionClick != null) EditActionClick(this, e);
            }
            else if (e.CommandName == "DeleteItem")
            {
                if (DeleteActionClick != null) DeleteActionClick(this, e);
            }
            
        }

        /// <summary>
        /// Dispara el evento cuando se presiona el botón para la creación de un nuevo elemento.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNewItem_Click(object sender, EventArgs e)
        {
            if (NewActionClick != null) NewActionClick(this, e);
        }
    }
}