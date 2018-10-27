using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class PollOption
    {
        private int id;
        private string option;

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

        public string Option
        {
            get
            {
                return option;
            }

            set
            {
                option = value;
            }
        }
    }
}
