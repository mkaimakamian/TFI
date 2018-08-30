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
        //public bool CheckExistence(string name)
        //{

        //    return true;
        //}


        public bool Delete(int id)
        {
            LanguageMapper mapper = new LanguageMapper();

            //borrar traducciones
            //borrar idioma
            return mapper.Delete(id);
        }


        //public void Edit(Language language)
        //{

        //}

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
            LanguageMapper languageMapper = new LanguageMapper();
            List<Language> languages = languageMapper.Get();

            if (languages == null)
            {
                Errors.Add(new ResultBE(ResultBE.Type.NULL, "No existen idiomas"));
                return null;
            }

            return languages;
        }

        public List<Label> GetLabels()
        {
            LabelMapper labelMapper = new LabelMapper();
            List<Label> labels = labelMapper.Get();

            if (labels == null)
            {
                Errors.Add(new ResultBE(ResultBE.Type.NULL, "No existen etiquetas"));
                return null;
            }

            return labels;
        }

        //TODO - agregar en ea
        public List<Translation> GetTranslations(int languageId)
        {
            TranslationMapper translationMapper = new TranslationMapper();
            List<Translation> translations = translationMapper.Get(languageId);

            if (translations == null)
            {
                Errors.Add(new ResultBE(ResultBE.Type.NULL, "No existen traducciones"));
                return null;
            }

            return translations;
        }

        //public void Save(Language language)
        //{

        //}
    }
}
