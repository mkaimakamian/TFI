using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class PollAnswer
    {
        User user;
        PollQuestion pollQuestion;
        PollOption pollOption;

        public PollAnswer()
        {
            pollOption = new PollOption();
            pollQuestion = new PollQuestion();
            user = new User();
        }

        public User User
        {
            get
            {
                return user;
            }

            set
            {
                user = value;
            }
        }

        public PollQuestion PollQuestion
        {
            get
            {
                return pollQuestion;
            }

            set
            {
                pollQuestion = value;
            }
        }

        public PollOption PollOption
        {
            get
            {
                return pollOption;
            }

            set
            {
                pollOption = value;
            }
        }
    }
}
