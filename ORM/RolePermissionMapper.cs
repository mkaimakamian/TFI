using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using DA;

namespace ORM
{
    //TODO - agregar en ea
    public class RolePermissionMapper
    {
        public bool Save(Role role)
        {
            Dal dal = new Dal();
            Hashtable table = new Hashtable();

            table.Add("@idRole", role.Name);
            table.Add("@idPermission", role.Description);

            return dal.Write(table, "spWriteRolePermission");
        }
    }
}
