using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Invoice
    {
        private int id;
        private DateTime date;
        private List<InvoiceItem> invoiceItems;
        private User user;
        private Address billingAddress;
        private List<CreditNote> creditNotes;
        private CreditCard creditCard;

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

        public List<InvoiceItem> InvoiceItems
        {
            get
            {
                return invoiceItems;
            }

            set
            {
                invoiceItems = value;
            }
        }

        public User User
        {
            get
            {
                if (user == null) user = new User();
                return user;
            }

            set
            {
                user = value;
            }
        }

        public Address BillingAddress
        {
            get
            { if (billingAddress == null) billingAddress = new Address();
                return billingAddress;
            }

            set
            {
                billingAddress = value;
            }
        }

        public List<CreditNote> CreditNotes
        {
            get
            {
                return creditNotes;
            }

            set
            {
                creditNotes = value;
            }
        }

        public CreditCard CreditCard
        {
            get
            {
                if (creditCard == null) creditCard = new CreditCard();
                return creditCard;
            }

            set
            {
                creditCard = value;
            }
        }
    }
}
