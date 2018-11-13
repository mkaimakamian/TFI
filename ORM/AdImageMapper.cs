using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using System.Xml.Serialization;
using System.IO;
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
            TextReader textReader = new StreamReader(@"C:\Users\Kokumo\Documents\UAI\5to\TFI\plataforma\Ubiquicity\Ubiquicity\Resources\adRotatorImages\ARImages.xml");
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
            StreamWriter writer = new StreamWriter(@"C:\Users\Kokumo\Documents\UAI\5to\TFI\plataforma\Ubiquicity\Ubiquicity\Resources\adRotatorImages\ARImages.xml");
            serializer.Serialize(writer, adImages);
            writer.Close();
        }
    }
}
