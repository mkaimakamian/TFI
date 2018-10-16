using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class CreditNote
    {
        private int id;
        private double amount;
        private DateTime date;
        private string observation;
        private int status; //quizá enumerado?
        private User user;
        private DateTime used;
        //todo - debería estar asociado a un invoice o directamente eso lo pongo como observación?

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

        public int Status
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
    }
}
