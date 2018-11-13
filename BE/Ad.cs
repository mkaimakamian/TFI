using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace BE
{
    [Serializable]
    public class Ad
    {
       // [XmlElement("Impressions")]
        public int Id { get; set; }
        [XmlElement("ImageUrl")]
        public string Image { get; set; }
        public string NavigateUrl { get; set; }
        public string AlternateText { get; set; }
        public string Impressions { get; set; }

    }
}
