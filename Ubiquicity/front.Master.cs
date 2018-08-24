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
            if(!IsPostBack) { 
                if (Session["SessionCreated"] != null)
                {

                    //1. Ocultar el form de logueo y mostrar nombre
                    panelLogin.Visible = false;

                    //2. Mostrar menú

                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try {   
                if (IsValid(txtUser.Value, txtPassword.Value)) {
                    SessionManager sessionManager = new SessionManager();
                    User user = sessionManager.LogIn(txtUser.Value, txtPassword.Value);

                    if (sessionManager.HasErrors)
                    {
                        //mostrar error en pantalla
                    } else
                    {
                        SessionHelper.StartSession(user);
                        Session["SessionCreated"] = user;

                        Response.Redirect(Request.RawUrl);
                    }
                }
            } catch (Exception exception)
            {
                //mostrar mensaje de error
            }
        }

        private bool IsValid(string username, string password)
        {
            //TODO - Validar los inputs
            return true;

        }
    }
}