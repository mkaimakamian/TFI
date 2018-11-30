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
        private const string PERFORM_CLAIM = "PerformClaim";
        private const string PERFORM_RANKING = "PerformRanking";
        private const string PERFORM_SUPPORT = "PerformSupport";

        protected void Page_Load(object sender, EventArgs e)
        {
            SessionHelper.ExecuteAutoStop();
            if (!SecurityHelper.HasPermission(SessionHelper.GetUser(), Request.RawUrl)) Response.Redirect("/index.aspx");

            if (!IsPostBack)
            {
                LoadAccountDetail();
                LoadProductTracking();
            }

        }

        /// <summary>
        /// Carga el listado de movimientos: facturas y notas de crédito.
        /// </summary>
        private void LoadAccountDetail()
        {
            try
            {
                AccountDetailManager am = new AccountDetailManager();
                List<AccountDetail> accountsDetail = am.Get(SessionHelper.GetUser());

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

        /// <summary>
        /// Carga la información sobre la trazabilidad de los productos adquiridos.
        /// </summary>
        private void LoadProductTracking()
        {
            try
            {
                TrackingManager trackingManager = new TrackingManager();
                List<Tracking> accountsDetail = trackingManager.Get(SessionHelper.GetUser());

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
        protected void ResolveDownloadLink(object sender, RepeaterItemEventArgs e)
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

        /// <summary>
        /// Muestra la descripción adecuada según el estado de la compra.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ResolveActionLink(object sender, RepeaterItemEventArgs e)
        {
            LinkButton link = e.Item.FindControl("claimCNLink") as LinkButton;

            switch (((Tracking)e.Item.DataItem).Status)
            {
                case Tracking.StatusType.Pendiente:
                    link.Text = "Reclamar";
                    link.CommandName = PERFORM_CLAIM;
                    break;
                case Tracking.StatusType.Descargado:
                    link.Text = "Valorar";
                    link.CommandName = PERFORM_RANKING;
                    link.CommandArgument = ((Tracking)e.Item.DataItem).InvoiceItem.Id.ToString();
                    break;
                case Tracking.StatusType.Reclamado:
                    link.Visible = false;
                    break;
                case Tracking.StatusType.Valorado:
                    link.Text = "Valorado con " + ((Tracking)e.Item.DataItem).Ranking + " puntos";
                    link.Enabled = false;
                    break;
            }
        }

        /// <summary>
        /// Atiende la ejecución de las acciones generadas según el estado del tracking.
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void PerformTrackingAction(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == PERFORM_CLAIM)
                {
                    int invoiceItemId = Convert.ToInt32(e.CommandArgument);
                    CreditNoteManager creditNoteManager = new CreditNoteManager();
                    bool success = creditNoteManager.ClaimCreditNote(invoiceItemId);

                    if (!success && creditNoteManager.HasErrors)
                    {
                        ((front)Master).Alert.Show("Error", creditNoteManager.ErrorDescription);
                    }
                    else
                    {
                        LoadProductTracking();
                        ((front)Master).Alert.Show("Nota de crédito", "Se ha generado una nota de crédito, pendiente de aprobación");
                    }
                }
                else if (e.CommandName == PERFORM_RANKING)
                {
                    SessionUtilHelper.KeepInSession(e.CommandArgument.ToString(), Session);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", "window.onload = function() { $('#modalRanking').modal('show'); }", true);
                }
                 else if (e.CommandName == PERFORM_SUPPORT)
                {
                    SessionUtilHelper.KeepInSession(e.CommandArgument.ToString(), Session);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", "window.onload = function() { $('#modalInvoiceItemSupport').modal('show'); }", true);
                    UCModalInvoiceItemSupport.LoadCommentsSupport(Convert.ToInt32(e.CommandArgument.ToString()));
                }
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

        /// <summary>
        /// Ejecuta la valración
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PerformRanking(object sender, EventArgs e)
        {
            try
            {
                int invoiceItemId = Convert.ToInt32(SessionUtilHelper.GetIdFromSession(Session));
                TrackingManager trackingManager = new TrackingManager();

                //TODO - AGREGAR CONTROL DE ERROR
                Tracking tracking = trackingManager.Get(invoiceItemId);

                tracking.Ranking = UCFormRanking.Ranking;
                tracking.Status = Tracking.StatusType.Valorado;

                bool success = trackingManager.Edit(tracking);

                if (!success && trackingManager.HasErrors)
                {
                    ((front)Master).Alert.Show("Error", trackingManager.ErrorDescription);

                }
                else
                {
                    LoadProductTracking();
                }
                //}
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);

            }
        }
    }
}