using System;
using System.Collections.Generic;
using System.Linq;
using System.Collections;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using BE;
using DA;

namespace ORM
{
    public class TranslationMapper
    {
        public List<Translation> Get(int languageId)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<Translation> translations = null;

            table.Add("@languageId", languageId);
            DataSet result = dal.Read(table, "spReadTranslation");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                translations = new List<Translation>();

                foreach (DataRow data in result.Tables[0].Rows)
                {
                    translations.Add(ConvertToModel(data));
                }
            }

            return translations;
        }

        // actualizar en EA
        public bool Save(Language language)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            foreach(Translation translation in language.Translations)
            {
                table.Add("@labelId", translation.Label.Id);
                table.Add("@languageId", language.Id);
                table.Add("@translation", translation.Translate);
            }

            return dal.Write(table, "spWriteTranslation");
        }


        private Translation ConvertToModel(DataRow data)
        {
            Translation translation = new Translation();
            translation.Id = int.Parse(data["id"].ToString());
            translation.Label.Id = data["labelId"].ToString();
            translation.Label.Description = data["description"].ToString();
            translation.Translate = data["translation"].ToString();
            return translation;
        }
    }
}
