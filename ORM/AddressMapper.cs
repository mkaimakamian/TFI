﻿using System;
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
            table.Add("@countryIso", address.Country.Name);//debería ser id
            table.Add("@zip", address.Zip);
            table.Add("@observation", address.Observation);
            address.Id = dal.Write(table, "spWriteAddress");

            return address.Id > 0;
        }


        /// <summary>
        /// Recupera el elemento cuyo id coincida con el provisto por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Address Get(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            Address address = null;

            table.Add("@id", id);

            DataSet result = dal.Read(table, "spReadAddress");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                address = ConvertToModel(result.Tables[0].Rows[0]);
            }

            return address;
        }

        /// <summary>
        /// Devuelve un objeto modelado con los valores del dataRow que recibe por parámetro.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private Address ConvertToModel(DataRow data)
        {
            Address address = new Address();
            address.Id = int.Parse(data["id"].ToString());
            address.City = data["city"].ToString();
            address.Street = data["street"].ToString();
            address.Number = Convert.ToInt32(data["number"]);
            address.Zip = data["zip"].ToString();

            return address;
        }
    }
}
