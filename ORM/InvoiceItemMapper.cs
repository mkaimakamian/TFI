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
                table.Add("@invoiceId", invoice.Id);
                invoiceItem.Id = dal.Write(table, "spWriteInvoiceItem");
            }

            return true;
        }

        /// <summary>
        /// Recupera el elemento cuyo id coincida con el provisto por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public InvoiceItem Get(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            InvoiceItem invoiceItem = null;

            table.Add("@id", id);

            DataSet result = dal.Read(table, "spReadInvoiceItem");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                invoiceItem = ConvertToModel(result.Tables[0].Rows[0]);
            }

            return invoiceItem;
        }

        /// <summary>
        /// Devuelve un objeto modelado con los valores del dataRow que recibe por parámetro.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private InvoiceItem ConvertToModel(DataRow data)
        {
            InvoiceItem invoiceItem = new InvoiceItem();
            invoiceItem.Id = int.Parse(data["id"].ToString());
            invoiceItem.Price = Convert.ToDouble(data["price"]); 
            invoiceItem.Quantity = int.Parse(data["quantity"].ToString());
            invoiceItem.Resource.Id = int.Parse(data["resourceId"].ToString());

            return invoiceItem;
        }
    }
}
