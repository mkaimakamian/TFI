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
        private Dictionary<string, string> columnsToShow;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// Settea el diccionario de las columnas cuyos encabezados se traducirán y a los que se acotará la 
        /// grilla a través del método ShowTranslateColumns.
        /// </summary>

        ///// <summary>
        ///// Deja visible únicamente las columnas definidas por la propiedad ColumnsToTranslateAndShow
        ///// </summary>
        public void TranslateAndShow(Dictionary<string, string> columns)
        {
            //TODO - REVISAR
            //stand by
            //foreach (DataControlField column in gvItem.Columns)
            //{
            //    if (columns.ContainsKey(column.HeaderText))
            //    {
            //        column.HeaderText = columnsToShow[column.HeaderText];
            //    }
            //    else if (!String.IsNullOrEmpty(column.HeaderText))
            //    {
            //        column.Visible = false;
            //    }
            //}
        }

        public void HideDeleteButton()
        {
            gvItem.Columns[0].Visible = false;
        }

        public void HideNewButton()
        {
            btnNewItem.Visible = false;
        }

        public void HideEditButton()
        {
            gvItem.Columns[1].Visible = false;
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

        protected void gvItem_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //TODO - REVISAR
            //stand by
            //if (columnsToShow == null || columnsToShow.Count == 0) return;

            //if (e.Row.RowType == DataControlRowType.Header)
            //{
            //    foreach (TableCell cell in e.Row.Cells)
            //    {
            //        if (columnsToShow.ContainsKey(cell.Text)) cell.Text = columnsToShow[cell.Text];
            //    }
            //}
        }
    }
}