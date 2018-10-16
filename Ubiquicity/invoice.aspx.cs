using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;
using Helper;
namespace Ubiquicity
{
    public partial class invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!SessionHelper.IsSessionAlive()) Response.Redirect("/index.aspx");

                LoadCreditNotes(SessionHelper.GetUserFromSession());
                LoadCreditCards();
                LoadItemsShop(ShopHelper.GetItemsId());
            }
        }

        /// <summary>
        /// Recupera las notas de crédito del usuario en sesión.
        /// </summary>
        /// <param name="user"></param>
        private void LoadCreditNotes(User user)
        {
            try
            {
                CreditNoteManager creditNoteManager = new CreditNoteManager();
                checkCreditNotes.DataSource = creditNoteManager.Get(user);
                checkCreditNotes.DataTextField = "Amount";
                checkCreditNotes.DataValueField = "Id";
                checkCreditNotes.DataBind();
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

        private void LoadCreditCards()
        {
            try
            {
                InvoiceManager invoiceManager = new InvoiceManager();
                checkCard.DataSource = invoiceManager.GetCreditCards();
                checkCard.DataTextField = "Name";
                checkCard.DataValueField = "Id";
                checkCard.DataBind();
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

        /// <summary>
        /// Recupera los artículos que el usuario seleccionó para su selección.
        /// </summary>
        /// <param name="itemsId"></param>
        private void LoadItemsShop(int[] itemsId)
        {
            try
            {
                //Esto debería ser un resource manager, porque si bien ahora existen únicamente mapas, 
                //se ofrecen servicios también.
                MapManager mapManager = new MapManager();
                checkoutRepeater.DataSource = mapManager.GetBySeveralIds(itemsId);
                checkoutRepeater.DataBind();
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

        /// <summary>
        /// Ejecuta el pago contemplando los distintos métodos de pago.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PerformCheckout(object sender, EventArgs e)
        {
            try
            {
                int[] creditNoteIds = GetCreditNotesIds();
                int[] cardIds = GetCardIds();
                int[] itemsIds = ShopHelper.GetItemsId();

                //Debería ser el manager de recursos
                MapManager mapManager = new MapManager();
                List<Map> maps = mapManager.GetBySeveralIds(itemsIds);

                // Cada método de pago implementa el modo de llevar adelante la operación.
                List<PaymentMethod> paymenMethods = new List<PaymentMethod>();
                paymenMethods.Add(new CreditNotePayment(creditNoteIds));
                //paymenMethods.Add(new CardPayment(cardIds));

                InvoiceManager invoiceManager = new InvoiceManager();
                bool success = invoiceManager.ProcessPayment(maps, paymenMethods, SessionHelper.GetUserFromSession());

                if (!success && invoiceManager.HasErrors)
                {
                    ((front)Master).Alert.Show("Error", invoiceManager.ErrorDescription);
                }

            } catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

        /// <summary>
        /// Recupera los ids de las notas de crédito utilizadas para pagar los ítems.
        /// </summary>
        /// <returns></returns>
        private int[] GetCreditNotesIds()
        {
            //Dudo que no haya otro modo más práctico de obtener los ids de las notas de crédito 
            //seleccionadas. Se obtienen las elegidas y luego se arma un array de int
            List<ListItem> selected = checkCreditNotes.Items.Cast<ListItem>().Where(li => li.Selected).ToList();
            int[] creditNoteIds = new int[selected.Count];
            for (int i = 0; i < selected.Count; ++i)
            {
                creditNoteIds[i] = Convert.ToInt32(selected[i].Value);
            }

            return creditNoteIds;
        }

        private int[] GetCardIds()
        {
            //TODO  completar con la tarjeta de crédito
           return new int[]{ };
        }
    }
}