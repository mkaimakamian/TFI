using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class PollOptionManager : BaseManager
    {

        /// <summary>
        /// Recupera el listado de todos los items.
        /// </summary>
        /// <returns></returns>
        public List<PollOption> Get()
        {
            PollOptionMapper pollOptionMapper = new PollOptionMapper();
            List<PollOption> pollOptions = pollOptionMapper.Get();

            //Al menos debe existir una posible opción
            if (pollOptions == null || pollOptions.Count == 0)
            {
                string errorDescription = "No se han encontrado opciones para las encuestas.";
                log.AddLogCritical("Get", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
            }

            return pollOptions;
        }
    }
}
