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
    public class AccountDetailMapper
    {

        /// <summary>
        /// Recupera el listado de elementos de la base.
        /// </summary>
        /// <returns></returns>
        public List<AccountDetail> Get(User user)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<AccountDetail> accountsDetail = null;
            table.Add("@userId", user.Id);

            DataSet result = dal.Read(table, "spReadAccountDetail");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                accountsDetail = new List<AccountDetail>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    accountsDetail.Add(ConvertToModel(data));
                }
            }

            return accountsDetail;
        }

        /// <summary>
        /// Devuelve un objeto modelado con los valores del dataRow que recibe por parámetro.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private AccountDetail ConvertToModel(DataRow data)
        {
            AccountDetail accountsDetail = new AccountDetail();
            //accountsDetail.Id = int.Parse(data["sourceId"].ToString());
            accountsDetail.IssuedId = int.Parse(data["issuedId"].ToString());
            accountsDetail.Description = data["description"].ToString();
            accountsDetail.Amount = Convert.ToDouble(data["amount"]);
            accountsDetail.Status = data["status"].ToString();
            accountsDetail.Date = Convert.ToDateTime(data["date"].ToString());
            accountsDetail.Type = data["type"].ToString();
            return accountsDetail;
        }
    }
}
