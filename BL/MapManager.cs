using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class MapManager: BaseManager
    {
        /// <summary>
        /// Persiste el elemento.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        public bool Save(Map map)
        {
            if (!IsValid(map)) return false;

            MapMapper mapMapper = new MapMapper();

            if (!mapMapper.Save(map))
            {
                string errorDescription = "No se ha podido guardar el mapa.";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        /// <summary>
        /// Guarda los cambios del recurso existente.
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        public bool Edit(Map map)
        {
            if (!IsValidForEdit(map)) return false;

            MapMapper mapMapper = new MapMapper();

            if (!mapMapper.Edit(map))
            {
                string errorDescription = "No se ha podido modificar el mapa.";
                log.AddLogCritical("Edit", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        /// <summary>
        /// Devuelve el recurso cuyo id es pasado por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Map Get(int id)
        {
            MapMapper mapMapper = new MapMapper();
            Map map = mapMapper.Get(id);

            if (map == null)
            {
                string errorDescription = "No se ha encontrado mapa con id " + id + ".";
                log.AddLogCritical("Get", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.NULL, errorDescription));
            }

            return map;
        }

        /// <summary>
        /// Recupera el listado de todos los mapas.
        /// </summary>
        /// <returns></returns>
        public List<Map> Get()
        {
            MapMapper mapMapper = new MapMapper();
            return mapMapper.Get();
        }

        public List<Map> Get(List<QueryFilter> filters)
        {
            MapMapper mapMapper = new MapMapper();
            return mapMapper.Get(filters);
        }

        /// <summary>
        /// Recupera los productos cuyos ids son pasados por parámetro.
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public List<Map> GetBySeveralIds(int[] ids)
        {
            List<Map> maps = new List<Map>();

            // TODO -feo... pero funciona por ahora
            foreach (int id in ids) maps.Add(Get(id));
            return maps;
        }

        /// <summary>
        /// Elimina el elemento cuyo id es pasado por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(int id)
        {
            MapMapper mapMapprer = new MapMapper();

            if (!mapMapprer.Delete(id))
            {
                string errorDescription = "No se ha podido eliminar el mapa con id " + id + ".";
                log.AddLogCritical("Delete", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }
            return true;
        }

        private bool IsValid(Map map)
        {
            bool isValid = IsValidForEdit(map);
            //Debe asociarse un archivo la mapa
            isValid &= VLetterNumbers(map.Resource, 1, 0, "Recurso", "IsValid");
            return isValid;
        }

        private bool IsValidForEdit(Map map)
        {
            bool isValid = true;
            isValid &= VLetterNumbers(map.Name, 1, 50, "Nombre", "IsValidForEdit");
            isValid &= VLetterNumbers(map.Description, 1, 250, "Descripción", "IsValidForEdit");
            isValid &= VLetterNumbers(map.Name, 1, 0, "Imagen", "IsValidForEdit");
            //isValid &= VOnlyNumber(map.Price.ToString(), 1, 0, "Price", "IsValidForEdit");
            return isValid;
        }
    }
}
