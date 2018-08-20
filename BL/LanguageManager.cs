using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class LanguageManager:BaseManager
    {
        public bool CheckExistence(string name)
        {

            return true;
        }

        
        public void Delete(int id)
        {

        }

        
        public void Edit(Language language)
        {

        }

        public Language Get(int id)
        {
            LanguageMapper languageMapper = new LanguageMapper();
            Language language = languageMapper.Get(id);

            if(language == null)
            {
                Errors.Add(new ResultBE(ResultBE.Type.NULL, "No existe idioma con id " + id));
                return null;
            }

            return language;
        }

        public List<Language> Get()
        {

            return null;
        }

        public List<Label> GetLabels()
        {

            return null;
        }

        public void Save(Language language)
        {

        }
    }
}
