using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;
namespace BL
{
    public class AccountDetailManager:BaseManager
    {

        /// <summary>
        /// Recupera el listado de todos los mapas.
        /// </summary>
        /// <returns></returns>
        public List<AccountDetail> Get(User user)
        {
            AccountDetailMapper accountDetailMapper = new AccountDetailMapper();
            return accountDetailMapper.Get(user);
        }
    }
}
