using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Collections;
using BE;
using DA;

namespace ORM
{
    public class LogMapper
    {
        public bool Save(LogEntry logEntry)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@logLevel", Enum.GetName(typeof(LogEntry.Level), logEntry.LogLevel));
            table.Add("@action", logEntry.Action);
            table.Add("@description", logEntry.Description);
            table.Add("@entity", logEntry.Entity);
            table.Add("@userName", logEntry.User);

            return dal.Write(table, "spWriteLog") > 0;
        }

        /// <summary>
        /// Recupera todos los registros de la bitácora.
        /// </summary>
        /// <returns></returns>
        public List<LogEntry> Get()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<LogEntry> logEntries = null;

            DataSet result = dal.Read(table, "spReadLog");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                logEntries = new List<LogEntry>();

                foreach (DataRow data in result.Tables[0].Rows)
                {
                    logEntries.Add(ConvertToModel(data));
                }
            }

            return logEntries;
        }

        public List<LogEntry> Get(List<QueryFilter> filters)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<LogEntry> logEntries = null;

            foreach(QueryFilter qf in filters)
            {
                table.Add(qf.Key, qf.Value);
            }

            DataSet result = dal.Read(table, "spReadLog");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                logEntries = new List<LogEntry>();

                foreach (DataRow data in result.Tables[0].Rows)
                {
                    logEntries.Add(ConvertToModel(data));
                }
            }

            return logEntries;
        }

        private LogEntry ConvertToModel(DataRow data)
        {
            LogEntry.Level levelValue;
            Enum.TryParse<LogEntry.Level>(data["logLevel"].ToString(), true, out levelValue);

            return new LogEntry
            {
                Id = int.Parse(data["id"].ToString()),
                LogLevel = levelValue,
                Action = data["action"].ToString(),
                Description = data["description"].ToString(),
                Entity = data["entity"].ToString(),
                Created = Convert.ToDateTime(data["created"]),
                User = data["userName"].ToString()
            };
        }
    }
}
