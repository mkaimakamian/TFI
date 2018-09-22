using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ORM;
using System.IO;
using BE;

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
                BackupMapper backupMapper = new BackupMapper();
                log.AddLogInfo("PerformBackup", "Creando respaldo...", this);

                if (backupMapper.Backup(""))
                {
                    log.AddLogInfo("PerformBackup", "El respaldo se ha generado exitosamente.", this);
                    return true;
                } else
                {
                    log.AddLogInfo("PerformBackup", "No se ha podido generar el respaldo.", this);
                    return false;
                }
            }
            catch (Exception exception)
            {
                log.AddLogCritical("PerformBackup", exception.Message, this);
                return false;
            }
        }

        /// <summary>
        /// Restaura la copia de respaldo
        /// </summary>
        /// <returns></returns>
        public bool PerformRestore()
        {
            try
            {
                BackupMapper backupMapper = new BackupMapper();
                log.AddLogInfo("PerformRestore", "Restaurando respaldo...", this);

                if (backupMapper.Backup(""))
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

            string path = System.Web.HttpContext.Current.Server.MapPath(("~/Resources"));

            DirectoryInfo Dir = new DirectoryInfo(path);
            FileInfo[] FileList = Dir.GetFiles("*.*", SearchOption.AllDirectories);
            foreach (FileInfo backupFile in FileList)
            {
                backups.Add(new Backup(backupFile.Name, backupFile.FullName, backupFile.CreationTime));
            }

            return backups;
        }
    }
}
