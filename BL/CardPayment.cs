using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;
using Helper;

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
            creditCard.Field1 = SecurityHelper.RDesencrypt(creditCard.Field1);
            creditCard.Field2 = SecurityHelper.RDesencrypt(creditCard.Field2);
            creditCard.Field3 = SecurityHelper.RDesencrypt(creditCard.Field3);
            creditCard.Field4 = SecurityHelper.RDesencrypt(creditCard.Field4);
            
            //Asumo que al menos debe posee 3 dígitos
            if (String.IsNullOrEmpty(SecurityHelper.RDesencrypt(creditCard.Cvv)))
            {
                string errorDescription = "Debe completarse el CVV.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            //Deben poseer al menos 4 dígitos
            if (String.IsNullOrEmpty(creditCard.Field1))
            {
                string errorDescription = "Debe completarse el campo 1 de la tarjeta.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(creditCard.Field2))
            {
                string errorDescription = "Debe completarse el campo 2 de la tarjeta.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty((creditCard.Field3)))
            {
                string errorDescription = "Debe completarse el campo 3 de la tarjeta.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(creditCard.Field4))
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

            // Control de validez de la tarjeta
            CreditCardMapper creditCardMapper = new CreditCardMapper();
            if (!creditCardMapper.IsValidPrefix(creditCard))
            {
                string errorDescription = "El emisor de la tarjeta no se corresponde con el declarado.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                isValid = false;
            }
            

            if (creditCardMapper.IsInBlackList(creditCard))
            {
                string errorDescription = "La tarjeta actual no puede utilizarse porque está anulada.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                isValid = false;
            }

            creditCard.Field1 = SecurityHelper.REncrypt(creditCard.Field1);
            creditCard.Field2 = SecurityHelper.REncrypt(creditCard.Field2);
            creditCard.Field3 = SecurityHelper.REncrypt(creditCard.Field3);
            creditCard.Field4 = SecurityHelper.REncrypt(creditCard.Field4);

            return isValid;
        }
    }
}
