using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using BE;
using DA;

namespace ORM
{
    public class RolePermissionMapper
    {
        /// <summary>
        /// La edición de la relación consiste en la eliinación y recreación de las relaciones.
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public bool Edit(Role role) {
            bool result = Delete(role.Id);
            return result && SavePermissionForRole(role);
        }

        /// <summary>
        /// Elimina el rol cuyo id es pasado por parámetro.
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public bool Delete(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@roleId", id);
            return dal.Write(table, "spDeleteRolePermission") > -1;
        }

        /// <summary>
        /// Guarda la relación rol - permisos
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public bool SavePermissionForRole(Role role)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            bool result = true;
            //TODO -  Cambiar para que soporte transaccionalidad
            foreach (Permission permission in role.Permissions)
            {
                table.Remove("@roleId");
                table.Remove("@permissionId");

                table.Add("@roleId", role.Id);
                table.Add("@permissionId", permission.Id);
                result = result & dal.Write(table, "spWriteRolePermission") > 0;
            }

            return result;
        }

        /// <summary>
        /// Guarda la relación usuario - rol
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public bool SaveRoleForUser(User user)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            bool result = true;

            table.Add("@userId", user.Id);

            //TODO -  Cambiar para que soporte transaccionalidad
            foreach (Role role in user.Roles)
            {
                table.Remove("@roleId");
                table.Add("@roleId", role.Id);
                result = result & dal.Write(table, "spWriteUserRole") > 0;
            }

            return result;
        }

        public bool EditRoleForUser(User user)
        {
            DeleteRoleForUser(user);
            return SaveRoleForUser(user);
        }

        /// <summary>
        /// Elimina las relación usuario - rol.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        private bool DeleteRoleForUser(User user)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@userId", user.Id);
            return dal.Write(table, "spDeleteUserRole") > 0;
        }

        /// <summary>
        /// Recupera todos los permisos que no se encuentren asignados al rol.
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public List<Permission> GetUnassignedPermission(Role role)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<Permission> permissions = null;

            table.Add("@roleId", role.Id);
            table.Add("@unassigned", true);

            DataSet result = dal.Read(table, "spReadRolePermission");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                permissions = new List<Permission>();

                foreach (DataRow data in result.Tables[0].Rows)
                {
                    permissions.Add(ConvertToPermissionModel(data));
                }
            }

            return permissions;
        }

        /// <summary>
        /// Recupera todos los roles disponibles para el usuario pasado por parámetro.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public List<Role> GetUnassignedRole(User user)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<Role> roles = null;

            table.Add("@inUse", false);
            table.Add("@userId", user.Id);
            table.Add("@roleId", DBNull.Value);

            DataSet result = dal.Read(table, "spReadUserRole");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                roles = new List<Role>();

                foreach (DataRow data in result.Tables[0].Rows)
                {
                    roles.Add(ConvertToRoleModel(data));
                }
            }

            return roles;
        }

        /// <summary>
        /// Recupera todos los permisos.
        /// </summary>
        /// <returns></returns>
        public List<Permission> Get()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<Permission> permissions = null;

            table.Add("@roleId", DBNull.Value);
            table.Add("@unassigned", DBNull.Value);

            DataSet result = dal.Read(table, "spReadRolePermission");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                permissions = new List<Permission>();

                foreach (DataRow data in result.Tables[0].Rows)
                {
                    permissions.Add(ConvertToPermissionModel(data));
                }
            }

            return permissions;
        }

        /// <summary>
        /// Recupera la lista de permisos asociados a un rol.
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public List<Permission> Get(Role role)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<Permission> permissions = null;

            table.Add("@roleId", role.Id);
            table.Add("@unassigned", false);

            DataSet result = dal.Read(table, "spReadRolePermission");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                permissions = new List<Permission>();

                foreach (DataRow data in result.Tables[0].Rows)
                {
                    permissions.Add(ConvertToPermissionModel(data));
                }
            }

            return permissions;
        }

        private Permission ConvertToPermissionModel(DataRow data)
        {
            return new Permission
            {
                Id = int.Parse(data["id"].ToString()),
                Description = data["description"].ToString(),
                UrlAccess = data["urlAccess"].ToString()
            };
        }

        private Role ConvertToRoleModel(DataRow data)
        {
            return new Role
            {
                Id = int.Parse(data["id"].ToString()),
                Name = data["name"].ToString(),
                Description = data["description"].ToString()
            };
        }
    }
}
