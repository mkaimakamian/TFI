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
            if (PerformSecondAction != null) PerformSecondAction(this, e);
        }

        public void Show(string title, string message, String button1Label = "", String button2Label = "")
        {
            //customAlertBox.title = title;
            //customAlertBox.message = message;
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", "window.onload = function() { $('#ucModalMessageBox').modal('show'); }", true);

            this.title = title;
            this.message = message;
            this.MainActionLabel = button1Label;
            this.SecondActionLabel = button2Label;

            this.MainActionVisible = !String.IsNullOrEmpty(button1Label);
            this.SecondActionVisible = !String.IsNullOrEmpty(button2Label);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", "window.onload = function() { $('#ucModalMessageBox').modal('show'); }", true);
        }

    }
}