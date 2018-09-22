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
        private long size;
        private DateTime created;

        public Backup(string name, string path, long size, DateTime created)
        {
            Name = name;
            Path = path;
            Size = size;
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

        public long Size
        {
            get { return size; }
            set { size = value; }
        }

        public DateTime Created
        {
            get { return created; }
            set { created = value; }
        }
    }
}
