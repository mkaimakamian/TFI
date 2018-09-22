﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Helper;
using BE;
using Ubiquicity.Classes;

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
        protected virtual void PerformDeleteItem(object sender, UbiquicityEventArg e) { }
        protected virtual void AskForDelete(object sender, UbiquicityEventArg e) { }
        protected virtual void ShowEditForm(object sender, UbiquicityEventArg e) { }
        protected virtual void ShowNewForm(object sender, UbiquicityEventArg e) { }
        protected virtual void PerformGenericAction(object sender, UbiquicityEventArg e) { }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SessionCreated"] == null) Response.Redirect("/index.aspx");
            if (!SecurityHelper.HasPermission(Session["SessionCreated"] as User, Request.RawUrl)) Response.Redirect("/index.aspx");

            //Se asignó al botón principal la tarea de ejecutar la eliminación
            Alert.PerformMainAction += PerformDeleteItem;

            //Se emplea una suerte de patrón template para que los hijos puedan hacer uso del Page_Load
            PageLoad(sender, e);

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