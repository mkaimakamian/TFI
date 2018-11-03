using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    /// <summary>
    /// Modela el esta de cuenta del usuario
    /// </summary>
    public class AccountDetail
    {
        private int id;
        private int issuedId;
        private string description;
        //private double amount;
        private string status;
        private DateTime date;
        private string type;
        private string debe;
        private string haber;
        
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

        public int IssuedId
        {
            get
            {
                return issuedId;
            }

            set
            {
                issuedId = value;
            }
        }

        public string Description
        {
            get
            {
                return description;
            }

            set
            {
                description = value;
            }
        }

        //public double Amount
        //{
        //    get
        //    {
        //        return amount;
        //    }

        //    set
        //    {
        //        amount = value;
        //    }
        //}

        public string Status
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

        public string Type
        {
            get
            {
                return type;
            }

            set
            {
                type = value;
            }
        }

        public string Debe
        {
            get
            {
                return debe;
            }

            set
            {
                debe = value;
            }
        }

        public string Haber
        {
            get
            {
                return haber;
            }

            set
            {
                haber = value;
            }
        }
    }
}
