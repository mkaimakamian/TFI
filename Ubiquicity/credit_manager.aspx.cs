using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;
using Helper;
using Ubiquicity.Classes;

namespace Ubiquicity
{
    public partial class credit_manager : BaseManager
    {
        protected override void PageLoad(object sender, EventArgs e)
        {
            GridView = UCcrudGrid;
            GridView.ShowGenericActionButton("Acción");
            GridView.HideDeleteButton();
            GridView.HideNewButton();
            GridView.HideEditButton();

            Alert.PerformMainAction += RejectCreditNote;
            //se elimina para que no conflictúe
            Alert.PerformMainAction -= PerformDeleteItem; 
            Alert.PerformSecondAction += AcceptCreditNote;
            Manager = new CreditNoteManager();
        }

        /// <summary>
        /// Muestra el formulario con las opciones de rechazo o de aceptación.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void PerformGenericAction(object sender, UbiquicityEventArg e)
        {
            int id = Convert.ToInt32(e.TheObject.ToString());
            CreditNoteManager creditNoteManager = new CreditNoteManager();
            CreditNote creditNote = creditNoteManager.Get(id);
            if (creditNote.Status == CreditNote.StatusType.Pendiente)
            {
                Session["Ubiquicity_itemId"] = id;
                Alert.ShowUP("Nota de crédtio", "Seleccione la acción a ejecutar sobre el reclamo.", "¡Rechazar!", "!Aprobar!");
            } else
            {
                Alert.ShowUP("Nota de crédtio", "La nota de crédito ya fue " + creditNote.Status + ".");

            }
        }

        protected void RejectCreditNote(object sender, UbiquicityEventArg e)
        {
            ApproveOrReject(false);
        }

        protected void AcceptCreditNote(object sender, UbiquicityEventArg e)
        {
            ApproveOrReject(true);
        }

        private void ApproveOrReject(bool approve)
        {
            try
            {
                int id = Convert.ToInt32(Session["Ubiquicity_itemId"]);
                CreditNoteManager creditNoteManager = new CreditNoteManager();
                bool success = creditNoteManager.ApproveOrReject(id, approve);

                if (!success && creditNoteManager.HasErrors)
                {
                    //No se lanza el mensaje!
                    Alert.ShowUP("Error", creditNoteManager.ErrorDescription);
                }
                else
                {
                    LoadGridView();
                }
            }
            catch (Exception exception)
            {
                Alert.ShowUP("Excepción", exception.Message);

            }
        } 

        /// <summary>
        /// Se establece la traducción de las columnas que quieren ser mostradas.
        /// </summary>
        /// <returns></returns>
        protected override Dictionary<string, string> ColumnsToShowAndTranslate()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("Id", "#");
            columns.Add("Amount", "Monto");
            columns.Add("Date", "Emisión");
            columns.Add("Observation", "Observación");
            columns.Add("UserName", "Usuario");
            columns.Add("Status", "Estado");
            columns.Add("InvoiceId", "Factura");
            return columns;
        }
    }
}