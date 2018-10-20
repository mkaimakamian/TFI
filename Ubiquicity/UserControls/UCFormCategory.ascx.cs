using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;

namespace Ubiquicity.UserControls
{
    public partial class UCFormCategory : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void CleanForm()
        {
            nameInput.Value = "";
        }

        public void FillForm(Category category)
        {
            nameInput.Value = category.Name;
        }

        public void PopulateModel(Category category)
        {
            category.Name = nameInput.Value;
        }
    }
}