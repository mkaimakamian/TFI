using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;

namespace Ubiquicity.UserControls
{
    public partial class UCFormRolePermission : System.Web.UI.UserControl
    {
        public event EventHandler GrantAction;
        public event EventHandler UngrantAction;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void InitializeForm(List<Permission> toGrant)
        {
            rolNameInput.Value = "";
            rolDescriptionInput.Value = "";
            lstPermissionGranted.DataSource = null;
            lstPermissionGranted.DataBind();
            lstPermissionToGrant.DataSource = toGrant;
            lstPermissionToGrant.DataTextField = "Description";
            lstPermissionToGrant.DataValueField = "Id";
            lstPermissionToGrant.DataBind();
        }

        public void PopulateModel(Role rol)
        {
            rol.Name = rolNameInput.Value;
            rol.Description = rolDescriptionInput.Value;

            //No sse pueden recuperar los datos de las listas!
        }

        public void FillForm(List<Permission> granted, List<Permission> toGrant)
        {
            lstPermissionGranted.DataSource = granted;
            lstPermissionGranted.DataTextField = "Description";
            lstPermissionGranted.DataValueField = "Id";
            lstPermissionGranted.DataBind();

            lstPermissionToGrant.DataSource = toGrant;
            lstPermissionToGrant.DataTextField = "Description";
            lstPermissionToGrant.DataValueField = "Id";
            lstPermissionToGrant.DataBind();
        }

        protected void btnUngrant_Click(object sender, EventArgs e)
        {
            if (lstPermissionGranted.SelectedIndex > -1)
            {
                Session["Ubiquicity_itemId"] = lstPermissionGranted.SelectedValue;
                if (UngrantAction != null) UngrantAction(this, e);
            }
        }

        protected void btnGrant_Click(object sender, EventArgs e)
        {
            if (lstPermissionToGrant.SelectedIndex > -1) { 
                Session["Ubiquicity_itemId"] = lstPermissionToGrant.SelectedValue;
                if (GrantAction != null) GrantAction(this, e);
            }
        }
    }
}