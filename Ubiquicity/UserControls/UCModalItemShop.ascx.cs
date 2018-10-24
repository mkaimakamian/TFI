using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;

namespace Ubiquicity.UserControls
{
    public partial class UCModalItemShop : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //commentInputDiv
            User user = (User)Session["SessionCreated"];
            if (user != null)
            {
                commentInputDiv.Style.Remove("display");
            }
        }

        public String title
        {
            set { ucModalItemShopLabel.InnerText = value; }
        }

        public String message
        {
            set { ucModalItemShopMessage.InnerText = value; }
        }

        /// <summary>
        /// Muestra en pantalla el mensaje; si los labels fueron asignados, se muestran los botones.
        /// </summary>
        /// <param name="title"></param>
        /// <param name="message"></param>
        /// <param name="button1Label"></param>
        /// <param name="button2Label"></param>
        public void Show(Map map)
        {

            itemRepeater.DataSource = GetComments(map);
            itemRepeater.DataBind();
            //super turbio: almaceno el id para saber, al momento de comentar, a qué producto le pertenece.
            btnComentar.CommandArgument = map.Id.ToString();
            this.title = map.Name;
            //this.message = map.Description;
            PopulateItemDetail(map);
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalItemShop", "window.onload = function() { $('#ucModalItemShop').modal('show'); }", true);
            ScriptManager.RegisterStartupScript(upItemShop, upItemShop.GetType(), "openModalItemShop", "$('#ucModalItemShop').modal('show');", true);
            upItemShop.Update();
        }

        private void PopulateItemDetail(Map map)
        {
            imgItem.Src = map.Image;
            descriptionItem.InnerText = map.Description;
            priceItem.InnerHtml = "<i class=\"fa fa-tags\"></i> $AR " + map.Price.ToString();
        }

        /// <summary>
        /// Recupera todos los comentarios para el producto cuyo detalle se quiere ver.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        private List<ItemComment> GetComments(Map map)
        {
            try
            {
                ItemCommentManager commentManager = new ItemCommentManager();
                return commentManager.Get(map.Id);
            }
            catch(Exception exception)
            {
                //TODO - Agregar control de error
            }

            return null;
        }

        /// <summary>
        /// Crea un comentario.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnComentar_Click(object sender, EventArgs e)
        {
            try
            {
                ItemCommentManager commentManager = new ItemCommentManager();

                ItemComment itemComment = new ItemComment();
                itemComment.Comment = commentInput.InnerText;
                itemComment.User =(User)Session["SessionCreated"];
                itemComment.Resource.Id = Convert.ToInt32(((Button)sender).CommandArgument);

                commentManager.Save(itemComment);
            }catch
            {
                //TODO - agregar control de error
                //((front)Master).Alert.Show("Exception", exception.Message);
            }
        }
    }
}