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

            if (!IsValid(invoice)) return false;

            List<PaymentMethod> paymentMethods = new List<PaymentMethod>();

            if (invoice.CreditNotes != null) paymentMethods.Add(new CreditNotePayment(invoice.CreditNotes));
            if (invoice.CreditCard != null) paymentMethods.Add(new CardPayment(invoice.CreditCard));

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

            //- valido la dirección ahora que se sabe que se puede afrontar el gasto-//
            AddressManager addressManager = new AddressManager();
            if (!addressManager.IsValid(invoice.BillingAddress))
            {
                AddError(addressManager.Errors);
                return false;
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
                SaveTracking(invoice);
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
        /// Genera el PDF para la descarga de la factura
        /// </summary>
        public string DownloadInvoice(int id) {

            AddressManager addressManager = new AddressManager();
            UserManager userManager = new UserManager();
            InvoiceItemMapper invoiceItemMapper = new InvoiceItemMapper();
            InvoiceMapper invoiceMapper = new InvoiceMapper();

            Invoice invoice = invoiceMapper.Get(id);
            invoice.BillingAddress = addressManager.Get(invoice.BillingAddress.Id);
            invoice.User = userManager.Get(invoice.User.Id);
            invoice.InvoiceItems = invoiceItemMapper.Get(invoice);
            //No es necesaria la información sobre el medio de pago //

            string fullPath = PDFHelper.CreateInvoice(invoice);

            if (String.IsNullOrEmpty(fullPath))
            {
                string errorDescription = "Se ha producido un error al generar el archivo de la factura.";
                log.AddLogCritical("DownloadInvoice", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
            }

            return fullPath;
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
            InvoiceCreditCardMapper invoiceCCMapper = new InvoiceCreditCardMapper();

            addressManager.Save(invoice.BillingAddress);
            invoiceMapper.Save(invoice);
            invoiceItemMapper.Save(invoice);
            if (invoice.CreditCard != null)
            {
                creditCardMapper.Save(invoice.CreditCard);
                invoiceCCMapper.Save(invoice);
            }
        }

        /// <summary>
        /// Genera el registro de traxckeo del producto.
        /// </summary>
        private void SaveTracking(Invoice invoice)
        {
            TrackingManager trackingManager = new TrackingManager();
            // TODO - implementar control de error.
            trackingManager.Save(invoice);
        }

        private bool IsValid(Invoice invoice)
        {
            bool isValid = true;

            if (invoice.CreditCard == null && invoice.CreditNotes == null)
            {
                string errorDescription = "Debe escogerse al menos un método de pago.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }
            
            return isValid;
        }

    }
}
