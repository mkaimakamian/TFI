using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class CreditCardType
    {
        private int id;
        private string name;
        private int prefix;

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

        public int Prefix
        {
            get
            {
                return prefix;
            }

            set
            {
                prefix = value;
            }
        }
    }
}
