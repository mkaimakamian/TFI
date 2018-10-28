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

            //BaseManager trabaja solidario con una UCGrid... pero en este caso la página presemta
            //dos grillas, de modo que esta segunda, de visualización, se manipula aparte
            UCcrudGridTracking.HideDeleteButton();
            UCcrudGridTracking.HideEditButton();
            UCcrudGridTracking.HideNewButton();

            LoadTrackingInformation();
        }

        /// <summary>
        /// Sobreescribe el método base porque éste trabaja con reflection buscando un método GET sin
        /// parámetros, y en este caso se necesita suministrarle el id del susuario para refinar la búsqueda.
        /// </summary>
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
            columns.Add("IssuedId", "#");
            columns.Add("Description", "Descripción");
            columns.Add("Amount", "Monto");
            columns.Add("Date", "Emisión");
            columns.Add("Status", "Estado");
            return columns;
        }

        /// <summary>
        /// Carga la grilla con la información de trackeo.
        /// </summary>
        private void LoadTrackingInformation()
        {
            try
            {
                TrackingManager trackingManager = new TrackingManager();
                List<Tracking> accountsDetail = trackingManager.Get(SessionHelper.GetUserFromSession());

                if (trackingManager.HasErrors)
                {
                    Alert.Show("Error", Manager.ErrorDescription);
                }
                else
                {
                    UCcrudGridTracking.ColumnsToShow = ColumnsToShowAndTranslateForTracking();
                    UCcrudGridTracking.LoadGrid(accountsDetail);
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
        private Dictionary<string, string> ColumnsToShowAndTranslateForTracking()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("Resource", "Artículo");
            columns.Add("Status", "Estado");
            columns.Add("Date", "Últ. Actualización");
            return columns;
        }
    }
}