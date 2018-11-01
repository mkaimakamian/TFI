﻿using System;
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

            if (String.IsNullOrEmpty(address.Street))
            {
                string errorDescription = "Debe completarse la calle.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(address.Zip))
            {
                string errorDescription = "Debe completarse el código postal.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(address.City))
            {
                string errorDescription = "Debe completarse la ciudad.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            //Debería ser id
            if (String.IsNullOrEmpty(address.Country.Name))
            {
                string errorDescription = "Debe completarse el país.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }
            return isValid;
        }
    }
}
