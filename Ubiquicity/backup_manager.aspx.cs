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
    public partial class backup_manager : BaseManager
    {
        protected override void PageLoad(object sender, EventArgs e)
        {
            GridView = UCcrudGrid;
            GridView.HideDeleteButton();
            GridView.HideEditButton();
            GridView.ShowGenericActionButton("Restaurar");
            Alert.PerformMainAction += PerformBackup;
            Alert.PerformSecondAction += PerformRestore;
            Manager = new BackupManager();
        }

        /// <summary>
        /// Muestra el formulairo para el alta de un nuevo usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ShowNewForm(object sender, UbiquicityEventArg e)
        {
            Alert.Show("Crear respaldo", "¿Está seguro de querer crear el respaldo? El sistema se inhabilitará durante la ejecución.", "Si, crear respaldo");
        }

        protected override void PerformGenericAction(object sender, UbiquicityEventArg e)
        {
            Session["Ubiquicity_itemId"] = e.TheObject.ToString();
            Alert.Show("Restaurar respaldo", "¿Está seguro de querer restaurar el respaldo? El sistema se inhabilitará y se perderán los datos posteriores al punto de restauración.", null, "Si, restaurar respaldo");
        }

        /// <summary>
        /// Atiende la petición de creación lanzada desde al alert creado por ShowNewForm.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PerformBackup(object sender, UbiquicityEventArg e)
        {
            try
            {
                BackupManager backupManager = new BackupManager();

                if (!backupManager.PerformBackup() && backupManager.HasErrors)
                {
                    Alert.Show("Error", backupManager.ErrorDescription);
                }
                else
                {
                    LoadGridView();
                    Alert.Show("Éxtito", "El respaldo se ha generado exitosamente.");
                }
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }

        protected void PerformRestore(object sender, UbiquicityEventArg e)
        {
            try
            {
                string fileName = Session["Ubiquicity_itemId"].ToString();

                BackupManager backupManager = new BackupManager();

                if (!backupManager.PerformRestore(fileName) && backupManager.HasErrors)
                {
                    Alert.Show("Error", backupManager.ErrorDescription);
                }
                else
                {
                    Alert.Show("Éxtito", "La restauración se ha generado exitosamente.");
                }
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }

            Session.Remove("Ubiquicity_itemId");
        }

        /// <summary>
        /// Se establece la traducción de las columnas que quieren ser mostradas.
        /// </summary>
        /// <returns></returns>
        protected override Dictionary<string, string> ColumnsToShowAndTranslate()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("Id", "Nombre");
            columns.Add("Size", "Tamaño");
            columns.Add("Created", "Creado");
            
            return columns;
        }
    }
}