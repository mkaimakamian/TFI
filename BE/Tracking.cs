using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Tracking
    {
        public enum StatusType
        {
            Pendiente = 0,
            Descargado = 1,
            Reclamado = 2,
            Rechazado = 3,
            Aceptado = 4
        }

        private int id;
        private int invoiceId; //¬_¬'
        private InvoiceItem invoiceItem;
        private StatusType status;
        private DateTime date;

        public InvoiceItem InvoiceItem
        {
            get
            {
                if (invoiceItem == null) invoiceItem = new InvoiceItem();
                return invoiceItem;
            }

            set
            {
                invoiceItem = value;
            }
        }

        //public string Resource
        //{
        //    get { return invoiceItem.Resource.Name; }
        //}

        public StatusType Status
        {
            get
            {
                return status;
            }

            set
            {
                status = value;
            }
        }

        public DateTime Date
        {
            get
            {
                return date;
            }

            set
            {
                date = value;
            }
        }

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public int InvoiceId
        {
            get
            {
                return invoiceId;
            }

            set
            {
                invoiceId = value;
            }
        }
    }
}
