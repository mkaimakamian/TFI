using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;

namespace Ubiquicity
{
    public partial class recovery_action : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PerformRecovery(Request["a"]);
        }

        private void PerformRecovery(string activationHash)
        {
            UserManager userManager = new UserManager();
            //bool success = userManager.Edit(activationHash);
            bool success = true;
            if (!success)
            {
                //mensaje de "intentalo de nuevo manualmente"
            }
            else
            {
                //Joya!
            }
        }
    }
}