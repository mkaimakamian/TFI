using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;
namespace DA
{
    public class Dal
    {
        private string databaseName = String.Empty;
        private string serverInstance = String.Empty;
        private static string connStr = String.Empty;

        public Dal()
        {
            try {

                databaseName = ConfigurationManager.AppSettings["DATABASE"];
                serverInstance = ConfigurationManager.AppSettings["SERVERINSTANCE"];
                //databaseName = "ubiquicity";
                //serverInstance = "SQLEXPRESS";
            }
            catch {
                databaseName = "ubiquicity";
                serverInstance = "SQLEXPRESS";
            }

            connStr = "Data Source=.\\" + serverInstance + "; Initial Catalog=" + databaseName + "; Integrated Security=True";

            //if (String.IsNullOrEmpty(connStr))
            //{
            //    string SERVERINSTANCE = String.Empty;
            //    try
            //    {
            //        //TODO - Preguntar si leemos desde un archivo de configuración

            //        StreamReader st = new StreamReader(Directory.GetCurrentDirectory() + "\\dbconfig.txt");
            //        serverInstance = st.ReadLine();
            //        DATABASE = st.ReadLine();

            //    }
            //    catch
            //    {
            //        DATABASE = "ubiquicity";
            //        SERVERINSTANCE = "SQLEXPRESS";
            //    }

            //    connStr = "Data Source=.\\" + SERVERINSTANCE + "; Initial Catalog=" + DATABASE + "; Integrated Security=True";
            //}

        }

        /// <summary>
        /// Realiza la escritura en la base de datos, recibiendo como parámetros una tabla con 
        /// pares key-value, y el store procedure a ejecutar.
        /// </summary>
        /// <param name="table"></param>
        /// <param name="sql"></param>
        /// <returns></returns>
        public int Write(Hashtable table, String sql)
        {
            SqlConnection connection = null;
            SqlTransaction transaction = null;
            SqlCommand command = null;

            try
            {
                connection = new SqlConnection(connStr);
                connection.Open();
                transaction = connection.BeginTransaction();
                command = new SqlCommand(sql, connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Transaction = transaction;

                if (table != null) {
                    foreach (string data in table.Keys) {
                        command.Parameters.AddWithValue(data, table[data]);
                    }
                }
            
                object returned = command.ExecuteScalar();
                transaction.Commit();

                return int.Parse(returned.ToString());
            } catch (Exception e)
            {
                transaction.Rollback();
                throw e;
            } finally
            {
                connection.Close();
            }
        }

        /// <summary>
        /// Recupera de la base de datos los objetos y los inyecta en un dataset.
        /// </summary>
        /// <param name="table"></param>
        /// <param name="sql"></param>
        /// <returns></returns>
        public DataSet Read(Hashtable table, String sql)
        {
            DataSet dataBaseInfo = new DataSet();
            SqlConnection connection = new SqlConnection(connStr);
            SqlCommand command = new SqlCommand(sql, connection);
            command.CommandType = CommandType.StoredProcedure;

            if (table != null)
            {
                foreach (string data in table.Keys)
                {
                    command.Parameters.AddWithValue(data, table[data]);
                }
            }

            try
            {
                new SqlDataAdapter(command).Fill(dataBaseInfo);
                return dataBaseInfo;
            } catch (Exception e)
            {
                throw e;
            } finally
            {
                connection.Close();
            }
        }

        public bool Backup(string path)
        {
            string sql = "BACKUP DATABASE " + databaseName + " TO DISK = '" + path + "'";
            return ExecuteQuery(sql);
        }

        public bool Restore(string path)
        {
            string sql = "USE MASTER ALTER DATABASE " + databaseName + " SET SINGLE_USER WITH ROLLBACK IMMEDIATE RESTORE DATABASE " + databaseName + " FROM DISK = '" + path + "' WITH REPLACE";
            return ExecuteQuery(sql);
        }

        //TODO - Actualizar ea
        private bool ExecuteQuery(string sql)
        {
            SqlConnection connection = new SqlConnection(connStr);
            SqlCommand command = new SqlCommand(sql, connection);

            try { 
                connection.Open();
                object row = command.ExecuteScalar();
                connection.Close();

                return true;
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
