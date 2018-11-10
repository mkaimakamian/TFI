using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Message
    {
        public Message()
        {
            User = new User();
        }
        public int Id { get; set; }
        public string Sentence { get; set; }
        public DateTime Date { get; set; }
        public User User { get; set; }
    }
}
