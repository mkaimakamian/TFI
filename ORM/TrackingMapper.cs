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
    public class TrackingMapper
    {

        /// <summary>
        /// Guarda los datos modelados, en la base.
        /// </summary>
        /// <param name="trackings"></param>
        /// <returns></returns>
        public bool Save(List<Tracking> trackings)
        {
            Dal dal = new Dal();
            Hashtable table = null;
            bool success = true;
            foreach (Tracking tracking in trackings)
            {
                table = new Hashtable();
                table.Add("@invoiceItemId", tracking.InvoiceItem.Id);
                table.Add("@status", tracking.Status);
                table.Add("@date", tracking.Date);
                success = success && dal.Write(table, "spWriteTracking") > 0;
            }

            return success;
        }


        /// <summary>
        /// Recupera el listado de elementos de la base.
        /// </summary>
        /// <returns></returns>
        public List<Tracking> Get(User user)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<Tracking> trackings = null;

            table.Add("@userId", user.Id);
            DataSet result = dal.Read(table, "spReadTracking");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                trackings = new List<Tracking>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    trackings.Add(ConvertToModel(data));
                }
            }

            return trackings;
        }

        /// <summary>
        /// Recupera el elemento por el id de objeto comprado.
        /// </summary>
        /// <param name="invoiceItemId"></param>
        /// <returns></returns>
        public Tracking Get(int invoiceItemId)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            Tracking tracking = null;

            table.Add("@invoiceItemId", invoiceItemId);
            DataSet result = dal.Read(table, "spReadTracking");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                tracking = ConvertToModel(result.Tables[0].Rows[0]);
            }

            return tracking;
        }

        /// <summary>
        /// Ejecuta la actualización del modelo de datos.
        /// </summary>
        /// <param name="tracking"></param>
        /// <returns></returns>
        public bool Edit(Tracking tracking)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@invoiceItemId", tracking.InvoiceItem.Id);
            table.Add("@status", tracking.Status);
            table.Add("@ranking", tracking.Ranking);

            return dal.Write(table, "spModifyTracking") > 0;
        }

        /// <summary>
        /// Devuelve un objeto modelado con los valores del dataRow que recibe por parámetro.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private Tracking ConvertToModel(DataRow data)
        {
            Tracking.StatusType statusType;
            Enum.TryParse<Tracking.StatusType>(data["status"].ToString(), true, out statusType);

            Tracking tracking = new Tracking();
            tracking.InvoiceItem.Id = int.Parse(data["invoiceItemId"].ToString());
            tracking.Status = statusType;
            tracking.Date= Convert.ToDateTime(data["date"].ToString());
            tracking.InvoiceId = int.Parse(data["InvoiceId"].ToString());
            tracking.Ranking = int.Parse(data["Ranking"].ToString());
            return tracking;
        }
    }
}
