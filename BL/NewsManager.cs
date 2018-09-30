using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class NewsManager: BaseManager
    {

        public bool Save(News news)
        {
            if (!IsValid(news)) return false;

            NewsMapper newsMapper = new NewsMapper();
            if (!newsMapper.Save(news))
            {
                string errorDescription = "No se ha podido guardar la novedad.";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        public List<News> Get()
        {
            NewsMapper newsMapper = new NewsMapper();
            return newsMapper.Get();
        }

        public bool IsValid(News news)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(news.Title))
            {
                string errorDescription = "Debe completarse el título.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(news.Body))
            {
                string errorDescription = "Debe completarse el cuerpo.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(news.Image))
            {
                string errorDescription = "Debe asignarse una imagen.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (news.Until <= DateTime.Now)
            {
                string errorDescription = "La fecha de vencimiento tiene que se rposterior al día actual";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            return isValid;
        }
    }
}
