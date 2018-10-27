using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;

namespace Ubiquicity.UserControls
{
    public partial class UCFormPoll : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void CleanForm(List<PollOption> pollOptions)
        {
            optionListInput.DataSource = pollOptions;
            optionListInput.DataTextField = "Option";
            optionListInput.DataValueField = "Id";
            optionListInput.DataBind();

            nameInput.Value = "";
            descriptionInput.Value = "";
            dueDateInput.Date = "";
        }

        public void FillForm(Poll poll)
        {

            nameInput.Value = poll.Name;
            descriptionInput.Value = poll.Description;
            dueDateInput.Date = poll.DueDate.ToShortDateString();
            poll.PollType = false;
            poll.Questions = null;
        }

        public void PopulateModel(Poll poll)
        {
            poll.Name = nameInput.Value;
            poll.Description = descriptionInput.Value;
            poll.DueDate = Convert.ToDateTime(dueDateInput.Date);
            poll.PollType = false;
            poll.Questions = null;
        }

        /// <summary>
        /// Habilita el formulario para crear una nueva pregunta
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void NewQuestion(object sender, EventArgs e)
        {
            questionListCol.Disabled = true;
            newQuestionListCol.Disabled = false;
        }
    }
}