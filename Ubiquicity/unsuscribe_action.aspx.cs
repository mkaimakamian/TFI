using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using BE;

namespace Ubiquicity
{
    public partial class unsuscribe_action : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PerformUnsuscribe(object sender, EventArgs e)
        {
            try
            {
                NewsAddresseeManager naManager = new NewsAddresseeManager();
                NewsAddressee newsAddressee = new NewsAddressee();
                newsAddressee.Email = mailInput.Value;

                bool success = naManager.Unsuscribe(newsAddressee, chkConfirm.Checked);
                if (!success && naManager.HasErrors)
                {
                    ((front)Master).Alert.Show("Error", naManager.ErrorDescription);
                } else
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