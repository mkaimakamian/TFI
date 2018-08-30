﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;

namespace Ubiquicity.UserControls
{
    public partial class UCFormLanguage : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Cleanform()
        {
            languageNameInput.Value = "";
        }

        public void FillForm(List<Translation> translations)
        {
            FillForm(null, translations);
        }

        public void FillForm(Language language, List<Translation> translations)
        {
            languageNameInput.Value = language.Name;
            gvTranslation.DataSource = translations;
            gvTranslation.DataBind();
        }

        protected void RowCreated(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            e.Row.Cells[3].Visible = false;
            //e.Row.Cells[0].Text = e.Row.Cells[4].Text;
        }


        protected void gvTranslation_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            //int id = Convert.ToInt32(e.CommandArgument);
            //Session["Ubiquicity_itemId"] = e.CommandArgument;
            //if (e.CommandName == "EditItem")
            //{
            //    if (EditActionClick != null) EditActionClick(this, e);
            //}
            //else if (e.CommandName == "DeleteItem")
            //{
            //    if (DeleteActionClick != null) DeleteActionClick(this, e);
            //}

        }
    }
}