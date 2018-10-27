using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using BE;
using Helper;

namespace Ubiquicity
{
    public partial class user_profile : BaseManager
    {
        protected override void PageLoad(object sender, EventArgs e)
        {
            GridView = UCcrudGrid;
            GridView.HideDeleteButton();
            GridView.HideEditButton();
            GridView.HideNewButton();
            GridView.ShowGenericActionButton("Descargar");
            

            Manager = new AccountDetailManager();
        }

        protected override void LoadGridView()
        {
            try
            {
                List<AccountDetail> accountsDetail = ((AccountDetailManager)Manager).Get(SessionHelper.GetUserFromSession());

                if (Manager.HasErrors)
                {
                    Alert.Show("Error", Manager.ErrorDescription);
                }
                else
                {
                    GridView.ColumnsToShow = ColumnsToShowAndTranslate();
                    GridView.LoadGrid(accountsDetail);
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
        protected override Dictionary<string, string> ColumnsToShowAndTranslate()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("IssuedId", "Comprobante");
            columns.Add("Description", "Descripción");
            columns.Add("Amount", "Monto");
            columns.Add("Date", "Emisión");
            columns.Add("Status", "Estado");
            return columns;
        }
    }
}