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
    public class PollMapper
    {
        /// <summary>
        /// Guarda los datos modelados, en la base.
        /// </summary>
        /// <param name="poll"></param>
        /// <returns></returns>
        public bool Save(Poll poll)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@name", poll.Name);
            table.Add("@description", poll.Description);
            table.Add("@dueDate", poll.DueDate);
            table.Add("@pollType", poll.Type);
            table.Add("@active", poll.Active);

            poll.Id = dal.Write(table, "spWritePoll");

            return poll.Id > 0;
        }

        /// <summary>
        /// Recupera el elemento cuyo id coincida con el provisto por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Poll Get(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            Poll poll = null;

            table.Add("@id", id);

            DataSet result = dal.Read(table, "spReadPoll");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                poll = ConvertToModel(result.Tables[0].Rows[0]);
            }

            return poll;
        }

        /// <summary>
        /// Devulve la encuesta de satisfacción activa.
        /// </summary>
        /// <returns></returns>
        public Poll GetSatisfactionPoll()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            Poll poll = null;

            table.Add("@activeSP", true);

            DataSet result = dal.Read(table, "spReadPoll");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                poll = ConvertToModel(result.Tables[0].Rows[0]);
            }

            return poll;
        }
        
        /// <summary>
        /// Recupera el listado de elementos de la base.
        /// </summary>
        /// <returns></returns>
        public List<Poll> Get()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<Poll> polls = null;

            DataSet result = dal.Read(table, "spReadPoll");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                polls = new List<Poll>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    polls.Add(ConvertToModel(data));
                }
            }

            return polls;
        }

        /// <summary>
        /// Recupera las encuestas sin tener en cuenta si están activas o vencidas,
        /// Sí filtra las eliminadas.
        /// </summary>
        /// <param name="instant"></param>
        /// <returns></returns>
        public List<Poll> GetPollsForReport(bool instant)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<Poll> polls = null;

            table.Add("@instant", instant);

            DataSet result = dal.Read(table, "spReadPollReport");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                polls = new List<Poll>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    polls.Add(ConvertToModel(data));
                }
            }

            return polls;
        }

        /// <summary>
        /// Recupera el listado de elementos de la base.
        /// </summary>
        /// <returns></returns>
        public List<Poll> GetInstantPolls()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<Poll> polls = null;

            table.Add("@instant", true);
            DataSet result = dal.Read(table, "spReadPoll");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                polls = new List<Poll>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    polls.Add(ConvertToModel(data));
                }
            }

            return polls;
        }

        /// <summary>
        /// Ejecuta la actualización del modelo de datos.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        public bool Edit(Poll poll)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@id", poll.Id);
            table.Add("@name", poll.Name);
            table.Add("@description", poll.Description);
            table.Add("@dueDate", poll.DueDate);
            table.Add("@pollType", poll.Type);
            table.Add("@active", poll.Active);
            return dal.Write(table, "spModifyPoll") > 0;
        }

        /// <summary>
        /// Elimina el elemento del sistema.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(int id)
        {
            //eliminado lógico
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            table.Add("@id", id);
            return dal.Write(table, "spDeletePoll") > 0;
        }

        /// <summary>
        /// Devuelve un objeto modelado con los valores del dataRow que recibe por parámetro.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private Poll ConvertToModel(DataRow data)
        {
            Poll.PollType type;
            Enum.TryParse<Poll.PollType>(data["pollType"].ToString(), true, out type);

            Poll poll = new Poll();
            poll.Id = int.Parse(data["id"].ToString());
            poll.Name = data["name"].ToString();
            poll.Description = data["description"].ToString();
            poll.DueDate = Convert.ToDateTime(data["dueDate"]);
            poll.Type = type;
            poll.Active = Convert.ToBoolean(data["active"]);
            return poll;
        }
    }
}
