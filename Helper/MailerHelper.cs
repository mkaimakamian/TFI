﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;
using BE;

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

        public static void SendWelcomeMail(User user, String activationHash)
        {
            Send(
            "Gracias por registrarte, " + user.Name + "!",
            "Estás recibiendo este mail porque te has registrado y queremos verificar tu identidad." +
            Environment.NewLine +
            "Por favor, accedé a la siguiente url: http://localhost:50551/register_action.aspx?a=" + activationHash,
            new string[] { user.Mail });
        }

        public static void SendResetPassword(User user, String activationHash)
        {
            Send(
            "Recupero de password - Ubiquicity",
            "Estás recibiendo este mail porque nos informaste que te olvidaste tu password." +
            Environment.NewLine +
            "Por favor, accedé a la siguiente url para resetear el password: http://localhost:50551/recovery_action.aspx?a=" + activationHash,
            new string[] { user.Mail });
        }

        public static void SendResetPasswordByAdmin(User user, String activationHash)
        {
            Send(
            "Reseteo de password - Ubiquicity",
            "Estás recibiendo este mail porque el administrador reseteó tu password y requiere que lo cambies." +
            Environment.NewLine +
            "Por favor, accedé a la siguiente url para resetear el password: http://localhost:50551/recovery_action.aspx?a=" + activationHash,
            new string[] { user.Mail });
        }

        public static void SendResetPasswordConfirmation(User user)
        {
            Send(
            "Password cambiado - Ubiquicity",
            "Estás recibiendo este mail para recordarte que has cambiado tu password." +
            Environment.NewLine +  "Esperamos que no te la olvides otra vez ^_~",
            new string[] { user.Mail });
        }
    }
}
