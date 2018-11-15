using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class CreditCard
    {
        private int id;
        private string field1;
        private string field2;
        private string field3;
        private string field4;
        private DateTime dueDate;
        private string cvv;
        private CreditCardType creditCardType;
        private string firstName;
        private string lastName;

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

        public string Field1
        {
            get
            {
                return field1;
            }

            set
            {
                field1 = value;
            }
        }

        public string Field2
        {
            get
            {
                return field2;
            }

            set
            {
                field2 = value;
            }
        }

        public string Field3
        {
            get
            {
                return field3;
            }

            set
            {
                field3 = value;
            }
        }

        public string Field4
        {
            get
            {
                return field4;
            }

            set
            {
                field4 = value;
            }
        }

        public DateTime DueDate
        {
            get
            {
                return dueDate;
            }

            set
            {
                dueDate = value;
            }
        }

        public string Cvv
        {
            get
            {
                return cvv;
            }

            set
            {
                cvv = value;
            }
        }

        public CreditCardType CreditCardType
        {
            get
            {
                if (creditCardType == null) creditCardType = new CreditCardType();
                return creditCardType;
            }

            set
            {
                creditCardType = value;
            }
        }

        public string FirstName
        {
            get
            {
                return firstName;
            }

            set
            {
                firstName = value;
            }
        }

        public string LastName
        {
            get
            {
                return lastName;
            }

            set
            {
                lastName = value;
            }
        }
    }
}
