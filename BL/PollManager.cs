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

            if (poll == null)
            {
                string errorDescription = "No se ha encontrado la encuesta con id " + id + ".";
                log.AddLogCritical("Get", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.NULL, errorDescription));
                return null;
            }

            List<PollQuestion> pollQuestions = pollQuestionManager.Get(id);

            if (pollQuestions == null || pollQuestions.Count == 0)
            {
                string errorDescription = "No se han encontrado preguntas para la encuesta " + id + ".";
                log.AddLogCritical("Get", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.NULL, errorDescription));
                return null;
            }
            poll.Questions = pollQuestions;
            return poll;
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
            if (!IsValid(poll)) return false;

            PollQuestionManager pollQuestionManager = new PollQuestionManager();
            PollMapper pollMapper = new PollMapper();

            if (!pollMapper.Edit(poll))
            {
                string errorDescription = "No se ha podido modificar la encuesta.";
                log.AddLogCritical("Edit", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            if (!pollQuestionManager.Edit(poll))
            {
                AddError(pollQuestionManager.Errors);
                return false;
            }

            return true;
        }

        private bool IsValid(Poll poll)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(poll.Name))
            {
                string errorDescription = "Debe completarse el nombre.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (poll.Questions == null | poll.Questions.Count == 0)
            {
                string errorDescription = "La encuesta debe contener al menos una pregunta.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }
            return isValid;
        }
    }
}
