using Microsoft.VisualStudio.TestTools.UnitTesting;
using Pawnshop;
using System;

namespace UnitTestDB
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestValidation()
        {
            bool expect = true;
            bool result = MainWindow.Validation("kharitonov", "kharitonov");
            Assert.AreEqual(expect, result);
        }
        [TestMethod]
        public void TestAuth()
        {
            String Login = "kharitonov";
            String Password = "kharitonov";
            bool expect = true;
            bool result = MainWindow.TestAuth(Password, Login);
            Assert.AreEqual(expect, result);
        }
    }
}
