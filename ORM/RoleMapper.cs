﻿using System;
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

        /// <summary>
        /// Elimina el rol.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(int roleId)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@roleId", roleId);
            return dal.Write(table, "spDeleteRole") > 0;
        }

        /// <summary>
        /// Guarda los cambios del rol.
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public bool Edit(Role role)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@id", role.Id);
            table.Add("@name", role.Name);
            table.Add("@description", role.Description);

            return dal.Write(table, "spModifyRole") > 0;
        }

        /// <summary>
        /// Chequea si existe un rol con el mismo nombre.
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public bool Exists(Role role)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@roleId", DBNull.Value);
            table.Add("@roleName", role.Name);

            DataSet result = dal.Read(table, "spCheckRoleExistence");

            return result != null && result.Tables[0].Rows.Count > 0;
        }
        
        /// <summary>
        /// Recupera el rol cuyo id es pasado por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Role Get(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            Role role = null;

            table.Add("@id", id);
            table.Add("@userId", DBNull.Value);
            table.Add("@name", DBNull.Value);
            table.Add("@userOnly", false);

            DataSet result = dal.Read(table, "spReadRole");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                role = ConvertToModel(result.Tables[0].Rows[0]);
            }

            return role;
        }

        /// <summary>
        /// Devuelve la lista de roles que se asignan a los usuarios.
        /// </summary>
        /// <returns></returns>
        public List<Role> GetForWebUser()
        {
            return Get(true);
        }

        /// <summary>
        /// Recupera el listado completo de roles.
        /// </summary>
        /// <returns></returns>
        public List<Role> Get(bool userOnly = false)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<Role> roles = null;

            table.Add("@id", DBNull.Value);
            table.Add("@userId", DBNull.Value);
            table.Add("@name", DBNull.Value);
            table.Add("@userOnly", userOnly);

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

        /// <summary>
        /// Persiste el rol pasado por parámetro.
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
            return role.Id > 0;
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
    }
}
