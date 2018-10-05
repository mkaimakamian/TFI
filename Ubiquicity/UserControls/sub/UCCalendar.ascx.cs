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
            get { return txtCalendar.Text; }

        }

        //public string CalendarImage
        //{
        //    set { btnCalendar.ImageUrl = value; }
        //}
    }
}