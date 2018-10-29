using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using BE;
using Helper;
using Ubiquicity.Classes;

namespace Ubiquicity
{
    public partial class user_profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAccountDetail();
                LoadProductTracking();
            }

        }

        private void LoadAccountDetail()
        {
            try
            {
                AccountDetailManager am = new AccountDetailManager();
                List<AccountDetail> accountsDetail = am.Get(SessionHelper.GetUserFromSession());

                if (am.HasErrors)
                {
                    ((front)Master).Alert.Show("Error", am.ErrorDescription);
                }
                else
                {
                    invoiceRepeater.DataSource = accountsDetail;
                    invoiceRepeater.DataBind();
                }
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

        private void LoadProductTracking()
        {
            try
            {
                TrackingManager trackingManager = new TrackingManager();
                List<Tracking> accountsDetail = trackingManager.Get(SessionHelper.GetUserFromSession());

                if (trackingManager.HasErrors)
                {
                    ((front)Master).Alert.Show("Error", trackingManager.ErrorDescription);

                }
                else
                {
                    productRepeater.DataSource = accountsDetail;
                    productRepeater.DataBind();
                }
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);

            }
        }


        /// <summary>
        /// Se encarga de habilitar o esconder el link para la descarga de la factura.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void invoiceRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            LinkButton link = e.Item.FindControl("downloadLink") as LinkButton;
            if (((AccountDetail)e.Item.DataItem).Type == "NC")
            {
                link.Visible = false;
            }
        }

        /// <summary>
        /// Ejecuta la creación y descarga de la factura.
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void PerformDownload(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                InvoiceManager invoiceManager = new InvoiceManager();
                string url = invoiceManager.DownloadInvoice(Convert.ToInt32(e.CommandArgument));

                if (invoiceManager.HasErrors)
                {
                    ((front)Master).Alert.Show("Error", invoiceManager.ErrorDescription);
                }
                else
                {
                    HttpResponse res = HttpContext.Current.Response;
                    res.Clear();
                    res.AppendHeader("content-disposition", "attachment; filename=PaymentReceipt.pdf");
                    res.ContentType = "application/octet-stream";
                    res.WriteFile(url);
                    res.Flush();
                    res.End();
                }

            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }



        /*
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


        protected override void PerformGenericAction(object sender, UbiquicityEventArg e)
        {
            Session["Ubiquicity_itemId"] = e.TheObject.ToString();
            try
            {
                InvoiceManager invoiceManager = new InvoiceManager();
                invoiceManager.DownloadInvoice();

                if (invoiceManager.HasErrors)
                {
                    Alert.ShowUP("Error", invoiceManager.ErrorDescription);
                } else
                {
                    HttpResponse res = HttpContext.Current.Response;
                    res.Clear();
                    res.AppendHeader("content-disposition", "attachment; filename=PaymentReceipt.pdf");
                    res.ContentType = "application/octet-stream";
                    res.WriteFile(@"C:\\tmp\\testPDF.pdf");
                    res.Flush();
                    res.End();
                }

            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }*/
    }
}