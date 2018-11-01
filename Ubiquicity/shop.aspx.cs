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
            ShowItemsResume(SessionHelper.IsSessionAlive());

            if (!IsPostBack)
            {
                UpdateCartInformation();
            }
        }


        /// <summary>
        /// Muestra el menú con el resumen de los artículos seleccionados únicamente si el usuario
        /// está logueado.
        /// </summary>
        private void ShowItemsResume(bool logged)
        {
            divLoggedShop.Visible = logged;
            divNotLogged.Visible = !logged;
        }


        /// <summary>
        /// Actualiza la etiqueta del botón, mostrando las cantidades de los artículos escogidos para comprar.
        /// </summary>
        private void UpdateCartInformation()
        {
            try
            {
                if (ShopHelper.GetQuantity() > 0)
                {
                    cartBtn.Text = "<i class='fa fa-tags' aria-hidden='true'></i> Elementos: " + ShopHelper.GetQuantity();
                    MapManager mapManager = new MapManager();
                    List<Map> maps = mapManager.GetBySeveralIds(ShopHelper.GetItemsId());

                    // Si por algún motivo no se recuperan mapas, significa que los ids están mal
                    // o hay algo raro
                    if ((maps == null || maps.Count == 0) && mapManager.HasErrors)
                    {
                        ((front)Master).Alert.ShowUP("Error", mapManager.ErrorDescription);
                    }
                    else
                    {
                        cartItemRepeater.DataSource = maps;
                        cartItemRepeater.DataBind();
                    }
                }
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.ShowUP("Excepción", exception.Message);
            }
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

                if (!String.IsNullOrEmpty(selectedItemsInput.Value))
                {
                    int[] itemsId = UtilsHelper.ToIntArray(selectedItemsInput.Value);

                    MapManager mapManager = new MapManager();
                    List<Map> maps = mapManager.GetBySeveralIds(itemsId);

                    if ((maps == null || maps.Count == 0) && mapManager.HasErrors)
                    {
                        ((front)Master).Alert.ShowUP("Error", mapManager.ErrorDescription);
                    }
                    else
                    {
                        ModalCompare.Show("Comparador", maps);
                    }
                }
                else
                {
                    ((front)Master).Alert.ShowUP("Comparador", "Debes elegir productos para realizar la comparación.");

                }
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.ShowUP("Excepción", exception.Message);
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

                MapManager mapManager = new MapManager();
                Map map = mapManager.Get(id);

                if (e.CommandName == "ShowDetail")
                {
                    ModalItemShop.Show(map);
                }
                else
                {
                    //Únicamente es posible agregar artículos si el usuario está logueado
                    if (SessionHelper.IsSessionAlive())
                    {
                        if (e.CommandName == "AddToCart")
                        {
                            ShopHelper.AddToCart(id, Session);
                            UpdateCartInformation();
                        }
                        else if (e.CommandName == "RemoveItemCart")
                        {
                            ShopHelper.RemoveFromCart(id, Session);
                            UpdateCartInformation();
                        }
                    }
                    else
                    {
                        ((front)Master).Alert.ShowUP("Sesión requerida", "Para poder realizar la operación debés iniciar sesión.");

                    }

                }
            }
            catch (Exception exception)
            {
                ((front)Master).Alert.ShowUP("Exception", exception.Message);
            }
        }

        protected void GoToInvoice(object sender, EventArgs e)
        {
            if (ShopHelper.GetQuantity() > 0)
            {
                Response.Redirect("/invoice.aspx");
            }
            else
            {
                ((front)Master).Alert.ShowUP("No hay productos elegidos", "¡Hey! debes elegir algún producto primero.");
            }
        }

        //Muestra la ventana de login
        protected void LogIn(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal", "$('#loginModal').modal('show');", true);
        }

        protected void HideBuyButton(object sender, RepeaterItemEventArgs e)
        {
            LinkButton btn = e.Item.FindControl("btnBuy") as LinkButton;
            btn.Visible = SessionHelper.IsSessionAlive();
        }
    }
}