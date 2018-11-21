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

            isValid &= VOnlyNumber(SecurityHelper.RDesencrypt(creditCard.Cvv), 3, 3, "CVV", "IsValidForEdit");
            isValid &= VOnlyNumber(creditCard.Field1, 4, 4, "Campo #1", "IsValid");
            isValid &= VOnlyNumber(creditCard.Field2, 4, 4, "Campo #2", "IsValid");
            isValid &= VOnlyNumber(creditCard.Field3, 4, 4, "Campo #3", "IsValid");
            isValid &= VOnlyNumber(creditCard.Field4, 4, 4, "Campo #4", "IsValid");

            if (creditCard.DueDate < DateTime.Today)
            {
                string errorDescription = "La tarjeta no puede presentar fecha de expiración anterior al día actual.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            //Evalúo parcialmente el estado de la validación
            if (!isValid) return false;

            // Control de validez de la tarjeta
            CreditCardMapper creditCardMapper = new CreditCardMapper();
            if (!creditCardMapper.IsValidPrefix(creditCard))
            {
                string errorDescription = "El emisor de la tarjeta no se corresponde con el declarado.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                isValid = false;
            }

            creditCard.Field1 = SecurityHelper.REncrypt(creditCard.Field1);
            creditCard.Field2 = SecurityHelper.REncrypt(creditCard.Field2);
            creditCard.Field3 = SecurityHelper.REncrypt(creditCard.Field3);
            creditCard.Field4 = SecurityHelper.REncrypt(creditCard.Field4);

            //Evalúo parcialmente el estado de la validación
            if (!isValid) return false;

            CreditCard cc = creditCardMapper.CreditCardList(creditCard);
            if (cc == null)
            {
                string errorDescription = "La tarjeta no está registrada ante la entidad emisora; verifique los datos.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                isValid = false;
            }

            if (cc != null && !cc.Allowed)
            {
                string errorDescription = "La tarjeta actual no puede utilizarse porque está anulada.";
                log.AddLogCritical("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                isValid = false;
            }
            return isValid;
        }
    }
}
