using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using Helper;

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

            pollQuestionList.DataSource = null;
            pollQuestionList.DataBind();

            nameInput.Value = "";
            descriptionInput.Value = "";
            dueDateInput.Date = "";
        }

        public void FillForm(Poll poll)
        {

            nameInput.Value = poll.Name;
            descriptionInput.Value = poll.Description;
            dueDateInput.Date = poll.DueDate.ToShortDateString();
            //poll.PollType = false;
            RefreshQuestionList(poll.Questions);
        }

        public void PopulateModel(Poll poll)
        {
            poll.Name = nameInput.Value;
            poll.Description = descriptionInput.Value;
            poll.DueDate = Convert.ToDateTime(dueDateInput.Date);
            poll.PollType = false;
            poll.Questions = SessionUtilHelper.GetPollQuestions(Session);

            SessionUtilHelper.FlushPollQuestion(Session);
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

        protected void AddQuestion(object sender, EventArgs e)
        {
            List<PollOption> pollOptions = new List<PollOption>();
            List<ListItem> selectedOptions = optionListInput.Items.Cast<ListItem>().Where(li => li.Selected).ToList();

            //Como es un elemento simple, no tiene sentido buscar el elemento en la base
            //puesto que todos los datos ya están disponibles.
            foreach(ListItem listItem in selectedOptions)
            {
                PollOption pollOption = new PollOption();
                pollOption.Id = Convert.ToInt32(listItem.Value);
                pollOption.Option = listItem.Text;
                pollOptions.Add(pollOption);
            }

            PollQuestion pollQuestion = new PollQuestion();
            pollQuestion.Question = questionInput.Value;
            pollQuestion.Options = pollOptions;

            SessionUtilHelper.KeepPollQuestion(pollQuestion, Session);
            RefreshQuestionList(SessionUtilHelper.GetPollQuestions(Session));

            questionInput.Value = "";
            optionListInput.ClearSelection();
        }

        /// <summary>
        /// Elimina de la lista de las preguntas, aquella que se encuentra seleccionada.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteQuestion(object sender, EventArgs e)
        {
            ListItem selectedQuestion = pollQuestionList.SelectedItem;
            PollQuestion pollQuestion = new PollQuestion();
            pollQuestion.Question = selectedQuestion.Text;
            SessionUtilHelper.RemovePollQuestion(pollQuestion, Session);
            RefreshQuestionList(SessionUtilHelper.GetPollQuestions(Session));
        }

        /// <summary>
        /// Actualiza el listado de preguntas.
        /// </summary>
        private void RefreshQuestionList(List<PollQuestion> questions)
        {
            pollQuestionList.DataSource = questions;
            pollQuestionList.DataTextField = "Question";
            pollQuestionList.DataBind();
        }
    }
}