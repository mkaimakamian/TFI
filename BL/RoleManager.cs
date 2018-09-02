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
        //      /// 
        ///// <param name="user"></param>
        //public boolean AssignWebUserRole(User user)
        //      {

        //          return null;
        //      }

        //      /// 
        //      /// <param name="role"></param>
        //      public boolean CheckExistence(string role)
        //      {

        //          return null;
        //      }

        //      /// 
        //      /// <param name="id"></param>
        //      public boolean CheckUsage(int id)
        //      {

        //          return null;
        //      }

        //      /// 
        //      /// <param name="id"></param>
        //      public boolean Delete(int id)
        //      {

        //          return null;
        //      }

        /// <summary>
        /// Guarda las modificaciones del rol.
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public bool Edit(Role role)
        {
            return false;
            //RoleMapper roleMapper = new RoleMapper();
            //RolePermissionMapper rolePermissionMapper = new RolePermissionMapper();

            //if (!IsValid(role)) return false;

            //if (roleMapper.Exists(role))
            //{
            //    AddError(new ResultBE(ResultBE.Type.ALREADY_EXISTS, "Rol existente"));
            //    return false;
            //}

            //if (!roleMapper.Save(role))
            //{
            //    AddError(new ResultBE(ResultBE.Type.FAIL, "Error al grabar rol"));
            //    return false;
            //}

            ////eliminar la relación existente!!!

            //// TODO - los roles tienen una lista de permisos
            //if (!rolePermissionMapper.Save(role))
            //{
            //    AddError(new ResultBE(ResultBE.Type.FAIL, "Error al grabar permisos"));
            //    return false;
            //}

            //return true;
        }

        //      public List<Role> Get()
        //      {

        //          return null;
        //      }

        //      /// 
        //      /// <param name="id"></param>
        //      public Role Get(int id)
        //      {

        //          return null;
        //      }

        /// <summary>
        /// Devuelve la lista de roles del usuario pasado por parámetro.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public List<Role> Get(User user)
        {
            RoleMapper roleMapper = new RoleMapper();
            List<Role> roles = roleMapper.Get(user);

            if (roles == null)
            {
                AddError(new ResultBE(ResultBE.Type.EMPTY, "El usuario no posee permisos asociados."));
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

            if (role == null)
            {
                AddError(new ResultBE(ResultBE.Type.EMPTY, "El rol no posee permisos asociados."));
                return null;
            }

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

        // TODO - Agregar en ea
        /// <summary>
        /// Recupera los permisos que no fueron asociados a un rol.
        /// </summary>
        /// <returns></returns>
        public List<Permission> GetUnassignedPermission(Role role)
        {
            RolePermissionMapper rolePermissionMapper = new RolePermissionMapper();
            List<Permission> permissions = rolePermissionMapper.GetUnassigned(role);

            if (permissions == null)
            {
                AddError(new ResultBE(ResultBE.Type.EMPTY, "Sin permisos sin asignar."));
            }

            return permissions;
        }

        // TODO - Agregar en ea
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
                AddError(new ResultBE(ResultBE.Type.ALREADY_EXISTS, "Rol existente"));
                return false;
            }

            if (!roleMapper.Save(role))
            {
                AddError(new ResultBE(ResultBE.Type.FAIL, "Error al grabar rol"));
                return false;
            }

            // TODO - los roles tienen una lista de permisos
            if (!rolePermissionMapper.Save(role))
            {
                AddError(new ResultBE(ResultBE.Type.FAIL, "Error al grabar permisos"));
                return false;
            }

            return true;
        }

        private bool IsValid(Role role)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(role.Name))
            {
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, "EMPTY_FIELD_ERROR"));
                isValid = false;
            }

            if(role.Permissions.Count == 0)
            {
                AddError(new ResultBE(ResultBE.Type.EMPTY, "EMPTY_FIELD_ERROR"));
                isValid = false;
            }

            return isValid;
        }

    }
}
