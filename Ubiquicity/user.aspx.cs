using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;

namespace Ubiquicity
{
    public partial class user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGrid();
            }

        }

        private void LoadGrid()
        {
            try {

                UserManager userManager = new UserManager();
                List<User> users = userManager.Get();

                if (userManager.HasErrors)
                {
                    ShowAlert("Error", userManager.Errors[0].description);
                } else
                {
                    gvUser.DataSource = users;
                    gvUser.DataBind();
                }
                }
            catch (Exception exception)
            {
                ShowAlert("Exception", exception.Message);
            }
        }

        protected void gvUser_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            try
            {
                UserManager userManager = new UserManager();

                if (e.CommandName == "EditItem")
                {
                    User user = userManager.Get(id);

                    if (userManager.HasErrors)
                    {
                        ShowAlert("Error", userManager.Errors[0].description);
                    }
                    else
                    {
                        UCFormNewMember.Fill(user);
                    }
               

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", "window.onload = function() { $('#ucModalNewMember').modal('show'); }", true);
                }
                else if (e.CommandName == "DeleteItem")
                {
                    //TODO -  Agregar confirmación
                    userManager.Delete(id);
                    LoadGrid();
                }
            }
            catch (Exception exception)
            {
                ShowAlert("Exception", exception.Message);
            }
        }

        private void ShowAlert(string title, string message)
        {
            UserControls.UCModalMessageBox customAlertBox = (UserControls.UCModalMessageBox) Master.FindControl("customAlertBox");
            customAlertBox.title = title;
            customAlertBox.message = message;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", "window.onload = function() { $('#ucModalMessageBox').modal('show'); }", true);
        }
    }
}