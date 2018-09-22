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
    public partial class backup_manager : BaseManager
    {
        protected override void PageLoad(object sender, EventArgs e)
        {
            GridView = UCcrudGrid;
            Alert.PerformMainAction += PerformBackup;
        }


        protected override void LoadGridView()
        {
            try
            {
                BackupManager backupManager = new BackupManager();
                List<Backup> backups = backupManager.Get();

                if (backupManager.HasErrors)
                {
                    Alert.Show("Error", backupManager.ErrorDescription);
                }
                else
                {
                    GridView.ColumnsToShow = ColumnsToShowAndTranslate();
                    GridView.LoadGrid(backups);
                }
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }

        /// <summary>
        /// Muestra el formulairo para el alta de un nuevo usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ShowNewForm(object sender, EventArgs e)
        {
            Alert.Show("Crear respaldo", "¿Está seguro de querer crear el respaldo? El sistema se inhabilitará durante la ejecución.", "Si, crear respaldo");
        }

        /// <summary>
        /// Atiende la petición de creación lanzada desde al alert creado por ShowNewForm.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PerformBackup(object sender, EventArgs e)
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
                    Alert.Show("Éxtito", "El respaldo se ha generado exitosamente.");
                }
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }

        /// <summary>
        /// Se establece la traducción de las columnas que quieren ser mostradas.
        /// </summary>
        /// <returns></returns>
        private Dictionary<string, string> ColumnsToShowAndTranslate()
        {
            Dictionary<string, string> columns = new Dictionary<string, string>();
            columns.Add("Name", "Nombre");
            columns.Add("Size", "Tamaño");
            columns.Add("Created", "Creado");
            
            return columns;
        }
    }
}