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
            
            // TODO - APLICAR CONTROL DE LOCKEO

            if (!IsValidAfterRetrieve(user)) return null;
            
            user.Language = languageManager.Get(user.Language.Id);

            if (languageManager.HasErrors)
            {
                Errors.AddRange(languageManager.Errors);
                return null;
            }
            
            List<Role> roles = roleManager.Get(user);
            
            // Si no posee permisos asociados, debería poder navegar igual aunque a los efectos prácticos
            // sería como si estuviese navegando como cualquier visitante
            if (roleManager.HasErrors)
            {
                Errors.AddRange(roleManager.Errors);
                //return null;
            }

            user.Roles = roles;
            
            log.AddLogInfo("LogIn", "Usuaerio " + user.Username + " identificado exitosamente.", this);
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
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            return isValid;
        }

        //TODO - Agregar en EA
        private bool IsValidAfterRetrieve(User user)
        {
            if (user == null)
            {
                string errorDescription = "El usuario no existe.";
                log.AddLogWarn("LogIn", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INVALID_CREDENTIAL, errorDescription));
                return false;
            }

            if (!user.Active)
            {
                string errorDescription = "El usuario " + user.Username + " no está activo.";
                log.AddLogWarn("LogIn", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INACTIVE_USER, errorDescription));
                return false;
            }

            if (user.Locked)
            {
                string errorDescription = "El usuario " + user.Username + " está bloqueado.";
                log.AddLogWarn("LogIn", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.LOCKED_USER, errorDescription));
                return false;
            }

            return true;
        }
    }
}
