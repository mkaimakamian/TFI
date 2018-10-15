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

        /// <summary>
        /// Recupera los productos cuyos ids son pasados por parámetro.
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public List<Map> GetBySeveralIds(int[] ids)
        {
            List<Map> maps = new List<Map>();

            //feo... pero funciona por ahora
            foreach (int id in ids) maps.Add(Get(id));
            return maps;
        }
        


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

            if (String.IsNullOrEmpty(map.Resource))
            {
                string errorDescription = "Debe asociarse un archivo al mapa.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = isValid & false;
            }

            return isValid;
        }

        private bool IsValidForEdit(Map map)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(map.Name))
            {
                string errorDescription = "Debe completarse el nombre.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(map.Description))
            {
                string errorDescription = "Debe completarse la descripción.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(map.Image))
            {
                string errorDescription = "Debe asociarse una imagen al mapa.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            return isValid;
        }
    }
}
