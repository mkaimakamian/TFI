using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class CreditNote
    {
        public enum StatusType
        {
            Pendiente = 0,
            Aprobada = 1,
            Rechazada = 2
        }

        private int id;
        private double amount;
        private DateTime date;
        private string observation;
        private StatusType status;
        private User user;
        private DateTime used;
        private int invoiceId;

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

        public double Amount
        {
            get
            {
                return amount;
            }

            set
            {
                amount = value;
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

        public string Observation
        {
            get
            {
                return observation;
            }

            set
            {
                observation = value;
            }
        }

        public string UserName
        {
            get { return user.Name + " " + user.Lastname; }
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

        public DateTime Used
        {
            get
            {
                return used;
            }

            set
            {
                used = value;
            }
        }

        public string Description
        {
            get { return "$" + Amount + " ("+ Date.ToShortDateString() + ")" ; }
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
    }
}
