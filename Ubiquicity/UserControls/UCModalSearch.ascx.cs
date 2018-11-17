using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;

namespace Ubiquicity.UserControls
{
    public partial class UCModalSearch : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Show(List<WebSearch> webSearchResult)
        {
            resultDiv.Visible = webSearchResult.Count > 0;
            noResultDiv.Visible = !resultDiv.Visible;

            searchRepeater.DataSource = webSearchResult;
            searchRepeater.DataBind();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalSearch", "window.onload = function() { $('#ucModalSearch').modal('show'); }", true);
        }
    }
}