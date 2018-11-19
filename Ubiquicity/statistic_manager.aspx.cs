using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using BL;
using BE;
using Helper;

namespace Ubiquicity
{
    public partial class statistic_manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionHelper.ExecuteAutoStop();
            if (!SecurityHelper.HasPermission(SessionHelper.GetUser(), Request.RawUrl)) Response.Redirect("/index.aspx");

            if (!IsPostBack)
            {
                LoadPolls();
                LoadSatisfactionPolls();
                LoadSells();
            }
        }

        private void LoadPolls()
        {
            try
            {
                PollManager pollmanager = new PollManager();
                List<Poll> polls = pollmanager.GetPollsForReport(true);
                bListPoll.DataTextField = "Name";
                bListPoll.DataValueField = "Id";
                bListPoll.DataSource = polls;
                bListPoll.DataBind();
            }
            catch (Exception exception) {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

        private void LoadSatisfactionPolls()
        {
            try
            {
                PollManager pollmanager = new PollManager();
                List<Poll> polls = pollmanager.GetPollsForReport(false);
                bListSPoll.DataTextField = "Name";
                bListSPoll.DataValueField = "Id";
                bListSPoll.DataSource = polls;
                bListSPoll.DataBind();
            }
            catch (Exception exception) {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }

        }

        private void LoadSells()
        {
            try
            {
                bListSell.DataTextField = "Key";
                bListSell.DataValueField = "Value";
                bListSell.DataSource = GetQFSell();
                bListSell.DataBind();
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

        protected void ShowSPoll(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(bListSPoll.SelectedItem.Value);
            PollAnswerManager pollAnswerManager = new PollAnswerManager();
            Dictionary<string, ArrayList[]> dataChart = pollAnswerManager.GetReportForPollAnswers(id);
            ShowChart(dataChart);
        }

        protected void ShowPoll(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(bListPoll.SelectedItem.Value);
            PollAnswerManager pollAnswerManager = new PollAnswerManager();
            Dictionary<string, ArrayList[]> dataChart = pollAnswerManager.GetReportForPollAnswers(id);
            ShowChart(dataChart);
        }

        protected void ShowSell(object sender, EventArgs e)
        {
            QueryFilter queryFilter = new QueryFilter();
            queryFilter.Key = bListSell.SelectedItem.Text;
            queryFilter.Value = bListSell.SelectedItem.Value;
            InvoiceManager invoiceManager = new InvoiceManager();
            Dictionary<string, ArrayList[]> dataChart = invoiceManager.GetReportForSales(queryFilter);
            ShowChart(dataChart);

        }
        private void ShowChart(Dictionary<string, ArrayList[]> statistics)
        {
            if (statistics == null)
            {
                //mostrar que no hay nada
                //quizá mostrar el div "no hay nada para mostrar"
            }
            else
            {
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
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalChart", "window.onload = function() { $('#ucModalChart').modal('show'); }", true);
        }


        /// <summary>
        /// Devuelve el set de "tipo" de reportes de venta que puede generar.
        /// </summary>
        /// <returns></returns>
        private List<QueryFilter> GetQFSell()
        {
            List<QueryFilter> filters = new List<QueryFilter>();
            QueryFilter yearFilter = new QueryFilter();
            yearFilter.Key = "Anual";
            yearFilter.Value = "year";
            QueryFilter monthFilter = new QueryFilter();
            monthFilter.Key = "Mensual";
            monthFilter.Value = "month";
            QueryFilter dayFilter = new QueryFilter();
            dayFilter.Key = "Diario";
            dayFilter.Value = "day";

            filters.Add(yearFilter);
            filters.Add(monthFilter);
            filters.Add(dayFilter);

            return filters;
        }
    }
}