using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;

namespace Ubiquicity.UserControls
{
    public partial class UCModalNewMember : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Fill(User user)
        {
            firstNameInput.Value = user.Name;
            lastNameInput.Value = user.Lastname;
            mailInput.Value = user.Mail;
        }
        
        //public string FirstName {
        //    get { return firstNameInput.Value; } set { firstNameInput.Value = value; }
        //}
    }
}