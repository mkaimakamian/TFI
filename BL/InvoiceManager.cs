using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;
using PdfSharp.Pdf;
using TheArtOfDev.HtmlRenderer.PdfSharp;

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
        public bool ProcessPayment(Invoice invoice)
        {
            double totalAmount = invoice.InvoiceItems.Sum(resource => resource.Price);
            double leftAmount = totalAmount;

            List<PaymentMethod> paymentMethods = new List<PaymentMethod>();
            paymentMethods.Add(new CreditNotePayment(invoice.CreditNotes));
            paymentMethods.Add(new CardPayment(invoice.CreditCard));

            //Ejecuta una prueba para constatar que el saldo puede ser cubierto
            foreach (PaymentMethod paymentMethod in paymentMethods)
            {
                if (paymentMethod.IsValid())
                {
                    leftAmount = paymentMethod.EstimatePaymentResult(leftAmount);
                } else
                {
                    AddError(paymentMethod.Errors);
                    return false;
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

                SaveInvoice(invoice);
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
        /// Persiste la factura en el sistema.
        /// </summary>
        /// <param name="invoice"></param>
        private void SaveInvoice(Invoice invoice)
        {
            //Persistir el invoice: debería hacerse en una transacción
            AddressManager addressManager = new AddressManager();
            InvoiceMapper invoiceMapper = new InvoiceMapper();
            InvoiceItemMapper invoiceItemMapper = new InvoiceItemMapper();
            // TODO - si se crea un manager, mover la tarjeta
            CreditCardMapper creditCardMapper = new CreditCardMapper();
            InvoiceCreditNoteMapper invoiceCNMapper = new InvoiceCreditNoteMapper();
            InvoiceCreditCardMapper invoiceCCMapper = new InvoiceCreditCardMapper();

            addressManager.Save(invoice.BillingAddress);
            creditCardMapper.Save(invoice.CreditCard);
            //Credit notes exist beforehand//
            invoiceMapper.Save(invoice);
            invoiceItemMapper.Save(invoice);
            invoiceCNMapper.Save(invoice);
            invoiceCCMapper.Save(invoice);

        }
    }
}
