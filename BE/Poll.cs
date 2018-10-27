using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Poll
    {
        private int id;
        private string name;
        private string description;
        private DateTime dueDate;
        private bool pollType;
        private List<PollQuestion> questions;

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

        public bool PollType
        {
            get
            {
                return pollType;
            }

            set
            {
                pollType = value;
            }
        }

        public List<PollQuestion> Questions
        {
            get
            {
                return questions;
            }

            set
            {
                questions = value;
            }
        }
    }
}
