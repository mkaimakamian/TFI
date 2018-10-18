using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using DA;
using System.Data;
using System.Collections;

namespace ORM
{
    public class NewsAddresseeMapper
    {
        public bool Save(NewsAddressee addressee)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@name", addressee.Name);
            table.Add("@mail", addressee.Email);
            table.Add("@active", addressee.Active);
            table.Add("@singup", addressee.Singup);
            table.Add("@categories", addressee.Categories);
            addressee.Id = dal.Write(table, "spWriteNewsAddressee");

            return addressee.Id > 0;
        }

        public List<NewsAddressee> Get()
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            List<NewsAddressee> addressees = null;

            table.Add("@mail", DBNull.Value);
            DataSet result = dal.Read(table, "spReadMap");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                addressees = new List<NewsAddressee>();
                foreach (DataRow data in result.Tables[0].Rows)
                {
                    addressees.Add(ConvertToModel(data));
                }
            }

            return addressees;
        }

        public NewsAddressee Get(string mail)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();
            NewsAddressee addressee = null;

            table.Add("@mail", mail);
            DataSet result = dal.Read(table, "spReadNewsAddressee");

            if (result != null && result.Tables[0].Rows.Count > 0)
            {
                addressee = ConvertToModel(result.Tables[0].Rows[0]);
            }
            return addressee;
        }

        public bool Unsuscribe(NewsAddressee addressee)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@email", addressee.Email);
            table.Add("@active", addressee.Active);
            table.Add("@dropout", addressee.Dropout);
            return dal.Write(table, "spModifyNewsAddressee") > 0;
        }


        private NewsAddressee ConvertToModel(DataRow data)
        {
            NewsAddressee addressee = new NewsAddressee();

            addressee.Id = int.Parse(data["id"].ToString());
            addressee.Name = data["name"].ToString();
            addressee.Email = data["email"].ToString();
            addressee.Singup = Convert.ToDateTime(data["singup"]);
            addressee.Active = Convert.ToBoolean(data["active"]);
            addressee.Categories = data["categories"].ToString();

            if (data["dropout"] != DBNull.Value)
            {
                addressee.Dropout = Convert.ToDateTime(data["dropout"]);
            }
            return addressee;
            
        }
    }
}
