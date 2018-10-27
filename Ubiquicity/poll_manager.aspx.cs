using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using BE;
using Ubiquicity.Classes;

namespace Ubiquicity
{
    public partial class poll_manager : BaseManager
    {
        protected override void PageLoad(object sender, EventArgs e)
        {
            GridView = UCcrudGrid;
            Manager = new PollManager();
        }

        /// <summary>
        /// Muestra el formulairo para el alta de un nuevo elemento.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ShowNewForm(object sender, UbiquicityEventArg e)
        {
            try
            {
                PollOptionManager pollOptionManager = new PollOptionManager();
                List<PollOption> pollOptions = pollOptionManager.Get();

                if (pollOptions == null && pollOptionManager.HasErrors)
                {
                    Alert.ShowUP("Error", pollOptionManager.ErrorDescription);
                }
                else
                {
                    UCFormPoll.CleanForm(pollOptions);
                    Session["Ubiquicity_action"] = CREATE;
                    ScriptManager.RegisterStartupScript(upUCModalForm, upUCModalForm.GetType(), "openModalCreate", "$('#modalPol').modal('show');", true);
                    upUCModalForm.Update();
                }

            }
            catch (Exception exception)
            {
                Alert.ShowUP("Exception", exception.Message);
            }
        }

        /// <summary>
        /// Muestra el formulario para la edición de un elemento existente.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ShowEditForm(object sender, UbiquicityEventArg e)
        {
            int id = Convert.ToInt32(e.TheObject);
            Session["Ubiquicity_itemId"] = id;

            PollManager pollManager = new PollManager();
            Poll poll = pollManager.Get(id);

            if (poll == null && pollManager.HasErrors)
            {
                Alert.ShowUP("Error", pollManager.ErrorDescription);
            }
            else
            {
                //TODO - agregar controles de error
                PollOptionManager pollOptionManager = new PollOptionManager();
                List<PollOption> pollOptions = pollOptionManager.Get();

                UCFormPoll.CleanForm(pollOptions);
                UCFormPoll.FillForm(poll);
                Session["Ubiquicity_action"] = EDIT;
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalEdit", "window.onload = function() { $('#modalMap').modal('show'); }", true);
                ScriptManager.RegisterStartupScript(upUCModalForm, upUCModalForm.GetType(), "openModalEdit", "$('#modalPol').modal('show');", true);
                upUCModalForm.Update();
            }
        }

        protected override bool AcceptCreate(BL.BaseManager manager)
        {
            Poll poll = new Poll();
            UCFormPoll.PopulateModel(poll);
            return ((PollManager)manager).Save(poll);
        }

        /// <summary>
        /// Se establece la traducción de las columnas que quieren ser mostradas.
        /// </summary>
        /// <returns></returns>
        protected override Dictionary<string, string> ColumnsToShowAndTranslate()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("Name", "Nombre");
            columns.Add("Description", "Descripción");
            columns.Add("DueDate", "Vencimiento");
            return columns;
        }
    }
}