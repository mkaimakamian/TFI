using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;

namespace Ubiquicity.UserControls
{
    public partial class UCModalNewMember : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    LoadLanguages();   
            //}
        }

        //private void LoadLanguages()
        //{
        //    LanguageManager languageManager = new LanguageManager();
        //    dropLanguageInput.DataTextField = "Name";
        //    dropLanguageInput.DataValueField = "Id";
        //    dropLanguageInput.DataSource = languageManager.Get();
        //    dropLanguageInput.DataBind();
        //}

        public void HidePasswordFields()
        {
            passwordControls.Visible = false;
        }

        public void ShowPasswordFields()
        {
            passwordControls.Visible = true;
        }

        public void DisableUserField()
        {
            userInput.Disabled = true;
        }

        public void EnableUserField()
        {
            userInput.Disabled = false;
        }

        public void FillForm(User user)
        {
            FirstName = user.Name;
            LastName = user.Lastname;
            Mail = user.Mail;
            UserName = user.Username;
            Password = user.Password;
            PasswordVerification = user.Password;
            //dropLanguageInput.SelectedValue = user.Language.Id.ToString();
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
        //    get { return dropLanguageInput.SelectedValue; }
        //    set { dropLanguageInput.SelectedValue = value; }
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
            user.Language.Id = 1; // int.Parse(dropLanguageInput.SelectedValue);
            user.Mail = Mail;
        }
    }
}