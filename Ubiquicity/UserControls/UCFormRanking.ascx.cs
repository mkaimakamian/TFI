using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ubiquicity.UserControls
{
    public partial class UCFormRanking : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public int Ranking {
            get { return Convert.ToInt32(radioOptionList.SelectedValue); }
        }
    }
}