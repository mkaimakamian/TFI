using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using DA;
using BE;

namespace ORM
{
    // TODO - agregar en ea
    public class UserRoleMapper
    {
        public bool InUse(int roleId)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@roleId", roleId);
            table.Add("@inUse", true);
            table.Add("@userId", DBNull.Value);

            DataSet result = dal.Read(table, "spReadUserRole");

            return result != null && result.Tables[0].Rows.Count > 0;
        }

        /// <summary>
        /// Recupera el listado de roles a los que pertenece el usuario.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public List<Role> Get(User user)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<Role> roles = null;

            table.Add("@userId", user.Id);
            table.Add("@inUse", DBNull.Value);
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

        public List<User> GetUserWithoutRole()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<User> users = null;

            table.Add("@userId", DBNull.Value);
            table.Add("@inUse", false);
            table.Add("@roleId", DBNull.Value);

            DataSet result = dal.Read(table, "spReadUserRole");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                users = new List<User>();

                foreach (DataRow data in result.Tables[0].Rows)
                {
                    users.Add(ConvertToUserModel(data));
                }
            }

            return users;
        }

        private Role ConvertToRoleModel(DataRow data)
        {
            return new Role
            {
                Id = Convert.ToInt32(data["id"]),
                Name = data["name"].ToString(),
                Description = data["description"].ToString()
            };
        }

        private User ConvertToUserModel(DataRow data)
        {
            User user = new User();
            user.Id = int.Parse(data["id"].ToString());
            user.Password = data["password"].ToString();
            user.Mail = data["mail"].ToString();
            user.Active = Convert.ToBoolean(data["active"]);
            user.Locked = Convert.ToBoolean(data["locked"]);
            user.Language.Id = int.Parse(data["languageId"].ToString());
            user.Name = data["name"].ToString();
            user.Lastname = data["lastname"].ToString();
            user.Lastupdate = Convert.ToDateTime(data["lastupdate"]);
            return user;
        }
    }
}
