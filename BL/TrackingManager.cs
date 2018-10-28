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
                tracking.Status = Tracking.StatusType.Pending;
                tracking.Date = DateTime.Now;

                trackings.Add(tracking);
            }
            trackingMapper.Save(trackings);
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
    }
}
