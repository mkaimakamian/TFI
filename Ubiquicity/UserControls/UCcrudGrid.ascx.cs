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
        //private Dictionary<string, string> columnsToShow;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// Settea el diccionario de las columnas cuyos encabezados se traducirán y a los que se acotará la 
        /// grilla a través del método ShowTranslateColumns.
        /// </summary>
        public Dictionary<string, string> ColumnsToShow
        {
            set { Session["gvItemcolumnsToShow"] = value; }
            get { return (Dictionary < string, string> ) Session["gvItemcolumnsToShow"]; }
        }
        
        public void HideDeleteButton()
        {
            gvItem.Columns[0].Visible = false;
        }

        public void HideNewButton()
        {
            divBtnNew.Visible = false;
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

        /// <summary>
        /// Realiza la paginación de la grilla.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
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

        private HashSet<Int32> toRemove = new HashSet<int>();
        protected void gvItem_RowDataBound(object sender, GridViewRowEventArgs e)
        {
                        
            if (ColumnsToShow == null || ColumnsToShow.Count == 0) return;

            for (int i = 0; i < e.Row.Cells.Count; ++i)
            {
                TableCell cell = e.Row.Cells[i];

                // En lo particular, si es el encabeado, traduzco
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    if (ColumnsToShow.ContainsKey(cell.Text))
                    {
                        cell.Text = ColumnsToShow[cell.Text];
                    }
                    else if (cell.Text != "&nbsp;") // las dos columnas templates de eliminación y edición
                    {
                        //Si no se traduce, entonces no interesa y debe ser eliminado, razón por la que guardo los indices de columna
                        toRemove.Add(i);
                    }
                }

                // Las celdas pertenecientes a columnas no mostrables, se ocultan.
                if (toRemove.Contains(i))
                {
                    cell.Visible = false;
                }
            }
            
        }
    }
}