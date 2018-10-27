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
    public class PollOptionMapper
    {
        /// <summary>
        /// Recupera el listado de elementos de la base.
        /// </summary>
        /// <returns></returns>
        public List<PollOption> Get()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<PollOption> pollOptions = null;

            DataSet result = dal.Read(table, "spReadPollOption");

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
            PollOption pollOption = new PollOption();
            pollOption.Id = int.Parse(data["id"].ToString());
            pollOption.Option = data["option"].ToString();
            return pollOption;
        }
    }
}
