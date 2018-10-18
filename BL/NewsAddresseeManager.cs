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
    public class NewsAddresseeManager: BaseManager
    {

        public bool Suscribe(NewsAddressee newsAddressee)
        {
            if (!IsValid(newsAddressee)) return false;

            //chequear existencia del correo
            NewsAddresseeMapper mapper = new NewsAddresseeMapper();
            NewsAddressee existence = mapper.Get(newsAddressee.Email);

            if (existence != null)
            {
                string errorDescription = "El suscriptor ya existe.";
                log.AddLogWarn("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            newsAddressee.Active = true;
            newsAddressee.Singup = DateTime.Now;

            if (!mapper.Save(newsAddressee))
            {
                string errorDescription = "No se ha podido guardar el suscriptor.";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            MailerHelper.SendNewsletterWelcome(newsAddressee);
            return true;
        }

        /// <summary>
        /// Realiza la desuscripción del suscriptor.
        /// </summary>
        /// <param name="newsAddressee"></param>
        /// <param name="confirm"></param>
        /// <returns></returns>
        public bool Unsuscribe(NewsAddressee newsAddressee, bool confirm)
        {
            if (!IsValidForUnsuscribe(newsAddressee, confirm)) return false;

            NewsAddresseeMapper mapper = new NewsAddresseeMapper();
            newsAddressee.Active = false;
            newsAddressee.Dropout = DateTime.Now;

            bool success = mapper.Unsuscribe(newsAddressee);

            if (!success)
            {
                string errorDescription = "No se ha podido ejecutar la desuscripción.";
                log.AddLogCritical("Unsuscribe", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return success;
        }

        /// <summary>
        /// Valida que los datos para ejecutar la desuscripción están completos.
        /// </summary>
        /// <param name="newsAddressee"></param>
        /// <param name="confirm"></param>
        /// <returns></returns>
        private bool IsValidForUnsuscribe(NewsAddressee newsAddressee, bool confirm)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(newsAddressee.Email))
            {
                string errorDescription = "Debe completarse el correo.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (!confirm)
            {
                string errorDescription = "Debe confirmarse la acción de desuscripción.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            return isValid;
        }

        /// <summary>
        /// Valida que los datos para la suscripción estén completos.
        /// </summary>
        /// <param name="newsAddressee"></param>
        /// <returns></returns>
        private bool IsValid(NewsAddressee newsAddressee)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(newsAddressee.Name))
            {
                string errorDescription = "Debe completarse el nombre.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(newsAddressee.Email))
            {
                string errorDescription = "Debe completarse el correo.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(newsAddressee.Categories))
            {
                string errorDescription = "Debe elegir la menos una categoría.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            return isValid;
        }
    }
}
