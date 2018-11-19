using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class PollManager : BaseManager
    {

        /// <summary>
        /// Persiste el elemento.
        /// </summary>
        /// <param name="Poll"></param>
        /// <returns></returns>
        public bool Save(Poll poll)
        {
            if (!IsValid(poll)) return false;

            PollMapper pollMapper = new PollMapper();
            PollQuestionManager pollQuestionManager = new PollQuestionManager();

            if (!pollMapper.Save(poll))
            {
                string errorDescription = "No se ha podido guardar la encuesta.";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            if (!pollQuestionManager.Save(poll))
            {
                AddError(pollQuestionManager.Errors);
                return false;
            }

            return true;
        }

        /// <summary>
        /// Recupera una encuesta en base a su id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Poll Get(int id)
        {
            PollQuestionManager pollQuestionManager = new PollQuestionManager();
            PollMapper pollMapper = new PollMapper();
            Poll poll = pollMapper.Get(id);
            PopulatePoll(poll);
            return poll;
        }

        /// <summary>
        /// Recupera la encuesta de satisfacción (activa)
        /// </summary>
        /// <returns></returns>
        public Poll GetSatisfactionPoll()
        {
            PollQuestionManager pollQuestionManager = new PollQuestionManager();
            PollMapper pollMapper = new PollMapper();
            Poll poll = pollMapper.GetSatisfactionPoll();
            PopulatePoll(poll);
            return poll;
        }

        /// <summary>
        /// Devuelve una encuesta aleatoria válida apara ser mostrada en el sitio.
        /// </summary>
        /// <returns></returns>
        public Poll GetInstantPoll()
        {
            PollMapper pollMapper = new PollMapper();
            List<Poll> polls = pollMapper.GetInstantPolls();
            Poll poll = null;
            if (polls != null && polls.Count > 0) { 
                poll = polls[new Random().Next(0, polls.Count)];
                PopulatePoll(poll);
            }

            return poll;
        }

        /// <summary>
        /// Devuelve el listado de encuestas "generales" / "on the fly".
        /// </summary>
        /// <returns></returns>
        public List<Poll> GetPollsForReport(bool instant)
        {
            PollMapper pollMapper = new PollMapper();
            List<Poll> polls = pollMapper.GetPollsForReport(instant);

            foreach (Poll poll in polls)
            {
                PopulatePoll(poll);

            }
           
            return polls;
        }

        /// <summary>
        /// Recupera el listado de todos los items.
        /// </summary>
        /// <returns></returns>
        public List<Poll> Get()
        {
            PollMapper pollMapper = new PollMapper();
            return pollMapper.Get();
        }

        /// <summary>
        /// Guarda los cambios del recurso existente.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        public bool Edit(Poll poll)
        {
            PollAnswerManager pollAnswerManager = new PollAnswerManager();
            PollQuestionManager pollQuestionManager = new PollQuestionManager();
            PollMapper pollMapper = new PollMapper();

            if (!IsValideForEdit(poll)) return false;

            //Si fue respondida, no es posible la edición.
            //Notar que a menos que se editen las preguntas, Questions estará vacío
            bool hasQuestions = poll.Questions != null && poll.Questions.Count > 0;
            if (hasQuestions && pollAnswerManager.HasAnswers(poll))
            {
                string errorDescription = "La encuesta no puede ser editada porque al menos una persona contestó.";
                log.AddLogInfo("Edit", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            if (!pollMapper.Edit(poll))
            {
                string errorDescription = "No se ha podido modificar la encuesta.";
                log.AddLogCritical("Edit", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            if (hasQuestions && !pollQuestionManager.Edit(poll))
            {
                AddError(pollQuestionManager.Errors);
                return false;
            }

            return true;
        }

        /// <summary>
        /// Elimina el elemento cuyo id es pasado por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(int id)
        {
            PollMapper pollMapper = new PollMapper();

            if (!pollMapper.Delete(id))
            {
                string errorDescription = "No se ha podido eliminar la encuesta con id " + id + ".";
                log.AddLogCritical("Delete", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        private bool IsValideForEdit(Poll poll)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(poll.Name))
            {
                string errorDescription = "Debe completarse el nombre.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (poll.DueDate == null)
            {
                string errorDescription = "Debe ingresars euna fecha.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            //esto es competencia del manager de preguntas
            if (poll.Questions != null && poll.Questions.Count == 0)
            {
                string errorDescription = "La encuesta debe poseer al menos una pregunta.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            return isValid;
        }

        private bool IsValid(Poll poll)
        {
            bool isValid = true;

            isValid = IsValideForEdit(poll);

            if (poll.Questions == null || poll.Questions.Count == 0)
            {
                string errorDescription = "La encuesta debe contener al menos una pregunta.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }
            return isValid;
        }

        /// <summary>
        /// Completa con elementos adicionales la encuesta
        /// </summary>
        /// <param name="poll"></param>
        /// <returns></returns>
        private void PopulatePoll(Poll poll)
        {
            // Como es válida la no existencia, simplemente retorno un null
            if (poll == null) return;

            PollQuestionManager pollQuestionManager = new PollQuestionManager();
            List<PollQuestion> pollQuestions = pollQuestionManager.Get(poll.Id);

            if (pollQuestions == null || pollQuestions.Count == 0)
            {
                string errorDescription = "No se han encontrado preguntas para la encuesta " + poll.Id + ".";
                log.AddLogCritical("Get", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.NULL, errorDescription));
                return;
            }
            poll.Questions = pollQuestions;
        }
    }
}
