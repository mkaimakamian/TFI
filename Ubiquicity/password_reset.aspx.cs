using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using Helper;
using BE;

namespace Ubiquicity
{
    public partial class password_reset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPassword_Click(object sender, EventArgs e)
        {
            if (passwordInput.Value == passwordVerificationInput.Value && !String.IsNullOrEmpty(passwordInput.Value))
            {
                User user = (User)Session["SessionCreated"];
                UserManager userManager = new UserManager();
                string password = SecurityHelper.Encrypt(passwordInput.Value);
                user.Password = password;
                userManager.RestPassword(user);
            }
            else
            {

                ((front)Master).Alert.Show("Error", "El password y la verificación deben coincidir.");
            }

        }
    }
}