using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BE;
using BL;

namespace Ubiquicity.Tests
{
    [TestClass]
    public class UserTest
    {
        [TestMethod]
        public void CreateBOUserAndLogin()
        {
            User user = new User();
            user.Name = "NombreTest";
            user.Lastname = "ApellidoTest";
            user.Mail = "mail@test.com";
            user.Username = "TestLoginUser";
            user.Password = "passwordTest";

            Language language = new Language();
            language.Id = 1;
            user.Language = language;

            UserManager um = new UserManager();
            bool result = um.Save(user);
            Assert.IsTrue(result, "El valor debería haber sido True.");

            SessionManager sm = new SessionManager();
            User retrievedUser = sm.LogIn(user.Username, user.Password);
            Assert.IsFalse(sm.HasErrors, "No debería contener errores");
            Assert.AreEqual(retrievedUser.Username, user.Username, "Los usuarios deberían coincidir.");
            Assert.AreEqual(retrievedUser.Mail, user.Mail, "Los mails deberían coincidir.");

        }
    }
}
