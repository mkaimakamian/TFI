using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.IO;

namespace DA
{
    public class Dal
    {
        private static string DATABASE = String.Empty;
        private static string connStr = String.Empty;

        public Dal()
        {
            if (String.IsNullOrEmpty(connStr))
            {
                string serverInstance = String.Empty;
                try
                {
                    //TODO - Preguntar si leemos desde un archivo de configuración
                    
                    StreamReader st = new StreamReader(Directory.GetCurrentDirectory() + "\\dbconfig.txt");
                    serverInstance = st.ReadLine();
                    DATABASE = st.ReadLine();
                    
                }
                catch
                {
                    DATABASE = "ubiquicity";
                    serverInstance = "SQLEXPRESS";
                }

                connStr = "Data Source=.\\" + serverInstance + "; Initial Catalog=" + DATABASE + "; Integrated Security=True";
            }

        }

        /// <summary>
        /// Realiza la escritura en la base de datos, recibiendo como parámetros una tabla con 
        /// pares key-value, y el store procedure a ejecutar.
        /// </summary>
        /// <param name="table"></param>
        /// <param name="sql"></param>
        /// <returns></returns>
        public bool Write(Hashtable table, String sql)
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
            
                int affected = command.ExecuteNonQuery();
                transaction.Commit();
                return affected > 0;
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
    }
}
