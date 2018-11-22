using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;
using System.Collections;

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

        /// <summary>
        /// Devuelve un diccionario cuyas keys son el nombre de la serie, y cuyos valores
        /// es un array de objeto bidimensional con 0 = opcion, 1 = valor
        /// </summary>
        /// <param name="pollId"></param>
        /// <returns></returns>
        public Dictionary<string, ArrayList[]> GetReportForPollAnswers(int pollId)
        {
            PollAnswerMapper pollAnswerMapper = new PollAnswerMapper();
            List<PollAnswerSerie> series = pollAnswerMapper.GetPollAnswersForChart(pollId);

            //Nadie contestó :|
            if (series == null) return null;

            Dictionary<string, ArrayList[]> chartSeries = new Dictionary<string, ArrayList[]>();

            //La estrategia consiste en devolver un diccionario para identificar adecuadamente
            //las series, cada una con los array que necesita el chart para ser mostrado.
            //Una serie = una pregunta.
            foreach (PollAnswerSerie paserie in series)
            {
                if (!chartSeries.ContainsKey(paserie.SerieLabel))
                {
                    chartSeries.Add(paserie.SerieLabel, new ArrayList[2] { new ArrayList(), new ArrayList()});
                }

                chartSeries[paserie.SerieLabel][0].Add(paserie.ValueLabel);
                chartSeries[paserie.SerieLabel][1].Add(paserie.Value);
            }

            return chartSeries;
        }

        public override string ToString() { return "PollAnswer"; }

    }
}
