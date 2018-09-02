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
    public class PermissionMapper
    {
        //public List<Permission> Get()
        //{

        //    return null;
        //}

        ///// <summary>
        ///// Recupera los permisos asociados a un rol.
        ///// </summary>
        ///// <param name="role"></param>
        ///// <returns></returns>
        //public List<Permission> Get(Role role)
        //{
        //    Dal dal = new Dal();
        //    Hashtable table = new Hashtable();
        //    List<Permission> permissions = null;

        //    table.Add("@id", role.Id);

        //    DataSet result = dal.Read(table, "spReadPermission");

        //    if (result != null && result.Tables[0].Rows.Count > 0)
        //    {
        //        permissions = new List<Permission>();

        //        foreach (DataRow data in result.Tables[0].Rows)
        //        {
        //            permissions.Add(ConvertToModel(data));
        //        }
        //    }

        //    return permissions;
        //}

        //private Permission ConvertToModel(DataRow data)
        //{
        //    return new Permission
        //    {
        //        Id = int.Parse(data["id"].ToString()),
        //        Description = data["name"].ToString()
        //    }
        //}
    }
}
