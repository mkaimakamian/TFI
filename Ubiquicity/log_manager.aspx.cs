using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;

namespace Ubiquicity
{
    public partial class logManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGrid();
            }
        }

        private void LoadGrid()
        {
            try
            {
                LogManager logManager = new LogManager();
                gvLogEntry.DataSource = logManager.Get();
                gvLogEntry.DataBind();

            } catch (Exception exception)
            {

            }
            
        }
    }
}