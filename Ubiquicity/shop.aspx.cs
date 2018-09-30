using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;

namespace Ubiquicity
{
    public partial class shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MapManager mapManager = new MapManager();
                List<Map> maps = mapManager.Get();
                //shopRepeater.DataSource = maps;
                //shopRepeater.DataBind();
            }
        }
    }
}