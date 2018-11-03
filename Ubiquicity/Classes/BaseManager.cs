using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Helper;
using BE;
using Ubiquicity.Classes;
using BL;
using System.Reflection;

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
        private BL.BaseManager manager = null;

        protected virtual void PageLoad(object sender, EventArgs e) { throw new Exception("La subclase no ha implementado el método PageLoad"); }
        protected virtual void PreLoadGridView() { }
        protected virtual void PosLoadGridView() { }

        protected virtual bool AcceptCreate(BL.BaseManager manager) { return true; }
        protected virtual bool AcceptModify(BL.BaseManager manager, int id) { return true; }

        protected virtual Dictionary<string, string> ColumnsToShowAndTranslate() { return null; }
        protected virtual void ShowEditForm(object sender, UbiquicityEventArg e) { }
        protected virtual void ShowNewForm(object sender, UbiquicityEventArg e) { }
        protected virtual void PerformGenericAction(object sender, UbiquicityEventArg e) { }

        protected void Page_Load(object sender, EventArgs e)
        {
            SessionHelper.ExecuteAutoStop();
            if (!SecurityHelper.HasPermission(SessionHelper.GetUser(), Request.RawUrl)) Response.Redirect("/index.aspx");

            //Se asignó al botón principal la tarea de ejecutar la eliminación
            Alert.PerformMainAction += PerformDeleteItem;

            //Se emplea una suerte de patrón template para que los hijos puedan hacer uso del Page_Load
            PageLoad(sender, e);

            //if (manager == null)
            //{
            //    throw new Exception("Manager no definido.");
            //}

            if (!IsPostBack)
            {
                //Los hijos deben implementar este método para cargar la grilla
                LoadGridView();
            }

            //Setteo de handlers que deben ser implementados por las clases hijo si se pretende manipular alguna de estas acciones.
            if (GridView != null) {
                GridView.DeleteActionClick += AskForDelete;
                GridView.EditActionClick += ShowEditForm;
                GridView.NewActionClick += ShowNewForm;
                GridView.GenericActionClick += PerformGenericAction;
            }
        }

        protected virtual void LoadGridView() {
            try
            {
                Type type = Manager.GetType();
                MethodInfo info = type.GetMethod("Get", Type.EmptyTypes);
                object elements = info.Invoke(Manager, null);

                if (Manager.HasErrors)
                {
                    Alert.Show("Error", Manager.ErrorDescription);
                }
                else
                {
                    GridView.ColumnsToShow = ColumnsToShowAndTranslate();
                    GridView.LoadGrid(elements);
                }
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
            }
        }

        /// <summary>
        /// Muestra el mensaje para que se confirme la eliminación, mostrando los mensajes con UP.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected virtual void AskForDelete(object sender, UbiquicityEventArg e)
        {
            Session["Ubiquicity_itemId"] = Convert.ToInt32(e.TheObject);
            Alert.ShowUP("Eliminar registro", "¿Está seguro de querer eliminar el registro?", "Si, eliminarlo");
        }

        protected virtual void PerformDeleteItem(object sender, UbiquicityEventArg e) {
            if (Session["Ubiquicity_itemId"] != null)
            {
                Type type = Manager.GetType();
                MethodInfo info = type.GetMethod("Delete", new[] { typeof(int) });
                object[] value = { Convert.ToInt32(Session["Ubiquicity_itemId"]) };
                object success = info.Invoke(Manager, value);

                if (!Boolean.Parse(success.ToString()) && Manager.HasErrors)
                {
                    Alert.Show("Error", Manager.ErrorDescription);
                } else
                {
                    Session.Remove("Ubiquicity_itemId");
                    LoadGridView();
                }
            }
        }

        // Atiende la llamada del botón aceptar del form de creación.
        //En lo particular, como la edición y la creación usan el mismo botón, los dos eventos son atendidos por este handler.
        protected void AccepCreateOrModify(object sender, EventArgs e)
        {
            try
            {
                int action = Convert.ToInt32(Session["Ubiquicity_action"]);
                //TODO - Validar los campos
                bool success = false;

                switch (action)
                {
                    case CREATE:
                        success = AcceptCreate(Manager);
                        break;

                    case EDIT:
                        if (Session["Ubiquicity_itemId"] != null)
                        {
                            success = AcceptModify(Manager, Convert.ToInt32(Session["Ubiquicity_itemId"]));
                        }
                        break;
                }

                Session.Remove("Ubiquicity_itemId");

                if (!success && Manager.HasErrors)
                {
                    Alert.Show("Error", Manager.ErrorDescription);
                }
                else
                {
                    LoadGridView();
                }
            }
            catch (Exception exception)
            {
                Alert.Show("Exception", exception.Message);
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

        protected BL.BaseManager Manager
        {
            get { return manager; }
            set { manager = value; }
        }
    }
}