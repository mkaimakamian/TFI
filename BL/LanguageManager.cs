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
           // LabelMapper labelMapper = new LabelMapper();
            List<Translation> translations = translationMapper.Get(languageId);
            //List<Label> labels = labelMapper.Get();


            if (translations == null)
            {
                Errors.Add(new ResultBE(ResultBE.Type.NULL, "No existen traducciones"));
                return null;
            }

            ////TODO - reveer si se puede mejorar
            //foreach (Translation translation in translations)
            //{
            //    Get()
            //}

            return translations;
        }

        public bool Save(Language language)
        {
            LanguageMapper languageMapper = new LanguageMapper();
            TranslationMapper translationMapper = new TranslationMapper();

            if (!IsValid(language)) return false;

            if (!languageMapper.Save(language))
            {
                AddError(new ResultBE(ResultBE.Type.FAIL, "Error al grabar"));
                return false;
            }

            if (!translationMapper.Save(language))
            {
                AddError(new ResultBE(ResultBE.Type.FAIL, "Error al grabar"));
                return false;
            }

            return true;
        }

        public bool IsValid(Language language)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(language.Name))
            {
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, "EMPTY_FIELD_ERROR"));
                isValid = false;
            }

            if (language.Translations.Count == 0)
            {
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, "EMPTY_FIELD_ERROR"));
                isValid = false;
            }

            return isValid;
        }
    }
}
