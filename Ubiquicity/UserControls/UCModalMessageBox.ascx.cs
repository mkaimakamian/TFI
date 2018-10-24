using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ubiquicity.Classes;

namespace Ubiquicity.UserControls
{
    public partial class UCModalMessageBox : System.Web.UI.UserControl
    {

        public delegate void UCMessageBoxEvent(object sender, UbiquicityEventArg arg);

        public event UCMessageBoxEvent PerformMainAction;
        public event UCMessageBoxEvent PerformSecondAction;

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
            if (PerformMainAction != null) PerformMainAction(this, new UbiquicityEventArg(e));
            ScriptManager.RegisterStartupScript(upModalMessageBox, upModalMessageBox.GetType(), "closeModal", "$('#ucModalMessageBox').modal('hide');", true);
            upModalMessageBox.Update();
        }

        protected void btnSecondAction_Click(object sender, EventArgs e)
        {
            //Se propaga el evento para el consumo por parte del parent
            if (PerformSecondAction != null) PerformSecondAction(this, new UbiquicityEventArg(e));
            ScriptManager.RegisterStartupScript(upModalMessageBox, upModalMessageBox.GetType(), "closeModal", "$('#ucModalMessageBox').modal('hide');", true);
            upModalMessageBox.Update();
        }


        /// <summary>
        /// Muestra un mensaje de error invocando el componente de modo sincrónico, sin usar Update Panel.
        /// </summary>
        /// <param name="title"></param>
        /// <param name="message"></param>
        /// <param name="button1Label"></param>
        /// <param name="button2Label"></param>
        public void Show(string title, string message, String button1Label = "", String button2Label = "")
        {
            ShowMessage(title, message, button1Label, button2Label);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", "window.onload = function() { $('#ucModalMessageBox').modal('show'); }", true);
        }

        /// <summary>
        /// Muestra un mensaje de error invocando el componente de modo asincrónico, usando Update Panel.
        /// </summary>
        /// <param name="title"></param>
        /// <param name="message"></param>
        /// <param name="button1Label"></param>
        /// <param name="button2Label"></param>
        public void ShowUP(string title, string message, String button1Label = "", String button2Label = "")
        {
            ShowMessage(title, message, button1Label, button2Label);
            ScriptManager.RegisterStartupScript(upModalMessageBox, upModalMessageBox.GetType(), "openModal", "$('#ucModalMessageBox').modal('show');", true);
            upModalMessageBox.Update();
        }

        /// <summary>
        /// Muestra en pantalla el mensaje; si los labels fueron asignados, se muestran los botones.
        /// </summary>
        /// <param name="title"></param>
        /// <param name="message"></param>
        /// <param name="button1Label"></param>
        /// <param name="button2Label"></param>
        private void ShowMessage(string title, string message, String button1Label = "", String button2Label = "")
        {
            this.title = title;
            this.message = message;
            this.MainActionLabel = button1Label;
            this.SecondActionLabel = button2Label;

            this.MainActionVisible = !String.IsNullOrEmpty(button1Label);
            this.SecondActionVisible = !String.IsNullOrEmpty(button2Label);
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", "window.onload = function() { $('#ucModalMessageBox').modal('show'); }", true);
            //ScriptManager.RegisterStartupScript(upModalMessageBox, upModalMessageBox.GetType(), "openModal", "$('#ucModalMessageBox').modal('show');", true);
            //upModalMessageBox.Update();
        }

    }
}