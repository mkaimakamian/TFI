using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BE;
using BL;
using System.Collections.Generic;

namespace Ubiquicity.Tests
{
    [TestClass]
    public class LanguageTest
    {
        [TestMethod]
        public void GetALanguage()
        {
            LanguageManager manager = new LanguageManager();
            Language language = manager.Get(1);
            Assert.AreEqual(language.Name, "Español", "Debería ser español");

        }

        [TestMethod]
        public void GetLanguages()
        {
            LanguageManager manager = new LanguageManager();
            List<Language> language = manager.Get();
        }
    }
}
