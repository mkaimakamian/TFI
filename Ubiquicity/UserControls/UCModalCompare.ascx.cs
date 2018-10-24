using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;

namespace Ubiquicity.UserControls
{
    public partial class UCModalCompare : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public String title
        {
            set { ucModalNewsLabel.InnerText = value; }
        }


        /// <summary>
        /// Muestra en pantalla el mensaje; si los labels fueron asignados, se muestran los botones.
        /// </summary>
        /// <param name="title"></param>
        /// <param name="message"></param>
        /// <param name="button1Label"></param>
        /// <param name="button2Label"></param>
        public void Show(string title, List<Map> resources)
        {
            this.title = title;
            compareRepeater.DataSource = resources;
            compareRepeater.DataBind();
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalCompare", "window.onload = function() { $('#ucModalCompare').modal('show'); }", true);
            ScriptManager.RegisterStartupScript(upCompare, upCompare.GetType(), "openModalCompare", "$('#ucModalCompare').modal('show');", true);
            upCompare.Update();
        }
    }
}