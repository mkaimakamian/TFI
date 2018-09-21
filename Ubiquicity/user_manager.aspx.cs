using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;
using Helper;

namespace Ubiquicity
{
    public partial class user : BaseManager
    {

        protected override void PageLoad(object sender, EventArgs e)
        {
            GridView = UCcrudGrid;
        }

        protected override void LoadGridView()
        {
            try {
                UserManager userManager = new UserManager();
                List<User> users = userManager.Get();

                if (userManager.HasErrors)
                {
                    Alert.Show("Error", userManager.Errors[0].description);
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

        // Atiende la llamada del botón aceptar del form de creación de usuario
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
                            Session.Remove("Ubiquicity_itemId");
                        }
                        break;
                }

                if (userManager.HasErrors)
                {
                    Alert.Show("Error", userManager.ErrorDescription);
                }
                else if (!success) {
                    Alert.Show("Error", "El password y su verificación, deben coincidir.");
                }
                else
                {
                    Response.Redirect(Request.RawUrl);
                }
            } catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }

        protected override void AskForDelete(object sender, EventArgs e)
        {
            //Session["Ubiquicity_itemId"] = id;
            Alert.Show("Eliminar registro", "¿Está seguro de querer eliminar el registro?", "Si");
        }

        protected override void PerformDeleteItem(object sender, EventArgs e)
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
        /// Muestra el formulairo para el alta de un nuevo usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ShowNewForm(object sender, EventArgs e)
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
        protected override void ShowEditForm(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["Ubiquicity_itemId"]);
                        
            UserManager userManager = new UserManager();
            User user = userManager.Get(id);

            if (userManager.HasErrors)
            {
                Alert.Show("Error", userManager.Errors[0].description);
            }
            else
            {
                UCFormNewMember.HidePasswordFields();
                UCFormNewMember.DisableUserField();
                UCFormNewMember.FillForm(user);
                Session["Ubiquicity_action"] = EDIT;
                //Session["Ubiquicity_itemId"] = id;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalEdit", "window.onload = function() { $('#ucModalNewMember').modal('show'); }", true);
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
            return UCFormNewMember.PasswordVerification == UCFormNewMember.Password;
        }
    }
}