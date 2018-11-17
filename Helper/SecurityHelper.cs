using System;
using System.Text;
using System.Security.Cryptography;
using BE;
using System.Collections.Generic;
using System.IO;
using System.ComponentModel;

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
            int idx = page.IndexOf("/");
            if (idx > -1) page = page.Substring(idx+1);
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

        public static string REncrypt(int seed)
        {
            return REncrypt(seed.ToString());
        }

        public static string REncrypt(string seed)
        {
            CipherMode CyphMode = CipherMode.ECB;
            string key = "KaimakamianCarrau";

            TripleDESCryptoServiceProvider Des = new TripleDESCryptoServiceProvider();
            byte[] InputbyteArray = Encoding.Default.GetBytes(seed);
            MD5CryptoServiceProvider hashMD5 = new MD5CryptoServiceProvider();
            Des.Key = hashMD5.ComputeHash(Encoding.Default.GetBytes(key));
            Des.Mode = CyphMode;
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, Des.CreateEncryptor(), CryptoStreamMode.Write);
            cs.Write(InputbyteArray, 0, InputbyteArray.Length);
            cs.FlushFinalBlock();
            StringBuilder ret = new StringBuilder();
            byte[] b = ms.ToArray();
            ms.Close();
            int I;
            for (I = 0; I <= b.GetUpperBound(0); I++)
                ret.AppendFormat("{0:X2}", b[I]);
            return ret.ToString();
        }

        public static string RDesencrypt(int seed)
        {
            return RDesencrypt(seed.ToString());

        }

        public static string RDesencrypt(string seed)
        {
            string key = "KaimakamianCarrau";

            if (String.IsNullOrEmpty(seed)) return "";
            CipherMode CyphMode = CipherMode.ECB;

            TripleDESCryptoServiceProvider Des = new TripleDESCryptoServiceProvider();
            byte[] InputbyteArray = new byte[System.Convert.ToInt32(seed.Length / (double)2 - 1) + 1];
            MD5CryptoServiceProvider hashMD5 = new MD5CryptoServiceProvider();
            Des.Key = hashMD5.ComputeHash(Encoding.Default.GetBytes(key));
            Des.Mode = CyphMode;
            int X;
            for (X = 0; X <= InputbyteArray.Length - 1; X++)
            {
                Int32 IJ = (Convert.ToInt32(seed.Substring(X * 2, 2), 16));
                ByteConverter BT = new ByteConverter();
                InputbyteArray[X] = new byte();
                InputbyteArray[X] = System.Convert.ToByte(BT.ConvertTo(IJ, typeof(byte)));
            }
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, Des.CreateDecryptor(), CryptoStreamMode.Write);
            cs.Write(InputbyteArray, 0, InputbyteArray.Length);
            cs.FlushFinalBlock();
            StringBuilder ret = new StringBuilder();
            byte[] B = ms.ToArray();
            ms.Close();
            int I;
            for (I = 0; I <= B.GetUpperBound(0); I++)
                ret.Append(Convert.ToChar(B[I]));
            return ret.ToString();
        }
    }
}
