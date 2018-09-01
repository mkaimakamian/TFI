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
                    // Todo - ver si en vez de usuario es Session
                    User user = (User) Session["SessionCreated"];
                    ManageLoginPanel(Session["SessionCreated"] != null);
                    LoadMenu(user);
                    LoadLanguages();
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsValid(txtUser.Value, txtPassword.Value))
                {
                    SessionManager sessionManager = new SessionManager();
                    User user = sessionManager.LogIn(txtUser.Value, txtPassword.Value);

                    if (sessionManager.HasErrors)
                    {
                        Alert.Show("Error", sessionManager.Errors[0].description);

                    }
                    else
                    {
                        SessionHelper.StartSession(user);
                        Session["SessionCreated"] = user;
                        Response.Redirect(Request.RawUrl);
                    }
                }
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }
      
        private void ManageLoginPanel(bool logged) {
            panelLogin.Visible = !logged;
            panelAlreadyLogged.Visible = logged;
        }

        private void LoadMenu(User user) {

        }

        private void LoadLanguages()
        {
            LanguageManager languageManager = new LanguageManager();
            dropLanguage.DataTextField = "Name";
            dropLanguage.DataValueField = "Id";
            dropLanguage.DataSource = languageManager.Get();
            dropLanguage.DataBind();
        }

        private bool IsValid(string username, string password)
        {
            //TODO - Validar los inputs
            return true;

        }
        
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("SessionCreated");
            Response.Redirect(Request.RawUrl);
        }

        // Obtiene el componente para mostrar los alertas y lo expone como variable de la Master para un más fácil 
        // acceso desde los hijos
        public UserControls.UCModalMessageBox Alert
        {
            get { return customAlertBox; }
        }
    }
}