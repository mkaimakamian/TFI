using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    // TODO - Actualizar en ea
    public class LogManager
    {
        //public ResultBM GetLogs(LogDTO filter)
        //{
        //    ResultBM result;
        //    try
        //    {
        //        LogDAL logDal = new LogDAL();
        //        List<LogDTO> logDtos = logDal.GetLogs(filter);
        //        List<LogBM> logBms = ConvertIntoBusinessModel(logDtos);
        //        result = new ResultBM(ResultBM.Type.OK, "Recuperación de registros exitosa.", logBms);
        //    }
        //    catch (Exception exception)
        //    {
        //        result = new ResultBM(ResultBM.Type.EXCEPTION, SessionHelper.GetTranslation("RETRIEVING_ERROR") + " " + exception.Message, exception);

        //    }

        //    return result;
        //}

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

        //private LogBM ConvertIntoBusinessModel(LogDTO log)
        //{
        //    LogBM result = new LogBM();
        //    result.Id = log.id;
        //    result.LogLevel = log.logLevel.ToString();
        //    result.Action = log.action;
        //    result.Description = log.description;
        //    result.Entity = log.entity;
        //    result.Created = log.created;
        //    return result;
        //}

      
        //private List<LogBM> ConvertIntoBusinessModel(List<LogDTO> logs)
        //{
        //    List<LogBM> result = new List<LogBM>();
        //    foreach (LogDTO log in logs)
        //    {
        //        result.Add(ConvertIntoBusinessModel(log));
        //    }
        //    return result;
        //}

        //public ResultBM GetCollection(Dictionary<string, string> filter = null)
        //{
        //    //El filtro se modela utilizando el DTO que es la representación del modelo en base
        //    LogDTO logFilter = null;
        //    if (filter != null && filter.Count > 0)
        //    {
        //        logFilter = new LogDTO();
        //        //logFilter.logLevel = filter.ContainsKey("LogLevel") ? (LogDTO.Level) int.Parse(filter["LogLevel"])  : LogDTO.Level.DEBUG;                
        //        logFilter.logLevel = (LogDTO.Level)Enum.Parse(typeof(LogDTO.Level), filter["LogLevel"].ToString());
        //        logFilter.action = filter.ContainsKey("Action") ? filter["Action"] : null;
        //        logFilter.description = filter.ContainsKey("Description") ? filter["Description"] : null;
        //        logFilter.entity = filter.ContainsKey("Entity") ? filter["Entity"] : null;
        //        logFilter.created = filter.ContainsKey("Created") ? DateTime.Parse(filter["Created"]) : new DateTime(1900, 1, 1);
        //    }

        //    return GetLogs(logFilter);

        //}
    }
}
