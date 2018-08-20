using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class UserManager:BaseManager
    {
        

        public bool ActivateAccount(User user)
        {

            return true;
        }

   
        public bool CheckExistence(string username)
        {

            return true;
        }

        public bool Delete(int id)
        {

            return true;
        }

        public bool Edit(User user)
        {

            return true;
        }

        public List<User> Get()
        {

            return null;
        }

        public User Get(int id)
        {

            return null;
        }

        public User Get(string username)
        {

            return null;
        }

        public List<User> Get(List<QueryFilter> queryFilter)
        {

            return null;
        }

        /// <summary>
        /// Creates a user for backoffice.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public ResultBE Save(User user)
        {
            ResultBE validation = ValidateForSave(user);
            if (!validation.IsValid) return validation;

            try {
                UserMapper mapper = new UserMapper();

                // Setting up default values
                user.Lastupdate = DateTime.Now;
                user.Locked = true;
                user.Active = false;

                if (mapper.Save(user))
                {
                    return new ResultBE(ResultBE.Type.OK);
                } else
                {
                    return new ResultBE(ResultBE.Type.FAIL);
                }

            } catch (Exception e)
            {
                //Notificar situación
                return new ResultBE(ResultBE.Type.EXCEPTION, e.Message, e);
            }

        }

        public bool SaveForWeb(User user)
        {

            return true;
        }

        public bool SendActivation(User user)
        {

            return true;
        }

        public bool SendRecovery(User user)
        {

            return true;
        }

        private ResultBE ValidateForSave(User user)
        {
            if (String.IsNullOrEmpty(user.Name))
            {
                //Log
                return new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, "EMPTY_FIELD_ERROR");
            }

            if (String.IsNullOrEmpty(user.Lastname))
            {
                //Log
                return new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, "EMPTY_FIELD_ERROR");
            }

            if (String.IsNullOrEmpty(user.Username))
            {
                //Log
                return new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, "EMPTY_FIELD_ERROR");
            }

            if (String.IsNullOrEmpty(user.Mail))
            {
                //Log
                return new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, "EMPTY_FIELD_ERROR");
            }

            if (String.IsNullOrEmpty(user.Password))
            {
                //Log
                return new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, "EMPTY_FIELD_ERROR");
            }
            return new ResultBE(ResultBE.Type.OK);
        }

       
    }
}
