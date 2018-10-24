using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using BE;
using Ubiquicity.Classes;

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
            Manager = new RoleManager(); ;
        }

        protected override bool AcceptCreate(BL.BaseManager manager)
        {
            Role role = new Role();
            UCFormRolePermission.PopulateModel(role);
            role.Permissions = RetrievePermissionFromSession("granted");
            return ((RoleManager) manager).Save(role);
        }

        protected override bool AcceptModify(BL.BaseManager manager, int id)
        {
            Role role = ((RoleManager) manager).Get(id);
            UCFormRolePermission.PopulateModel(role);
            role.Permissions = RetrievePermissionFromSession("granted");
            return ((RoleManager)manager).Edit(role);
        }

        protected override void ShowEditForm(object sender, UbiquicityEventArg e) {

            int id = Convert.ToInt32(e.TheObject);
            Session["Ubiquicity_itemId"] = id;

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
                KeepPermissionInSession("granted", role.Permissions);
                KeepPermissionInSession("toGrant", unassignedPermission);

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
        protected override void ShowNewForm(object sender, UbiquicityEventArg e) {
            RoleManager roleManager = new RoleManager();
            List<Permission> unassignedPermission = roleManager.GetAllPermission();
            List<Permission> granted = new List<Permission>();

            //Se guardan en sesión para su manejo posterior
            KeepPermissionInSession("granted", granted);
            KeepPermissionInSession("toGrant", unassignedPermission);

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
            List<Permission> granted = RetrievePermissionFromSession("granted");
            List<Permission> toGrant = RetrievePermissionFromSession("toGrant");

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
            List<Permission> granted = RetrievePermissionFromSession("granted");
            List<Permission> toGrant = RetrievePermissionFromSession("toGrant");

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

            KeepPermissionInSession(keyfrom, from);
            KeepPermissionInSession(keyTo, to);
            Session.Remove("Ubiquicity_permissionId");
            ShowCrudForm();
        }

        private void ShowCrudForm()
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalRole", "window.onload = function() { $('#modalRolePermission').modal('show'); }", true);
            ScriptManager.RegisterStartupScript(upUCModalForm, upUCModalForm.GetType(), "openModalRole", "$('#modalRolePermission').modal('show');", true);
            upUCModalForm.Update();
        }

        //estrategia para manejar las listas: el uso de la sesión
        private void KeepPermissionInSession(string key, List<Permission> value)
        {
            Session[key] = value;
        }
        
        private List<Permission> RetrievePermissionFromSession(string key)
        {
            return (List < Permission > ) Session[key];
        }

        /// <summary>
        /// Se establece la traducción de las columnas que quieren ser mostradas.
        /// </summary>
        /// <returns></returns>
        private Dictionary<string, string> ColumnsToShowAndTranslate()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("Name", "Nombre");
            columns.Add("Description", "Descripción");

            return columns;
        }
    } 
}