using System;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BE;
using BL;

namespace Ubiquicity.Tests
{
    [TestClass]
    public class RoleTest
    {
        [TestMethod]
        public void RetrieveRoles()
        {
            User user = new User();
            user.Id = 2;

            RoleManager roleManager = new RoleManager();
            List<Role> roles = roleManager.Get(user);
            
            Assert.IsFalse(roleManager.HasErrors, "No debería contener errores.");

            Assert.IsTrue(roles.Count > 0, "Debería contener elementos.");
        }
    }
}
