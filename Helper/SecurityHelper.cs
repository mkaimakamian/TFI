using System;
using System.Text;
using System.Security.Cryptography;
using BE;
using System.Collections.Generic;

namespace Helper
{
    public static class SecurityHelper
    {
        /// <summary>
        /// Devuelve un hashing basado en MD5
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static String Encrypt(string value)
        {
            Byte[] bytes;
            StringBuilder sb = new StringBuilder();

            if (String.IsNullOrEmpty(value))
            {
                throw new ArgumentNullException("Valor no provisto para realizar hashing.");
            }

            bytes = Encoding.Default.GetBytes(value);
            bytes = MD5.Create().ComputeHash(bytes);

            for (int x = 0; x < bytes.Length; x++)
            {
                sb.Append(bytes[x].ToString("x2"));
            }
            return sb.ToString();
        }

        /// <summary>
        /// Evalúa si el parámetro seed es equivalente al valor hasheado.
        /// </summary>
        /// <param name="seed"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        public static bool IsEquivalent(string seed, string hashedValue)
        {
            string hash = SecurityHelper.Encrypt(seed);
            return hash == hashedValue;
        }


        /// <summary>
        /// Devuelve true si posee el permiso para la página; false en otro caso.
        /// </summary>
        /// <param name="user"></param>
        /// <param name="page"></param>
        /// <returns></returns>
        public static bool HasPermission(User user, string page)
        {
            bool found = false;
            page = page.Substring(1);
            for (int i = 0; i < user.Roles.Count && !found; ++i)
            {
                List<Permission> permissions = user.Roles[i].Permissions;

                for (int p = 0; p < permissions.Count && !found; ++p)
                {
                    found = permissions[p].UrlAccess == page;
                }
            }

            return found;
        }
    }
}
