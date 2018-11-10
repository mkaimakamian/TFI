using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.SessionState;
using BE;

namespace Helper
{
    //TODO - PASAR AL FRONT.

    /// <summary>
    /// Tiene como propósito ofrecer herramientas para el manejo de contenido generar en sesión.
    /// </summary>
    public static class SessionUtilHelper
    {
        private const string POLL_QUESTION = "ubiquicity_pollQuestion";
        private static bool pollQuestionEdited = false;
        private const string UBIQUICITY_ITEM_ID = "Ubiquicity_itemId";


        /// <summary>
        /// Persiste las preguntas de la encuestas en sessión para podes efectuar tareas ABMicas.
        /// </summary>
        /// <param name="pollQuestion"></param>
        /// <param name="session"></param>
        public static void KeepPollQuestion(PollQuestion pollQuestion, HttpSessionState session)
        {
            if (!Exist(POLL_QUESTION, session)) session[POLL_QUESTION] = new List<PollQuestion>();

            ((List<PollQuestion>)session[POLL_QUESTION]).Add(pollQuestion);
            pollQuestionEdited = true;
        }

        public static void KeepPollQuestion(List<PollQuestion> pollQuestions, HttpSessionState session)
        {
            if (!Exist(POLL_QUESTION, session)) session[POLL_QUESTION] = new List<PollQuestion>();

            ((List<PollQuestion>)session[POLL_QUESTION]).AddRange(pollQuestions);
        }

        /// <summary>
        /// Devuelve true si se han agregado preguntas nuevas.
        /// </summary>
        /// <returns></returns>
        public static bool PollQuestionEdited()
        {
            return pollQuestionEdited;
        }

        /// <summary>
        /// Devuelve el listado de preguntas de la encuesta persistidas en sesión.  
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        public static List<PollQuestion> GetPollQuestions(HttpSessionState session)
        {
            if (!Exist(POLL_QUESTION, session)) return null;
            return (List<PollQuestion>)session[POLL_QUESTION];
        }

        /// <summary>
        /// Elimina del listado la pregunta de la encuesta persistidas en sesión.  
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        public static void RemovePollQuestion(PollQuestion pollQuestion, HttpSessionState session)
        {
            if (Exist(POLL_QUESTION, session))
            {
                //Se elimina por pregunta porque en caso de ser nuevo el item, no presenta id
                ((List<PollQuestion>)session[POLL_QUESTION]).RemoveAll(x => x.Question == pollQuestion.Question);
            }
        }

        /// <summary>
        /// Se encarga de eliminar los elementos persistidos en sesión.
        /// </summary>
        /// <param name="session"></param>
        public static void FlushPollQuestion(HttpSessionState session)
        {
            if (Exist(POLL_QUESTION, session)) session.Remove(POLL_QUESTION);
        }

        /// <summary>
        /// Mantiene el id de el ítem deseado en sesión; es responsabilidad del usuario
        /// encargarse del contenido.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="session"></param>
        public static void KeepInSession(string id, HttpSessionState session)
        {
            session[UBIQUICITY_ITEM_ID] = id;
        }

        public static String GetIdFromSession(HttpSessionState session)
        {
            if (!Exist(UBIQUICITY_ITEM_ID, session)) return null;
            return session[UBIQUICITY_ITEM_ID].ToString();
        }

        /// <summary>
        /// Se encarga de eliminar el id persistido en sesión.
        /// </summary>
        /// <param name="session"></param>
        public static void FlushId(HttpSessionState session)
        {
            if (Exist(UBIQUICITY_ITEM_ID, session)) session.Remove(UBIQUICITY_ITEM_ID);
        }

        /// <summary>
        /// Devuelve el valor de verdad de la existencia de un determinado elemento en sesión.
        /// </summary>
        /// <param name="SessionTag"></param>
        /// <returns></returns>
        private static bool Exist(string SessionTag, HttpSessionState sessionState)
        {
            return sessionState != null && sessionState[SessionTag] != null;
        }
    }
}
