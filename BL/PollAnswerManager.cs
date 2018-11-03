using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class PollAnswerManager: BaseManager
    {
        /// <summary>
        /// Persiste el elemento.
        /// </summary>
        /// <param name="pollAnswers"></param>
        /// <returns></returns>
        public bool Save(List<PollAnswer> pollAnswers)
        {
            //if (!IsValid(pollAnswers)) return false;

            PollAnswerMapper pollAnswerMapper = new PollAnswerMapper();

            if (!pollAnswerMapper.Save(pollAnswers))
            {
                string errorDescription = "No se han podido guardar las respuestas para la encuesta de satisfacción.";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }
            
            return true;
        }

        /// <summary>
        /// Devuelve true si existe al menos una respuesta para la encuesta.
        /// </summary>
        /// <param name="poll"></param>
        /// <returns></returns>
        public bool HasAnswers(Poll poll)
        {
            PollAnswerMapper pollAnswerMapper = new PollAnswerMapper();
            return pollAnswerMapper.HasAnswers(poll);
        }
    }
}
