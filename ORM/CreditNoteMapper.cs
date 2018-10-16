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
        /// Guarda los datos modelados, en la base.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        public bool Save(CreditNote creditNote)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@amount", creditNote.Amount);
            table.Add("@observation", creditNote.Observation);
            table.Add("@date", creditNote.Date);
            table.Add("@status", creditNote.Status);
            table.Add("@userId", creditNote.User.Id);
            creditNote.Id = dal.Write(table, "spWriteCreditNote");

            return creditNote.Id > 0;
        }

        /// <summary>
        /// Ejecuta la actualización del modelo de datos.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        public bool Edit(CreditNote creditNote)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@id", creditNote.Id);
            table.Add("@amount", creditNote.Amount);
            table.Add("@observation", creditNote.Observation);
            table.Add("@date", creditNote.Date);
            table.Add("@status", creditNote.Status);
            table.Add("@userId", creditNote.User.Id);
            table.Add("@used", creditNote.Used);
            return dal.Write(table, "spModifyCreditNote") > 0;
        }

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

            table.Add("@userId", user.Id);
            DataSet result = dal.Read(table, "spReadCreditNote");

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

        public CreditNote Get(int id)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            CreditNote creditNote = null;

            table.Add("@id", id);

            DataSet result = dal.Read(table, "spReadCreditNote");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                creditNote = ConvertToModel(result.Tables[0].Rows[0]);
            }
            return creditNote;
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
            creditNote.Used = Convert.ToDateTime(data["date"]);
            return creditNote;
        }
    }
}
