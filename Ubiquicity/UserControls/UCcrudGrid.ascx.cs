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
        public event EventHandler EditActionClick;
        public event EventHandler DeleteActionClick;
        public event EventHandler NewActionClick;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void HideDeleteButton()
        {
            gvItem.Columns[0].Visible = false;
        }

        public void HideNewButton()
        {
            btnNewItem.Visible = false;
        }


        /// <summary>
        /// Carga el datasource y establece el binding con los objetos a mostrar
        /// </summary>
        /// <param name="objetcs"></param>
        public void LoadGrid(object objects)
        {
            Session["gvItemDatasource"] = objects; //empleado internamente para el paginado
            gvItem.DataSource = objects;
            gvItem.DataBind();
        }

        /// <summary>
        /// Dependiendo si se presionó el botón de editar o de eliminación, dispara uno u otro evento.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvItem_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
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

        protected void gvItem_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (gvItem.EditIndex != -1)
            {
                e.Cancel = true;
            } else
            {
                gvItem.PageIndex = e.NewPageIndex;
                gvItem.DataSource = Session["gvItemDatasource"];
                gvItem.DataBind();
                gvItem.UseAccessibleHeader = true;
                gvItem.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}