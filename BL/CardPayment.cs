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

        public override double EstimatePaymentResult(double amount)
        {
            throw new NotImplementedException();
        }

        public override bool IsValid()
        {
            throw new NotImplementedException();
        }

        public override double ProcessPayment(double amount)
        {
            throw new NotImplementedException();
        }
    }
}
