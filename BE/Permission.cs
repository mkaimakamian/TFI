using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Permission
    {
        private int id;
        private string description;
        private string urlAccess;

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
        public string UrlAccess
        {
            get
            {
                return urlAccess;
            }

            set
            {
                urlAccess = value;
            }
        }
    }
}
