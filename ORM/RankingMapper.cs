using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Collections;
using BE;
using DA;

namespace ORM
{
    public class RankingMapper
    {
        ///// <summary>
        ///// Guarda los datos modelados, en la base.
        ///// </summary>
        ///// <param name="map"></param>
        ///// <returns></returns>
        //public bool Save(Resource resource)
        //{
        //    Dal dal = new Dal();
        //    Hashtable table = new Hashtable();
        //    table.Add("@userId", resource.Ranking.User.Id);
        //    table.Add("@ranking", resource.Ranking.Value);
        //    table.Add("@resourceId", resource.Id);
        //    return dal.Write(table, "spWriteRanking") > 0;
        //}
    }
}
