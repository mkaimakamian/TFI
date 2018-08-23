using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Role
    {
        private int id;
        private string name;
        private string description;       
        private List<Permission> permissions;

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

        public List<Permission> Permissions
        {
            get
            {
                if (permissions == null)
                {
                    permissions = new List<Permission>();
                }
                return permissions;
            }

            set
            {
                permissions = value;
            }
        }
    }
}
