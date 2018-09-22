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
        protected LogManager log = new LogManager();
        
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

        /// <summary>
        /// Devuelve la descripción de todos los errores producidos durante la última operación.
        /// </summary>
        public string ErrorDescription
        {
            get {
                string description = "";

                foreach (ResultBE error in Errors)
                {

                    description += error.description + "\n\r";
                }

                return description;
            }
        }

        /// <summary>
        /// Permite agregar errores al listado.
        /// </summary>
        /// <param name="error"></param>
        protected void AddError(ResultBE error)
        {
            Errors.Add(error);
        }
    }
}
