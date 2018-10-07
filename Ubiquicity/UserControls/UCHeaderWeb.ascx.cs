using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ubiquicity.UserControls
{
    public partial class UCHeaderWeb : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string Imgsource
        {
            set { imgSource.Src = value; }
            get { return imgSource.Src; }
        }

        public string Label
        {
            set { h2Label.InnerText = value; }
            get { return h2Label.InnerText; }
        }
    }
}