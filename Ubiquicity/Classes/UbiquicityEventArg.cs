using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ubiquicity.Classes
{
    public class UbiquicityEventArg: EventArgs
    {

        private object theObject;

        public UbiquicityEventArg(object theObject)
        {
            TheObject = theObject;
        }

        public object TheObject {
            get { return theObject; }
            set { theObject = value; }
        }
    }
}