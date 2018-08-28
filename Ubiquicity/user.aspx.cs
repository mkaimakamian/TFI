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
        // TODO - La master podría tener la referencia del objeto.
        UserControls.UCModalMessageBox customAlertBox;
        private const int CREATE = 1;
        private const int EDIT = 2;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGrid();
            }
            customAlertBox = (UserControls.UCModalMessageBox)Master.FindControl("customAlertBox");
            customAlertBox.PerformMainAction += DeleteItem;
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
                if (e.CommandName == "EditItem")
                {
                    UserManager userManager = new UserManager();
                    User user = userManager.Get(id);

                    if (userManager.HasErrors)
                    {
                        ShowAlert("Error", userManager.Errors[0].description);
                    }
                    else
                    {
                        UCFormNewMember.FillForm(user);
                        Session["Ubiquicity_action"] = EDIT;
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalEdit", "window.onload = function() { $('#ucModalNewMember').modal('show'); }", true);
                    }
                    
                }
                else if (e.CommandName == "DeleteItem")
                {
                    Session["idToDelete"] = id;
                    ShowAlert("Eliminar registro", "¿Está seguro de querer eliminar el registro?", "Si", "No");
                }
            }
            catch (Exception exception)
            {
                ShowAlert("Exception", exception.Message);
            }
        }

        private void DeleteItem(object sender, EventArgs e)
        {
            if (Session["idToDelete"] != null)
            {
                UserManager userManager = new UserManager();
                userManager.Delete(Convert.ToInt32(Session["idToDelete"]));
                LoadGrid();
                Session.Remove("idToDelete");
            }
        }
       
        // Atiende la llamada del botón aceptar
        protected void ucModalNewMember_btnAcceptClick(object sender, EventArgs e)
        {
            try
            {
                int action = Convert.ToInt32(Session["Ubiquicity_action"]);
               
                //TODO - Validar los campos
                UserManager userManager = new UserManager();
                User newUser = new User();

                newUser.Name = UCFormNewMember.FirstName;
                newUser.Lastname = UCFormNewMember.LastName;
                newUser.Password = UCFormNewMember.Password;
                newUser.Username = UCFormNewMember.UserName;
                //newUser.Language = UCFormNewMember.Language;
                newUser.Mail = UCFormNewMember.Mail;

                switch (action) {
                    case CREATE:
                        userManager.Save(newUser);
                        break;
                    case EDIT:
                        userManager.Edit(newUser);
                        break;
                }

                if (userManager.HasErrors)
                {
                    ShowAlert("Error", userManager.Errors[0].description);
                } else {
                    Response.Redirect(Request.RawUrl);
                }
            } catch (Exception exception)
            {
                ShowAlert("Exception", exception.Message);
            }
        }

        private void ShowAlert(string title, string message, String button1Label = "", String button2Label = "")
        {
            //UserControls.UCModalMessageBox customAlertBox = (UserControls.UCModalMessageBox) Master.FindControl("customAlertBox");
            customAlertBox.title = title;
            customAlertBox.message = message;
            customAlertBox.MainActionLabel = button1Label;
            customAlertBox.SecondActionLabel = button2Label;

            customAlertBox.MainActionVisible = !String.IsNullOrEmpty(button1Label);
            //customAlertBox.SecondActionVisible = !String.IsNullOrEmpty(button2Label);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalMessage", "window.onload = function() { $('#ucModalMessageBox').modal('show'); }", true);
        }

        protected void btnNewUser_Click(object sender, EventArgs e)
        {
            Session["Ubiquicity_action"] = CREATE;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalCreate", "window.onload = function() { $('#ucModalNewMember').modal('show'); }", true);
        }
    }
}