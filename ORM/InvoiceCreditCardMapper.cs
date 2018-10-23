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
    public class InvoiceCreditCardMapper
    {
        /// <summary>
        /// Guarda los datos modelados, en la base.
        /// </summary>
        /// <param name="Invoice"></param>
        /// <returns></returns>
        public bool Save(Invoice invoice)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@invoiceId", invoice.Id);
            table.Add("@creditCardId", invoice.CreditCard.Id);
            invoice.Id = dal.Write(table, "spWriteMap");

            return invoice.Id > 0;
        }
    }
}
