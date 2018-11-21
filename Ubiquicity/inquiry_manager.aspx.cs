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
    public partial class inquiry_manager : BaseManager
    {

        protected override void PageLoad(object sender, EventArgs e)
        {
            GridView = UCcrudGrid;
            GridView.ShowGenericActionButton("Acción");
            GridView.HideEditButton();
            GridView.HideNewButton();
            Manager = new ItemCommentManager();
        }

        /// <summary>
        /// Muestra el formulario para realizar responder la pregunta.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void PerformGenericAction(object sender, UbiquicityEventArg e)
        {
            int id = Convert.ToInt32(e.TheObject.ToString());
            ItemCommentManager itemCommentManager = new ItemCommentManager();
            ItemComment itemComment = itemCommentManager.Get(id);

            if (itemComment == null && itemCommentManager.HasErrors)
            {
                Alert.ShowUP("Error", itemCommentManager.ErrorDescription);
            }
            else
            {
                //Si existe la referencia, entonces a sido respondida
                if (itemComment.SentenceReference == null) {
                    UCFormInquiry.CleanForm();
                    UCFormInquiry.FillForm(itemComment);
                    SessionUtilHelper.KeepInSession(id.ToString(), Session);
                    ScriptManager.RegisterStartupScript(upUCModalForm, upUCModalForm.GetType(), "openModalCreate", "$('#modalInquiry').modal('show');", true);
                    upUCModalForm.Update(); }
                else
                {
                    Alert.ShowUP("Respuesta", "Esta pregunta ya ha sido respondida; no hay acciones disponibles.");
                }
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
                //Una implementación no muy buena
                int id = Convert.ToInt32(SessionUtilHelper.GetIdFromSession(Session));
                ItemCommentManager itemCommentManager = new ItemCommentManager();
                ItemComment itemommentRef = itemCommentManager.Get(id);

                ItemComment itemComment = new ItemComment();
                itemComment.Resource = itemommentRef.Resource;
                itemComment.SentenceReference = itemommentRef;
                UCFormInquiry.PopulateModel(itemComment);

                bool success = itemCommentManager.Save(itemComment);

                if (!success && itemCommentManager.HasErrors)
                {
                    Alert.Show("Error", itemCommentManager.ErrorDescription);
                }
                else
                {
                    LoadGridView();
                }
            } catch (Exception exception)
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
            columns.Add("Sentence", "Comentario");
            columns.Add("Date", "Fecha");
            columns.Add("Answer", "Respuesta");
            columns.Add("AnswerDate", "Respondido");

            //columns.Add("Username", "Usuario");

            return columns;
        }
    }
}