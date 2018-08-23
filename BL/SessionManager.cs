using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;
using Helper;

namespace BL
{
    //TODO - Agregar A EA
    public class SessionManager:BaseManager
    {
     
        /// <summary>
        /// Autentica el usuario ante el sistema.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public User LogIn(string username, string password)
        {
            if (!IsValid(username, password)) return null;

            UserMapper mapper = new UserMapper();
            RoleManager roleManager = new RoleManager();
            LanguageManager languageManager = new LanguageManager();

            User user = mapper.Get(username, password);

            if (user == null)
            {
                AddError(new ResultBE(ResultBE.Type.INVALID_CREDENTIAL, "Usuario no existe: " + username));
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

        //TODO - Agregar en EA
        private bool IsValid(string username, string password)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(username))
            {
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, "EMPTY_FIELD_ERROR"));
                isValid = false;
            }
            if (String.IsNullOrEmpty(password))
            {
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, "EMPTY_FIELD_ERROR"));
                isValid = false;
            }

            return isValid;
        }
    }
}
