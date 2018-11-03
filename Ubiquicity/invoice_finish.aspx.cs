using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using BE;
using Helper;

namespace Ubiquicity
{
    public partial class invoide_finish : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPoll();
            }
        }

        public void LoadPoll()
        {
            try
            {
                PollManager pollManager = new PollManager();
                Poll poll = pollManager.Get(7);

                pollRepeater.DataSource = poll.Questions;
                pollRepeater.DataBind();
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Excepción", exception.Message);
            }

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PopulateOptions(object sender, RepeaterItemEventArgs e)
        {
            RadioButtonList optionList = e.Item.FindControl("radioOptionList") as RadioButtonList;
            if (e.Item.DataItem != null)
            {
                optionList.DataSource = ((PollQuestion)e.Item.DataItem).Options;
                optionList.DataBind();
                optionList.DataTextField = "Option";
                optionList.DataValueField = "Id";
            }
        }

        protected void SubmitAnswer(object sender, EventArgs e)
        {
            List<PollAnswer> pollAnswers = new List<PollAnswer>();

            foreach (RepeaterItem item in pollRepeater.Items)
            {
                PollAnswer pollAnswer = new PollAnswer();
                pollAnswer.User = SessionHelper.GetUser();
                pollAnswer.PollOption.Id = Convert.ToInt32( ((RadioButtonList) item.FindControl("radioOptionList")).SelectedValue);
                pollAnswer.PollQuestion.Id = Convert.ToInt32(((HiddenField)item.FindControl("lblQuestion")).Value);
                //if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                pollAnswers.Add(pollAnswer);
            }

            PollAnswerManager pollAnswerManager = new PollAnswerManager();
            pollAnswerManager.Save(pollAnswers);
        }
    }
}