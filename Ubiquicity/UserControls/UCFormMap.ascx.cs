using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;

namespace Ubiquicity.UserControls
{
    public partial class UCFormMap : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void CleanForm()
        {
            nameInput.Value = "";
            descriptionInput.Value = "";
            //resourceInput.Value = "";
            //imageInput.Value = "";
        }

        public void PopulateModel(Map map)
        {
            map.Name = nameInput.Value;
            map.Description = descriptionInput.Value;
            map.SourcePath = resourceInput.Value;
            map.Image = imageInput.Value;
            //deberíamos capturar el base 64
        }
    }
}