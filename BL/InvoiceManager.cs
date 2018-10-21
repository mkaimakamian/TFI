using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
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

                //Crear invoice
                //Crear PDF
                //CreateInvoicePDF(resources);

                    return true;
            } else
            {
                string errorDescription = "Los medios de pago no cubren el total a pagar.";
                log.AddLogInfo("ProcessPayment", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }
                
        }

        //TODO - Pasar a un helper... etso es todo frula
        private void CreateInvoicePDF(List<Map> resources)
        {
            //PdfDocument pdf = PdfGenerator.GeneratePdf("<p><h1>Hello World</h1>This is html rendered text</p>", PageSize.A4);
            //pdf.Save("document.pdf");


            //string prueba = MailerHelper.GetTemplate("lalalala", "lkskslñksñks", "ljljsdljs");
            //PdfDocument invoice = new PdfDocument(prueba);
            //invoice.Save("c:/tmp/lala.pdf");
            //    //PdfGenerator.GeneratePdf(html, PageSize.A4, 60);
            //pdf.Save(pathOUT);
        }

    }
}
