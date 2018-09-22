using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Backup
    {
        private int id;
        private string path;
        private string name;
        private DateTime created;

        public Backup(string name, string path, DateTime created)
        {
            Name = name;
            Path = path;
            Created = created;
        }

        // No es necesario pero mantiene compatibilidad con la grilla.
        public int Id
        {
            get { return 0; }
        }

        public string Path
        {
            get { return path; }
            set { path = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public DateTime Created
        {
            get { return created; }
            set { created = value; }
        }
    }
}
