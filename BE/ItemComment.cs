using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class ItemComment
    {
        private int id;
        private Resource resource;
        private User user;
        private DateTime date;
        private string comment;

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

        public Resource Resource
        {
            get
            {
                if (resource == null) resource = new Resource();
                return resource;
            }

            set
            {
                resource = value;
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

        public string Comment
        {
            get
            {
                return comment;
            }

            set
            {
                comment = value;
            }
        }
    }
}
