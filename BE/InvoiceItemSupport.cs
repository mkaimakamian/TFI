using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class InvoiceItemSupport
    {
        public InvoiceItem InvoiceItem { get; set; }
        public List<ItemCommentSupport> Comments { get; set; }

        public InvoiceItemSupport()
        {
            InvoiceItem = new InvoiceItem();
            Comments = new List<ItemCommentSupport>();
        }
    }
}
