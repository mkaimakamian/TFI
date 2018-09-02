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
            //Requerido por la clase padre
            GridView = UCcrudGrid;

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
        //protected virtual void PerformDeleteItem(object sender, EventArgs e) { }
        //protected virtual void AskForDelete(object sender, EventArgs e) { }
        //protected virtual void ShowEditForm(object sender, EventArgs e) { }

        protected void modalUserRole_btnAcceptClick(object sender, EventArgs e)
        {
            try
            {
                int action = int.Parse(Session["Ubiquicity_action"].ToString());

                //Negrada: se está obteniendo el valor desde la sesión y no debería ser así
                int userId = int.Parse(Session["Ubiquicity_userId"].ToString());

                //TODO - Validar los campos
                UserManager userManager = new UserManager();
                RoleManager roleManager = new RoleManager();
                User user = null;

                switch (action)
                {
                    case CREATE:
                        //TODO - Evaluar los errores
                        user = userManager.Get(userId);
                        //UCFormUserRole.PopulateModel(user);
                        user.Roles = RetrieveFromSession("granted");
                        roleManager.SaveRoleForUser(user);
                        break;

                    case EDIT:
                        if (Session["Ubiquicity_itemId"] != null)
                        {
                            //role = rolManager.Get(Convert.ToInt32(Session["Ubiquicity_itemId"]));
                            //UCFormUserRole.PopulateModel(role);
                            //role.Permissions = RetrieveFromSession("granted");
                            //rolManager.Edit(role);
                            //Session.Remove("Ubiquicity_itemId");
                        }
                        break;
                }

                if (roleManager.HasErrors || userManager.HasErrors )
                {
                    Alert.Show("Error", roleManager.Errors[0].description + Environment.NewLine + userManager.Errors[0].description);
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

        protected override void ShowNewForm(object sender, EventArgs e)
        {
            UserManager userManager = new UserManager();
            RoleManager roleManager = new RoleManager();
            List<User> users = userManager.GetUserWithoutRole();
            List<Role> unassignedRol = roleManager.Get();
            List<Role> assignedRol = new List<Role>();

            //Se guardan en sesión para su manejo posterior
            KeepInSession("granted", assignedRol);
            KeepInSession("toGrant", unassignedRol);

            UCFormUserRole.InitializeForm(users, assignedRol, unassignedRol);
            Session["Ubiquicity_action"] = CREATE;
            ShowCrudForm();
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