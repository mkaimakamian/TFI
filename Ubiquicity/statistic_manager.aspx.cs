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
                //LoadPolls();
                //LoadSatisfactionPolls();
                //LoadSells();
            }
        }

        private void LoadPolls()
        {
            try
            {
                PollManager pollmanager = new PollManager();
                List<Poll> polls = pollmanager.GetPollsForReport(true);
                lstReports.DataTextField = "Name";
                lstReports.DataValueField = "Id";
                lstReports.DataSource = polls;
                lstReports.DataBind();
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

        private void LoadSatisfactionPolls()
        {
            try
            {
                PollManager pollmanager = new PollManager();
                List<Poll> polls = pollmanager.GetPollsForReport(false);
                lstReports.DataTextField = "Name";
                lstReports.DataValueField = "Id";
                lstReports.DataSource = polls;
                lstReports.DataBind();
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }

        }

        private void LoadSales()
        {
            try
            {
                lstReports.DataTextField = "Key";
                lstReports.DataValueField = "Value";
                lstReports.DataSource = GetDateQFilter();
                lstReports.DataBind();
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

        private void LoadSupport ()
        {
            try
            {
                lstReports.DataTextField = "Key";
                lstReports.DataValueField = "Value";

                QueryFilter rateFilter = new QueryFilter();
                rateFilter.Key = "Cerrados / Totales";
                rateFilter.Value = "monthRate";

                List<QueryFilter> filters = GetDateQFilter();
                filters.Add(rateFilter);

                lstReports.DataSource = filters;
                lstReports.DataBind();
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

        /// <summary>
        /// Muestra el reporte según el tipo elegido.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ShowReport(object sender, EventArgs e)
        {
            try {
if (dropReportType.SelectedIndex == -1 || lstReports.SelectedIndex == -1) return;
            
            int type = dropReportType.SelectedIndex;
            PollAnswerManager pollAnswerManager = new PollAnswerManager();
            Dictionary<string, ArrayList[]> dataChart = null;

            switch (type)
            {
                case 1: //satisfacción
                    int id = Convert.ToInt32(lstReports.SelectedItem.Value);
                    dataChart = pollAnswerManager.GetReportForPollAnswers(id);
                    break;
                case 2: //general
                    int id2 = Convert.ToInt32(lstReports.SelectedItem.Value);
                    dataChart = pollAnswerManager.GetReportForPollAnswers(id2);
                    break;
                case 3: //ventas
                    QueryFilter salesType = new QueryFilter();
                    salesType.Key = lstReports.SelectedItem.Text;
                    salesType.Value = lstReports.SelectedItem.Value;

                    QueryFilter monthFilter = new QueryFilter();
                    monthFilter.Value = dropMonth.SelectedValue;

                    QueryFilter yearFilter = new QueryFilter();
                    yearFilter.Value = dropYear.SelectedValue;

                    Dictionary<String, QueryFilter> filters = new Dictionary<String, QueryFilter>();
                    filters.Add("Type", salesType);
                    filters.Add("Month", monthFilter);
                    filters.Add("Year", yearFilter);

                    InvoiceManager invoiceManager = new InvoiceManager();
                    dataChart = invoiceManager.GetReportForSales(filters);
                    break;
                case 4: //ventas
                    QueryFilter supportType = new QueryFilter();
                    supportType.Key = lstReports.SelectedItem.Text;
                    supportType.Value = lstReports.SelectedItem.Value;

                    QueryFilter smonthFilter = new QueryFilter();
                    smonthFilter.Value = dropMonth.SelectedValue;

                    QueryFilter syearFilter = new QueryFilter();
                    syearFilter.Value = dropYear.SelectedValue;

                    Dictionary<String, QueryFilter> sfilters = new Dictionary<String, QueryFilter>();
                    sfilters.Add("Type", supportType);
                    sfilters.Add("Month", smonthFilter);
                    sfilters.Add("Year", syearFilter);

                    ItemCommentSupportManager commentManager = new ItemCommentSupportManager();
                    dataChart = commentManager.GetReportForSupport(sfilters);
                    break;
                default:
                    return;
            }

            ShowChart(dataChart);
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }
    
        private void ShowChart(Dictionary<string, ArrayList[]> statistics)
        {
            if (statistics == null)
            {
                divNoChart.Visible = true;
                divChart.Visible = false;
            }
            else
            {
                divNoChart.Visible = false;
                divChart.Visible = true;
                int i = 0;
                foreach (KeyValuePair<string, ArrayList[]> serie in statistics)
                {
                    Series series = new Series(serie.Key);
                    //series.LabelFormat = "{0:c}";
                    Chart1.Series.Add(series);
                    Chart1.Legends.Add(serie.Key);
                    Array yValues = serie.Value[1].ToArray(typeof(double));
                    Array xLabels = (string[])serie.Value[0].ToArray(typeof(string));
                    Chart1.Series[i].Points.DataBindXY(xLabels, yValues);
                    Chart1.Series[i].ChartType = SeriesChartType.Column;
                    ++i;
                }
            }
        }


        /// <summary>
        /// Devuelve el set de "tipo" de reportes de venta que puede generar.
        /// </summary>
        /// <returns></returns>
        private List<QueryFilter> GetDateQFilter()
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

        /// <summary>
        /// Cambia el contenido del listado de reportes según el tipo.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Listreports(object sender, EventArgs e)
        {
            int type = ((DropDownList)sender).SelectedIndex;
            divNoChart.Visible = true;
            divChart.Visible = false;

            switch (type)
            {
                case 1:
                    LoadSatisfactionPolls();
                    divDates.Visible = false;
                    break;
                case 2:
                    LoadPolls();
                    divDates.Visible = false;
                    break;
                case 3:
                    LoadSales();
                    divDates.Visible = true;
                    break;
                case 4:
                    LoadSupport();
                    divDates.Visible = true;
                    break;
                default:
                    lstReports.Items.Clear();
                    break;
            }
        }

        /// <summary>
        /// Atiende la peticiónd e cmabio de índice de la lista de reportes; se emplea
        /// para ocultar filtros o mostrarlos según el tipo de reporte.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SelectReport(object sender, EventArgs e)
        {
            string value = ((ListBox)sender).SelectedValue;

            if (value == "year")
            {
                divDates.Visible = false;
            } else if (value == "month" || value == "monthRate")
            {
                divMonth.Visible = false;
                divDates.Visible = true;

            }
            else if (value == "day")
            {
                divMonth.Visible = true;
                divDates.Visible = true;
            }

            divNoChart.Visible = true;
            divChart.Visible = false;
        }
    }
}