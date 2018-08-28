using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;

namespace Ubiquicity.UserControls
{
    public partial class UCModalNewMember : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void FillForm(User user)
        {
            FirstName = user.Name;
            LastName = user.Lastname;
            Mail = user.Mail;
            UserName = user.Username;
            Password = user.Password;
            PasswordVerification = user.Password;
            //Language = 

        }

        public string FirstName
        {
            get { return firstNameInput.Value; }
            set { firstNameInput.Value = value; }
        }

        public string LastName
        {
            get { return lastNameInput.Value; }
            set { lastNameInput.Value = value; }
        }

        public string Mail
        {
            get { return mailInput.Value; }
            set { mailInput.Value = value; }
        }

        public string UserName
        {
            get { return userInput.Value; }
            set { userInput.Value = value; }
        }

        public string Password
        {
            get { return passwordInput.Value; }
            set { passwordInput.Value = value; }
        }

        public string PasswordVerification
        {
            get { return passwordVerificationInput.Value; }
            set { passwordVerificationInput.Value = value; }
        }

        //public string Language
        //{
        //    get { return passwordVerificationInput.Value; }
        //    set { passwordVerificationInput.Value = value; }
        //}

        public void CleanForm()
        {
            FirstName = "";
            LastName = "";
            Password = "";
            PasswordVerification = "";
            UserName = "";
            Mail = "";
        }

        public void PopulateModel(User user)
        {
            user.Name = FirstName;
            user.Lastname = LastName;
            user.Password = Password;
            user.Username = UserName;
            user.Language.Id = 1; //Todo - cambiar esto!
            user.Mail = Mail;
        }
    }
}