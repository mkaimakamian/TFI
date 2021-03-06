﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;
using Helper;

namespace BL
{
    public class SessionManager:BaseManager
    {
     
        /// <summary>
        /// Autentica el usuario ante el sistema.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public User LogIn(string mail, string password)
        {
            if (!IsValid(mail, password)) return null;

            UserMapper mapper = new UserMapper();
            RoleManager roleManager = new RoleManager();
            LanguageManager languageManager = new LanguageManager();
            
            User user = mapper.Get(mail, password);
            
            // TODO - APLICAR CONTROL DE LOCKEO

            if (!IsValidAfterRetrieve(user)) return null;
            
            //Se debería recuperar el idioma en caso de utilizar managr de idioma
            List<Role> roles = roleManager.Get(user);
            
            // Si no posee permisos asociados, debería poder navegar igual aunque a los efectos prácticos
            // sería como si estuviese navegando como cualquier visitante
            if (roleManager.HasErrors)
            {
                Errors.AddRange(roleManager.Errors);
                //return null;
            }

            user.Roles = roles;
            
            log.AddLogInfo("LogIn", "Usuario " + user.Mail + " identificado exitosamente.", this);
            return user; 
        }

        private bool IsValid(string mail, string password)
        {
            bool isValid = true;
            isValid &= VLetterNumbers(mail, 1, 50, "Usuario (mail)", "IsValid");
            isValid &= VLetterNumbers(password, 6, 50, "Password", "IsValid");
            return isValid;
        }

        private bool IsValidAfterRetrieve(User user)
        {
            if (user == null)
            {
                string errorDescription = "Credenciales inválidas.";
                log.AddLogWarn("LogIn", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INVALID_CREDENTIAL, errorDescription));
                return false;
            }

            if (!user.Active)
            {
                string errorDescription = "El usuario " + user.Mail + " no está activo.";
                log.AddLogWarn("LogIn", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INACTIVE_USER, errorDescription));
                return false;
            }

            if (user.Locked)
            {
                string errorDescription = "El usuario " + user.Mail + " está bloqueado.";
                log.AddLogWarn("LogIn", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.LOCKED_USER, errorDescription));
                return false;
            }

            return true;
        }

        public override string ToString() { return "User"; }
    }
}
