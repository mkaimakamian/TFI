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
            Manager = new UserManager();
        }

        protected override bool AcceptCreate(BL.BaseManager manager)
        {
            User user = new User();
            UCFormNewMember.PopulateModel(user);

            //TODO - LA VALIDACIÓN DEL PASSWORD Y LA REPETICIÓN, DEBERÍA HACERSE POR FRONT
            //Por otro lado, notar que como está el break, el mensaje no se muestra y debe implementarse un workaround
            bool success = true;

            if (IsValidForSave())
            {
                user.Password = SecurityHelper.Encrypt(user.Password);
                success = ((UserManager)manager).Save(user);
            }
            else
            {
                success = false;
                Alert.Show("Error", "El password y su verificación, deben coincidir.");
            }

            return success;
        }

        protected override bool AcceptModify(BL.BaseManager manager, int id)
        {
            User user = ((UserManager)manager).Get(id);
            UCFormNewMember.PopulateModel(user);
            return ((UserManager)manager).Edit(user);
        }

        /// <summary>
        /// Muestra el formulairo para el alta de un nuevo usuario.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ShowNewForm(object sender, UbiquicityEventArg e)
        {
            try
            {
                UCFormNewMember.ShowPasswordFields();
                UCFormNewMember.EnableUserField();
                UCFormNewMember.CleanForm();
                Session["Ubiquicity_action"] = CREATE;
                ScriptManager.RegisterStartupScript(upUCModalForm, upUCModalForm.GetType(), "openModalCreate", "$('#ucModalNewMember').modal('show');", true);
                upUCModalForm.Update();
            }
            catch (Exception exception)
            {
                Alert.ShowUP("Excepción", exception.Message);
            }

        }

        /// <summary>
        /// Muestra el formulario para la edición de un usuario existente.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ShowEditForm(object sender, UbiquicityEventArg e)
        {
            try
            {
                int id = Convert.ToInt32(e.TheObject);
                Session["Ubiquicity_itemId"] = id;

                UserManager userManager = new UserManager();
                User user = userManager.Get(id);

                if (userManager.HasErrors)
                {
                    Alert.ShowUP("Error", userManager.ErrorDescription);
                }
                else
                {
                    UCFormNewMember.HidePasswordFields();
                    UCFormNewMember.DisableUserField();
                    UCFormNewMember.FillForm(user);
                    Session["Ubiquicity_action"] = EDIT;
                    ScriptManager.RegisterStartupScript(upUCModalForm, upUCModalForm.GetType(), "openModalEdit", "$('#ucModalNewMember').modal('show');", true);
                    upUCModalForm.Update();
                }
            }
            catch (Exception exception)
            {
                Alert.ShowUP("Excepción", exception.Message);
            }

        }

        /// <summary>
        /// Se emplea el alert con uno de los eventos genéricos para solicitar que el administrador
        /// confirme si envía el reseteo de password al usuario.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void PerformGenericAction(object sender, UbiquicityEventArg e)
        {
            Session["Ubiquicity_itemId"] = e.TheObject.ToString();
            Alert.ShowUP("Resetear password", "Estás a punto de iniciar el proceso de reseteo de password. Estás seguro?", null, "Si, resetear");
        }

        protected void SendPasswordReset(object sender, UbiquicityEventArg e)
        {
            try
            {
                if (Session["Ubiquicity_itemId"] != null)
                {
                    int id = Convert.ToInt32(Session["Ubiquicity_itemId"]);

                    UserManager userManager = new UserManager();
                    userManager.ResetPasswordRequest(id);
                    Session.Remove("Ubiquicity_itemId");

                    //TODO - No se muestra la alerta :|
                    Alert.ShowUP("Solicitud enviada", "Se ha enviado la solicitud de reseteo de password.");

                }
            }
            catch (Exception exception)
            {
                Alert.ShowUP("Excepción", exception.Message);
            }
        }

        /// <summary>
        /// Se establece la traducción de las columnas que quieren ser mostradas.
        /// </summary>
        /// <returns></returns>
        protected override Dictionary<string, string> ColumnsToShowAndTranslate()
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