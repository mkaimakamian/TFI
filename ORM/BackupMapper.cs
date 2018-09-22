using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DA;

namespace ORM
{
    public class BackupMapper
    {
        public bool Backup(string fullBackupPath)
        {
            Dal dal = new Dal();
            return dal.Backup(fullBackupPath);
        }

        public bool Restore(string fullBackupPath)
        {
            Dal dal = new Dal();
            return dal.Restore(fullBackupPath);
        }
    }
}
