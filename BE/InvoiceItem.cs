using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class InvoiceItem
    {
        private int id;
        private double price;
        private int quantity;
        private Resource resource;

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public double Price
        {
            get
            {
                return price;
            }

            set
            {
                price = value;
            }
        }

        public int Quantity
        {
            get
            {
                return quantity;
            }

            set
            {
                quantity = value;
            }
        }

        public Resource Resource
        {
            get
            {
                if (resource == null) resource = new Resource();
                return resource;
            }

            set
            {
                resource = value;
            }
        }
    }
}
