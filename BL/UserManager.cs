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
    public class UserManager:BaseManager
    {

        public bool ActivateAccount(string hash)
        {
            if (!IsValidHash(hash)) return false;
            string activation = hash.Substring(0, 32);
            int userId = int.Parse(hash.Substring(32, hash.Length - 32));

            UserMapper userMapper = new UserMapper();
            User user = userMapper.Get(userId);

            if (user == null)
            {
                // Siempre se devuelve true para ofuscar
                string errorDescription = "¡Parece que estamos teniendo inconvenientes con el sistema!";
                log.AddLogCritical("ActivateAccount", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            if (SecurityHelper.IsEquivalent(user.Mail + user.Lastupdate.Minute, activation))
            {
                //activo!
                user.Locked = false;
                user.Active = true;
                user.Lastupdate = DateTime.Now;

                if (!userMapper.Edit(user))
                {
                    // Siempre se devuelve true para ofuscar
                    string errorDescription = "Quizá quieras solicitar la contraseña de nuevo... el sistema no está actualmente disponible (solo es momentáneo!)";
                    log.AddLogCritical("ActivateAccount", errorDescription, this);
                    AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                    return false;
                } 

                return true;
            } else
            {
                // Siempre se devuelve true para ofuscar // bería mostrar el formulario? cuando?
                string errorDescription = "Excelente! gracias por recuperar tu password :D";
                log.AddLogWarn("Edit", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return true;
            }
        }

        public bool ResetPasswordAction(String password, string passwordHash)
        {
            if (!IsValidHash(passwordHash)) return false;
            string recovery = passwordHash.Substring(0, 32);
            int userId = int.Parse(passwordHash.Substring(32, passwordHash.Length - 32));
            UserMapper userMapper = new UserMapper();
            User user = userMapper.Get(userId);

            if (SecurityHelper.IsEquivalent(user.Mail + user.Lastupdate.Minute, recovery))
            {
                user.Password = password;
                return Edit(user);
            } else
            {
                // Siempre se devuelve true para ofuscar // bería mostrar el formulario? cuando?
                string errorDescription = "Excelente! gracias por recuperar tu password :D";
                log.AddLogWarn("Edit", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return true;
            }
        }

        /// <summary>
        /// Envía un mail para informarle al usuario que inició el proceso de cambio de contraseña.
        /// acorde.
        /// </summary>
        /// <param name="mail"></param>
        public bool ResetPasswordRequest(string mail)
        {

            if (!IsValidForRecover(mail)) return false;

            UserMapper mapper = new UserMapper();
            User user = mapper.Get(mail);

            if (user == null)
            {
                // Si no se encuentra, no se informa para ofuscar posibles ataques
                string errorDescription = "No se ha encontrado usuario "+ mail +".";
                log.AddLogCritical("ResetPassword", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.NULL, errorDescription));
            } else
            {
                string activationHash = SecurityHelper.Encrypt(user.Mail + user.Lastupdate.Minute) + user.Id;
                MailerHelper.SendResetPassword(user, activationHash);
            }

            return true;
        }

        /// <summary>
        /// Fuerza el cambio de password de un usuario, anulando la contraseña actual.
        /// </summary>
        /// <param name="userId"></param>
        public void ResetPasswordRequest(int userId)
        {
            UserMapper mapper = new UserMapper();
            User user = mapper.Get(userId);

            if (user == null)
            {
                // Si no se encuentra, no se informa para ofuscar posibles ataques
                string errorDescription = "No se ha encontrado usuario con id " + userId + ".";
                log.AddLogCritical("ResetPassword", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.NULL, errorDescription));
            }
            else
            {
                //Se asigna un password cualquiera para invalidar el acceso
                user.Password = DateTime.Now.Ticks.ToString();

                // TODO - controlar errores
                Edit(user);

                //Se recupera porque a veces hay problemas con el hash
                user = Get(userId);

                string activationHash = SecurityHelper.Encrypt(user.Mail + user.Lastupdate.Minute) + user.Id;
                MailerHelper.SendResetPasswordByAdmin(user, activationHash);
            }
        }

        /// <summary>
        /// Realiza el reseteo solicitado por el usuario desde la sección profile o apartado correspondiente.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public bool RestPassword(User user)
        {
            bool success = Edit(user);
            if (success) MailerHelper.SendResetPasswordConfirmation(user);
            return success;
        }

        public List<User> GetUserWithoutRole()
        {
            UserRoleMapper userRoleMapper = new UserRoleMapper();
            List<User> users = userRoleMapper.GetUserWithoutRole();

            if (users == null)
            {
                string errorDescription = "Todos los usuarios poseen roles asociados.";
                log.AddLogWarn("GetUserWithoutRole", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.EMPTY, errorDescription));
            }
            
            return users;
        }

        public bool Delete(int id)
        {
            //Agregado de último momento
            User user = SessionHelper.GetUser();
            if (user.Id == id)
            {
                string errorDescription = "No e sposible elimiar el usuario porque es el mismo que está ejecutando la acción.";
                log.AddLogWarn("Delete", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.EMPTY, errorDescription));
                return false;
            }

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
            
            if (!IsValidForEdit(user)) return false;

            user.Lastupdate = DateTime.Now;

            //Deberían ser opciones que el administrador pudiera seleccionar
            //user.Locked = true;
            //user.Active = false;

            if (!mapper.Edit(user))
            {
                string errorDescription = "Las modifiaciones no se han podido guardar.";
                log.AddLogWarn("Edit", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        /// <summary>
        /// Recupera la nómina de usuarios del sistema que no se encuentren eliminados.
        /// </summary>
        /// <returns></returns>
        public List<User> Get()
        {
            UserMapper mapper = new UserMapper();
            UserRoleMapper userRoleMapper = new UserRoleMapper();
            RoleManager roleManager = new RoleManager();

            List<User> users = mapper.Get();

            if (users == null)
            {
                string errorDescription = "No existen usuarios.";
                log.AddLogWarn("Edit", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
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
                string errorDescription = "No se ha encontrado usuario con el id " +id+ ".";
                log.AddLogCritical("Get", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.NULL, errorDescription));
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

            //Explota cuando uno intenta editar un usuario-rol
            //if (roleManager.HasErrors)
            //{
            //    Errors.AddRange(roleManager.Errors);
            //    return null;
            //}

            user.Roles = roles;
            return user;
        }

        /// <summary>
        /// Creates a user for backoffice.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public bool Save(User user, bool assignWebRol = false)
        {
            RoleManager roleManager = new RoleManager();
            UserMapper mapper = new UserMapper();

            if (!IsValidForSave(user)) return false;

            // Existencia del user name
            if (mapper.Get(user.Mail) != null)
            {
                string errorDescription = "El usuario ya existe.";
                log.AddLogWarn("SaveForWeb", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.ALREADY_EXISTS, errorDescription));
                return false;
            }
            /*
                        // Existencia del correo electrónico
                        if (mapper.GetByMail(user.Mail))
                        {
                            string errorDescription = "El mail se encuentra en uso.";
                            log.AddLogWarn("SaveForWeb", errorDescription, this);
                            AddError(new ResultBE(ResultBE.Type.ALREADY_EXISTS, errorDescription));
                            return false;
                        }
            */
            user.Lastupdate = DateTime.Now;
            user.Locked = true;
            user.Active = false;

            // Asignar permisos de usuario web (recién cuando se loguea)
            if (mapper.Save(user))
            {
                if (assignWebRol)
                {
                    user.Roles = roleManager.GetForWebUser();
                    roleManager.SaveRoleForUser(user);
                }

                //se recupera de nuevo el usuario porque hay discrepancia entre la fecha de la base y la del sistema
                user = mapper.Get(user.Id);
                string activationHash = SecurityHelper.Encrypt(user.Mail + user.Lastupdate.Minute) + user.Id;
                MailerHelper.SendWelcomeMail(user, activationHash);
            }
            else
            {
                string errorDescription = "El mail se encuentra en uso.";
                log.AddLogCritical("SaveForWeb", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        /// <summary>
        /// Genera el alta de usuario, que implica la persistencia y el envío de mail de bienvenida.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public bool SaveForWeb(User user)
        {
            return Save(user, true);
        }
        

        public bool SendActivation(User user)
        {

            return true;
        }

        public bool SendRecovery(string userName)
        {
            UserMapper userMapper = new UserMapper();
            User user = userMapper.Get(userName);

            if (user == null)
            {
                AddError(new ResultBE(ResultBE.Type.NULL, "Usuario no existe: " + userName));
                return false;
            } else
            {
                string recoveryHash = SecurityHelper.Encrypt(user.Mail + user.Lastupdate.Minute);
                
                //TODO - Confeccionar plantillas para el envío de mail
                MailerHelper.Send(
                    "Buenas! " + user.Name + "!",
                    "Parece que te has olvidado la contraseña... o al menos esos nos has dicho." +
                    Environment.NewLine +
                    "Para cambiar tu password, accedé a la siguiente url: http://localhost:50551/recovery_action.aspx?r=" + recoveryHash + user.Id,
                    new string[] { user.Mail }
                );

                return true;
            }
        }

        private bool IsValidForEdit(User user)
        {
            bool isValid = true;
            isValid &= VOnlyLetter(user.Name, 1, 50, "Nombre", "IsValidForEdit");
            isValid &= VOnlyLetter(user.Lastname, 1, 50, "Apellido", "IsValidForEdit");
            isValid &= VLetterNumbers(user.Mail, 7, 50, "Mail", "IsValidForEdit");
            return isValid;
        }

        private bool IsValidForSave(User user)
        {
            bool isValid = IsValidForEdit(user);
            isValid &= VLetterNumbers(user.Password, 6, 50, "Password", "IsValidForSave");
            return isValid;
        }

        /// <summary>
        /// Evalúa que se cumplan las condiciones para seguir el proceso de registro.
        /// </summary>
        /// <param name="hash"></param>
        /// <returns></returns>
        private bool IsValidHash(string hash)
        {
           return VLetterNumbers(hash, 32, 36, "Hash", "IsValidHash"); ;
        }

        private bool IsValidForRecover(string mail)
        {
            return VLetterNumbers(mail, 7, 50, "Mail", "IsValidForRecover"); ;
        }
    }
}
