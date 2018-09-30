using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;
using Helper;
using Ubiquicity.Classes;

namespace Ubiquicity
{
    public partial class user : BaseManager
    {

        protected override void PageLoad(object sender, EventArgs e)
        {
            GridView = UCcrudGrid;
            GridView.ShowGenericActionButton("Password");
            Alert.PerformSecondAction += SendPasswordReset;
        }

        protected override void LoadGridView()
        {
            try {
                UserManager userManager = new UserManager();
                List<User> users = userManager.Get();

                if (userManager.HasErrors)
                {
                    Alert.Show("Error", userManager.ErrorDescription);
                }
                else
                {
                    GridView.ColumnsToShow = ColumnsToShowAndTranslate();
                    GridView.LoadGrid(users);
                }
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }

        // Atiende la llamada del botón aceptar del form de creación de usuario.
        //En lo particular, como la edición y la creación usan el mismo botón, los dos eventos son atendidos por este handler.
        protected void ucModalNewMember_btnAcceptClick(object sender, EventArgs e)
        {
            try
            {
                int action = Convert.ToInt32(Session["Ubiquicity_action"]);
               
                //TODO - Validar los campos
                UserManager userManager = new UserManager();
                User user = null;
                bool success = true;

                switch (action) {
                    case CREATE:
                        
                        user = new User();
                        UCFormNewMember.PopulateModel(user);

                        //TODO - LA VALIDACIÓN DEL PASSWORD Y LA REPETICIÓN, DEBERÍA HACERSE POR OTRO FRONT
                        //Por otro lado, notar que como está el break, el mensaje no se muestra y debe implementarse un workaround
                        success = IsValidForSave();
                        if(success) {
                            user.Password = SecurityHelper.Encrypt(user.Password);
                            userManager.Save(user);
                        }                         
                        break;

                    case EDIT:
                        if (Session["Ubiquicity_itemId"] != null)
                        {
                            user = userManager.Get(Convert.ToInt32(Session["Ubiquicity_itemId"]));
                            UCFormNewMember.PopulateModel(user);
                            userManager.Edit(user);
                            
                        }
                        break;
                }

                Session.Remove("Ubiquicity_itemId");

                if (userManager.HasErrors)
                {
                    Alert.Show("Error", userManager.ErrorDescription);
                }
                else if (!success) {
                    Alert.Show("Error", "El password y su verificación, deben coincidir.");
                }
                else
                {
                    //Response.Redirect(Request.RawUrl);
                    LoadGridView();
                }
            } catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }

        protected override void AskForDelete(object sender, UbiquicityEventArg e)
        {
            Session["Ubiquicity_itemId"] = e.TheObject.ToString();
            Alert.Show("Eliminar registro", "¿Está seguro de querer eliminar el registro?", "Si");
        }

        protected override void PerformDeleteItem(object sender, UbiquicityEventArg e)
        {
            if (Session["Ubiquicity_itemId"] != null)
            {
                UserManager userManager = new UserManager();
                userManager.Delete(Convert.ToInt32(Session["Ubiquicity_itemId"]));
                LoadGridView();
                Session.Remove("Ubiquicity_itemId");
            }
        }

        /// <summary>
        /// Muestra el formulairo para el alta de un nuevo usuario.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ShowNewForm(object sender, UbiquicityEventArg e)
        {
            UCFormNewMember.ShowPasswordFields();
            UCFormNewMember.EnableUserField();
            UCFormNewMember.CleanForm();
            Session["Ubiquicity_action"] = CREATE;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalCreate", "window.onload = function() { $('#ucModalNewMember').modal('show'); }", true);
        }

        /// <summary>
        /// Muestra el formulario para la edición de un usuario existente.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ShowEditForm(object sender, UbiquicityEventArg e)
        {
            int id = Convert.ToInt32(e.TheObject);
            Session["Ubiquicity_itemId"] = id;

            UserManager userManager = new UserManager();
            User user = userManager.Get(id);

            if (userManager.HasErrors)
            {
                Alert.Show("Error", userManager.ErrorDescription);
            }
            else
            {
                UCFormNewMember.HidePasswordFields();
                UCFormNewMember.DisableUserField();
                UCFormNewMember.FillForm(user);
                Session["Ubiquicity_action"] = EDIT;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalEdit", "window.onload = function() { $('#ucModalNewMember').modal('show'); }", true);
            }
        }

        /// <summary>
        /// Se emplea el alert con uno de los eventos genéricos para solicitar que el administrador
        /// confirme si envía el reseteo de password al usuario.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void PerformGenericAction(object sender, UbiquicityEventArg e) {
            Session["Ubiquicity_itemId"] = e.TheObject.ToString();
            Alert.Show("resetear password", "Estás a punto de iniciar el proceso de reseteo de password. Estás seguro?", null, "Si, resetear");
        }

        protected void SendPasswordReset(object sender, UbiquicityEventArg e)
        {
            if (Session["Ubiquicity_itemId"] != null)
            {
                int id = Convert.ToInt32(Session["Ubiquicity_itemId"]);

                UserManager userManager = new UserManager();
                userManager.ResetPasswordRequest(id);
                Session.Remove("Ubiquicity_itemId");

                //TODO - debería mostrar un mensaje de "trabajo hecho"
            }
        }

        /// <summary>
        /// Se establece la traducción de las columnas que quieren ser mostradas.
        /// </summary>
        /// <returns></returns>
        private Dictionary<string, string> ColumnsToShowAndTranslate()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("Active", "Activo");
            columns.Add("Locked", "Bloqueado");
            columns.Add("Username", "Usuario");
            columns.Add("Name", "Nombre");
            columns.Add("Lastname", "Apellido");
            columns.Add("Mail", "Mail");
            columns.Add("Lastupdate", "Actualizado");

            return columns;
        }

        public bool IsValidForSave()
        {
            return UCFormNewMember.PasswordVerification == UCFormNewMember.Password && !String.IsNullOrEmpty(UCFormNewMember.Password);
        }
    }
}