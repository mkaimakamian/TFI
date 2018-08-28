﻿using System;
using System.Collections.Generic;
using System.Collections;
using System.Data;
using BE;
using DA;

namespace ORM
{
    public class UserMapper
    {
        
        //TODO - Agregar en EA
        public User Get(string username, string password)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            
            table.Add("@username", username);
            table.Add("@password", password);

            DataSet result = dal.Read(table, "spLoginUser");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                return ConvertToModel(result.Tables[0].Rows[0]);
            } else
            {
                return null;
            }
        }

        public User Get(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            User user = null;

            table.Add("@id", id);

            DataSet result = dal.Read(table, "spReadUser");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                user =  ConvertToModel(result.Tables[0].Rows[0]);
            }

            return user;
        }

        public List<User> Get()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<User> users = null;

            table.Add("@id", DBNull.Value);

            DataSet result = dal.Read(table, "spReadUser");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                users = new List<User>();

                foreach (DataRow data in result.Tables[0].Rows)
                {
                    users.Add(ConvertToModel(data));
                }
            }

            return users;
        }

        public bool Delete(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            table.Add("@id", id);
            return dal.Write(table, "spDeleteUser");
        }

        public bool Edit(User user)
        {

            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@username", user.Username);
            table.Add("@password", user.Password);
            table.Add("@mail", user.Mail);
            table.Add("@active", user.Active);
            table.Add("@locked", user.Locked);
            table.Add("@language", user.Language.Id);
            table.Add("@name", user.Name);
            table.Add("@lastname", user.Lastname);
            table.Add("@lastupdate", user.Lastupdate);

            return dal.Write(table, "spModifyUser");
        }

        // TODO - Agregar en EA
        /// <summary>
        /// Convierte el dataset al modelo de datos correspondiente.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private User ConvertToModel(DataRow data)
        {
            User user = new User();
            user.Id = Convert.ToInt32(data["id"].ToString());
            user.Username = data["username"].ToString();
            user.Password = data["password"].ToString();
            user.Mail = data["mail"].ToString();
            user.Active = Convert.ToBoolean(data["active"]);
            user.Locked = Convert.ToBoolean(data["locked"]);
            user.Language.Id = Convert.ToInt32(data["languageId"]);
            user.Name = data["name"].ToString();
            user.Lastname = data["lastname"].ToString();
            user.Lastupdate = Convert.ToDateTime(data["lastupdate"]);
            return user;
        }






        //      public bool Exists(string username)
        //      {

        //          return true;
        //      }





        //      public User Get(string username)
        //      {

        //          return null;
        //      }

        //      public List<User> Get(List<QueryFilter> queryFilter)
        //      {

        //          return null;
        //      }

        /// <summary>
        /// Save an user into database.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public bool Save(User user)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@username", user.Username);
            table.Add("@password", user.Password);
            table.Add("@mail", user.Mail);
            table.Add("@active", user.Active);
            table.Add("@locked", user.Locked);
            table.Add("@language", user.Language.Id);
            table.Add("@name", user.Name);
            table.Add("@lastname", user.Lastname);
            table.Add("@lastupdate", user.Lastupdate);

            return dal.Write(table, "spWriteUser");
        }
    }
}
