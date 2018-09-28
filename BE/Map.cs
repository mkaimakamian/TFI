using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Map: Resource
    {
        string sourcePath;

        public string SourcePath
        {
            get
            {
                return sourcePath;
            }

            set
            {
                sourcePath = value;
            }
        }
    }
}
