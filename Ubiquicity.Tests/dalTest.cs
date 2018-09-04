using System;
using System.Collections;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Data;
using DA;

namespace Ubiquicity.Tests
{
    [TestClass]
    public class DalTest
    {
        [TestMethod]
        public void TestDBRead()
        {
            Dal dal = new Dal();
            DataSet result = dal.Read(null, "spReadTest");
            DataRow row = result.Tables[0].Rows[0];
            Assert.AreEqual("Ejecutado", row[0], "El valor no es el esperado.");

        }

        [TestMethod]
        public void TestDBWrite()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            table.Add("@key", "value");
            bool result = dal.Write(table, "spWriteTest") >1;
            
            Assert.IsTrue(result, "El valor debería haber sido True.");

        }

    }
}
