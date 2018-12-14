using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;
using Ubiquicity.Classes;
using Helper;

namespace Ubiquicity
{
    public partial class support_manager : BaseManager
    {
        protected override void PageLoad(object sender, EventArgs e)
        {
            GridView = UCcrudGrid;
            GridView.ShowGenericActionButton("Responder");
            GridView.HideEditButton();
            GridView.HideNewButton();
            GridView.HideDeleteButton();
            Manager = new ItemCommentSupportManager();
        }

        /// <summary>
        /// Muestra el formulario para realizar responder la pregunta.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void PerformGenericAction(object sender, UbiquicityEventArg e)
        {
            try {
                int id = Convert.ToInt32(e.TheObject.ToString());

                //UCFormInquiry.CleanForm();
                //UCFormInquiry.FillForm(itemComment);
                SessionUtilHelper.KeepInSession(id.ToString(), Session);
                //ScriptManager.RegisterStartupScript(upUCModalForm, upUCModalForm.GetType(), "openModalCreate", "$('#modalInquiry').modal('show');", true);
                //upUCModalForm.Update();

                //SessionUtilHelper.KeepInSession(e.CommandArgument.ToString(), Session);

                //Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", "window.onload = function() { $('#modalInvoiceItemSupport').modal('show'); }", true);
                UCModalInvoiceItemSupport.LoadCommentsSupport(id);
                ScriptManager.RegisterStartupScript(upUCModalInvoiceItemSupport, upUCModalInvoiceItemSupport.GetType(), "openModalCreate", "$('#modalInvoiceItemSupport').modal('show');", true);
                upUCModalInvoiceItemSupport.Update();
            }
            catch (Exception exception)
            {
                Alert.Show("Excepción", exception.Message);
            }

        }

        /// <summary>
        /// Se encarga de persistir los datos.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PerformAnswer(object sender, EventArgs e)
        {
            try
            {
                ////Una implementación no muy buena
                //int id = Convert.ToInt32(SessionUtilHelper.GetIdFromSession(Session));
                //ItemCommentManager itemCommentManager = new ItemCommentManager();
                //ItemComment itemommentRef = itemCommentManager.Get(id);

                //ItemComment itemComment = new ItemComment();
                //itemComment.Resource = itemommentRef.Resource;
                //itemComment.SentenceReference = itemommentRef;
                //UCFormInquiry.PopulateModel(itemComment);

                //bool success = itemCommentManager.Save(itemComment);

                //if (!success && itemCommentManager.HasErrors)
                //{
                //    Alert.Show("Error", itemCommentManager.ErrorDescription);
                //}
                //else
                //{
                //    LoadGridView();
                //}
            }
            catch (Exception exception)
            {
                Alert.Show("Excepción", exception.Message);
            }
            SessionUtilHelper.FlushId(Session);
        }

        /// <summary>
        /// Se establece la traducción de las columnas que quieren ser mostradas.
        /// </summary>
        /// <returns></returns>
        protected override Dictionary<string, string> ColumnsToShowAndTranslate()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("Sentence", "Consulta");
            columns.Add("Date", "Fecha");
            columns.Add("IsClosed", "Cerrado");
            return columns;
        }
    }
}