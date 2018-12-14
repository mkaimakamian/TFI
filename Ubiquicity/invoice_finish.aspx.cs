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
    public partial class invoide_finish : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionHelper.ExecuteAutoStop();

            if (!IsPostBack)
            {
                LoadPoll();
            }
        }

        /// <summary>
        /// Carga la encuesta de satisfacción.
        /// </summary>
        public void LoadPoll()
        {
            try
            {
                ShopHelper.DropCart(Session);
                PollManager pollManager = new PollManager();
                Poll poll = pollManager.GetSatisfactionPoll();

                if (poll != null)
                {
                    pollRepeater.DataSource = poll.Questions;
                    pollRepeater.DataBind();
                } else
                {
                    // No es prolijo porque se mezcla la parte visual con los datos, pero sirve
                    divPoll.Visible = false;
                }
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Excepción", exception.Message);
            }

        }

        /// <summary>
        /// Llena el listado de opciones de la pregunta que se está cargando en el repeater.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PopulateOptions(object sender, RepeaterItemEventArgs e)
        {
            RadioButtonList optionList = e.Item.FindControl("radioOptionList") as RadioButtonList;
            if (e.Item.DataItem != null)
            {
                optionList.DataSource = ((PollQuestion)e.Item.DataItem).Options;
                optionList.DataBind();
                optionList.DataTextField = "Option";
                optionList.DataValueField = "Id";
            }
        }

        /// <summary>
        /// Se encarga de guardar las respuestas en el sistema.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SubmitAnswer(object sender, EventArgs e)
        {
            try
            {
                PollAnswerManager pollAnswerManager = new PollAnswerManager();
                List<PollAnswer> pollAnswers = new List<PollAnswer>();

                foreach (RepeaterItem item in pollRepeater.Items)
                {
                    PollAnswer pollAnswer = new PollAnswer();
                    pollAnswer.User = SessionHelper.GetUser();
                    pollAnswer.PollOption.Id = Convert.ToInt32(((RadioButtonList)item.FindControl("radioOptionList")).SelectedValue);
                    pollAnswer.PollQuestion.Id = Convert.ToInt32(((HiddenField)item.FindControl("lblQuestion")).Value);
                    //if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    pollAnswers.Add(pollAnswer);
                }

                bool success = pollAnswerManager.Save(pollAnswers);

                if (!success && pollAnswerManager.HasErrors)
                {
                    ((front)Master).Alert.Show("Error", pollAnswerManager.ErrorDescription);
                }
                else
                {
                    divPoll.Visible = false;
                    divSuccessMessage.Visible = true;
                }
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Excepción", exception.Message);
            }
        }

        protected void PerformDownload(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(SessionUtilHelper.GetIdFromSession(Session));
                 
                InvoiceManager invoiceManager = new InvoiceManager();
                string url = invoiceManager.DownloadInvoice(id);

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
    }
}