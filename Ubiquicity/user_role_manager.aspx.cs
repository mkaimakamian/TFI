using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;
using Ubiquicity.Classes;

namespace Ubiquicity
{
    public partial class user_role_manager : BaseManager
    {
        protected override void PageLoad(object sender, EventArgs e)
        {
            GridView = UCcrudGrid; //Requerido por la clase padre
            GridView.HideDeleteButton();
            GridView.HideNewButton();

            UCFormUserRole.GrantAction += GrantPermission;
            UCFormUserRole.UngrantAction += UngrantPermission;
            Manager = new UserManager();
        }

        protected override bool AcceptModify(BL.BaseManager manager, int id)
        {
            RoleManager roleManager = new RoleManager();
            User user = ((UserManager) manager).Get(id);

            if (user == null && manager.HasErrors) return false;

            user.Roles = RetrieveFromSession("granted");
            bool success = roleManager.EditRoleForUser(user);

            if (!success && roleManager.HasErrors)
            {
                Alert.Show("Error", roleManager.ErrorDescription);
            }

            return success;
        }

        protected override void ShowEditForm(object sender, UbiquicityEventArg e) {
            int id = Convert.ToInt32(e.TheObject);
            Session["Ubiquicity_itemId"] = id;

            UserManager userManager = new UserManager();
            User user = userManager.Get(id);

            RoleManager roleManager = new RoleManager();
            List<Role> unassignedRoles = roleManager.GetUnassignedRole(user);

            if (userManager.HasErrors)
            {
                Alert.Show("Error", userManager.Errors[0].description);
            }
            else
            {
                if (unassignedRoles == null)
                {
                    unassignedRoles = new List<Role>();
                }

                //Se guardan en sesión para su manejo posterior
                KeepInSession("granted", user.Roles);
                KeepInSession("toGrant", unassignedRoles);

                UCFormUserRole.FillForm(user, unassignedRoles);
                Session["Ubiquicity_action"] = EDIT;
                ShowCrudForm();
            }
        }

        /// <summary>
        /// Ejecuta el pasaje de la lista de los disponibles a los asignados.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void GrantPermission(object sender, EventArgs e)
        {
            List<Role> granted = RetrieveFromSession("granted");
            List<Role> toGrant = RetrieveFromSession("toGrant");

            int id = int.Parse(Session["Ubiquicity_roleId"].ToString());
            SwitchPermission(id, "toGrant", toGrant, "granted", granted);
            UCFormUserRole.FillForm(granted, toGrant);
        }

        /// <summary>
        /// Ejecuta el pasaje de la lista de los asignados a los disponibles.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void UngrantPermission(object sender, EventArgs e)
        {
            List<Role> granted = RetrieveFromSession("granted");
            List<Role> toGrant = RetrieveFromSession("toGrant");

            int id = int.Parse(Session["Ubiquicity_roleId"].ToString());
            SwitchPermission(id, "granted", granted, "toGrant", toGrant);
            UCFormUserRole.FillForm(granted, toGrant);
        }

        private void SwitchPermission(int id, string keyfrom, List<Role> from, string keyTo, List<Role> to)
        {
            bool found = false;

            // Traspaso a la lista de disponibles
            for (int i = 0; i < from.Count && !found; ++i)
            {
                found = from[i].Id == id;
                if (found)
                {
                    to.Add(from[i]);
                    from.RemoveAt(i);
                }
            }

            KeepInSession(keyfrom, from);
            KeepInSession(keyTo, to);
            Session.Remove("Ubiquicity_roleId");
            ShowCrudForm();
        }

        //estrategia para manejar las listas: el uso de la sesión
        private void KeepInSession(string key, List<Role> value)
        {
            Session[key] = value;
        }

        private void ShowCrudForm()
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalUserRole", "window.onload = function() { $('#modalUserRole').modal('show'); }", true);
        }

        private List<Role> RetrieveFromSession(string key)
        {
            return (List<Role>)Session[key];
        }

        /// <summary>
        /// Se establece la traducción de las columnas que quieren ser mostradas.
        /// </summary>
        /// <returns></returns>
        protected override Dictionary<string, string> ColumnsToShowAndTranslate()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("Username", "Usuario");
            columns.Add("Name", "Nombre");
            columns.Add("Lastname", "Apellido");
            columns.Add("Mail", "Mail");
            columns.Add("Permission", "Roles");

            return columns;
        }
    }
}