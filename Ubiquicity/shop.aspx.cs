﻿using System;
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
                shopRepeater.DataSource = maps;
                shopRepeater.DataBind();
            }
        }

        /// <summary>
        /// Toma los valores que están almacenados en el input selectedItemsInput del tipo hidden
        /// y recupera todos los elementos cuyos ids coinciden.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PerformCompare(object sender, EventArgs e)
        {
            try
            {
                string[] itemsId = selectedItemsInput.Value.ToString().Split(',');
                MapManager mapManager = new MapManager();
                List<Map> maps = mapManager.GetToCompare(itemsId);

                if ((maps == null || maps.Count == 0) && mapManager.HasErrors )
                {
                    ((front)Master).Alert.Show("Error", mapManager.ErrorDescription);
                } else
                {
                    ModalCompare.Show("Comparador", maps);
                }
            } catch (Exception exception)
            {
                ((front)Master).Alert.Show("Excepción", exception.Message);
            }
        }

    }
}