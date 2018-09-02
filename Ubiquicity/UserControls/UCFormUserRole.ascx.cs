using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;

namespace Ubiquicity.UserControls
{
    public partial class UCFormUserRole : System.Web.UI.UserControl
    {
        public event EventHandler GrantAction;
        public event EventHandler UngrantAction;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void InitializeForm(List<User> users, List<Role> granted, List<Role> toGrant)
        {
            userDrop.Enabled = true;
            userDrop.DataSource = users;
            userDrop.DataTextField = "Username";
            userDrop.DataValueField = "Id";
            userDrop.DataBind();

            FillForm(granted, toGrant);
        }

        public void PopulateModel(User user)
        {
            //No se puede recuperar dato del combo;
            //No se pueden recuperar los datos de las listas!
        }

        public void FillForm(User user, List<Role> toGrant)
        {
            List<User> users = new List<User>();
            users.Add(user);
            userDrop.DataSource = users;
            userDrop.DataTextField = "Username";
            userDrop.DataValueField = "Id";
            userDrop.DataBind();
            userDrop.Enabled = false;
            FillForm(user.Roles, toGrant);
        }

        public void FillForm(List<Role> granted, List<Role> toGrant)
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
                Session["Ubiquicity_roleId"] = lstPermissionGranted.SelectedValue;
                Session["Ubiquicity_userId"] = userDrop.SelectedValue;
                if (UngrantAction != null) UngrantAction(this, e);
            }
        }

        protected void btnGrant_Click(object sender, EventArgs e)
        {
            if (lstPermissionToGrant.SelectedIndex > -1)
            {
                Session["Ubiquicity_roleId"] = lstPermissionToGrant.SelectedValue;
                Session["Ubiquicity_userId"] = userDrop.SelectedValue;
                if (GrantAction != null) GrantAction(this, e);
            }
        }
    }
}