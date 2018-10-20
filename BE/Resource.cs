using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Resource
    {
        private int id;
        private string name;
        private string description;
        private double price;
        private Category category;
        private string image;
        

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

        public string Name
        {
            get
            {
                return name;
            }

            set
            {
                name = value;
            }
        }

        public string Description
        {
            get
            {
                return description;
            }

            set
            {
                description = value;
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

        public Category Category
        {
            get
            {
                if (category == null) category = new Category();
                return category;
            }

            set
            {
                category = value;
            }
        }

        // Para poder leer el nombre en la grill
        public String CategoryName
        {
            get
            {
                return Category.Name;
            }

        }

        public string Image
        {
            get
            {
                return image;
            }

            set
            {
                image = value;
            }
        }
    }
}
