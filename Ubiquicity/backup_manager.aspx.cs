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

                //UserManager userManager = new UserManager();
                //List<User> users = userManager.Get();

                //if (userManager.HasErrors)
                //{
                //    Alert.Show("Error", userManager.ErrorDescription);
                //}
                //else
                //{
                //    GridView.ColumnsToShow = ColumnsToShowAndTranslate();
                //    GridView.LoadGrid(users);
                //}
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
            columns.Add("Path", "Ruta");
            columns.Add("Created", "Creado");
            
            return columns;
        }
    }
}