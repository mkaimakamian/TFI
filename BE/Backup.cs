using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Backup
    {
        private string id;
        private string path;
        private long size;
        private DateTime created;

        public Backup(string id, string path, long size, DateTime created)
        {
            Id = id;
            Path = path;
            Size = size;
            Created = created;
        }

        public string Id
        {
            get { return id; }
            set { id = value; }
        }

        public string Path
        {
            get { return path; }
            set { path = value; }
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
