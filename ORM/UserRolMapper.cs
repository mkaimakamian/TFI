using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using DA;
using BE;

namespace ORM
{
    // TODO - agregar en ea
    public class UserRoleMapper
    {
        public bool InUse(int roleId)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@roleId", roleId);
            table.Add("@inUse", true);

            DataSet result = dal.Read(table, "spReadUserRole");

            return result != null && result.Tables[0].Rows.Count > 0;
        }

    }
}
