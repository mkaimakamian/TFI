using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class AdImageManager: BaseManager
    {

        public List<Ad> Get()
        {
            AdImageMapper adImageMapper = new AdImageMapper();
            return adImageMapper.Get();
        }

        public bool Save(Ad adImage)
        {
            if (!IsValid(adImage)) return false;

            AdImageMapper adImageMapper = new AdImageMapper();
            return adImageMapper.Save(adImage);
        }

        public bool Delete(int id)
        {
            AdImageMapper adImageMapper = new AdImageMapper();
            return adImageMapper.Delete(id);
        }

        public bool IsValid(Ad adImage)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(adImage.Image))
            {
                string errorDescription = "Debe escogerse una imagen para la publicidad.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(adImage.NavigateUrl))
            {
                string errorDescription = "Debe completarse con la url destino.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            return isValid;
        }
    }
}
