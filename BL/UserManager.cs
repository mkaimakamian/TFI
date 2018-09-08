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

        //TODO - Actualizar en ea
        public bool ActivateAccount(string hash)
        {
            string activation = hash.Substring(0, 32);
            int userId = int.Parse(hash.Substring(32, hash.Length - 32));
            string errorDescription = "";

            UserMapper userMapper = new UserMapper();
            User user = userMapper.Get(userId);

            if (SecurityHelper.IsEquivalent(user.Username + user.Lastupdate.Minute, activation))
            {
                //activo!
                user.Locked = false;
                user.Active = true;
                user.Lastupdate = DateTime.Now;

                if (!userMapper.Edit(user))
                {
                    // Siempre se devuelve true para ofuscar
                    errorDescription = "Quizá quieras solicitar la contraseña de nuevo... el sistema no está actualmente disponible (solo es momentáneo!)";
                    log.AddLogCritical("ActivateAccount", errorDescription, this);
                    AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                    return false;
                } 

                return true;
            } 

            // Siempre se devuelve true para ofuscar // bería mostrar el formulario? cuando?
            errorDescription = "Excelente! gracias por recuperar tu password :D";
            log.AddLogWarn("Edit", errorDescription, this);
            AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
            return true;
        }


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
                string errorDescription = "Todos los usuarios poseen roles asociados.";
                log.AddLogWarn("GetUserWithoutRole", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.EMPTY, errorDescription));
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

            user.Lastupdate = DateTime.Now;
            user.Locked = true;
            user.Active = false;

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

            //Explota cuando uno intenta editar un usuario-rol
            //if (roleManager.HasErrors)
            //{
            //    Errors.AddRange(roleManager.Errors);
            //    return null;
            //}

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

        /// <summary>
        /// Genera el alta de usuario, que implica la persistencia y el envío de mail de bienvenida.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public bool SaveForWeb(User user)
        {
            RoleManager roleManager = new RoleManager();
            UserMapper mapper = new UserMapper();

            if (!IsValidForSave(user)) return false;

            // Existencia del user name
            if(mapper.Get(user.Username) != null)
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

            user.Roles = roleManager.GetForWebUser();
            

            // Asignar permisos de usuario web (recién cuando se loguea)
            if (mapper.Save(user))
            {
                roleManager.SaveRoleForUser(user);

                //se recupera de nuevo el usuario porque hay discrepancia entre la fecha de la base y la del sistema
                user = mapper.Get(user.Id);
                string activationHash = SecurityHelper.Encrypt(user.Username + user.Lastupdate.Minute) +user.Id;
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

        public bool SendActivation(User user)
        {

            return true;
        }

        //TODO - Actualizar ea
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
                string recoveryHash = SecurityHelper.Encrypt(user.Username + user.Lastupdate.Minute);
                
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

        //TODO - agregar en ea
        private bool IsValidForSave(User user)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(user.Name))
            {
                string errorDescription = "Debe completarse el nombre.";
                log.AddLogWarn("SaveForWeb", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(user.Lastname))
            {
                string errorDescription = "Debe completarse el apellido.";
                log.AddLogWarn("SaveForWeb", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(user.Username))
            {
                string errorDescription = "Debe completarse el usuario.";
                log.AddLogWarn("SaveForWeb", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(user.Mail))
            {
                string errorDescription = "Debe completarse el correo electrónico.";
                log.AddLogWarn("SaveForWeb", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(user.Password))
            {
                string errorDescription = "Debe completarse el password.";
                log.AddLogWarn("SaveForWeb", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            return isValid;
        }

       
    }
}
