﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using BE;

namespace Ubiquicity
{
    public partial class language : System.Web.UI.Page
    {
        private const int CREATE = 1;
        private const int EDIT = 2;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Se asigna el Alert que está incrustado en la master page
            //TODO - quizá el componente debería utilizar su propio alert box
            UCcrudGrid.AlertBox = (UserControls.UCModalMessageBox)Master.FindControl("customAlertBox");

            //Se asignó al botón principal la tarea de ejecutar la eliminación
            UCcrudGrid.PerformAlertBoxMainAction = PerformDeleteItem;

            UCcrudGrid.DeleteActionClick += AskForDelete;
            UCcrudGrid.EditActionClick += ShowEditForm;
            UCcrudGrid.NewActionClick += ShowNewForm;

            if (!IsPostBack)
            {
                LoadGrid();
            }
        }

        /// <summary>
        /// Carga la grilla con los idiomas disponibles.
        /// </summary>
        private void LoadGrid()
        {
            try
            {
                LanguageManager languageManager = new LanguageManager();
                List<Language> languages = languageManager.Get();

                if (languageManager.HasErrors)
                {
                    UCcrudGrid.ShowAlert("Error", languageManager.Errors[0].description);
                }
                else
                {
                    UCcrudGrid.LoadGrid(languages);
                }
            }
            catch (Exception exception)
            {
                UCcrudGrid.ShowAlert("Exception", exception.Message);
            }
        }

        /// <summary>
        /// Carga las traducciones para el alta / modificación de los idiomas.
        /// </summary>
        private void LoadGridTranslationForNewLanguage()
        {
            try
            {
                LanguageManager languageManager = new LanguageManager();
                List<BE.Label> labels = languageManager.GetLabels();
                List<Translation> translations = new List<Translation>();
                Translation translation = null;

                if (languageManager.HasErrors)
                {
                    UCcrudGrid.ShowAlert("Error", languageManager.Errors[0].description);
                }
                else
                {
                    foreach (BE.Label label in labels)
                    {
                        translation = new Translation();
                        translation.Label = label;
                        translations.Add(translation);
                    }

                    UCFormLanguage.LoadTranslations(translations);
                }
            }
            catch (Exception exception)
            {
                UCcrudGrid.ShowAlert("Exception", exception.Message);
            }
        }

        // Atiende la llamada del botón aceptar del form de usuario
        protected void ucModalLanguage_btnAcceptClick(object sender, EventArgs e)
        {
        //    try
        //    {
        //        int action = Convert.ToInt32(Session["Ubiquicity_action"]);

        //        //TODO - Validar los campos
        //        UserManager userManager = new UserManager();
        //        User user = null;

        //        switch (action)
        //        {
        //            case CREATE:
        //                user = new User();
        //                PopulateModel(user);
        //                userManager.Save(user);
        //                break;

        //            case EDIT:
        //                if (Session["Ubiquicity_itemId"] != null)
        //                {
        //                    user = userManager.Get(Convert.ToInt32(Session["Ubiquicity_itemId"]));
        //                    PopulateModel(user);
        //                    userManager.Edit(user);
        //                }
        //                break;
        //        }

        //        if (userManager.HasErrors)
        //        {
        //            UCcrudGrid.ShowAlert("Error", userManager.Errors[0].description);
        //        }
        //        else
        //        {
        //            Response.Redirect(Request.RawUrl);
        //        }
        //    }
        //    catch (Exception exception)
        //    {
        //        UCcrudGrid.ShowAlert("Exception", exception.Message);
        //    }
        }


        private void AskForDelete(object sender, EventArgs e)
        {
            //Session["Ubiquicity_itemId"] = id;
            UCcrudGrid.ShowAlert("Eliminar registro", "¿Está seguro de querer eliminar el registro?", "Si");
        }

        private void PerformDeleteItem(object sender, EventArgs e)
        {
            if (Session["Ubiquicity_itemId"] != null)
            {
                LanguageManager languageManager = new LanguageManager();
                languageManager.Delete(Convert.ToInt32(Session["Ubiquicity_itemId"]));
                LoadGrid();
                Session.Remove("Ubiquicity_itemId");
            }
        }

        /// <summary>
        /// Muestra el formulairo para el alta de un nuevo usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ShowNewForm(object sender, EventArgs e)
        {
            LoadGridTranslationForNewLanguage();
            Session["Ubiquicity_action"] = CREATE;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalCreate", "window.onload = function() { $('#ucModalLanguage').modal('show'); }", true);
        }


        /// <summary>
        /// Muestra el formulario para la edición de un usuario existente.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ShowEditForm(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["Ubiquicity_itemId"]);

            //UserManager userManager = new UserManager();
            //User user = userManager.Get(id);

            //if (userManager.HasErrors)
            //{
            //    UCcrudGrid.ShowAlert("Error", userManager.Errors[0].description);
            //}
            //else
            //{
            //    UCFormNewMember.FillForm(user);
            //    Session["Ubiquicity_action"] = EDIT;
            //    //Session["Ubiquicity_itemId"] = id;
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalEdit", "window.onload = function() { $('#ucModalLanguage').modal('show'); }", true);
            //}

            try
            {
                LanguageManager languageManager = new LanguageManager();
                List<Translation> translations = languageManager.GetTranslations(id);

                if (languageManager.HasErrors)
                {
                    UCcrudGrid.ShowAlert("Error", languageManager.Errors[0].description);
                }
                else
                {
                    // TODO - a lo mejor esto debe estar en un método separado
                    UCFormLanguage.LoadTranslations(translations);
                }
            }
            catch (Exception exception)
            {
                UCcrudGrid.ShowAlert("Exception", exception.Message);
            }
        }
    }
}