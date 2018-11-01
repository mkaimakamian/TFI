using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ORM;
using System.IO;
using BE;
using System.Configuration;
using Helper;

namespace BL
{
    public class BackupManager: BaseManager
    {
        /// <summary>
        /// Genera la copia de respaldo
        /// </summary>
        /// <returns></returns>
        public bool PerformBackup()
        {
            try
            {
                string folder = ConfigurationManager.AppSettings["BACKUP_PATH"];
                string fullPath = folder + "/" + DateTime.Now.Ticks + ".bkp";

                BackupMapper backupMapper = new BackupMapper();
                log.AddLogInfo("PerformBackup", "Creando respaldo...", this);

                if (backupMapper.Backup(fullPath))
                {
                    log.AddLogInfo("PerformBackup", "El respaldo se ha generado exitosamente.", this);
                    return true;
                } else
                {
                    string errorDescription = "No se ha podido generar el respaldo.";
                    log.AddLogCritical("PerformBackup", errorDescription, this);
                    AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                    return false;
                }
            }
            catch (Exception exception)
            {
                string errorDescription = exception.Message;
                log.AddLogCritical("PerformBackup", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }
        }

        /// <summary>
        /// Restaura la copia de respaldo
        /// </summary>
        /// <returns></returns>
        public bool PerformRestore(string name)
        {
            try
            {
                string folder = ConfigurationManager.AppSettings["BACKUP_PATH"];
                string fullPath = folder + "/" + name;

                BackupMapper backupMapper = new BackupMapper();
                log.AddLogInfo("PerformRestore", "Restaurando respaldo...", this);

                if (backupMapper.Restore(fullPath))
                {
                    log.AddLogInfo("PerformRestore", "El respaldo se ha restaurado exitosamente.", this);
                    return true;
                }
                else
                {
                    log.AddLogInfo("PerformRestore", "No se ha podido restaurar el respaldo.", this);
                    return false;
                }

            }
            catch (Exception exception)
            {
                log.AddLogCritical("PerformRestore", exception.Message, this);
                return false;
            }
        }

        public List<Backup> Get()
        {
            List<Backup> backups = new List<Backup>();

            string path = ConfigurationManager.AppSettings["BACKUP_PATH"];
            UtilsHelper.CreateDirectory(path);

            DirectoryInfo Dir = new DirectoryInfo(path);
            FileInfo[] FileList = Dir.GetFiles("*.bkp", SearchOption.AllDirectories);
            foreach (FileInfo backupFile in FileList)
            {
                backups.Add(new Backup(backupFile.Name, backupFile.FullName, backupFile.Length, backupFile.CreationTime));
            }

            return backups;
        }
    }
}
