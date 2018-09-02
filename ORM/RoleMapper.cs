using System;
using System.Data;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using DA;

namespace ORM
{
    public class RoleMapper
    {
        //      /// 
        ///// <param name="id"></param>
        //public boolean CheckUsage(int id)
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
        //      public boolean Edit(Role role)
        //      {

        //          return null;
        //      }

        //TODO - Cambiar el tipo de parámetro en ea
        /// <summary>
        /// Chequea si existe un rol con el mismo nombre.
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public bool Exists(Role role)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@id", DBNull.Value);
            table.Add("@userId", DBNull.Value);
            table.Add("@name", role.Name);

            DataSet result = dal.Read(table, "spReadRole");

            return result != null && result.Tables[0].Rows.Count > 0;
        }
        
        public Role Get(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            Role role = null;

            table.Add("@id", id);
            table.Add("@userId", DBNull.Value);
            table.Add("@name", DBNull.Value);

            DataSet result = dal.Read(table, "spReadRole");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                role = ConvertToModel(result.Tables[0].Rows[0]);
            }

            return role;
        }

        //      public List<Role> Get()
        //      {

        //          return null;
        //      }

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

            table.Add("@id", DBNull.Value);
            table.Add("@userId", user.Id);
            table.Add("@name", DBNull.Value);

            DataSet result = dal.Read(table, "spReadRole");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                roles = new List<Role>();

                foreach (DataRow data in result.Tables[0].Rows) {
                    roles.Add(ConvertToModel(data));
                }
            }

            return roles;
        }

        public List<Role> Get()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<Role> roles = null;

            table.Add("@id", DBNull.Value);
            table.Add("@userId", DBNull.Value);
            table.Add("@name", DBNull.Value);

            DataSet result = dal.Read(table, "spReadRole");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                roles = new List<Role>();

                foreach (DataRow data in result.Tables[0].Rows)
                {
                    roles.Add(ConvertToModel(data));
                }
            }

            return roles;
        }

        private Role ConvertToModel(DataRow data)
        {
            return new Role
            {
                Id = Convert.ToInt32(data["id"]),
                Name = data["name"].ToString(),
                Description = data["description"].ToString()
            };
        }

        /// <summary>
        /// Persiste el rol.
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public bool Save(Role role)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@name", role.Name);
            table.Add("@description", role.Description);
            role.Id = dal.Write(table, "spWriteRole");
            return true;
        }

        //TODO - ver si este método puede recibir únicamente User
        //      /// 
        //      /// <param name="user"></param>
        //      /// <param name="roles"></param>
        //      public boolean Save(User user, List<Role> roles)
        //      {

        //          return null;
        //      }

        //      /// 
        //      /// <param name="user"></param>
        //      public boolean SaveWebUserRol(User user)
        //      {

        //          return null;
        //      }
    }
}
