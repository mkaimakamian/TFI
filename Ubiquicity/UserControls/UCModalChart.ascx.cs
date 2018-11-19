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
    public partial class UCModalChart : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //public void ShowChart(Dictionary<string, ArrayList[]> statistics)
        //{
        //    if (statistics == null)
        //    {
        //        //mostrar que no hay nada
        //    }
        //    else
        //    {
        //        int i = 0;
        //        foreach (KeyValuePair<string, ArrayList[]> serie in statistics)
        //        {
        //            Chart1.Series.Add(new Series(serie.Key));
        //            Chart1.Legends.Add(serie.Key);
        //            Array yValues = serie.Value[1].ToArray(typeof(int));
        //            Array xLabels = (string[])serie.Value[0].ToArray(typeof(string));
        //            Chart1.Series[i].Points.DataBindXY(xLabels, yValues);
        //            Chart1.Series[i].ChartType = SeriesChartType.Column;
        //            ++i;
        //        }
        //    }
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalChart", "window.onload = function() { $('#ucModalChart').modal('show'); }", true);
        //}
    }
}