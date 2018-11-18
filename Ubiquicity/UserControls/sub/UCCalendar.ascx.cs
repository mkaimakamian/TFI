using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ubiquicity.UserControls
{
    public partial class UCCalendar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string Date
        {
            set { txtCalendar.Text = value; }
            get { return txtCalendar.Text; }

        }

        public AjaxControlToolkit.CalendarDefaultView DefaultView
        {
            get { return calendar.DefaultView; }
            set { calendar.DefaultView = value;

                if (value == AjaxControlToolkit.CalendarDefaultView.Months) calendar.Format = "yyyy-MM";
                if (value == AjaxControlToolkit.CalendarDefaultView.Days) calendar.Format = "yyyy-MM-dd";
            }
        }


    }
}