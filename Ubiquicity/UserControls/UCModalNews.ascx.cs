using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ubiquicity.UserControls
{
    public partial class UCModalNews : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public String title
        {
            set { ucModalNewsLabel.InnerText = value; }
        }

        public String message
        {
            set { ucModalNewsMessage.InnerText = value; }
        }

               /// <summary>
        /// Muestra en pantalla el mensaje; si los labels fueron asignados, se muestran los botones.
        /// </summary>
        /// <param name="title"></param>
        /// <param name="message"></param>
        /// <param name="button1Label"></param>
        /// <param name="button2Label"></param>
        public void Show(string title, string message, string b64Image)
        {
            //UCImage.Src = b64Image;
            this.title = title;
            this.message = message;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalNews", "window.onload = function() { $('#ucModalNews').modal('show'); }", true);
        }
    }
}