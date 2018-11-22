using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class TrackingManager : BaseManager
    {

        /// <summary>
        /// Genera el registro de trackeo del producto.
        /// </summary>
        public void Save(Invoice invoice)
        {
            TrackingMapper trackingMapper = new TrackingMapper();
            List<Tracking> trackings = new List<Tracking>();
            Tracking tracking = null;

            foreach (InvoiceItem invoiceItem in invoice.InvoiceItems)
            {
                tracking = new Tracking();
                tracking.InvoiceItem = invoiceItem;
                tracking.Status = Tracking.StatusType.Pendiente;
                tracking.Date = DateTime.Now;

                trackings.Add(tracking);
            }
            trackingMapper.Save(trackings);
        }

        /// <summary>
        /// Recupera el elemento según el id pasado por parámetro.
        /// </summary>
        /// <returns></returns>
        public Tracking Get(int invoiceItemId)
        {
            TrackingMapper trackingMapper = new TrackingMapper();
            Tracking tracking = trackingMapper.Get(invoiceItemId);

            if (tracking == null)
            {
                string errorDescription = "No se ha encontrado tracking para el producto adquirido con id " + invoiceItemId + ".";
                log.AddLogCritical("Get", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.NULL, errorDescription));
            }

            return tracking;
        }

        /// <summary>
        /// Recupera el listado de todos los elementos.
        /// </summary>
        /// <returns></returns>
        public List<Tracking> Get(User user)
        {
            MapManager mapManager = new MapManager();
            InvoiceItemMapper invoiceItemMapper = new InvoiceItemMapper();
            TrackingMapper trackingMapper = new TrackingMapper();
            List<Tracking> trakings = trackingMapper.Get(user);

            if (trakings != null)
            {
                foreach (Tracking tracking in trakings)
                {
                    //Sería más óptimo se si buscaran por invoice
                    tracking.InvoiceItem = invoiceItemMapper.Get(tracking.InvoiceItem.Id);
                    tracking.InvoiceItem.Resource = mapManager.Get(tracking.InvoiceItem.Resource.Id);
                }
            }
            return trakings;
        }

        /// <summary>
        /// Guarda los cambios del recurso existente.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        public bool Edit(Tracking tracking)
        {
            TrackingMapper trackingMapper = new TrackingMapper();
            tracking.Date = DateTime.Now;

            if (!trackingMapper.Edit(tracking))
            {
                string errorDescription = "No se ha podido modificar el tracking.";
                log.AddLogCritical("Edit", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        public override string ToString() { return "Tracking"; }

    }
}
