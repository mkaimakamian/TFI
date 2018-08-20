using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace BL
{
    // TODO - Agregar a EA
    public abstract class BaseManager
    {
        private List<ResultBE> errors;

        public bool HasErrors
        {
            get
            {
                return Errors.Count > 0;
            }
        }

        public List<ResultBE> Errors
        {
            get
            {
                if (errors == null) errors = new List<ResultBE>();
                return errors;
            }
        }

        protected void AddError(ResultBE error)
        {
            Errors.Add(error);
        }
    }
}
