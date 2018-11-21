using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class LogManager
    {
        public void AddLogInfo(String action, string description, Object entity, string user = null)
        {
            CreateLog(LogEntry.Level.INFO, action, description, entity.GetType().ToString(), user);
        }

        public void AddLogWarn(String action, string description, Object entity, string user = null)
        {
            CreateLog(LogEntry.Level.WARNING, action, description, entity.GetType().ToString(), user);
        }

        public void AddLogCritical(String action, string description, Object entity, string user = null)
        {
            CreateLog(LogEntry.Level.CRITICAL, action, description, entity.GetType().ToString(), user);
        }

        public void AddLogDebug(String action, string description, Object entity, string user = null)
        {
            CreateLog(LogEntry.Level.DEBUG, action, description, entity.GetType().ToString(), user);
        }

        private void CreateLog(LogEntry.Level loglevel, string action, string description, string entity, string user)
        {
            LogMapper logMapper = new LogMapper();
            LogEntry logEntry = new LogEntry();

            logEntry.LogLevel = loglevel;
            logEntry.Action = action;
            logEntry.Description = description;
            logEntry.Entity = entity;
            logEntry.User = user == null? "unknown" : user;
            
            logMapper.Save(logEntry);
        }

        public List<LogEntry> Get()
        {
            LogMapper logMapper = new LogMapper();
            return logMapper.Get();
        }

        public List<LogEntry> Get(List<QueryFilter> filters)
        {
            LogMapper logMapper = new LogMapper();
            return logMapper.Get(filters);
        }
    }
}
