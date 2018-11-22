using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class RoleManager: BaseManager
    {
        /// <summary>
        /// Elimina el rol cuyo id es pasado por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(int id)
        {
            RoleMapper rolMapper = new RoleMapper();
            RolePermissionMapper rolePermissionMapper = new RolePermissionMapper();
            UserRoleMapper userRolMapper = new UserRoleMapper();

            if (!userRolMapper.InUse(id))
            {
                //TODO - falta agregar control de error aquí
                rolePermissionMapper.Delete(id);
                rolMapper.Delete(id);
            } else
            {
                string errorDescription = "El rol está en uso.";
                log.AddLogCritical("Delete", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.RELATIONSHIP_ERROR, errorDescription));
            }
            return true;
        }

        /// <summary>
        /// Persiste el rol y los permisos asociados.
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public bool Save(Role role)
        {

            RoleMapper roleMapper = new RoleMapper();
            RolePermissionMapper rolePermissionMapper = new RolePermissionMapper();

            if (!IsValid(role)) return false;

            if (roleMapper.Exists(role))
            {
                string errorDescription = "Ya existe un rol con ese nombre.";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.ALREADY_EXISTS, errorDescription));
                return false;
            }

            if (!roleMapper.Save(role))
            {
                string errorDescription = "Error al grabar rol";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            // TODO - los roles tienen una lista de permisos
            if (!rolePermissionMapper.SavePermissionForRole(role))
            {
                string errorDescription = "Error al asociar los permisos al rol.";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        /// <summary>
        /// Guarda las modificaciones del rol.
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public bool Edit(Role role)
        {
            RoleMapper roleMapper = new RoleMapper();
            RolePermissionMapper rolePermissionMapper = new RolePermissionMapper();

            if (!IsValid(role)) return false;

            if (roleMapper.Exists(role))
            {
                string errorDescription = "Ya existe rol con ese nombre";
                log.AddLogWarn("Edit", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.ALREADY_EXISTS, errorDescription));
                return false;
            }

            if (!roleMapper.Edit(role))
            {
                string errorDescription = "No se pudo actualizar el rol.";
                log.AddLogCritical("Edit", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            // TODO - los roles tienen una lista de permisos y deberían guardarse en la misma transacción
            if (!rolePermissionMapper.Edit(role))
            {
                string errorDescription = "No se ha podido guardar la nómina de permisos asociados al rol.";
                log.AddLogCritical("Edit", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        /// <summary>
        /// Guarda los roles que le han sido asignado a un usuario.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public bool SaveRoleForUser(User user)
        {
            if (!IsValidForUserAssignation(user)) return false;

            RolePermissionMapper rolePermissionMapper = new RolePermissionMapper();
            bool success = rolePermissionMapper.SaveRoleForUser(user);

            if (!success)
            {
                string errorDescription = "No se han podido asgnar los roles.";
                log.AddLogCritical("EditRoleForUser", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
            }

            return success;
        }

        /// <summary>
        /// Guarda los cambios que 
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public bool EditRoleForUser(User user)
        {
            if (!IsValidForUserAssignation(user)) return false;
           
            RolePermissionMapper rolePermissionMapper = new RolePermissionMapper();
            bool success = rolePermissionMapper.EditRoleForUser(user);
            
            if (!success)
            {
                string errorDescription = "No se han podido asignar los roles al usuario.";
                log.AddLogCritical("EditRoleForUser", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
            }

            return success;
        }

        /// <summary>
        /// Devuelve la lista de roles del usuario pasado por parámetro.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public List<Role> Get(User user)
        {
            RolePermissionMapper rolePermissionMapper = new RolePermissionMapper();
            UserRoleMapper userRoleMapper = new UserRoleMapper();
            List<Role> roles = userRoleMapper.Get(user);

            if (roles == null)
            {
                string errorDescription = "El usuario " + user.Mail + " no posee permisos asociados.";
                log.AddLogInfo("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.EMPTY, errorDescription));
            } else
            {
                //TODO - revisar la performance
                foreach (Role role in roles) role.Permissions = rolePermissionMapper.Get(role);
            }

            return roles;
        }

        /// <summary>
        /// Recupera el rol cuyo id es pasado por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Role Get(int id)
        {
            RolePermissionMapper rolePermissionMapper = new RolePermissionMapper();
            RoleMapper roleMapper = new RoleMapper();

            Role role = roleMapper.Get(id);

            if (role == null)
            {
                AddError(new ResultBE(ResultBE.Type.EMPTY, "No se encontró el el rol con id " + id));
                return null;
            }

            List<Permission> permissions = rolePermissionMapper.Get(role);
            role.Permissions = permissions;

            return role;
        }

        /// <summary>
        /// Devuelve la lista de roles completa.
        /// </summary>
        /// <returns></returns>
        public List<Role> Get()
        {
            RoleMapper roleMapper = new RoleMapper();
            List<Role> roles = roleMapper.Get();

            if (roles == null)
            {
                AddError(new ResultBE(ResultBE.Type.EMPTY_PROFILE, "No existen roles."));
            }

            return roles;
        }

        /// <summary>
        /// Recupera los roles que son exclusivamente de usuarios web
        /// </summary>
        /// <returns></returns>
        public List<Role> GetForWebUser()
        {
            RoleMapper roleMapper = new RoleMapper();
            List<Role> roles = roleMapper.GetForWebUser();

            if (roles == null)
            {
                AddError(new ResultBE(ResultBE.Type.EMPTY_PROFILE, "No existen roles."));
            }

            return roles;
        }

        /// <summary>
        /// Recupera los permisos que no fueron asociados a un rol.
        /// </summary>
        /// <returns></returns>
        public List<Permission> GetUnassignedPermission(Role role)
        {
            RolePermissionMapper rolePermissionMapper = new RolePermissionMapper();
            return rolePermissionMapper.GetUnassignedPermission(role);
        }

        public List<Permission> GetAllPermission()
        {
            RolePermissionMapper rolePermissionMapper = new RolePermissionMapper();
            List<Permission> permissions = rolePermissionMapper.Get();

            if (permissions == null)
            {
                AddError(new ResultBE(ResultBE.Type.EMPTY, "Sin permisos sin asignar."));
            }

            return permissions;
        }

        /// <summary>
        /// Devuelve la lista de roles disponibles para un usuario.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public List<Role> GetUnassignedRole(User user)
        {
            RolePermissionMapper rolePermissionMapper = new RolePermissionMapper();
            return rolePermissionMapper.GetUnassignedRole(user);
        }

        private bool IsValid(Role role)
        {
            bool isValid = true;
            isValid &= VLetterNumbers(role.Name, 1, 50, "Nombre", "IsValid");

            if(role.Permissions.Count == 0)
            {
                string errorDescription = "El rol debe estar asociado a almenos un permiso.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = isValid & false;
            }

            return isValid;
        }

        private bool IsValidForUserAssignation(User user)
        {
            if (user.Roles == null || user.Roles.Count == 0)
            {
                string errorDescription = "Debe asignarse al menos un rol.";
                log.AddLogWarn("EditRoleForUser", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.EMPTY, errorDescription));
                return false;
            }

            return true;
        }

        public override string ToString() { return "Role"; }
    }
}
