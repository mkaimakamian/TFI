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

        public event EventHandler PerformMainAction;
        public event EventHandler PerformSecondAction;

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

        public String MainActionLabel
        {
            set { btnMainAction.Text = value; }
        }

        public bool MainActionVisible
        {
            set { btnMainAction.Visible = value; }
        }

        public String SecondActionLabel
        {
            set { btnSecondAction.Text = value; }
        }

        public bool SecondActionVisible
        {
            set { btnSecondAction.Visible = value; }
        }

        protected void btnMainAction_Click(object sender, EventArgs e)
        {
            //Se propaga el evento para el consumo por parte del parent
            if (PerformMainAction != null) PerformMainAction(this, e);
        }

        protected void btnSecondAction_Click(object sender, EventArgs e)
        {
            //Se propaga el evento para el consumo por parte del parent
            if (PerformMainAction != null) PerformMainAction(this, e);
        }
        
    }
}