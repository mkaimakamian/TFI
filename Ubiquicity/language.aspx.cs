using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ubiquicity
{
    public partial class language : System.Web.UI.Page
    {
        private const int CREATE = 1;
        private const int EDIT = 2;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGrid();
            }

            //Se asigna el Alert que está incrustado en la master page
            //TODO - quizá el componente debería utilizar su propio alert box
            UCcrudGrid.AlertBox = (UserControls.UCModalMessageBox)Master.FindControl("customAlertBox");

            //Se asignó al botón principal la tarea de ejecutar la eliminación
            UCcrudGrid.PerformAlertBoxMainAction = PerformDeleteItem;

            UCcrudGrid.DeleteActionClick += AskForDelete;
            UCcrudGrid.EditActionClick += ShowEditForm;
            UCcrudGrid.NewActionClick += ShowNewForm;
        }

        private void LoadGrid()
        {
            //try
            //{
            //    UserManager userManager = new UserManager();
            //    List<User> users = userManager.Get();

            //    //TODO - Quizá se pueda definir en el base un get genérico
            //    UCcrudGrid.LoadGrid(userManager, users);
            //}
            //catch (Exception exception)
            //{
            //    UCcrudGrid.ShowAlert("Exception", exception.Message);
            //}
        }

        // Atiende la llamada del botón aceptar del form de usuario
        //protected void ucModalNewMember_btnAcceptClick(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        int action = Convert.ToInt32(Session["Ubiquicity_action"]);

        //        //TODO - Validar los campos
        //        UserManager userManager = new UserManager();
        //        User user = null;

        //        switch (action)
        //        {
        //            case CREATE:
        //                user = new User();
        //                PopulateModel(user);
        //                userManager.Save(user);
        //                break;

        //            case EDIT:
        //                if (Session["Ubiquicity_itemId"] != null)
        //                {
        //                    user = userManager.Get(Convert.ToInt32(Session["Ubiquicity_itemId"]));
        //                    PopulateModel(user);
        //                    userManager.Edit(user);
        //                }
        //                break;
        //        }

        //        if (userManager.HasErrors)
        //        {
        //            UCcrudGrid.ShowAlert("Error", userManager.Errors[0].description);
        //        }
        //        else
        //        {
        //            Response.Redirect(Request.RawUrl);
        //        }
        //    }
        //    catch (Exception exception)
        //    {
        //        UCcrudGrid.ShowAlert("Exception", exception.Message);
        //    }
        //}

        //private void PopulateModel(User user)
        //{
        //    user.Name = UCFormNewMember.FirstName;
        //    user.Lastname = UCFormNewMember.LastName;
        //    user.Password = UCFormNewMember.Password;
        //    user.Username = UCFormNewMember.UserName;
        //    user.Language.Id = 1; //Todo - cambiar esto!
        //    user.Mail = UCFormNewMember.Mail;
        //}

        //private void CleanForm()
        //{
        //    UCFormNewMember.FirstName = "";
        //    UCFormNewMember.LastName = "";
        //    UCFormNewMember.Password = "";
        //    UCFormNewMember.UserName = "";
        //    UCFormNewMember.Mail = "";
        //}

        private void AskForDelete(object sender, EventArgs e)
        {
            //Session["Ubiquicity_itemId"] = id;
            UCcrudGrid.ShowAlert("Eliminar registro", "¿Está seguro de querer eliminar el registro?", "Si");
        }

        private void PerformDeleteItem(object sender, EventArgs e)
        {
            if (Session["Ubiquicity_itemId"] != null)
            {
                //UserManager userManager = new UserManager();
                //userManager.Delete(Convert.ToInt32(Session["Ubiquicity_itemId"]));
                //LoadGrid();
                //Session.Remove("Ubiquicity_itemId");
            }
        }

        /// <summary>
        /// Muestra el formulairo para el alta de un nuevo usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ShowNewForm(object sender, EventArgs e)
        {
            //CleanForm();
            Session["Ubiquicity_action"] = CREATE;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalCreate", "window.onload = function() { $('#ucModalNewMember').modal('show'); }", true);
        }

        /// <summary>
        /// Muestra el formulario para la edición de un usuario existente.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ShowEditForm(object sender, EventArgs e)
        {
            //int id = Convert.ToInt32(Session["Ubiquicity_itemId"]);

            //UserManager userManager = new UserManager();
            //User user = userManager.Get(id);

            //if (userManager.HasErrors)
            //{
            //    UCcrudGrid.ShowAlert("Error", userManager.Errors[0].description);
            //}
            //else
            //{
            //    UCFormNewMember.FillForm(user);
            //    Session["Ubiquicity_action"] = EDIT;
            //    //Session["Ubiquicity_itemId"] = id;
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalEdit", "window.onload = function() { $('#ucModalNewMember').modal('show'); }", true);
            //}
        }
    }
}