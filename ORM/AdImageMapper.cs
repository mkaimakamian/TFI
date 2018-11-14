using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using System.Xml.Serialization;
using System.IO;
using System.Configuration;
using System.Web;

namespace ORM
{
    public class AdImageMapper
    {

        public bool Save(Ad adImage)
        {
            Random random = new Random();
            int randomNumber = random.Next(0, 99999999);

            adImage.Id = randomNumber;
            List<Ad> adImages = Get();
            adImages.Add(adImage);
            WriteIntoFile(adImages);

            return true;
        }

        public List<Ad> Get()
        {
            XmlRootAttribute root = new XmlRootAttribute("Advertisements");
            XmlSerializer deserializer = new XmlSerializer(typeof(List<Ad>), root);
            TextReader textReader = new StreamReader(GetAdFilePath());
            List<Ad> adImages = (List<Ad>)deserializer.Deserialize(textReader);
            textReader.Close();
            return adImages;
        }

        public bool Delete(int id)
        {
            List<Ad> adImages = Get();
            adImages = adImages.Where(x => x.Id != id).ToList();
            WriteIntoFile(adImages);

            return true;
        }

        private void WriteIntoFile(List<Ad> adImages)
        {
            XmlRootAttribute root = new XmlRootAttribute("Advertisements");
            XmlSerializer serializer = new XmlSerializer(typeof(List<Ad>), root);
            StreamWriter writer = new StreamWriter(GetAdFilePath());
            serializer.Serialize(writer, adImages);
            writer.Close();
        }

        private string GetAdFilePath()
        {
            string path = ConfigurationManager.AppSettings["AD_RESOURCE"];
            return HttpContext.Current.Server.MapPath(path);
        }
    }
}
