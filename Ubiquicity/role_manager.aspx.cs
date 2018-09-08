using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using BE;

namespace Ubiquicity
{
    public partial class role : BaseManager
    {

        protected override void PageLoad(object sender, EventArgs e)
        {
            // Obligatorio para que la clase padre pueda operar
            GridView = UCcrudGrid;
            UCFormRolePermission.GrantAction += GrantPermission;
            UCFormRolePermission.UngrantAction += UngrantPermission;
        }

        protected override void LoadGridView() {
            try
            {
                RoleManager roleManager = new RoleManager();
                List<Role> roles = roleManager.Get();
                GridView.LoadGrid(roles);
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }

        protected void modalRolePermission_btnAcceptClick(object sender, EventArgs e)
        {
            try
            {
                int action = Convert.ToInt32(Session["Ubiquicity_action"]);

                //TODO - Validar los campos
                RoleManager rolManager = new RoleManager();
                Role role = null;
                bool success = false;

                switch (action)
                {
                    case CREATE:
                        role = new Role();
                        UCFormRolePermission.PopulateModel(role);
                        role.Permissions = RetrieveFromSession("granted");
                        success = rolManager.Save(role);
                        break;

                    case EDIT:
                        if (Session["Ubiquicity_itemId"] != null)
                        {
                            role = rolManager.Get(Convert.ToInt32(Session["Ubiquicity_itemId"]));
                            UCFormRolePermission.PopulateModel(role);
                            role.Permissions = RetrieveFromSession("granted");
                            success = rolManager.Edit(role);
                            Session.Remove("Ubiquicity_itemId");
                        }
                        break;
                }

                if (!success && rolManager.HasErrors)
                {
                    Alert.Show("Error", rolManager.ErrorDescription);
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

            RoleManager roleManager = new RoleManager();
            Role role = roleManager.Get(id);
            List<Permission> unassignedPermission = roleManager.GetUnassignedPermission(role);

            if (roleManager.HasErrors)
            {
                Alert.Show("Error", roleManager.ErrorDescription);
            }
            else
            {
                if (unassignedPermission == null) { 
                    unassignedPermission = new List<Permission>();
                }

                //Se guardan en sesión para su manejo posterior
                KeepInSession("granted", role.Permissions);
                KeepInSession("toGrant", unassignedPermission);

                UCFormRolePermission.FillForm(role, unassignedPermission);
                Session["Ubiquicity_action"] = EDIT;
                ShowCrudForm();
            }
        }

        /// <summary>
        /// Muestra el formulario para el alta de un nuevo rol.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ShowNewForm(object sender, EventArgs e) {
            RoleManager roleManager = new RoleManager();
            List<Permission> unassignedPermission = roleManager.GetAllPermission();
            List<Permission> granted = new List<Permission>();

            //Se guardan en sesión para su manejo posterior
            KeepInSession("granted", granted);
            KeepInSession("toGrant", unassignedPermission);

            UCFormRolePermission.InitializeForm(granted, unassignedPermission);
            Session["Ubiquicity_action"] = CREATE;
            ShowCrudForm();
        }

        /// <summary>
        /// Ejecuta el pasaje de la lista de los disponibles a los asignados.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void GrantPermission(object sender, EventArgs e) {
            List<Permission> granted = RetrieveFromSession("granted");
            List<Permission> toGrant = RetrieveFromSession("toGrant");

            int id = int.Parse(Session["Ubiquicity_permissionId"].ToString());
            SwitchPermission(id, "toGrant", toGrant, "granted", granted);
            UCFormRolePermission.FillForm(granted, toGrant);
        }

        /// <summary>
        /// Ejecuta el pasaje de la lista de los asignados a los disponibles.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void UngrantPermission(object sender, EventArgs e) {
            List<Permission> granted = RetrieveFromSession("granted");
            List<Permission> toGrant = RetrieveFromSession("toGrant");

            int id = int.Parse(Session["Ubiquicity_permissionId"].ToString());
            SwitchPermission(id, "granted", granted, "toGrant", toGrant);
            UCFormRolePermission.FillForm(granted, toGrant);
        }

        private void SwitchPermission(int id, string keyfrom, List<Permission> from, string keyTo, List<Permission> to)
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
            Session.Remove("Ubiquicity_permissionId");
            ShowCrudForm();
        }

        protected override void AskForDelete(object sender, EventArgs e)
        {
            Alert.Show("Eliminar registro", "¿Está seguro de querer eliminar el registro?", "Si");
        }

        protected override void PerformDeleteItem(object sender, EventArgs e) {
            if (Session["Ubiquicity_itemId"] != null)
            {
                int id = int.Parse(Session["Ubiquicity_itemId"].ToString());
                RoleManager rolManager = new RoleManager();

                if (rolManager.Delete(id))
                {
                    LoadGridView();
                    Session.Remove("Ubiquicity_itemId");
                }

                if (rolManager.HasErrors) {
                    Alert.Show("Error", rolManager.Errors[0].description);
                }
                
            }
        }

        private void ShowCrudForm()
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalRole", "window.onload = function() { $('#modalRolePermission').modal('show'); }", true);
        }

        //estrategia para manejar las listas: el uso de la sesión
        private void KeepInSession(string key, List<Permission> value)
        {
            Session[key] = value;
        }
        
        private List<Permission> RetrieveFromSession(string key)
        {
            return (List < Permission > ) Session[key];
        }
    }   
}