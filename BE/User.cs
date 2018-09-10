using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class User
    {
        private int id;
        private bool active;
        private Language language;
        private string lastname;
        private DateTime lastupdate;
        private bool locked;
        private string mail;
        private string name;
        private string password;
        private PersonalInformation person;
        private List<Role> roles;
        private string username;

        public User()
        {
            Language = new Language();
            Person = new PersonalInformation();
        }

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

        public bool Locked
        {
            get
            {
                return locked;
            }

            set
            {
                locked = value;
            }
        }

        public string Username
        {
            get
            {
                return username;
            }

            set
            {
                username = value;
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

        public string Lastname
        {
            get
            {
                return lastname;
            }

            set
            {
                lastname = value;
            }
        }



        public string Mail
        {
            get
            {
                return mail;
            }

            set
            {
                mail = value;
            }
        }

        public string Password
        {
            get
            {
                return password;
            }

            set
            {
                password = value;
            }
        }

        public Language Language
        {
            get
            {
                return language;
            }

            set
            {
                language = value;
            }
        }

        public DateTime Lastupdate
        {
            get
            {
                return lastupdate;
            }

            set
            {
                lastupdate = value;
            }
        }

        internal PersonalInformation Person
        {
            get
            {
                return person;
            }

            set
            {
                person = value;
            }
        }

        public List<Role> Roles
        {
            get
            {
                if (roles == null)
                {
                    roles = new List<Role>();
                }
                return roles;
            }

            set
            {
                roles = value;
            }
        }

        //TODO - agregar en ea

        public string Permission
        {
            get
            {
                string permissionList = "";

                foreach (Role role in Roles)
                {
                    permissionList += role.Name + ", ";
                }

                if (Roles.Count > 0)
                {
                    return permissionList.Substring(0, permissionList.Length - 2);
                } else
                {
                    return "";
                }
                
            }
        }
    }
}
