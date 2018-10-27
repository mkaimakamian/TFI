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
    public class PollQuestionMapper
    {

        /// <summary>
        /// Guarda los datos modelados, en la base.
        /// </summary>
        /// <param name="poll"></param>
        /// <returns></returns>
        public bool Save(Poll poll)
        {
            Dal dal = new Dal();
            Hashtable table = null;

            foreach (PollQuestion pollQuestion in poll.Questions)
            {
                table = new Hashtable();
                table.Add("@pollId", poll.Id);
                table.Add("@question", pollQuestion.Question);
                pollQuestion.Id = dal.Write(table, "spWritePollQuestion");
            }
            return true;
        }

        public List<PollQuestion> GetByPoll(int pollId)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<PollQuestion> pollQuestions = null;

            table.Add("@pollId", pollId);
            DataSet result = dal.Read(table, "spReadPollQuestion");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                pollQuestions = new List<PollQuestion>();

                foreach (DataRow data in result.Tables[0].Rows)
                {
                    pollQuestions.Add(ConvertToModel(data));
                }
            }

            return pollQuestions;
        }

        /// <summary>
        /// Elimina las preguntas asociadas al id de la encuesta.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(int pollId)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            table.Add("@pollId", pollId);
            return dal.Write(table, "spDeletePollQuestion") > 0;
        }

        /// <summary>
        /// Devuelve un objeto modelado con los valores del dataRow que recibe por parámetro.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private PollQuestion ConvertToModel(DataRow data)
        {
            PollQuestion pollQuestion = new PollQuestion();
            pollQuestion.Id = int.Parse(data["id"].ToString());
            pollQuestion.Question = data["question"].ToString();
            return pollQuestion;
        }
    }
}
