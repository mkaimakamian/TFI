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

            SessionUtilHelper.FlushPollQuestion(Session);
            pollQuestionList.Items.Clear();
            pollQuestionList.DataSource = null;
            pollQuestionList.DataBind();

            nameInput.Value = "";
            descriptionInput.Value = "";
            dueDateInput.Date = "";
            dueDateInput.DefaultView = AjaxControlToolkit.CalendarDefaultView.Days;
            pollRadioList.SelectedIndex = 1;
            activeCheck.Checked = false;
        }

        public void FillForm(Poll poll)
        {
            nameInput.Value = poll.Name;
            descriptionInput.Value = poll.Description;
            dueDateInput.Date = poll.DueDate.ToShortDateString();
            dueDateInput.DefaultView = AjaxControlToolkit.CalendarDefaultView.Days;
            pollRadioList.SelectedIndex = (int)poll.Type;
            SessionUtilHelper.KeepPollQuestion(poll.Questions, Session);
            RefreshQuestionList(poll.Questions);
            activeCheck.Checked = poll.Active;
        }

        public void PopulateModel(Poll poll)
        {
            poll.Name = nameInput.Value;
            poll.Description = descriptionInput.Value;
            poll.DueDate = String.IsNullOrEmpty(dueDateInput.Date)? DateTime.Now :  Convert.ToDateTime(dueDateInput.Date);
            poll.Active = activeCheck.Checked;
            Poll.PollType type;
            Enum.TryParse<Poll.PollType>(pollRadioList.SelectedItem.Value, true, out type);
            poll.Type = type;

            //Es un manejo malo... pero se eliminan todas las preguntas de la lista porque
            //se recibe el listado actualizado de la sesión
            poll.Questions = new List<PollQuestion>();

            //Es un chinito: si no se editaron, no se debe llenar la lista
            if (SessionUtilHelper.PollQuestionEdited())
            {
                poll.Questions.AddRange(SessionUtilHelper.GetPollQuestions(Session));
            }
            else
            {
                poll.Questions = null;
            }
            SessionUtilHelper.FlushPollQuestion(Session);
        }

        /// <summary>
        /// Habilita el formulario para crear una nueva pregunta
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void NewQuestion(object sender, EventArgs e)
        {
            //questionListCol.Disabled = true;
            //newQuestionListCol.Disabled = false;
        }

        protected void AddQuestion(object sender, EventArgs e)
        {
            //Prgeunta vacía...
            if (String.IsNullOrEmpty(questionInput.Value) ) return;

            List<PollOption> pollOptions = new List<PollOption>();
            List<ListItem> selectedOptions = optionListInput.Items.Cast<ListItem>().Where(li => li.Selected).ToList();

            //No se eligieron opciones
            if (selectedOptions.Count == 0) return;

            //Como es un elemento simple, no tiene sentido buscar el elemento en la base
            //puesto que todos los datos ya están disponibles.
            foreach (ListItem listItem in selectedOptions)
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
            if (pollQuestionList.SelectedItem == null) return;
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