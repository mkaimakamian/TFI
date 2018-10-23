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
    public class CreditCardMapper
    {

        /// <summary>
        /// Guarda los datos modelados, en la base.
        /// </summary>
        /// <param name="CreditCard"></param>
        /// <returns></returns>
        public bool Save(CreditCard creditCard)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@field4", creditCard.Field4);
            table.Add("@typeId", creditCard.CreditCardType.Id);
            table.Add("@firstName", creditCard.FirstName);
            table.Add("@lastName", creditCard.LastName);
            table.Add("@dueDate", creditCard.DueDate);
            creditCard.Id = dal.Write(table, "spWriteCreditCard");

            return creditCard.Id > 0;
        }

        /// <summary>
        /// Recupera el listado de elementos de la base.
        /// </summary>
        /// <returns></returns>
        public List<CreditCardType> Get()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<CreditCardType> cardTypes = null;

            DataSet result = dal.Read(table, "spReadCreditCardType");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                cardTypes = new List<CreditCardType>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    cardTypes.Add(ConvertToModel(data));
                }
            }

            return cardTypes;
        }

        /// <summary>
        /// Controla que el tipo de tarjeta declarada y le prefijo se correspondan
        /// </summary>
        /// <param name="creditCard"></param>
        /// <returns></returns>
        public bool IsValidPrefix(CreditCard creditCard)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@id", creditCard.CreditCardType.Id);
            table.Add("@prefix", creditCard.Field1);
            DataSet result = dal.Read(table, "spReadCreditCardType");

            return result != null && result.Tables[0].Rows.Count > 0;
        }


        public bool IsInBlackList(CreditCard creditCard)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@prefix", creditCard.Field1);
            table.Add("@field2", creditCard.Field2);
            table.Add("@field3", creditCard.Field3);
            table.Add("@field4", creditCard.Field4);

            DataSet result = dal.Read(table, "spReadCreditCardBlack");

            return result != null && result.Tables[0].Rows.Count > 0;
        }

        /// <summary>
        /// Devuelve un objeto modelado con los valores del dataRow que recibe por parámetro.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private CreditCardType ConvertToModel(DataRow data)
        {
            CreditCardType creditCardType = new CreditCardType();
            creditCardType.Id = int.Parse(data["Id"].ToString());
            creditCardType.Name = data["name"].ToString();
            creditCardType.Prefix = Convert.ToInt32(data["prefix"].ToString());
            return creditCardType;
        }
    }
}
