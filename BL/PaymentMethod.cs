using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public abstract class PaymentMethod:BaseManager
    {
        /// <summary>
        /// Debe implementar el proceso que permita identificar si el pago puede ser cancelado en su totalidad.
        /// </summary>
        /// <param name="amount"></param>
        /// <returns></returns>
        public abstract double EstimatePaymentResult(double amount);

        /// <summary>
        /// Ejecuta el procesamiento del pago y devuelve el resto que no pudo ser cancelado.
        /// </summary>
        /// <param name="amount"></param>
        /// <returns></returns>
        public abstract double ProcessPayment(double amount);

        /// <summary>
        /// Valida que se esté en condiciones de intentar procesar el pago.
        /// </summary>
        /// <returns></returns>
        public abstract bool IsValid();
    }
}
