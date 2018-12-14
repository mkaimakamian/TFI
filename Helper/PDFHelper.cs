using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Configuration;
using System.Web;
using BE;
using SelectPdf;

namespace Helper
{
    public static class PDFHelper
    {
        /// <summary>
        /// Crea la facturación en formato PDF y devuelve la ruta
        /// </summary>
        /// <param name="invoice"></param>
        /// <returns></returns>
        public static string CreateInvoice(Invoice invoice)
        {
            string finalPath = ConfigurationManager.AppSettings["PDF_INVOICE_FINAL_PATH"];
            UtilsHelper.CreateDirectory(finalPath);
            finalPath += "/" + invoice.Id + "_" + invoice.User.Lastname + ".pdf";
            string htmlInvoice = BuildInvoice(invoice);
            ConvertToPDF(htmlInvoice, finalPath);
            return finalPath;
        }

        private static string BuildInvoice(Invoice invoice)
        {
            string path = ConfigurationManager.AppSettings["INVOICE_TEMPLATE_PATH"];
            string fullPath = HttpContext.Current.Server.MapPath(path);
            StreamReader streamReader = new StreamReader(fullPath);
            string body = streamReader.ReadToEnd();
            streamReader.Dispose();

            //Detalle de la compra
            string detailRow = "<tr class=\"item\"><td>@itemDescription</td><td>@itemValue</td></tr>";
            string finalBlock = string.Empty;

            foreach (InvoiceItem ii in invoice.InvoiceItems)
            {
                finalBlock += detailRow.Replace("@itemDescription", ii.Resource.Name).Replace("@itemValue", ii.Price.ToString());
            }

            string crediNotes = string.Empty;
            // Notas de crédito
            if (invoice.CreditNotes != null)
            {
                foreach (CreditNote creditNote in invoice.CreditNotes)
                {
                    crediNotes += "Nota de crédito #" + creditNote.Id + " - " + creditNote.Description + "</br>";
                }
            }

            string creditCard = string.Empty;

            if (invoice.CreditCard != null)
            {
                creditCard = "Tarjeta: " + invoice.CreditCard.Field1 + "-xxxx-xxxx-" + invoice.CreditCard.Field4;
            }

                //Reemplazo
                string replaced = body.Replace(
                "@user", invoice.User.Name + " " + invoice.User.Lastname
            ).Replace(
                "@invoice", invoice.Id.ToString()
            ).Replace(
                "@date", invoice.Date.ToString("dd-MM-yyyy")
            ).Replace(
                "@mail", invoice.User.Mail
            ).Replace(
                "@address", invoice.BillingAddress.Street + " " + invoice.BillingAddress.Number + " (" + invoice.BillingAddress.Zip + "), " + invoice.BillingAddress.City
            ).Replace(
                "@itemDetail", finalBlock
            ).Replace(
                "@total", invoice.InvoiceItems.Sum(resource => resource.Price).ToString()
            ).Replace(
            "@notasCredito", crediNotes
            ).Replace(
                "@creditCard", creditCard
            );

            return replaced;
        }

        private static void ConvertToPDF(string htmlInvoice, string path)
        {
            PdfDocument doc = new PdfDocument();

            try
            {
                PdfPageSize pageSize;
                Enum.TryParse<PdfPageSize>("A4", true, out pageSize);

                PdfPageOrientation pdfOrientation;
                Enum.TryParse<PdfPageOrientation>("Portrait", true, out pdfOrientation);

                int webPageWidth = 1024;
                int webPageHeight = 0;

                HtmlToPdf converter = new HtmlToPdf();
                converter.Options.PdfPageSize = pageSize;
                converter.Options.MarginTop = 15;
                converter.Options.PdfPageOrientation = pdfOrientation;
                converter.Options.WebPageWidth = webPageWidth;
                converter.Options.WebPageHeight = webPageHeight;

                doc = converter.ConvertHtmlString(htmlInvoice);

                converter.Options.MaxPageLoadTime = 120;
                doc.Save(path);
            }
            catch (Exception exception)
            {
            }
            finally
            {
                doc.Close();
            }
        }
    }
}
