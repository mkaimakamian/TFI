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

        public List<CreditNote> Get(User user)
        {
            //Mock
            List<CreditNote> lst = new List<CreditNote>();
            CreditNote cn = new CreditNote();
            cn.Amount = 11.2;
            cn.Date = DateTime.Now;
            cn.Observation = "Esta nota de crédito se expide porque si";
            cn.User = user;
            lst.Add(cn);
            return lst;

            CreditNoteMapper creditNoteMapper = new CreditNoteMapper();
            return creditNoteMapper.Get(user);
        }
    }
}
