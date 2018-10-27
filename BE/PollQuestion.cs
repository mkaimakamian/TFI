using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class PollQuestion
    {
        private int id;
        private string question;
        private List<PollOption> options;

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

        public string Question
        {
            get
            {
                return question;
            }

            set
            {
                question = value;
            }
        }

        public List<PollOption> Options
        {
            get
            {
                return options;
            }

            set
            {
                options = value;
            }
        }
    }
}
