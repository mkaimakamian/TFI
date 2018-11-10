using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Collections;
using BE;
using DA;

namespace ORM
{
    public class MessageMapper
    {

        public bool Save(Message message)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@sentence", message.Sentence);
            table.Add("@date", message.Date);
            table.Add("@userId", message.User.Id);
            message.Id = dal.Write(table, "spWriteMessage");

            return message.Id > 0;
        }

    }
}
