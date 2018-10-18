using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;

namespace Ubiquicity
{
    public partial class register_action : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PerformActivation(Request["a"]);
        }

        /// <summary>
        /// Trata de activar la cuenta si se introdujo manualmente el hash.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ApplyCode(object sender, EventArgs e)
        {
            PerformActivation(activationCodeInput.Value);
        }

        private void PerformActivation(string activationHash)
        {
            try
            {
                UserManager userManager = new UserManager();
                bool success = userManager.ActivateAccount(activationHash);

                if (!success && userManager.HasErrors)
                {
                    ((front)Master).Alert.Show("Error", userManager.ErrorDescription);

                }
                else
                {
                    divForm.Visible = false;
                    divSuccessMessage.Visible = true;
                }

            } catch (Exception exception)
            {
                ((front)Master).Alert.Show("Excepción", exception.Message);
            }

        }
        
    }
}