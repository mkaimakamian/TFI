using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using Ubiquicity.Classes;

namespace Ubiquicity.UserControls
{
    public partial class UCcrudGrid : System.Web.UI.UserControl
    {
        public delegate void UCcrudGridEvent(object sender, UbiquicityEventArg arg);

        public event UCcrudGridEvent EditActionClick;
        public event UCcrudGridEvent DeleteActionClick;
        public event UCcrudGridEvent NewActionClick;
        public event UCcrudGridEvent GenericActionClick;
        private HashSet<Int32> cellsToRemove = new HashSet<int>();
        private string genericActionButtonName = "Genérico";

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

        public void ShowGenericActionButton(string buttonName)
        {
            gvItem.Columns[2].Visible = true;
            genericActionButtonName = buttonName;
        }

        public void ShowThumbnail()
        {
            gvItem.Columns[3].Visible = true;
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
            //Session["Ubiquicity_itemId"] = e.CommandArgument;
            
            if (e.CommandName == "EditItem")
            {
                if (EditActionClick != null) EditActionClick(this, new UbiquicityEventArg(e.CommandArgument));
            }
            else if (e.CommandName == "DeleteItem")
            {
                if (DeleteActionClick != null) DeleteActionClick(this, new UbiquicityEventArg(e.CommandArgument));
            }
            else if (e.CommandName == "GenericActionItem")
            {
                if (GenericActionClick != null) GenericActionClick(this, new UbiquicityEventArg(e.CommandArgument));
            }

        }

        /// <summary>
        /// Dispara el evento cuando se presiona el botón para la creación de un nuevo elemento.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNewItem_Click(object sender, EventArgs e)
        {
            if (NewActionClick != null) NewActionClick(this, new UbiquicityEventArg(e));
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

        /// <summary>
        /// Evalúa la existencia de la columna para hacer el binding; si no existe, devuelve un string vacío.
        /// </summary>
        /// <param name="columnName"></param>
        /// <returns></returns>
        public object EvalProperty(string columnName)
        {
            object toReturn;
            try {
                toReturn = Eval(columnName);

            }
            catch {
                toReturn = "";
            }
            return toReturn;
        }

        /// <summary>
        /// Muestra las columnas traducidas, ocultando las que no han recibido traducción.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
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
                    else if (cell.Text != "&nbsp;")
                    {
                        //Si no se traduce, entonces no interesa y debe ser eliminado, razón por la que se guarda
                        //el índice para poder remover luego la celda
                        cellsToRemove.Add(i);
                    }
                } else if (i == 2 && e.Row.RowType == DataControlRowType.DataRow) //el 2 es por el orden; poco feliz 
                {
                    //Se necesita para identificar el botón de acción genérica
                    LinkButton button = (LinkButton)e.Row.FindControl("btnGenericAction");
                    if (button != null) button.Text = genericActionButtonName;
                }

                // Las celdas pertenecientes a columnas no mostrables, se ocultan.
                if (cellsToRemove.Contains(i))
                {
                    cell.Visible = false;
                }
            }
            
        }
    }
}