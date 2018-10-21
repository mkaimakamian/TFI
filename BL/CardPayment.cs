using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace BL
{
    public class CardPayment : PaymentMethod
    {
        private CreditCard creditCard;

        public CardPayment(CreditCard creditCard)
        {
            this.creditCard = creditCard;
        }

        /// <summary>
        /// Evalúa si el monto puede ser cubierto por la tarjeta y devuelve el resto.
        /// Si el resultado es mayor a cero, significa que no se cubre el total a pagar.
        /// </summary>
        /// <param name="amount"></param>
        /// <returns></returns>
        public override double EstimatePaymentResult(double amount)
        {
            //Se asume que la tarjeta de crédito siempre tiene crédito suficiente, de modo tal que
            //siempre será verdadero.
            return 0;
        }

        public override double ProcessPayment(double amount)
        {
            //La tarjeta no registra ningún tipo de operación en el sistema, puesto que en realidad
            //se debería consumir un servicio externo.
            return 0;
        }

        public override bool IsValid()
        {

            bool isValid = true;

            //Asumo que al menos debe posee 3 dígitos
            if (creditCard.Cvv < 100)
            {
                string errorDescription = "Debe completarse el CVV.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            //Deben poseer al menos 4 dígitos
            if (creditCard.Field1 < 1000)
            {
                string errorDescription = "Debe completarse el campo 1 de la tarjeta.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (creditCard.Field2 < 1000)
            {
                string errorDescription = "Debe completarse el campo 2 de la tarjeta.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (creditCard.Field3 < 1000)
            {
                string errorDescription = "Debe completarse el campo 3 de la tarjeta.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (creditCard.Field4 < 1000)
            {
                string errorDescription = "Debe completarse el campo 4 de la tarjeta.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (creditCard.DueDate < DateTime.Today)
            {
                string errorDescription = "La tarjeta no puede presentar fecha de expiración anterior al día actual.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            //TODO - Comparar contra las tarjetas bloqueadas
            return isValid;
        }
    }
}
