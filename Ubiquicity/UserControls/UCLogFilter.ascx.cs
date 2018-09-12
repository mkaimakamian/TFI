﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;

namespace Ubiquicity.UserControls
{
    public partial class UCLogFilter : System.Web.UI.UserControl
    {
        private UserControls.UCcrudGrid gridView = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_PerformSearch(object sender, EventArgs e)
        {
            List<QueryFilter> filters = new List<QueryFilter>();

            

            if (!String.IsNullOrEmpty(inputLogLevel.Value))
            {
                QueryFilter qf = new QueryFilter();
                qf.Key = "@logLevel";
                qf.Value = inputLogLevel.Value;
                filters.Add(qf);
            }

            if (!String.IsNullOrEmpty(inputUser.Value))
            {
                QueryFilter qf = new QueryFilter();
                qf.Key = "@userName";
                qf.Value = inputUser.Value;
                filters.Add(qf);
            }

            if (!String.IsNullOrEmpty(inputAction.Value))
            {
                QueryFilter qf = new QueryFilter();
                qf.Key = "@action";
                qf.Value = inputAction.Value;
                filters.Add(qf);
            }

            if (!String.IsNullOrEmpty(inputEntity.Value))
            {
                QueryFilter qf = new QueryFilter();
                qf.Key = "@entity";
                qf.Value = inputEntity.Value;
                filters.Add(qf);
            }

            if (!String.IsNullOrEmpty(inputDescription.Value))
            {
                QueryFilter qf = new QueryFilter();
                qf.Key = "@description";
                qf.Value = inputDescription.Value;
                filters.Add(qf);
            }

            //desde
            //hasta

            LogManager logManager = new LogManager();
            List<LogEntry> logs = logManager.Get(filters);
            Gridview.ColumnsToShow = ColumnsToShowAndTranslate();
            Gridview.LoadGrid(logs);
        }

        // Referencia a la grilla afectada
        public UserControls.UCcrudGrid Gridview
        {
            set { gridView = value; }
            get { return gridView; }
        }

        /// <summary>
        /// Se establece la traducción de las columnas que quieren ser mostradas.
        /// </summary>
        /// <returns></returns>
        private Dictionary<string, string> ColumnsToShowAndTranslate()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("Action", "Acción");
            columns.Add("Entity", "Entidad");
            columns.Add("Username", "Usuario");
            columns.Add("Loglevel", "Criticidad");
            columns.Add("Description", "Descripción");
            columns.Add("Created", "Fecha");

            return columns;
        }
    }
}