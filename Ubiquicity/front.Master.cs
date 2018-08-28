using System;
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
            if (!IsPostBack) {
                bool logged = Session["SessionCreated"] != null;

                panelLogin.Visible = !logged;
                panelAlreadyLogged.Visible = logged;
                //falta el menu            
            }

        }
        
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {   
                if (IsValid(txtUser.Value, txtPassword.Value)) {
                    SessionManager sessionManager = new SessionManager();
                    User user = sessionManager.LogIn(txtUser.Value, txtPassword.Value);

                    if (sessionManager.HasErrors)
                    {
                        ShowAlert("Error", sessionManager.Errors[0].description);

                    } else
                    {
                        SessionHelper.StartSession(user);
                        Session["SessionCreated"] = user;
                        Response.Redirect(Request.RawUrl);
                    }
                }
            } catch (Exception exception)
            {
                ShowAlert("Exception", exception.Message);
            }
        }

        private bool IsValid(string username, string password)
        {
            //TODO - Validar los inputs
            return true;

        }

        private void ShowAlert(string title, string message)
        {
            customAlertBox.title = title;
            customAlertBox.message = message;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", "window.onload = function() { $('#ucModalMessageBox').modal('show'); }", true);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("SessionCreated");
            Response.Redirect(Request.RawUrl);
        }

    }
}