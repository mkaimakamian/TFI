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
    public class PollAnswerMapper
    {
        /// <summary>
        /// Guarda los datos modelados, en la base.
        /// </summary>
        /// <param name="pollAnswers"></param>
        /// <returns></returns>
        public bool Save(List<PollAnswer> pollAnswers)
        {
            Dal dal = new Dal();
            Hashtable table = null;
            bool success = true;

            foreach (PollAnswer answer in pollAnswers)
            {
                table = new Hashtable();
                if (answer.User != null) table.Add("@userId", answer.User.Id);
                table.Add("@questionId", answer.PollQuestion.Id);
                table.Add("@optionId", answer.PollOption.Id);
                success = success && dal.Write(table, "spWritePollAnswer") > 0;
            }

            return success;
        }

        /// <summary>
        /// Devuelve true cuando la encuesta ha sido contestada por al menos una persona.
        /// </summary>
        /// <param name="poll"></param>
        /// <returns></returns>
        public bool HasAnswers(Poll poll)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            table.Add("@pollId", poll.Id);
            DataSet result = dal.Read(table, "spReadPollAnswer");
            return result != null && result.Tables[0].Rows.Count > 0;
        }
    }
}
