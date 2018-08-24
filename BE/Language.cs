using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Language
    {
        private int id;
        private string name;
        private List<Translation> translations;

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

        public List<Translation> Translations
        {
            get
            {
                if (translations == null)
                {
                    translations = new List<Translation>();
                }
                return translations;
            }

            set
            {
                translations = value;
            }
        }
    }
}
