using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using System.Configuration;

namespace Ubiquicity.UserControls
{
    public partial class UCFormMap : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void CleanForm(List<Category> categories)
        {
            dropCategoryInput.DataTextField = "Name";
            dropCategoryInput.DataValueField = "Id";
            dropCategoryInput.DataSource = categories;
            dropCategoryInput.DataBind();

            nameInput.Value = "";
            descriptionInput.Value = "";
            mapFileImage.Src = "";
            imageInputBase64.Value = "";
            lblResource.InnerText = "Recurso";
        }

        public void FillForm(Map map)
        {
            nameInput.Value = map.Name;
            //dropCategoryInput.SelectedValue = map.Category.Id.ToString();
            descriptionInput.Value = map.Description;
            mapFileImage.Src = map.Image;
            imageInputBase64.Value = map.Image;
            lblResource.InnerText = "Recurso: " + map.Resource;
        }

        public void PopulateModel(Map map)
        {
            map.Name = nameInput.Value;
            map.Description = descriptionInput.Value;
            map.Image = imageInputBase64.Value;

            if (resourceInput.HasFile) {
                string fileName = DateTime.Now.Ticks + resourceInput.FileName;
                string path = ConfigurationManager.AppSettings["MAP_PATH"];
                resourceInput.PostedFile.SaveAs(path + "/" + fileName);
                map.Resource = fileName;
            }
        }
    }
}