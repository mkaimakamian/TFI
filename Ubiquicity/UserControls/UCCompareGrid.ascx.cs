using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ubiquicity.Classes;

namespace Ubiquicity.UserControls
{
    public partial class UCCompareGrid : System.Web.UI.UserControl
    {

        private List<object> internalList = new List<object>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //TemplateField temp1 = new TemplateField();
                //temp1.HeaderText = "H1";
                //temp1.ItemTemplate = new CompareGridRow();
                //compareGridView.Columns.Add(temp1);

                TemplateField temp1 = new TemplateField();
                temp1.HeaderText = "H1";
                temp1.ItemTemplate = new CompareItem("miId");
                compareGridView.Columns.Add(temp1);

                compareGridView.AutoGenerateColumns = false;
                compareGridView.DataSource = FormatData(ExternalData(), 3);
                compareGridView.DataBind();
            }
            
        }

        /// <summary>
        /// Crea una lista interna; cada elemento es una fila, los que a su vez albergan los
        /// elementos de la lista original reuniendo tantos ítems como columas.
        /// </summary>
        private List<object> FormatData(List<Object> elementList, decimal columns)
        {
            //Cantidad de filas totale en base a las columnas a mostrar
            int rows = (int) Math.Ceiling(elementList.Count / columns);

            //Por cada objeto que representará a una fila, agrego tantos elementos de la lista
            //del usuario como columnas solicitó mostar
            for (int i = 0; i < rows; ++i)
            {
                InternalItem internalElement = new InternalItem();

                for (int e = 0; e < columns; ++e)
                {
                    int elementIndex = i * (int)columns + e;
                    if (elementIndex < elementList.Count) { 
                        object element = elementList[i*(int) columns + e];
                        internalElement.Add(element);
                    }
                }

                internalList.Add(internalElement);
            }

            return internalList;
        }

        /// <summary>
        /// Esto es lo que estaría reicibiendo...
        /// </summary>
        private List<object> ExternalData()
        {
            List<object> lst = new List<object>();
            for (int i = 0; i < 10; ++i)
            {
                lst.Add("Elemento: " + i);
            }

            return lst;
        }

        protected void compareGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                UCCompareItem compareItem = e.Row.FindControl("miId") as UCCompareItem;
                compareItem.Element = ((InternalItem)e.Row.DataItem).Prop1;
                //compareItem.Fill(((InternalItem)e.Row.DataItem).Prop1);
            }

        }
    }

    class InternalItem
    {
        private List<object> elements = new List<object>();

        public void Add(object element)
        {
            elements.Add(element);
            
        }

        public string Prop1
        {
            get { return elements[0].ToString(); }
        }

        public string Prop2
        {
            get { return elements.Count > 1? elements[1].ToString() : ""; }
        }

        public string Prop3
        {
            get { return elements.Count > 2 ? elements[2].ToString() : ""; }
        }
    }
}