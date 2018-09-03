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
        

        //public bool ActivateAccount(User user)
        //{

        //    return true;
        //}

   
        //public bool CheckExistence(string username)
        //{

        //    return true;
        //}
        public List<User> GetUserWithoutRole()
        {
            UserRoleMapper userRoleMapper = new UserRoleMapper();
            List<User> users = userRoleMapper.GetUserWithoutRole();

            if (users == null)
            {
                AddError(new ResultBE(ResultBE.Type.EMPTY, "Sin usuarios "));
            }
            
            return users;
        }

        public bool Delete(int id)
        {
            UserMapper mapper = new UserMapper();
            return mapper.Delete(id);
        }

        /// <summary>
        /// Guarda los cambios del modelo.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public bool Edit(User user)
        {
            UserMapper mapper = new UserMapper();

            if (!IsValidForSave(user)) return false;

            // Setting up default values
            user.Lastupdate = DateTime.Now;
            user.Locked = true;
            user.Active = false;

            if (!mapper.Edit(user))
            {
                AddError(new ResultBE(ResultBE.Type.FAIL, "Error al grabar"));
                return false;
            }

            return true;
        }

        public List<User> Get()
        {
            UserMapper mapper = new UserMapper();
            UserRoleMapper userRoleMapper = new UserRoleMapper();
            RoleManager roleManager = new RoleManager();

            List<User> users = mapper.Get();

            if (users == null)
            {
                AddError(new ResultBE(ResultBE.Type.EMPTY, "Sin usuarios "));
                return users;
            }

            foreach (User user in users)
            {
                user.Roles = roleManager.Get(user);
            }
            
            return users;
        }

        public User Get(int id)
        {
            UserMapper mapper = new UserMapper();
            RoleManager roleManager = new RoleManager();
            LanguageManager languageManager = new LanguageManager();

            User user = mapper.Get(id);

            if (user == null)
            {
                AddError(new ResultBE(ResultBE.Type.NULL, "Usuario no existe: " + id));
                return null;
            }
            //if (!user.Active) return new ResultBE(ResultBE.Type.INACTIVE_USER, "Usuario inactivo: " + username);

            //TODO - Ver si hay que incluir la opción de lockeo cuando el usuario se equivoca
            //if (!user.Locked) return new ResultBE(ResultBE.Type.OK, "Usuario encontrado: " + username);

            user.Language = languageManager.Get(user.Language.Id);

            if (languageManager.HasErrors)
            {
                Errors.AddRange(languageManager.Errors);
                return null;
            }

            List<Role> roles = roleManager.Get(user);

            if (roleManager.HasErrors)
            {
                Errors.AddRange(roleManager.Errors);
                return null;
            }

            user.Roles = roles;
            return user;
        }

        //public User Get(string username)
        //{

        //    return null;
        //}

        //public List<User> Get(List<QueryFilter> queryFilter)
        //{

        //    return null;
        //}

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
            user.Locked = false;
            user.Active = true;

            if (!mapper.Save(user))
            {
                AddError(new ResultBE(ResultBE.Type.FAIL, "Error al grabar"));
                return false;                
            }

            return true;
        }

        public bool SaveForWeb(User user)
        {
            //validar
            //enviar mail
            //asignar permisos
            //guardar
            return Save(user);
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
