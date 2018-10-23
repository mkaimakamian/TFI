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
    public class AddressMapper
    {
        /// <summary>
        /// Guarda los datos modelados, en la base.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        public bool Save(Address address)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@street", address.Street);
            table.Add("@number", address.Number);
            table.Add("@city", address.City);
            table.Add("@country", address.Country.Name);//debería ser id
            table.Add("@zip", address.Zip);
            table.Add("@observation", address.Observation);
            address.Id = dal.Write(table, "spWriteMap");

            return address.Id > 0;
        }
    }
}
