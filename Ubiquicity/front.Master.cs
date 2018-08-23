﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;
using Helper;

namespace Ubiquicity
{
    public partial class front : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try {   
                if (IsValid(txtUser.Value, txtPassword.Value)) {
                    SessionManager sessionManager = new SessionManager();
                    User user = sessionManager.LogIn(txtUser.Value, txtPassword.Value);
                    SessionHelper.StartSession(user);
                    Session.Add(user.Username, user);
                    //Response.Redirect();
                    
                }
            } catch (Exception exception)
            {
                //mostrar mensaje de error
            }
        }

        private bool IsValid(string username, string password)
        {
            return true;
        }
    }
}