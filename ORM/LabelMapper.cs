using System;
using System.Collections.Generic;
using System.Collections;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using DA;

namespace ORM
{
    public class LabelMapper
    {

        //public List<Label> Get()
        //{
        //    Dal dal = new Dal();
        //    Hashtable table = new Hashtable();
        //    List<Label> labels = null;

        //    DataSet result = dal.Read(table, "spReadLabel");

        //    if (result != null && result.Tables[0].Rows.Count > 0)
        //    {
        //        labels = new List<Label>();

        //        foreach (DataRow data in result.Tables[0].Rows)
        //        {
        //            labels.Add(ConvertToModel(data));
        //        }
        //    }

        //    return labels;
        //}

        //private Label ConvertToModel(DataRow data)
        //{
        //    return new Label
        //    {
        //        Id = data["id"].ToString(),
        //        Description = data["description"].ToString()
        //    };
        //}
    }
}
