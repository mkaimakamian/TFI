using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class AddressManager:BaseManager
    {
        /// <summary>
        /// Persiste el elemento.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        public bool Save(Address address)
        {
            if (!IsValid(address)) return false;

            AddressMapper addressMapper = new AddressMapper();

            if (!addressMapper.Save(address))
            {
                string errorDescription = "No se ha podido guardar la dirección.";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        /// <summary>
        /// Devuelve el recurso cuyo id es pasado por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Address Get(int id)
        {
            AddressMapper addressMapper = new AddressMapper();
            Address address = addressMapper.Get(id);

            if (address == null)
            {
                string errorDescription = "No se ha encontrado la direcció con id " + id + ".";
                log.AddLogCritical("Get", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.NULL, errorDescription));
            } 

            return address;
        }

        public bool IsValid(Address address)
        {
            bool isValid = true;
            isValid &= VLetterNumbers(address.Street, 1, 50, "Dirección", "IsValid");
            isValid &= VLetterNumbers(address.Zip, 1, 10, "Código postal", "IsValid");
            isValid &= VOnlyLetter(address.City, 1, 50, "Ciudad", "IsValid");
            //Debería ser id
            isValid &= VOnlyLetter(address.Country.Name, 1, 50, "País", "IsValid");

            return isValid;
        }

        public override string ToString() { return "Address"; }

    }
}
