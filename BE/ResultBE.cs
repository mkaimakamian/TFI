using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class ResultBE
    {
        public enum Type
        {
            OK,
            INVALID_CREDENTIAL,
            INACTIVE_USER,
            CHECKSUM_ERROR,
            INCOMPLETE_FIELDS,
            EXCEPTION,
            FAIL,
            EMPTY_PROFILE,
            NULL
        };

        private Type type;
        public string description; //Descripción a mostrar
        public bool keepGoing;     //Indica si el resultado implica la detención del flujo normal del programa
        private object value;       //Valor del resultado

        public ResultBE(Type type, string description = "", object value = null, bool keepGoing = true)
        {
            this.type = type;
            this.description = description;
            this.value = value;
            this.keepGoing = keepGoing;
        }

        public ResultBE(Type type, object value, bool keepGoing = true)
        {
            this.type = type;
            this.value = value;
            this.keepGoing = keepGoing;
        }

        /// <summary>
        /// Evalúa si el resultado es válido (OK) o no (cualquier otro).
        /// </summary>
        public Boolean IsValid
        {
            get
            {
                return IsCurrentError(Type.OK);
            }
        }

        /// <summary>
        /// Evalúa si el tipo de resultado coincide con el pasado por parámetro.
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public Boolean IsCurrentError(Type type)
        {
            return (this.type == type);
        }

        /// <summary>
        /// Devuelve el objeto, casteando el typo a través de Generic.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public T GetValue<T>()
        {
            return (T)Convert.ChangeType(this.value, typeof(T));
        }

        /// <summary>
        /// Devueve el objeto sin obligar el casting.
        /// </summary>
        /// <returns></returns>
        public object GetValue()
        {
            return this.value;
        }
    }
}
