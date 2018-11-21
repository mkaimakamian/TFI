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

        protected void AddError(List<ResultBE> errors)
        {
            Errors.AddRange(errors);
        }

        /// <summary>
        /// Evalúa que sólo se hayan incluido números.
        /// </summary>
        /// <param name="toValidate"></param>
        /// <param name="minLenght"></param>
        /// <param name="maxLenght"></param>
        /// <param name="fieldName"></param>
        /// <param name="actionErr"></param>
        /// <returns></returns>
        protected bool VOnlyNumber(string toValidate, int minLenght, int maxLenght, string fieldName, string actionErr)
        {
            if (!VLetterNumbers(toValidate, minLenght, maxLenght, fieldName, actionErr)) return false;

            if (toValidate.Any(char.IsLetter))
            {
                string errorDescription = fieldName + " debe poseer únicamente números: " + toValidate;
                log.AddLogWarn(actionErr, errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.DATA_TYPE, errorDescription));
                return false;
            }

            return true;
        }

        /// <summary>
        /// Evalúa que únicamente haya caractéres alfabéticos.
        /// </summary>
        /// <param name="toValidate"></param>
        /// <param name="minLenght"></param>
        /// <param name="maxLenght"></param>
        /// <param name="fieldName"></param>
        /// <param name="actionErr"></param>
        /// <returns></returns>
        protected bool VOnlyLetter(string toValidate, int minLenght, int maxLenght, string fieldName, string actionErr)
        {
            if (!VLetterNumbers(toValidate, minLenght, maxLenght, fieldName, actionErr)) return false;

            if (toValidate.Any(char.IsDigit))
            {
                string errorDescription = fieldName + " debe contener únicamente caracteres: " + toValidate;
                log.AddLogWarn(actionErr, errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.DATA_TYPE, errorDescription));
                return false;
            }

            return true;
        }

        /// <summary>
        /// Valida que no exceda el máximo permitido. Si maxLenght = 0, entonces no contempla máximo.
        /// </summary>
        /// <param name="toValidate"></param>
        /// <param name="minLenght"></param>
        /// <param name="maxLenght"></param>
        /// <param name="fieldName"></param>
        /// <param name="actionErr"></param>
        /// <returns></returns>
        protected bool VLetterNumbers(string toValidate, int minLenght, int maxLenght, string fieldName, string actionErr)
        {
            if (String.IsNullOrEmpty(toValidate))
            {
                string errorDescription = fieldName + " no debe estar vacío.";
                log.AddLogWarn(actionErr, errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                return false;
            }

            if (toValidate.Length < minLenght)
            {
                string errorDescription = fieldName + " debe poseer al menos " + minLenght + " caracteres.";
                log.AddLogWarn(actionErr, errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            //Cero como valor de corte para señalar que no posee cota superior
            if (maxLenght > 0 && toValidate.Length > maxLenght)
            {
                string errorDescription = fieldName + " debe poseer a lo sumo " + maxLenght + " caracteres.";
                log.AddLogWarn(actionErr, errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

    }
}
