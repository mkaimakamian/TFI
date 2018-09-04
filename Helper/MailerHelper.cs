using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;

namespace Helper
{
    public static class MailerHelper
    {
        public static void Send(string subject, string body, string[] recipients)
        {
            try {
                // TODO - Los datos deberían estar guardados en un archivo de configuración
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("kaimakamian.mariano@gmail.com");

                SmtpClient smtp = new SmtpClient();
                smtp.Port = 587; 
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("kaimakamian.mariano@gmail.com", "Cript0genia");
                smtp.Host = "smtp.gmail.com";

                //Destinatarios
                foreach (string recipient in recipients)
                {
                    mail.To.Add(new MailAddress(recipient));
                }

                //Formatted mail body
                mail.IsBodyHtml = false;
                mail.Subject = subject;
                mail.Body = body;
                smtp.Send(mail);

                } catch (Exception exception)
                {
                    Console.WriteLine(exception.Message);
                }

                }

    }
}
