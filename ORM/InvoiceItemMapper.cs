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
    public class InvoiceItemMapper
    {

        /// <summary>
        /// Guarda los datos modelados, en la base.
        /// </summary>
        /// <param name="InvoiceItem"></param>
        /// <returns></returns>
        public bool Save(Invoice invoice)
        {
            Dal dal = new Dal();
            Hashtable table = null;

            //Todo - arreglar esto.
            foreach (InvoiceItem invoiceItem in invoice.InvoiceItems)
            {
                table = new Hashtable();
                table.Add("@price", invoiceItem.Price);
                table.Add("@quantity", invoiceItem.Quantity);
                table.Add("@resourceId", invoiceItem.Resource.Id);
                invoiceItem.Id = dal.Write(table, "spWriteMap");
            }

            return true;
        }
    }
}
