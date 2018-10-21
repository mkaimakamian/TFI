using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class CreditCardManager:BaseManager
    {
        /// <summary>
        /// Devuelve el listado con el tipo de tarjetas disponibles.
        /// </summary>
        /// <returns></returns>
        public List<CreditCardType> Get()
        {
            CreditCardMapper creditCardMapper = new CreditCardMapper();
            return creditCardMapper.Get();
        }
    }
}
