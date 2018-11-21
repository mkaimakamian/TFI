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
            isValid &= VLetterNumbers(adImage.Image, 1, 0, "Imagen publicitaria", "IsValid");
            isValid &= VLetterNumbers(adImage.NavigateUrl, 1, 250, "Url de la publicidad", "IsValid");
            return isValid;
        }
    }
}
