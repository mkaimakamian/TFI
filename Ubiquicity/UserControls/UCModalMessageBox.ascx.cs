using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ubiquicity.UserControls
{
    public partial class UCModalMessageBox : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public String title
        {
            set { ucModalMessageBoxLabel.InnerText = value; }
        }

        public String message
        {
            set { ucModalMessageBoxMessage.InnerText = value; }
        }
    }
}