﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class PollQuestionManager : BaseManager
    {
        /// <summary>
        /// Persiste el elemento.
        /// </summary>
        /// <param name="Poll"></param>
        /// <returns></returns>
        public bool Save(Poll poll)
        {
            if (!IsValid(poll)) return false;

            PollQuestionMapper pollQuestionMapper = new PollQuestionMapper();
            PollQuestionOptionMapper pollQuestionOptionMapper = new PollQuestionOptionMapper();

            if (!pollQuestionMapper.Save(poll))
            {
                string errorDescription = "No se han podido guardar las preguntas para la encuesta con id " + poll.Id + ".";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            if (!pollQuestionOptionMapper.Save(poll.Questions))
            {
                string errorDescription = "No se ha podido guardar las opcione spara la spreguntas de la encuesta con id " + poll.Id + ".";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        /// <summary>
        /// Recupera el listado de preguntas asociadas a una encuesta.
        /// </summary>
        /// <param name="pollId"></param>
        /// <returns></returns>
        public List<PollQuestion> Get(int pollId)
        {
            PollQuestionOptionMapper pollQuestionOptionMapper = new PollQuestionOptionMapper();
            PollQuestionMapper pollQuestionMapper = new PollQuestionMapper();
            //TODO - controlar errores
            List<PollQuestion> pollQuestions = pollQuestionMapper.GetByPoll(pollId);
            
            foreach (PollQuestion pollQuestion in pollQuestions)
            {
                //TODO - controlar errores
                pollQuestion.Options = pollQuestionOptionMapper.Get(pollQuestion.Id);
            }

            return pollQuestions;
        }


        /// <summary>
        /// Guarda los cambios del recurso existente.
        /// </summary>
        /// <param name="poll"></param>
        /// <returns></returns>
        public bool Edit(Poll poll)
        {
            if (!IsValid(poll)) return false;
            if (!Delete(poll.Id)) return false;
            //TODO - Regenerar la tabla de relaciones
            if (!Save(poll)) return false;

            return true;
        }

        /// <summary>
        /// Elimina todas las preguntas asociadas a la encuestra cuyo id es pasado por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(int pollId)
        {
            PollQuestionMapper pollQuestionMapper = new PollQuestionMapper();

            if (!pollQuestionMapper.Delete(pollId))
            {
                string errorDescription = "No se han podido eliminar las preguntas de la encueta con id " + pollId + ".";
                log.AddLogCritical("Delete", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        private bool IsValid(Poll poll)
        {
            bool isValid = true;

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
