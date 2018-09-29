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
            mapFileImage.Src = "";
            imageInputBase64.Value = "";
            //resourceInput.Value = "";
        }

        public void FillForm(Map map)
        {
            nameInput.Value = map.Name;
            descriptionInput.Value = map.Description;
            mapFileImage.Src = map.Image;
            imageInputBase64.Value = "";
            //resourceInput.Value = map.SourcePath;
        }

        public void PopulateModel(Map map)
        {
            map.Name = nameInput.Value;
            map.Description = descriptionInput.Value;
            map.SourcePath = resourceInput.Value;
            map.Image = imageInputBase64.Value;
        }
    }
}