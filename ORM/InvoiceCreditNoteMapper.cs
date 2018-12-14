using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using BE;
using DA;

namespace ORM
{
    public class InvoiceCreditNoteMapper
    {

        public bool Save(Invoice invoice)
        {
            Dal dal = new Dal();
            Hashtable table = null;
            foreach (CreditNote creditNote in invoice.CreditNotes)
            {
                if (creditNote.Used != null) { 
                    table = new Hashtable();
                    table.Add("@invoiceId", invoice.Id);
                    table.Add("@creditNoteId", creditNote.Id);
                    dal.Write(table, "spWriteInvoiceCreditNote");
                }
            }

            return true;
        }
    }
}
