using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;
using BE;
using System.IO;
using System.Configuration;
using System.Web;

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

                mail.IsBodyHtml = true;
                mail.Subject = subject;
                mail.Body = body;
                smtp.Send(mail);

            } catch (Exception exception)
            {
                Console.WriteLine(exception.Message);
            }

            }

        public static void SendWelcomeMail(User user, String activationHash)
        {
            string body = GetTemplate(
                user.Name,
                "Estás recibiendo este mail porque te has registrado y queremos verificar tu identidad.",
                "http://localhost:50551/register_action.aspx?a=" + activationHash
                );

            Send("Gracias por registrarte, " + user.Name + "!", body, new string[] { user.Mail });
        }

        public static void SendResetPassword(User user, String activationHash)
        {
            string body = GetTemplate(
                user.Name,
                "Estás recibiendo este mail porque nos informaste que te olvidaste tu password.",
                "http://localhost:50551/recovery_action.aspx?a=" + activationHash
                );

            Send("Recupero de password - Ubiquicity", body, new string[] {user.Mail});
        }

        public static void SendResetPasswordByAdmin(User user, String activationHash)
        {
            string body = GetTemplate(
                user.Name,
                "Estás recibiendo este mail porque el administrador reseteó tu password y requiere que lo cambies.",
                "http://localhost:50551/recovery_action.aspx?a=" + activationHash
                );

            Send("Reseteo de password - Ubiquicity", body, new string[] {user.Mail});
        }

        public static void SendResetPasswordConfirmation(User user)
        {
            string body = GetTemplate(
                user.Name,
                "Estás recibiendo este mail para recordarte que has cambiado tu password." +
                Environment.NewLine + "Esperamos que no te la olvides otra vez ^_~",
                "http://localhost:50551/index.aspx"
                );

            Send("Password cambiado - Ubiquicity", body, new string[] { user.Mail });
        }

        /// <summary>
        /// Lee el archivo html y procede al reemplazo de las variables internas con el contenido.
        /// </summary>
        /// <param name="user"></param>
        /// <param name="topic"></param>
        /// <param name="webUrl"></param>
        /// <returns></returns>
        private static string GetTemplate(string user, string topic, string webUrl)
        {
            string path = ConfigurationManager.AppSettings["MAIL_TEMPLATE_PATH"];
            string fullPath = HttpContext.Current.Server.MapPath(path);
            StreamReader streamReader = new StreamReader(fullPath);
            String body = streamReader.ReadToEnd();
            streamReader.Dispose();
            return body.Replace("@usuario", user).Replace("@motivo",topic).Replace("@web", webUrl);
        }
    }
}
