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

            return isValid;
        }
    }
}
