using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Map: Resource
    {
        string resource;

        public string Resource
        {
            get
            {
                return resource;
            }

            set
            {
                resource = value;
            }
        }
    }
}
