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
                //Si la sesión no está activa, se redirige al usuario hacia el index.
                if (!SessionHelper.IsSessionAlive()) Response.Redirect("/index.aspx");
                LoadCreditNotes(SessionHelper.GetUserFromSession());
                //LoadCreditsCards();
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
                creditNoteManager.Get(user);

            } catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

        /// <summary>
        /// Recupera los artículos que el usuario seleccionó para su selección.
        /// </summary>
        /// <param name="itemsId"></param>
        private void LoadItemsShop(HashSet<int> itemsId)
        {
            try
            {
                //Esto debería ser un resource manager, porque si bien ahora existen únicamente mapas, 
                //se ofrecen servicios también.
                MapManager mapManager = new MapManager();
                mapManager.GetBySeveralIds(itemsId.ToArray());

            }
            catch (Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

    }
}