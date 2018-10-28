using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Translation
    {
        private int id;
        //private Label label;
        private string translate;

        public Translation()
        {
            //label = new Label();
        }

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

        //public Label Label
        //{
        //    get
        //    {
        //        return label;
        //    }

        //    set
        //    {
        //        label = value;
        //    }
        //}

        //public string LabelDescription
        //{
        //    get
        //    {
        //        return label.Description;
        //    }
        //}

        public string Translate
        {
            get
            {
                return translate;
            }

            set
            {
                translate = value;
            }
        }
    }
}
