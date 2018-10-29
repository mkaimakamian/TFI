using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Configuration;
using System.Web;
using PdfSharp.Pdf;
using TheArtOfDev.HtmlRenderer.PdfSharp;
using BE;

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
            if (!Directory.Exists(finalPath)) Directory.CreateDirectory(finalPath);
            finalPath += "/" + invoice.Id + "_" + invoice.User.Lastname+".pdf";
            string htmlInvoice = BuildInvoice(invoice);
            PdfDocument pdfInvoice = PdfGenerator.GeneratePdf(htmlInvoice, PdfSharp.PageSize.A4);
            pdfInvoice.Save(finalPath);

            return finalPath;
        }

        private static string BuildInvoice(Invoice invoice)
        {
            string path = ConfigurationManager.AppSettings["INVOICE_TEMPLATE_PATH"];
            string fullPath = HttpContext.Current.Server.MapPath(path);
            StreamReader streamReader = new StreamReader(fullPath);
            string body = streamReader.ReadToEnd();
            streamReader.Dispose();
            string replaced = body.Replace(
                "$$user", invoice.User.Name + " " + invoice.User.Lastname
            ).Replace(
                "$$mail", invoice.User.Mail
            ).Replace(
                "$$address", invoice.BillingAddress.Street + " " + invoice.BillingAddress.Number
                );

            return replaced;
        }
    }
}
