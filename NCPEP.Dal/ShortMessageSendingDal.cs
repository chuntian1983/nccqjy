/**
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-5-3 09:22:54   N/A      wanghao
*
* Copyright (c) 2016 wanghao Corporation. All rights reserved.
*┌───────────────────────────────────┐
*│　此代码信息为机密信息             │
*│  未经书面同意禁止向第三方披露     │
*│　设计研发：wanghao　　　　　　　　 │
*└───────────────────────────────────┘
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using NCPEP.Model;
using NCPEP.Com.Util;
using System.Net;
using System.IO;
using System.Security.Cryptography;

namespace NCPEP.Dal
{
    public class ShortMessageSendingDal
    {
        private dynamic db = null;

        public ShortMessageSendingDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool Create(ShortMessageSending model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_ShortMessageSending(");
                strSql.Append("[Uid],[Key])");
                strSql.Append(" values (");
                strSql.Append("@Uid,@Key)");
                if (db.ExecuteNonQuery(strSql.ToString(), GetSqlParameter(model)) > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch { throw; }
        }
        //
        public bool Update(ShortMessageSending model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_ShortMessageSending set ");
                strSql.Append("[Uid]=@Uid,");
                strSql.Append("[Key]=@Key");
                if (db.ExecuteNonQuery(strSql.ToString(), GetSqlParameter(model)) > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch { throw; }
        }
        private string url = "http://utf8.sms.webchinese.cn/?";
        public string SendOutWebChinese(string tel, string mess)
        {
            dynamic sms = GetModel();
            string strRet = "短信发送失败";
            string[] strArray = new string[] { sms.Uid, sms.Key, tel, mess };
            url += string.Format("Uid={0}&Key={1}&smsMob={2}&smsText={3}", strArray);
            try
            {
                HttpWebRequest hr = (HttpWebRequest)WebRequest.Create(url);
                hr.UserAgent = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)";
                hr.Method = "GET";
                hr.Timeout = 30 * 60 * 1000;
                WebResponse hs = hr.GetResponse();
                Stream sr = hs.GetResponseStream();
                StreamReader ser = new StreamReader(sr, Encoding.Default);
                strRet = ser.ReadToEnd();
                int rm = 0;
                try { rm = Convert.ToInt32(strRet); }
                catch { }
                if (rm > 0)
                {
                    strRet = "短信发送成功";
                    return strRet;
                }
                else
                {
                    switch (rm)
                    {
                        #region 短信返回参数说明
                        case -1:
                            strRet = "没有该用户账户";
                            break;
                        case -2:
                            strRet = "接口密钥不正确,不是账户登陆密码";
                            break;
                        case -21:
                            strRet = "MD5接口密钥加密不正确";
                            break;
                        case -3:
                            strRet = "短信数量不足";
                            break;
                        case -11:
                            strRet = "该用户被禁用";
                            break;
                        case -14:
                            strRet = "短信内容出现非法字符";
                            break;
                        case -4:
                            strRet = "手机号格式不正确";
                            break;
                        case -41:
                            strRet = "手机号码为空";
                            break;
                        case -42:
                            strRet = "短信内容为空";
                            break;
                        case -51:
                            strRet = "短信签名格式不正确,接口签名格式为：【签名内容】";
                            break;
                        case -6:
                            strRet = "IP限制";
                            break;
                        #endregion
                    }
                }
            }
            catch
            {
                return strRet;
            }
            return strRet;
        }

        public static string Md5Encrypt(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            var data = Encoding.UTF8.GetBytes(str);
            var encs = md5.ComputeHash(data);
            return BitConverter.ToString(encs).Replace("-", "");
        }

        private string sendurl = "http://api.sms.cn/mt/?";
        public string SendOutSMS(string tel, string mess)
        {
            dynamic sms = GetModel();
            string strRet = "短信发送失败";
            string pwd = Md5Encrypt(sms.Key + sms.Uid);
            string[] strArray = new string[] { sms.Uid, pwd, tel, mess };
            sendurl += string.Format("uid={0}&pwd={1}&mobile={2}&content={3}", strArray);
            try
            {
                HttpWebRequest hr = (HttpWebRequest)WebRequest.Create(url);
                hr.UserAgent = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)";
                hr.Method = "GET";
                hr.Timeout = 30 * 60 * 1000;
                WebResponse hs = hr.GetResponse();
                Stream sr = hs.GetResponseStream();
                StreamReader ser = new StreamReader(sr, Encoding.Default);
                strRet = ser.ReadToEnd();
                int rm = 0;
                try { rm = Convert.ToInt32(strRet); }
                catch { }
                if (rm > 0)
                {
                    strRet = "短信发送成功数量为[" + rm.ToString() + "]条";
                    return strRet;
                }
                else
                {
                    switch (rm)
                    {
                        #region 短信返回参数说明
                        case -1:
                            strRet = "没有该用户账户";
                            break;
                        case -2:
                            strRet = "接口密钥不正确,不是账户登陆密码";
                            break;
                        case -21:
                            strRet = "MD5接口密钥加密不正确";
                            break;
                        case -3:
                            strRet = "短信数量不足";
                            break;
                        case -11:
                            strRet = "该用户被禁用";
                            break;
                        case -14:
                            strRet = "短信内容出现非法字符";
                            break;
                        case -4:
                            strRet = "手机号格式不正确";
                            break;
                        case -41:
                            strRet = "手机号码为空";
                            break;
                        case -42:
                            strRet = "短信内容为空";
                            break;
                        case -51:
                            strRet = "短信签名格式不正确,接口签名格式为：【签名内容】";
                            break;
                        case -6:
                            strRet = "IP限制";
                            break;
                        #endregion
                    }
                }
            }
            catch
            {
                return strRet;
            }
            return strRet;
        }
        public dynamic GetModel()
        {
            try
            {
                dynamic model = null;
                StringBuilder strSql = new StringBuilder();
                strSql.Append(" select [Uid],[Key] FROM T_ShortMessageSending ");
                using (dynamic read = db.ExecuteReader(strSql.ToString()))
                {
                    if (read.Read())
                    {
                        model = new ShortMessageSending();
                        model.Uid = read["Uid"].ToString();
                        model.Key = read["Key"].ToString();
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }

        private SqlParameter[] GetSqlParameter(dynamic model)
        {
            SqlParameter[] parameters = {
				new SqlParameter("@Uid", SqlDbType.NVarChar,150),
					new SqlParameter("@Key", SqlDbType.VarChar,300)};
            parameters[0].Value = model.Uid;
            parameters[1].Value = model.Key;
            return parameters;
        }
    }
}
