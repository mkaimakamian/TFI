using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class CreditNoteManager
    {
        /// <summary>
        /// Devuelve el listado de notas de créditos disponibles para el usuario pasado por parámetro.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public List<CreditNote> Get(User user)
        {
            CreditNoteMapper creditNoteMapper = new CreditNoteMapper();
            return creditNoteMapper.Get(user);
        }


        public CreditNote Get(int id)
        {
            CreditNoteMapper creditNoteMapper = new CreditNoteMapper();
            return creditNoteMapper.Get(id);
        }
    }
}
