using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class LogEntry
    {
        public enum Level
        {
            DEBUG = 1,
            WARNING = 2,
            CRITICAL = 3,
            INFO = 4
        };

        private int id;
        private Level logLevel;
        private string action;
        private string description;
        private string entity;
        private DateTime created;
        private string user;

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

        public Level LogLevel
        {
            get
            {
                return logLevel;
            }

            set
            {
                logLevel = value;
            }
        }

        public string Action
        {
            get
            {
                return action;
            }

            set
            {
                action = value;
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

        public string Entity
        {
            get
            {
                return entity;
            }

            set
            {
                entity = value;
            }
        }

        public DateTime Created
        {
            get
            {
                return created;
            }

            set
            {
                created = value;
            }
        }

        public string User
        {
            get
            {
                return user;
            }

            set
            {
                user = value;
            }
        }
    }

}