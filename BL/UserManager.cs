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
        public bool Save(User user)
        {
            UserMapper mapper = new UserMapper();

            if (!IsValidForSave(user)) return false;

            // Setting up default values
            user.Lastupdate = DateTime.Now;
            user.Locked = true;
            user.Active = false;

            if (!mapper.Save(user))
            {
                AddError(new ResultBE(ResultBE.Type.FAIL, "Error al grabar"));
                return false;                
            }

            return true;
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

        //TODO - agregar en ea
        private bool IsValidForSave(User user)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(user.Name))
            {
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, "EMPTY_FIELD_ERROR"));
                isValid = false;
            }

            if (String.IsNullOrEmpty(user.Lastname))
            {
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, "EMPTY_FIELD_ERROR"));
                isValid = false;
            }

            if (String.IsNullOrEmpty(user.Username))
            {
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, "EMPTY_FIELD_ERROR"));
                isValid = false;
            }

            if (String.IsNullOrEmpty(user.Mail))
            {
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, "EMPTY_FIELD_ERROR"));
                isValid = false;
            }

            if (String.IsNullOrEmpty(user.Password))
            {
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, "EMPTY_FIELD_ERROR"));
                isValid = false;
            }

            //TODO - usuario no debe existir!!
            return isValid;
        }

       
    }
}
