using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Address
    {
        private int id;
        private string city;
        private Country country;
        private string street;
        private int number;
        private string zip;
        private string observation;

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

        public string City
        {
            get
            {
                return city;
            }

            set
            {
                city = value;
            }
        }

        public Country Country
        {
            get
            {
                return country;
            }

            set
            {
                country = value;
            }
        }

        public string Street
        {
            get
            {
                return street;
            }

            set
            {
                street = value;
            }
        }

        public int Number
        {
            get
            {
                return number;
            }

            set
            {
                number = value;
            }
        }

        public string Zip
        {
            get
            {
                return zip;
            }

            set
            {
                zip = value;
            }
        }

        public string Observation
        {
            get
            {
                return observation;
            }

            set
            {
                observation = value;
            }
        }
    }
}
