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
        //private int[] creditNoteIds;
        private List<CreditNote> creditNotes;

        public CreditNotePayment(List<CreditNote> creditNotes)
        {
            this.creditNotes = creditNotes;
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
            for (int i = 0; i < creditNotes.Count && amount > 0; ++i)
            {
                amount -= creditNotes[i].Amount;
            }

            return amount;
        }

        public override double ProcessPayment(double amount)
        {
            // En caso de que esté "pago" no tiene sentido procesar
            if (amount <= 0) return amount;

            List<CreditNote> creditNoteUsed = new List<CreditNote>();

            for (int i = 0; i < creditNotes.Count && amount > 0; ++i)
            {
                amount -= creditNotes[i].Amount;
                creditNoteUsed.Add(creditNotes[i]);
            }

            //Todas las notas usadas deben ser anuladas
            if (ChangeStateToUsed(creditNoteUsed))
            {
                //Significa que la última nota de crédito fue la que se excedió y, como fue "consumida", 
                //debo generar una nota de crédito por la diferencia.
                if (amount < 0)
                {
                    CreditNote originalCreditNote = creditNotes[creditNotes.Count - 1];
                    if(!SaveCreditNote(originalCreditNote, amount))
                    {
                        //mensaje de error
                    }
                }
            } else
            {
                //crear beresult de error
            }

            return amount;
        }

        public override bool IsValid()
        {
            bool isValid = true;

            if (creditNotes == null || creditNotes.Count == 0)
            {
                string errorDescription = "No se seleccionó ninguna nota de crédito.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }
            
            //Como precondición, los ids de las notas de crédito pertenecen a aquellas válidas
            //por lo que no hace falta constatar nada.
            return isValid;
        }

        /// <summary>
        /// Actualiza el estado de las notas para marcarlas como usadas.
        /// </summary>
        /// <param name="usedCreditNotes"></param>
        /// <returns></returns>
        private bool ChangeStateToUsed(List<CreditNote> usedCreditNotes)
        {
            CreditNoteManager creditNoteManager = new CreditNoteManager();
            return creditNoteManager.ChangeStateToUsed(usedCreditNotes);
        }

        /// <summary>
        /// Crea una nota de crédito por el monto especificado.
        /// </summary>
        /// <param name="creditNoteTS"></param>
        /// <param name="amount"></param>
        /// <returns></returns>
        private bool SaveCreditNote(CreditNote creditNoteTS, double amount)
        {
            CreditNoteManager creditNoteManager = new CreditNoteManager();

            CreditNote creditNote = new CreditNote();
            creditNote.Amount = amount * -1;
            creditNote.Date = DateTime.Now;
            creditNote.Status = CreditNote.StatusType.Aprobada;
            creditNote.Observation = "Remanente de pago: " + creditNoteTS.Id + " (monto original: "+creditNote.Amount+")";
            creditNote.User = creditNoteTS.User;
            creditNote.InvoiceId = creditNoteTS.InvoiceId;
            return creditNoteManager.Save(creditNote);
        }
    }
}
