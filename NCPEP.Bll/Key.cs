using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Bll
{
    public class Key 
    {
        /// <summary>
        /// 加密
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string Encryption(string str)
        {
            Byte[] bye = Encoding.UTF8.GetBytes(str);
            return Convert.ToBase64String(bye);
        }
        /// <summary>
        /// 解密
        /// </summary>
        /// <param name="srt"></param>
        /// <returns></returns>
        public static string Decryption(string srt)
        {
            Byte[] Bye = Convert.FromBase64String(srt);
            return Encoding.UTF8.GetString(Bye);
        }
    }
}
