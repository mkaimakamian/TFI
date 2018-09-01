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
                string errorDescription = "El usuario " + username+" no existe.";
                log.AddLogWarn("LogIn", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INVALID_CREDENTIAL, errorDescription));
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

            //TODO - Habilitar roles
            //if (roleManager.HasErrors)
            //{
            //    Errors.AddRange(roleManager.Errors);
            //    return null;
            //}

            user.Roles = roles;
            
            log.AddLogInfo("LogIn", "éxito", this);
            return user; 
        }

        //TODO - Agregar en EA
        private bool IsValid(string username, string password)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(username))
            {
                string errorDescription = "Nombre de usuario incompleto";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(password))
            {
                string errorDescription = "Password incompleto";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, "EMPTY_FIELD_ERROR"));
                isValid = false;
            }

            return isValid;
        }
    }
}
