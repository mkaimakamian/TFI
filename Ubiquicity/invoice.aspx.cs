using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;

namespace Ubiquicity
{
    public partial class invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //LoadCreditNotes(user);
                //LoadCreditsCards();
            }
        }

    }
}