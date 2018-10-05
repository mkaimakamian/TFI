using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class NewsAddressee
    {
        private int id;
        private string email;
        private string name;
        private bool active;
        private DateTime dropout;
        private DateTime singup;
        private string categories;


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

        public string Email
        {
            get
            {
                return email;
            }

            set
            {
                email = value;
            }
        }

        public string Name
        {
            get
            {
                return name;
            }

            set
            {
                name = value;
            }
        }

        public bool Active
        {
            get
            {
                return active;
            }

            set
            {
                active = value;
            }
        }

        public DateTime Dropout
        {
            get
            {
                return dropout;
            }

            set
            {
                dropout = value;
            }
        }

        public DateTime Singup
        {
            get
            {
                return singup;
            }

            set
            {
                singup = value;
            }
        }

        public string Categories
        {
            get
            {
                return categories;
            }

            set
            {
                categories = value;
            }
        }
    }
}
