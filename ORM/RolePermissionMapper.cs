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
    //TODO - agregar en ea
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

        public bool Delete(int roleId)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@roleId", roleId);
            return dal.Write(table, "spDeleteRolePermission") > 0;
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

        public List<Permission> GetUnassigned(Role role)
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
                    permissions.Add(ConvertToModel(data));
                }
            }

            return permissions;
        }

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
                    permissions.Add(ConvertToModel(data));
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
                    permissions.Add(ConvertToModel(data));
                }
            }

            return permissions;
        }

        private Permission ConvertToModel(DataRow data)
        {
            return new Permission
            {
                Id = int.Parse(data["id"].ToString()),
                Description = data["description"].ToString(),
                UrlAccess = data["urlAccess"].ToString()
            };
        }
    }
}
