using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using BE;
using BL;
using Helper;
namespace Ubiquicity.UserControls
{
    public partial class UCPanelPoll : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                PollManager pollManager = new PollManager();
                Poll poll = pollManager.GetInstantPoll();
                SessionUtilHelper.KeepInSession(poll.Id.ToString(), Session);

                if (poll != null && poll.Questions.Count > 0)
                {
                    pollRepeater.DataSource = poll.Questions;
                    pollRepeater.DataBind();
                }
                else
                {
                    // No es prolijo porque se mezcla la parte visual con los datos, pero sirve
                    divPoll.Visible = false;
                }
            }
            catch (Exception exception)
            {
                //TODO - aplicar contorl e errores
                //((front)Master).Alert.Show("Excepción", exception.Message);
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
                    //TODO - Aplicar control de errores
                    //((front)Master).Alert.Show("Error", pollAnswerManager.ErrorDescription);
                }
                else
                {
                    //Esconde el panel de las preguntas y muestra el resultado en el chart
                    divPoll.Visible = false;
                    divPollStatistics.Visible = true;
                    int pollId = Convert.ToInt32(SessionUtilHelper.GetIdFromSession(Session));
                    Dictionary<string, ArrayList[]> statistics = pollAnswerManager.GetPollAnswersForChart(pollId);
                    
                    int i = 0;

                    
                    foreach (KeyValuePair<string, ArrayList[]> serie in statistics)
                    {

                        Chart1.Series.Add(new Series(serie.Key));
                        Chart1.Legends.Add(serie.Key);
                        Array yValues = serie.Value[1].ToArray(typeof(int));
                        Array xLabels = (string[])serie.Value[0].ToArray(typeof(string));
                        Chart1.Series[i].Points.DataBindXY(xLabels, yValues);
                        Chart1.Series[i].ChartType = SeriesChartType.Column;
                        ++i;
                    }
                }
            }
            catch (Exception exception)
            {
                //Aplicar control de errores
               // ((front)Master).Alert.Show("Excepción", exception.Message);
            }
        }
    }
}