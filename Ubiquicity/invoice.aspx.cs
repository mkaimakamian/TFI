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

        /// <summary>
        /// Recupera del sistema, todas las tarjetas disponibles.
        /// </summary>
        private void LoadCreditCards()
        {
            try
            {
                CreditCardManager creditCardManager = new CreditCardManager();
                dropCardInput.DataSource = creditCardManager.Get();
                dropCardInput.DataTextField = "Name";
                dropCardInput.DataValueField = "Id";
                dropCardInput.DataBind();
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

        /// <summary>
        /// Recupera los artículos que el usuario seleccionó para la compra.
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
                InvoiceManager invoiceManager = new InvoiceManager();
                List<PaymentMethod> paymenMethods = new List<PaymentMethod>();

                //Modelo la factura
                Invoice invoice = new Invoice();
                invoice.User = SessionHelper.GetUserFromSession();
                invoice.BillingAddress = GetBillingAddress();
                invoice.CreditCard = GetCreditCard();
                invoice.CreditNotes = GetCreditNotes();
                invoice.InvoiceItems = GetInvoiceItems();

                // Procesamiento del pago y creación de la facturación
                bool success = invoiceManager.ProcessPayment(invoice);

                if (!success && invoiceManager.HasErrors)
                {
                    ((front)Master).Alert.Show("Error", invoiceManager.ErrorDescription);
                } else
                {
                    ((front)Master).Alert.Show("Éxito", "Felicitaciones, la operación se realizó con éxito.");
                }

            } catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

        /// <summary>
        /// Modela la dirección de facturación.
        /// </summary>
        /// <returns></returns>
        private Address GetBillingAddress()
        {
            Address billingAddress = new Address();
            billingAddress.Street = streetInput.Value;
            billingAddress.Number = Convert.ToInt32(numberInput.Value);
            billingAddress.Zip = zipInput.Value;
            billingAddress.City = cityInput.Value;
            // Debería ser de un drop
            Country country = new Country();
            country.Name = countryInput.Value;
            billingAddress.Country = country;
            billingAddress.Observation = observationInput.Value;
            return billingAddress;
        }


        private List<InvoiceItem> GetInvoiceItems()
        {
            //TODO - Controlar error
            MapManager mapManager = new MapManager();
            List<Map> maps = mapManager.GetBySeveralIds(ShopHelper.GetItemsId());
            List<InvoiceItem> invoiceItems = new List<InvoiceItem>();

            foreach(Map map in maps)
            {
                InvoiceItem invoiceItem = new InvoiceItem();
                invoiceItem.Quantity = 1;
                invoiceItem.Resource = map;
                invoiceItem.Price = map.Price;
                invoiceItems.Add(invoiceItem);
            }

            return invoiceItems;
        }

        /// <summary>
        /// Si se eligió nc como método de pago, recupera sus ids y crea el método de pago afín..
        /// </summary>
        /// <returns></returns>
        private List<CreditNote> GetCreditNotes()
        {
            List<CreditNote> creditNotes = null;

            if (creditNotesChk.Checked)
            {
                CreditNoteManager creditNoteManager = new CreditNoteManager();

                //Dudo que no haya otro modo más práctico de obtener los ids de las notas de crédito 
                //seleccionadas. Se obtienen las elegidas y luego se arma un array de int
                List<ListItem> selected = checkCreditNotes.Items.Cast<ListItem>().Where(li => li.Selected).ToList();
                int[] creditNoteIds = new int[selected.Count];
                for (int i = 0; i < selected.Count; ++i)
                {
                    creditNoteIds[i] = Convert.ToInt32(selected[i].Value);
                }

                creditNotes = creditNoteManager.GetBySeveralIds(creditNoteIds);
            }

            return creditNotes;
        }

        /// <summary>
        /// Si la tarjeta se eligió como método de pago, devuelve el objeto modelado.
        /// </summary>
        /// <returns></returns>
        private CreditCard GetCreditCard()
        {
            CreditCard creditCard = null;

            if (cardChk.Checked)
            {
                creditCard = new CreditCard();
                creditCard.FirstName = firstNamesInput.Value;
                creditCard.LastName = lastNamesInput.Value;
                creditCard.Cvv = Convert.ToInt32(cvvInput.Value);
                creditCard.Field1 = Convert.ToInt32(card1Input.Value);
                creditCard.Field2 = Convert.ToInt32(card2Input.Value);
                creditCard.Field3 = Convert.ToInt32(card3Input.Value);
                creditCard.Field4 = Convert.ToInt32(card4Input.Value);
                creditCard.DueDate = Convert.ToDateTime(duedateInput.Date);
                creditCard.CreditCardType.Id = Convert.ToInt32(dropCardInput.SelectedValue);
            }

            return creditCard;
        }
    }
}