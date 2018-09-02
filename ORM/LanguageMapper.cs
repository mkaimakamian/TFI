using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using BE;
using DA;

namespace ORM
{
    public class LanguageMapper
    {

        /// <summary>
        /// Recupera el idioma basado en el id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Language Get(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@id", id);
            DataSet result = dal.Read(table, "spReadLanguage");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                return ConvertToModel(result.Tables[0].Rows[0]);
            }
            else
            {
                return null;
            }
        }

        public List<Language> Get()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<Language> languages = null;

            table.Add("@id", DBNull.Value);
            DataSet result = dal.Read(table, "spReadLanguage");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                languages = new List<Language>();

                foreach (DataRow data in result.Tables[0].Rows)
                {
                    languages.Add(ConvertToModel(data));
                }
            }

            return languages;
        }

        public bool Delete(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            table.Add("@id", id);
            return dal.Write(table, "spDeleteLanguage") > 0;
        }

        public bool Save(Language language)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@name", language.Name);

            return dal.Write(table, "spWriteLanguage") > 0;
        }

        // TODO - Agregar en EA
        /// <summary>
        /// Convierte el dataset al modelo de datos correspondiente.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private Language ConvertToModel(DataRow data)
        {
            return new Language
            {
                Id = Convert.ToInt32(data["id"]),
                Name = data["name"].ToString()
            };
        }
    }
}
