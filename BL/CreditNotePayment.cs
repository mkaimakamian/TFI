using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace BL
{
    public class CreditNotePayment : PaymentMethod
    {
        private int[] creditNoteIds;
        private List<CreditNote> creditNotes;

        public CreditNotePayment(int[] creditNoteIds)
        {
            this.creditNoteIds = creditNoteIds;
        }

        /// <summary>
        /// Evalúa si el monto puede ser cubierto por las notas de crédito cuyos id
        /// son requeridos por el constructor, y devuelve el resto.
        /// Si el resultado es mayor a cero, significa que no se cubre el total a pagar.
        /// </summary>
        /// <param name="amount"></param>
        /// <returns></returns>
        public override double EstimatePaymentResult(double amount)
        {
            List<CreditNote> creditNotes = GetCreditNotes(creditNoteIds);

            for (int i = 0; i < creditNotes.Count && amount > 0; ++i)
            {
                amount -= creditNotes[i].Amount;
            }

            return amount;
        }

        public override double ProcessPayment(double amount)
        {
            // En caso de que esté "pagado" no tiene sentido procesar
            if (amount <= 0) return amount;

            List<CreditNote> creditNotes = GetCreditNotes(creditNoteIds);
            List<CreditNote> creditNoteUsed = new List<CreditNote>();

            for (int i = 0; i < creditNotes.Count && amount > 0; ++i)
            {
                amount -= creditNotes[i].Amount;
                creditNoteUsed.Add(creditNotes[i]);
            }

            //Anulo todos creditNoteUsed

            //Significa que la última nota de crédito fue la que se excedió y, como fue "consumida" debo
            //generar una nota de crédito por la diferencia
            if (amount < 0)
            {
                //crear nota de crédito por valor *-1
            }

            return amount;
        }

        public override bool IsValid()
        {
            //Las condiciones de validación se dan todas porque como precondición, 
            //se requieren únicamente los ids de las notas de crédito afectadas.
            return true;
        }

        private List<CreditNote> GetCreditNotes(int[] ids)
        {
            if (creditNotes == null)
            {
                creditNotes = new List<CreditNote>();
            }
            else
            {
                // Si no es nulo es porque ya se llenó en alguna oportunidad
                // y no hace falta regresar a la base de nuevo.
                return creditNotes;
            }                

            foreach (int id in ids)
            {
                CreditNoteManager creditNoteManager = new CreditNoteManager();
                creditNotes.Add(creditNoteManager.Get(id));
            }

            return creditNotes;
        }
    }
}
