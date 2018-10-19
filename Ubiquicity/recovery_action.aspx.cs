using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using Helper;

namespace Ubiquicity
{
    public partial class recovery_action : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnPassword_Click(object sender, EventArgs e)
        {
            try
            {
                if (passwordInput.Value == passwordVerificationInput.Value && !String.IsNullOrEmpty(passwordInput.Value))
                {
                    String passwordHash = Request["a"];
                    UserManager userManager = new UserManager();
                    string password = SecurityHelper.Encrypt(passwordInput.Value);
                    bool success = userManager.ResetPasswordAction(password, passwordHash);

                    if (!success && userManager.HasErrors)
                    {
                        ((front)Master).Alert.Show("Error", userManager.ErrorDescription);
                    }
                    else
                    {
                        divForm.Visible = false;
                        divSuccessMessage.Visible = true;
                    }

                }
                else
                {
                    ((front)Master).Alert.Show("Error", "El password y la verificación deben coincidir.");
                }
            } catch (Exception exception)
            {
                ((front)Master).Alert.Show("Excepción", exception.Message);
            }
        }
    }
}