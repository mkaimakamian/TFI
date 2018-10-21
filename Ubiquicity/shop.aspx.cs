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
    public partial class shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UCItemShopFilter.ShopRepeater = shopRepeater;

        }

        /// <summary>
        /// Carga el repeater con los artículos a mostrar en el shop.
        /// </summary>
        //private void LoadRepeater()
        //{
        //    MapManager mapManager = new MapManager();
        //    List<Map> maps = mapManager.Get();
        //    shopRepeater.DataSource = maps;
        //    shopRepeater.DataBind();
        //}

        /// <summary>
        /// Actualiza la etiqueta del botón, mostrando las cantidades de los artículos escogidos para comprar.
        /// </summary>
        private void UpdateCartButton()
        {
            cartBtn.Text = "<i class='fa fa-tags' aria-hidden='true'></i> Elementos: " + ShopHelper.GetQuantity();
        }


        /// <summary>
        /// Toma los valores que están almacenados en el input selectedItemsInput del tipo hidden
        /// y recupera todos los elementos cuyos ids coinciden.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PerformCompare(object sender, EventArgs e)
        {
            try
            {
                //El input pasa el array como una cadena de texto con los ids separados por comas.
                //A continuación se crea un array de strings a través del split y se convierten los elementos en enteros
                //para crear el mismo array pero del tipo entero.
                //int[] itemsId = Array.ConvertAll(selectedItemsInput.Value.Split(','), item => Convert.ToInt32(item));
                int[] itemsId = UtilsHelper.ToIntArray(selectedItemsInput.Value);

                MapManager mapManager = new MapManager();
                List<Map> maps = mapManager.GetBySeveralIds(itemsId);

                if ((maps == null || maps.Count == 0) && mapManager.HasErrors )
                {
                    ((front)Master).Alert.Show("Error", mapManager.ErrorDescription);
                } else
                {
                    ModalCompare.Show("Comparador", maps);
                }
            } catch (Exception exception)
            {
                ((front)Master).Alert.Show("Excepción", exception.Message);
            }
        }

        /// <summary>
        /// Atiende los botones del repeater: agregar a la plataforma de venta & ver detalle
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void shopRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);

                if (e.CommandName == "AddToCart")
                {
                    ShopHelper.AddToCart(id, Session);
                    UpdateCartButton();
                }
                else if (e.CommandName == "ShowDetail")
                {
                    
                    MapManager mapManager = new MapManager();
                    Map map = mapManager.Get(id);
                    ModalItemShop.Show(map);
                }
            }
            catch(Exception exception)
            {
                ((front)Master).Alert.Show("Exception", exception.Message);
            }
        }

        protected void GoToInvoice(object sender, EventArgs e)
        {
            Response.Redirect("/invoice.aspx");
        }
    }
}