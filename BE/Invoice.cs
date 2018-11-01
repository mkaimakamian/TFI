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

        public Invoice()
        {
            creditCard = new CreditCard();
            user = new User();
            billingAddress = new Address();
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
            {
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
                return creditCard;
            }

            set
            {
                creditCard = value;
            }
        }
    }
}
