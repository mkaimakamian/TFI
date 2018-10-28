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
    public class InvoiceMapper
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

            table.Add("@userId", invoice.User.Id);
            table.Add("@billingAddressId", invoice.BillingAddress.Id);
            invoice.Id = dal.Write(table, "spWriteInvoice");

            return invoice.Id > 0;
        }

        /// <summary>
        /// Recupera el elemento cuyo id coincida con el provisto por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Invoice Get(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            Invoice invoice = null;

            table.Add("@id", id);

            DataSet result = dal.Read(table, "spReadInvoice");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                invoice = ConvertToModel(result.Tables[0].Rows[0]);
            }

            return invoice;
        }

        /// <summary>
        /// Devuelve un objeto modelado con los valores del dataRow que recibe por parámetro.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private Invoice ConvertToModel(DataRow data)
        {
            Invoice invoice = new Invoice();
            invoice.Id = int.Parse(data["id"].ToString());
            invoice.Date = Convert.ToDateTime(data["date"].ToString());
            invoice.User.Id = Convert.ToInt32(data["userId"]);
            invoice.BillingAddress.Id = Convert.ToInt32(data["billingAddressId"]);

            return invoice;
        }
    }
}
