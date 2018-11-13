using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;

namespace Ubiquicity.UserControls
{
    public partial class UCFormAd : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void CleanForm()
        {
            urlInput.Value = "";
        }

        public void PopulateModel(Ad adImage)
        {
            adImage.NavigateUrl = urlInput.Value;
            adImage.AlternateText = adImage.NavigateUrl;

            if (resourceInput.HasFile)
            {
                System.IO.Stream fs = resourceInput.PostedFile.InputStream;
                System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                adImage.Image = "data:image/png;base64," + base64String;
            }
        }
    }
}