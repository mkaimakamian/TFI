using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ubiquicity.UserControls
{
    public partial class UCCompareItem : System.Web.UI.UserControl
    {
        private object element;

        protected void Page_Load(object sender, EventArgs e)
        {
            Fill();
        }

        public void Fill()
        {
            //Se supone que uno conoce el elemento que recibe.
            miTxt.Value = element.ToString();
        }

        public object Element
        {
            set { element = value; }
            get { return element; }
        }
    }
}