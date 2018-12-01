using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class ItemCommentSupport: Message
    {
        public bool IsOperator { get; set; }
        public int InvoiceItemId { get; set; } //está mal este modelo
    }
}
