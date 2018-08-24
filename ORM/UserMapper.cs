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
        

		//public bool Delete(int id)
  //      {

  //          return true;
  //      }

  //      public bool Edit(User user)
  //      {

  //          return true;
  //      }

  //      public bool Exists(string username)
  //      {

  //          return true;
  //      }

  //      public List<User> Get()
  //      {

  //          return null;
  //      }

  //      public User Get(int id)
  //      {

  //          return null;
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

            return dal.Write(table, "spWriteUse");
        }
    }
}
