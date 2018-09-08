using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;
using Helper;
using System.Net;
using System.IO;
using System.Configuration;
using Newtonsoft.Json.Linq;

namespace Ubiquicity
{
    public partial class front : System.Web.UI.MasterPage
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                    // Todo - ver si en vez de usuario es Session
                    User user = (User) Session["SessionCreated"];
                    ManageLoginPanel(user);
                    LoadMenu(user);
                  //  LoadLanguages();
            }

        }

        /// <summary>
        /// Atiende el evento de logueo.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                //Todo - debería evaluar de algún modo si me están solicitando el reenvío
                //if (String.IsNullOrEmpty(txtPassword.Value))
                //{
                //    UserManager userManager = new UserManager();
                //    userManager.SendRecovery(txtUser.Value);
                //}
               
                if (IsValid(txtUser.Value, txtPassword.Value))
                {
                    // El password se encrypta antes de enviarse al back
                    txtPassword.Value = String.IsNullOrEmpty(txtPassword.Value) ? "" : SecurityHelper.Encrypt(txtPassword.Value);

                    SessionManager sessionManager = new SessionManager();
                    User user = sessionManager.LogIn(txtUser.Value, txtPassword.Value);

                    if (user == null && sessionManager.HasErrors)
                    {
                        Alert.Show("Error", sessionManager.ErrorDescription);
                    }
                    else
                    {
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

        /// <summary>
        /// Atiende el evento para el registro del usuario.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                UserManager userManager = new UserManager();

                if (!chekCondition.Checked)
                {
                    Alert.Show("Error", "Debes leer y aceptar los términos para poder registrarte");
                    return;
                }
                
                if (!IsValidCapcha())
                {
                    Alert.Show("Error", "Por el momento no estamos aceptando robots; mil disculpas.");
                    return;
                }

                User user = new User();
                user.Name = FormRegisterWebUser.FirstName;
                user.Lastname = FormRegisterWebUser.LastName;
                user.Username = FormRegisterWebUser.UserName;
                user.Mail = FormRegisterWebUser.Mail;

                if (!String.IsNullOrEmpty(FormRegisterWebUser.Password))
                {
                    user.Password = SecurityHelper.Encrypt(FormRegisterWebUser.Password);
                }

                //TODO - tomar el idioma que está en curso!
                user.Language.Id = 1; // int.Parse(FormRegisterWebUser.Language);
                bool success = userManager.SaveForWeb(user);

                if (!success && userManager.HasErrors)
                {
                    Alert.Show("Error", userManager.ErrorDescription);
                }

            } catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }

        }

        /// <summary>
        /// Según el valor pasado, muestra los paneles que permiten el acceso al botón de login + registro, o logout.
        /// </summary>
        /// <param name="logged"></param>
        private void ManageLoginPanel(User user) {

            if (user != null)
            {
                panelLogin.Visible = false;
                panelAlreadyLogged.Visible = true;
                btnLogout.Text = user.Username + " (salir)";
            } else
            {
                panelLogin.Visible = true;
                panelAlreadyLogged.Visible = false;
            }
        }

        // TODO - revisar la performance (la idea es evitar duplicados)
        //Eventualmente crear un método que recupere los permisos directamente de la base, sin duplicados.
        private void LoadMenu(User user) {
            if (user != null) {
                mnuSection.Items.Clear();
                Dictionary<int, MenuItem> access = new Dictionary<int, MenuItem>();

            foreach (Role role in user.Roles)
                {
                    foreach (Permission permission in role.Permissions)
                    {
                        MenuItem permissionItem = new MenuItem();
                        permissionItem.Text = permission.Description;
                        permissionItem.NavigateUrl = permission.UrlAccess;
                        if (!access.ContainsKey(permission.Id)) access.Add(permission.Id, permissionItem);
                    }
                }

            foreach (int key in access.Keys)
                {
                    mnuSection.Items.Add(access[key]);
                }
            }


        }

        private bool IsValidCapcha()
        {
            bool result = false;
            string captchaResponse = Request["g-recaptcha-response"];
            string secretKey = ConfigurationManager.AppSettings["reCAPTCHA"];
            string apiUrl = "https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}";
            string requestUri = String.Format(apiUrl, secretKey, captchaResponse);

            HttpWebRequest request = (HttpWebRequest) WebRequest.Create(requestUri);
            WebResponse response = request.GetResponse();
            StreamReader stream = new StreamReader(response.GetResponseStream());

            JObject jResponse = JObject.Parse(stream.ReadToEnd());
            result = jResponse.Value<Boolean>("success");

            return result;
        }

        private bool IsValid(string username, string password)
        {
            //TODO - Validar los inputs... quizá con java script mejor
            return true;

        }
        
        /// <summary>
        /// Finaliza la sesión del usuario y lo devuelve a la misma página en la que estaba.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("SessionCreated");
            Response.Redirect(Request.RawUrl);
        }

        // Obtiene el componente para mostrar los alertas y lo expone como variable de la master page 
        // para un más fácil acceso desde los hijos
        public UserControls.UCModalMessageBox Alert
        {
            get { return customAlertBox; }
        }
    }
}