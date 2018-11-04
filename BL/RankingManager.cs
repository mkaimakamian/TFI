using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class RankingManager: BaseManager
    {
        ///// <summary>
        ///// Persiste el elemento.
        ///// </summary>
        ///// <param name="map"></param>
        ///// <returns></returns>
        //public bool Save(Resource resource)
        //{
        //    //if (!IsValid(map)) return false;

        //    RankingMapper rankingMapper = new RankingMapper();

        //    if (!rankingMapper.Save(resource))
        //    {
        //        string errorDescription = "No se ha podido guardar la valoración.";
        //        log.AddLogCritical("Save", errorDescription, this);
        //        AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
        //        return false;
        //    }

        //    return true;
        //}

        ///// <summary>
        ///// Devuelve el recurso cuyo id es pasado por parámetro.
        ///// </summary>
        ///// <param name="id"></param>
        ///// <returns></returns>
        //public Ranking Get(int id)
        //{
        //    RankingManager rankingManager = new RankingManager();
        //    MapMapper mapMapper = new MapMapper();
        //    Map map = mapMapper.Get(id);

        //    if (map == null)
        //    {
        //        string errorDescription = "No se ha encontrado mapa con id " + id + ".";
        //        log.AddLogCritical("Get", errorDescription, this);
        //        AddError(new ResultBE(ResultBE.Type.NULL, errorDescription));
        //        return null;
        //    }

        //    map.Ranking = rankingManager.Get(map);

        //    return map;
        //}
    }
}
