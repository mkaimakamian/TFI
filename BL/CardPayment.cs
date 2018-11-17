﻿using System;
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

            isValid &= IsValidNumber(SecurityHelper.RDesencrypt(creditCard.Cvv), 3);
            isValid &= IsValidNumber(creditCard.Field1);
            isValid &= IsValidNumber(creditCard.Field2);
            isValid &= IsValidNumber(creditCard.Field3);
            isValid &= IsValidNumber(creditCard.Field4);

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

            creditCard.Field1 = SecurityHelper.REncrypt(creditCard.Field1);
            creditCard.Field2 = SecurityHelper.REncrypt(creditCard.Field2);
            creditCard.Field3 = SecurityHelper.REncrypt(creditCard.Field3);
            creditCard.Field4 = SecurityHelper.REncrypt(creditCard.Field4);

            CreditCard cc = creditCardMapper.CreditCardList(creditCard);
            if (cc == null)
            {
                string errorDescription = "La tarjeta debe ser habilitada para su uso.";
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

        private bool IsValidNumber(string number, int qty = 4)
        {
            bool isValid = true;
            int converted = 0;

            if (String.IsNullOrEmpty(number))
            {
                string errorDescription = "Alguno de los números de la tarjeta está incompleto.";
                log.AddLogCritical("IsValidNumber", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (number.Length != qty)
            {
                string errorDescription = "Todos los números deben poseer "+ qty+" dígitos";
                log.AddLogCritical("IsValidNumber", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (!int.TryParse(number, out converted))
            {
                string errorDescription = "No se admiten caracteres en los campos numéricos de la tarjeta.";
                log.AddLogCritical("IsValidNumber", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            return isValid;
        }
    }
}
