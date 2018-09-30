﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class News
    {
        private int id;
        private string title;
        private string body;
        private string image;
        private DateTime since;
        private DateTime until;
        private bool sent;
        private NewsCategory category;

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

        public string Title
        {
            get
            {
                return title;
            }

            set
            {
                title = value;
            }
        }

        public string Body
        {
            get
            {
                return body;
            }

            set
            {
                body = value;
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

        public DateTime Since
        {
            get
            {
                return since;
            }

            set
            {
                since = value;
            }
        }

        public DateTime Until
        {
            get
            {
                return until;
            }

            set
            {
                until = value;
            }
        }

        public string Resume
        {
            get
            {
                return body.Length > 250 ? body.Substring(0, 246) + " ..." : body;
            }
        }

        public bool Sent
        {
            get
            {
                return sent;
            }

            set
            {
                sent = value;
            }
        }

        public NewsCategory Category
        {
            get
            {
                if (category == null) category = new NewsCategory();
                return category;
            }

            set
            {
                category = value;
            }
        }
    }
}
