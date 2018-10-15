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
    public class CreditNoteMapper
    {
        /// <summary>
        /// Devuelve el listado de notas de crédito asociadas a un usuario.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public List<CreditNote> Get(User user)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<CreditNote> creditNotes = null;

            //table.Add("@resourceId", DBNull.Value);
            DataSet result = dal.Read(table, "spReadMap");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                creditNotes = new List<CreditNote>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    creditNotes.Add(ConvertToModel(data));
                }
            }

            return creditNotes;
        }

        /// <summary>
        /// Devuelve un objeto modelado con los valores del dataRow que recibe por parámetro.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private CreditNote ConvertToModel(DataRow data)
        {
            CreditNote creditNote = new CreditNote();
            creditNote.Id = int.Parse(data["id"].ToString());
            creditNote.Amount = Convert.ToDouble(data["amount"]);
            creditNote.Date = Convert.ToDateTime(data["date"]);
            creditNote.Observation = data["observation"].ToString();
            creditNote.User.Id = Convert.ToInt32(data["userId"].ToString());
            creditNote.Status = Convert.ToInt32(data["status"].ToString());
            return creditNote;
        }
    }
}
