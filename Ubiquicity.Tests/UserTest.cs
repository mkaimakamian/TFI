using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BE;
using BL;
using PdfSharp.Pdf;
using System.IO;
using TheArtOfDev.HtmlRenderer.PdfSharp;
namespace Ubiquicity.Tests
{
    [TestClass]
    public class UserTest
    {

        [TestMethod]
        public void CrearPdf()
        {
            string path = "C:\\Users\\Kokumo\\Documents\\UAI\\5to\\TFI\\plataforma\\Ubiquicity\\Ubiquicity\\Resources\\mail.htm";
            StreamReader streamReader = new StreamReader(path);
            string body = streamReader.ReadToEnd();
            streamReader.Dispose();
            string replaced = body.Replace("@usuario", "ñlkñlk").Replace("@motivo", "klkjlJ").Replace("@web", "ljljlkj");

            PdfDocument midoc = PdfGenerator.GeneratePdf(replaced, PdfSharp.PageSize.A4);
            midoc.Save(@"C:\\tmp\\testPDF.pdf");

        }


        [TestMethod]
        public void CreateBOUserAndLogin()
        {
            User user = new User();
            user.Name = "NombreTest";
            user.Lastname = "ApellidoTest";
            user.Mail = "mail@test.com";
            user.Password = "passwordTest";

            Language language = new Language();
            language.Id = 1;
            user.Language = language;

            UserManager um = new UserManager();
            bool result = um.Save(user);
            Assert.IsTrue(result, "El valor debería haber sido True.");

            SessionManager sm = new SessionManager();
            //User retrievedUser = sm.LogIn(user.Username, user.Password);
            //Assert.IsFalse(sm.HasErrors, "No debería contener errores");
            //Assert.AreEqual(retrievedUser.Username, user.Username, "Los usuarios deberían coincidir.");
            //Assert.AreEqual(retrievedUser.Mail, user.Mail, "Los mails deberían coincidir.");

        }
    }
}
