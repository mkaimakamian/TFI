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

        //      /// 
        //      /// <param name="role"></param>
        //      public boolean Edit(Rol role)
        //      {

        //          return null;
        //      }

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
                AddError(new ResultBE(ResultBE.Type.EMPTY_PROFILE, "No existen roles."));
                return null;
            }

            return roles;
        }

        //      /// 
        //      /// <param name="role"></param>
        //      public boolean Save(Role role)
        //      {

        //          return null;
        //      }

        //      /// 
        //      /// <param name="user"></param>
        //      /// <param name="roles"></param>
        //      public boolean Save(User user, List<Role> roles)
        //      {

        //          return null;
        //      }

    }
}
