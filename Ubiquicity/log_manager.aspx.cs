﻿using System;
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

            UCcrudGrid.HideDeleteButton();
            UCcrudGrid.HideEditButton();
            UCcrudGrid.HideNewButton();
        }

        private void LoadGrid()
        {
            
            try
            {
                LogManager logManager = new LogManager();
                UCcrudGrid.LoadGrid(logManager.Get());

            }
            catch (Exception exception)
            {

            }

        }
    }
}