using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Collections;
using BE;
using DA;
namespace ORM
{
    public class PollQuestionOptionMapper
    {

        /// <summary>
        /// Guarda la relación entre pregunta y opciones.
        /// </summary>
        /// <param name="pollQuestions"></param>
        /// <returns></returns>
        public bool Save(List<PollQuestion> pollQuestions)
        {
            Dal dal = new Dal();
            Hashtable table = null;

            foreach(PollQuestion pollQuestion in pollQuestions)
            {
                foreach (PollOption pollOption in pollQuestion.Options)
                {
                    table = new Hashtable();
                    table.Add("@questionid", pollQuestion.Id);
                    table.Add("@optionId", pollOption.Id);
                    dal.Write(table, "spWritePollQuestionOption");
                }

            }
            return true;
        }

        /// <summary>
        /// Recupera el listado de elementos de la base.
        /// </summary>
        /// <returns></returns>
        public List<PollOption> Get(int pollQuestionId)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<PollOption> pollOptions = null;

            table.Add("@questionId", pollQuestionId);

            DataSet result = dal.Read(table, "spReadPollQuestionOption");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                pollOptions = new List<PollOption>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    pollOptions.Add(ConvertToModel(data));
                }
            }

            return pollOptions;
        }

        /// <summary>
        /// Devuelve un objeto modelado con los valores del dataRow que recibe por parámetro.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private PollOption ConvertToModel(DataRow data)
        {
            return new PollOptionMapper().ConvertToModel(data);
        }
    }
}
