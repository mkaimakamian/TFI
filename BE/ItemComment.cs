using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class ItemComment : Message
    {
        public ItemComment () {
            Resource = new Resource();          
        }

        public Resource Resource { get; set; }
        public ItemComment SentenceReference { get; set; }

        public string Answer
        {
            get { return SentenceReference != null ? SentenceReference.Sentence : "Sin respuesta"; }
        }

        public String AnswerDate
        {
            get { return SentenceReference != null ? SentenceReference.Date.ToShortDateString() : "--/--/--"; }
        }
    }
}
