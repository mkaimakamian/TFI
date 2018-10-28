using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ubiquicity.UserControls
{
    public partial class UCHeaderBackOffice : System.Web.UI.UserControl
    {
        //private string image;
        //private string title;
        //private string subtitle;
        //private string content;

        public string Image
        {
            get
            {
                return UCImage.Src;
            }

            set
            {
                UCImage.Src = value;
                UCImage.Visible = true;
            }
        }

        public string Title
        {
            get
            {
                return UCTitle.InnerText;
            }

            set
            {
                UCTitle.InnerText = value;
            }
        }

        public string Subtitle
        {
            get
            {
                return UCSubtitle.InnerText;
            }

            set
            {
                UCSubtitle.InnerText = value;
            }
        }

        public string Content
        {
            get
            {
                return UCContent.InnerText;
            }

            set
            {
                UCContent.InnerText = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

      

    }
}