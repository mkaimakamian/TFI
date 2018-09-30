using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ubiquicity.UserControls;

namespace Ubiquicity.Classes
{
    public class CompareItem : ITemplate
    {
        private string id;
        public CompareItem(string id)
        {
            this.id = id;
        }
        public void InstantiateIn(Control container)
        {
            //TextBox txt1 = new TextBox();
            //txt1.ID = "txt1";
            //container.Controls.Add(txt1);

            UCCompareItem compareItem = new UCCompareItem();
            //UCCompareItem compareItem = (UCCompareItem) Page.LoadControl("~/UserControls/sub/UCCompareItem.ascx");
            compareItem.ID = id;
            container.Controls.Add(compareItem);
        }
    }
}