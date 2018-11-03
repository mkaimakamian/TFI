using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Poll
    {
        public enum PollType
        {
            Staisfaccion = 0,
            General = 1
        }

        private int id;
        private string name;
        private string description;
        private DateTime dueDate;
        private PollType type;
        private List<PollQuestion> questions;
        private bool active;

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

        public PollType Type
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
    }
}
