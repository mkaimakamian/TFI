using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;

namespace Ubiquicity
{
    public partial class newsletter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NewsManager newsmanager = new NewsManager();
                newsRepeater.DataSource = newsmanager.Get();
                newsRepeater.DataBind();
            }
        }

        protected void newsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            NewsManager newsmanager = new NewsManager();
            int id = Convert.ToInt32(e.CommandArgument);
            News news = newsmanager.Get(id);
            //
            ModalNewsletter.Show(news.Title, news.Body, news.Image);
        }
    }
}