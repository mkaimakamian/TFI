﻿using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.IO;
using Helper;
using BL;

namespace Ubiquicity.Tests
{
    [TestClass]
    public class UserTest
    {

        [TestMethod]
        public void testAsynch()
        {
            string encoded = SecurityHelper.REncrypt("123654dfA45");
            string desencoded = SecurityHelper.RDesencrypt(encoded);
        }

        [TestMethod]
        public void searchFile()
        {
            new SearchManager().PerformSearch("head");
        }
    }
}
