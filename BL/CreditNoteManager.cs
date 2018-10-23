using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class CreditNoteManager: BaseManager
    {
        public bool Save(CreditNote creditNote)
        {
            if (!IsValid(creditNote)) return false;

            CreditNoteMapper creditNoteMapper = new CreditNoteMapper();

            if (!creditNoteMapper.Save(creditNote))
            {
                string errorDescription = "No se ha podido guardar la nota de crédito.";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        /// <summary>
        /// Devuelve el listado de notas de créditos disponibles para el usuario pasado por parámetro.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public List<CreditNote> Get(User user)
        {
            CreditNoteMapper creditNoteMapper = new CreditNoteMapper();
            return creditNoteMapper.Get(user);
        }

        /// <summary>
        /// Devuelve la nota de crédito seguún el id pasado por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public CreditNote Get(int id)
        {
            CreditNoteMapper creditNoteMapper = new CreditNoteMapper();
            return creditNoteMapper.Get(id);
        }

        /// <summary>
        /// Recupera los credit notes cuyos ids son pasados por parámetro.
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public List<CreditNote> GetBySeveralIds(int[] ids)
        {
            List<CreditNote> creditNotes = new List<CreditNote>();

            // TODO - feo... pero funciona por ahora
            foreach (int id in ids) creditNotes.Add(Get(id));
            return creditNotes;
        }

        public bool ChangeStateToUsed(List<CreditNote> creditNotes)
        {
            bool success = true;
            CreditNoteMapper creditNoteMapper = new CreditNoteMapper();
            foreach (CreditNote creditNote in creditNotes)
            {
                creditNote.Used = DateTime.Now;
                success = success & creditNoteMapper.Edit(creditNote);
            }
            return success;
        }
        //public bool Edit(CreditNote creditNote)
        //{
        //    if (!IsValid(creditNote)) return false;

        //    CreditNoteMapper creditNoteMapper = new CreditNoteMapper();

        //    if (!creditNoteMapper.Edit(creditNote))
        //    {
        //        string errorDescription = "No se ha podido modificar la nota de crédito.";
        //        log.AddLogCritical("Edit", errorDescription, this);
        //        AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
        //        return false;
        //    }

        //    return true;
        //}

        /// <summary>
        /// Comprueba que la nota de crédito cumpla con los requerimientos mínimos de validez.
        /// </summary>
        /// <param name="creditNote"></param>
        /// <returns></returns>
        private bool IsValid(CreditNote creditNote)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(creditNote.Observation))
            {
                string errorDescription = "Debe ingresarse una observación.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = isValid & false;
            }

            if (creditNote.Amount <= 0)
            {
                string errorDescription = "El monto debe ser mayor a cero.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = isValid & false;
            }

            if (creditNote.User == null)
            {
                string errorDescription = "La nota de crédito debe asociarse a un usuario.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = isValid & false;
            }
            return isValid;
        }
    }
}
