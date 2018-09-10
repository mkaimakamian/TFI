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
    public partial class user_role_manager : BaseManager
    {
        protected override void PageLoad(object sender, EventArgs e)
        {
            GridView = UCcrudGrid; //Requerido por la clase padre
            GridView.HideDeleteButton();
            GridView.HideNewButton();

            UCFormUserRole.GrantAction += GrantPermission;
            UCFormUserRole.UngrantAction += UngrantPermission;
        }

        protected override void LoadGridView()
        {
            try
            {
                UserManager userManager = new UserManager();
                List<User> users = userManager.Get();
                GridView.LoadGrid(users);
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }

        protected void modalUserRole_btnAcceptClick(object sender, EventArgs e)
        {
            try
            {
                int action = int.Parse(Session["Ubiquicity_action"].ToString());

                //Negrada: se está obteniendo el valor desde la sesión y no debería ser así
                int userId = int.Parse(Session["Ubiquicity_itemId"].ToString());

                //TODO - Validar los campos
                UserManager userManager = new UserManager();
                RoleManager roleManager = new RoleManager();
                User user = null;
                bool success = false;

                user = userManager.Get(userId);

                if (user == null && userManager.HasErrors)
                {
                    Alert.Show("Error", userManager.ErrorDescription);
                }
                //UCFormUserRole.PopulateModel(user);
                user.Roles = RetrieveFromSession("granted");

                switch (action)
                {
                    //case CREATE:
                    //    success = roleManager.SaveRoleForUser(user);
                    //    break;

                    case EDIT:
                        success = roleManager.EditRoleForUser(user);
                        break;
                }

                Session.Remove("Ubiquicity_itemId");

                if (!success && roleManager.HasErrors)
                {
                    Alert.Show("Error", roleManager.ErrorDescription);
                }
                else
                {
                    Response.Redirect(Request.RawUrl);
                }
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }

        protected override void ShowEditForm(object sender, EventArgs e) {
            int id = Convert.ToInt32(Session["Ubiquicity_itemId"]);

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
    }
}