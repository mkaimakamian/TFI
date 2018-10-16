﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace BL
{
    public class InvoiceManager:BaseManager
    {

        /// <summary>
        /// Procesa el pago de los artículos.
        /// </summary>
        /// <param name="amount"></param>
        /// <param name="paymentMethods"></param>
        /// <returns></returns>
        public bool ProcessPayment(List<Map> resources, List<PaymentMethod> paymentMethods, User user)
        {
            //Total de los producto
            double totalAmount = resources.Sum(resource => resource.Price);
            double leftAmount = totalAmount;

            //Ejecuta una prueba para constatar que el saldo puede ser cubierto
            foreach(PaymentMethod paymentMethod in paymentMethods)
            {
                if (paymentMethod.IsValid())
                {
                    leftAmount = paymentMethod.EstimatePaymentResult(leftAmount);
                }
            }

            //Si el resto es igual o menor a 0, significa que los métodos elegidos cubren la deuda 
            //y se puede aplicar el cobro definitivo.
            if (leftAmount <= 0)
            {
                leftAmount = totalAmount;
                foreach (PaymentMethod paymentMethod in paymentMethods)
                {
                    leftAmount = paymentMethod.ProcessPayment(leftAmount);
                }

                //Guardar los datos de la factura y enviar el mail con el pdf

                    return true;
            } else
            {
                string errorDescription = "Los medios de pago no cubren el total a pagar.";
                log.AddLogInfo("ProcessPayment", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }
                
        }

        /// <summary>
        /// Devuelve el listado con el tipo de tarjetas disponibles.
        /// </summary>
        /// <returns></returns>
        public List<CreditCardType> GetCreditCards()
        {
            //MOCK
            List<CreditCardType> creditCards = new List<CreditCardType>();
            CreditCardType creditCard = new CreditCardType();
            creditCard.Name = "Visa";
            creditCard.Prefix = 325;
            creditCards.Add(creditCard);

            creditCard = new CreditCardType();
            creditCard.Name = "Master";
            creditCard.Prefix = 369;
            creditCards.Add(creditCard);

            return creditCards;
        }
    }
}