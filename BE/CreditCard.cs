﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class CreditCard
    {
        private int field1;
        private int field2;
        private int field3;
        private int field4;
        private DateTime dueDate;
        private int cvv;

        public int Field1
        {
            get
            {
                return field1;
            }

            set
            {
                field1 = value;
            }
        }

        public int Field2
        {
            get
            {
                return field2;
            }

            set
            {
                field2 = value;
            }
        }

        public int Field3
        {
            get
            {
                return field3;
            }

            set
            {
                field3 = value;
            }
        }

        public int Field4
        {
            get
            {
                return field4;
            }

            set
            {
                field4 = value;
            }
        }

        public DateTime DueDate
        {
            get
            {
                return dueDate;
            }

            set
            {
                dueDate = value;
            }
        }

        public int Cvv
        {
            get
            {
                return cvv;
            }

            set
            {
                cvv = value;
            }
        }
    }
}
