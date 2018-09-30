using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;

namespace Ubiquicity
{
    public partial class logManager : BaseManager
    {
        protected override void PageLoad(object sender, EventArgs e)
        {
            UCLogFilter.Gridview = UCcrudGrid;
            UCcrudGrid.HideDeleteButton();
            UCcrudGrid.HideEditButton();
            UCcrudGrid.HideNewButton();
        }

        protected override void LoadGridView()
        {
            //Evita que se ejecute la carga inicial.
        }

    }
}