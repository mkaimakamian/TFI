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
    public class InvoiceCreditNoteMapper
    {
        /// <summary>
        /// Guarda los datos modelados, en la base.
        /// </summary>
        /// <param name="Invoice"></param>
        /// <returns></returns>
        public bool Save(Invoice invoice)
        {
            Dal dal = new Dal();
            Hashtable table = null;

            //TODO - arreglar esto
            foreach(CreditNote creditNote in invoice.CreditNotes)
            {
                table = new Hashtable();
                table.Add("@invoiceId", invoice.Id);
                table.Add("@creditNoteId", creditNote.Id);
                dal.Write(table, "spWriteInvoiceCreditNote");

            }

            return true;
        }
    }
}
