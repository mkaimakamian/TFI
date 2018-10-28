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
            Pending = 0,
            Downloades = 1,
            Rejected = 2
        }

        private int id;
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

        public string Resource
        {
            get { return invoiceItem.Resource.Name; }
        }

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
    }
}
