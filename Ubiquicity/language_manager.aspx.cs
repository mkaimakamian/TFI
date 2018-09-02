using System;
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
            //Se asignó al botón principal la tarea de ejecutar la eliminación
            Alert.PerformMainAction += PerformDeleteItem;

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
                    Alert.Show("Error", languageManager.Errors[0].description);
                }
                else
                {
                    UCcrudGrid.LoadGrid(languages);
                }
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
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
                    Alert.Show("Error", languageManager.Errors[0].description);
                }
                else
                {
                    foreach (BE.Label label in labels)
                    {
                        translation = new Translation();
                        translation.Label = label;
                        translations.Add(translation);
                    }

                    UCFormLanguage.FillForm(translations);
                }
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }

        // Atiende la llamada del botón aceptar del form de usuario
        protected void ucModalLanguage_btnAcceptClick(object sender, EventArgs e)
        {
            try
            {
                int action = int.Parse(Session["Ubiquicity_action"].ToString());

                //TODO - Validar los campos
                LanguageManager languageManager = new LanguageManager();
                Language language = null;

                switch (action)
                {
                    case CREATE:
                        language = new Language();
                        UCFormLanguage.PopulateModel(language);
                        languageManager.Save(language);
                        break;

                    case EDIT:
                        if (Session["Ubiquicity_itemId"] != null)
                        {
                            language = languageManager.Get(int.Parse(Session["Ubiquicity_itemId"].ToString()));
                            UCFormLanguage.PopulateModel(language);
                            //languageManager.Edit(language);
                        }
                        break;
                }

                if (languageManager.HasErrors)
                {
                    Alert.Show("Error", languageManager.Errors[0].description);
                }
                else
                {
                    Response.Redirect(Request.RawUrl);
                }
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }


        private void AskForDelete(object sender, EventArgs e)
        {
            //Session["Ubiquicity_itemId"] = id;
            Alert.Show("Eliminar registro", "¿Está seguro de querer eliminar el registro?", "Si");
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
            UCFormLanguage.CleanForm();
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
            
            try
            {
                LanguageManager languageManager = new LanguageManager();
                Language language = languageManager.Get(id);
                List<Translation> translations = languageManager.GetTranslations(id);

                if (languageManager.HasErrors)
                {
                    Alert.Show("Error", languageManager.Errors[0].description);
                }
                else
                {
                    Session["Ubiquicity_action"] = EDIT;
                    // Para evitar traer apbsolutamente todo el contenido del objeto
                    //(y facilitar la carga en la grilla inicial), las traducciones
                    //y el idioma asociado se recuperan por separado
                    UCFormLanguage.FillForm(language, translations);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "openModalEdit", "window.onload = function() { $('#ucModalLanguage').modal('show'); }", true);

                }
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }

        //Para simplificar un poco, recupero el componente a través de la propiedad
        public UserControls.UCModalMessageBox Alert
        {
            get { return ((front)Master).Alert; }
        }
    }
}