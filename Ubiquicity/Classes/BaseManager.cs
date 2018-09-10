using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ubiquicity
{
    /// <summary>
    /// Esta clase intenta reunir los métodos y atributos más comunes de las páginas empleadas para los CRUDs
    /// </summary>
    public class BaseManager: System.Web.UI.Page
    {
        protected const int CREATE = 1;
        protected const int EDIT = 2;
        private UserControls.UCcrudGrid gridView = null;

        protected virtual void PageLoad(object sender, EventArgs e) { }
        protected virtual void PreLoadGridView() { }
        protected virtual void LoadGridView() { }
        protected virtual void PosLoadGridView() { }
        protected virtual void PerformDeleteItem(object sender, EventArgs e) { }
        protected virtual void AskForDelete(object sender, EventArgs e) { }
        protected virtual void ShowEditForm(object sender, EventArgs e) { }
        protected virtual void ShowNewForm(object sender, EventArgs e) { }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Se asignó al botón principal la tarea de ejecutar la eliminación
            Alert.PerformMainAction += PerformDeleteItem;

            //Se emplea una suerte de patrón template para que los hijos puedan hacer uso del Page_Load
            PageLoad(sender, e);

            if (!IsPostBack)
            {
                //Los hijos deben implementar este método para cargar la grilla
                PreLoadGridView();
                LoadGridView();
                PosLoadGridView();
            }

            //Setteo de handlers que deben ser implementados por las clases hijo
            if (GridView != null) {
                GridView.DeleteActionClick += AskForDelete;
                GridView.EditActionClick += ShowEditForm;
                GridView.NewActionClick += ShowNewForm;
            }
        }

        //Pone a disposición el componente para mostrar los mensajes de error
        protected UserControls.UCModalMessageBox Alert
        {
            get { return ((front)Master).Alert; }
        }

        //Permite que la clase asocie los handlers que deben ser implementados por los hijos
        protected UserControls.UCcrudGrid GridView
        {
            get { return gridView; }
            set { gridView = value;  }
        }

    }
}