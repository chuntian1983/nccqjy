using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Data;
using System.IO;

namespace NCPEP.Bll
{
    public static class JsonHelper<T>
    { 
        /// <summary>
        /// 序列化
        /// </summary>
        /// <param name="t">类</param>
        /// <returns>string</returns>
        public static string JsonWriter(T t)
        {
            return JsonConvert.SerializeObject(t, new IsoDateTimeConverter());
        }
        /// <summary>
        /// 序列化
        /// </summary>
        /// <param name="obj">要序列化的对象</param>
        /// <returns>string</returns>
        public static string JsonWriter(object obj)
        {
            return JsonConvert.SerializeObject(obj);
        }       
        /// <summary>
        /// 将DataTable转化成JSON格式
        /// </summary>
        /// <param name="dt">DataTable</param>
        /// <returns>string</returns>
        public static string JsonDataTable(DataTable dt)
        {
            string dtName = "T";
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            try
            {
                using (JsonWriter jw = new JsonTextWriter(sw))
                {
                    JsonSerializer ser = new JsonSerializer();
                    jw.WriteStartObject();
                    jw.WritePropertyName(dtName);
                    jw.WriteStartArray();
                    foreach (DataRow dr in dt.Rows)
                    {
                        jw.WriteStartObject();
                        foreach (DataColumn dc in dt.Columns)
                        {
                            jw.WritePropertyName(dc.ColumnName);
                            if (dc.DataType.FullName == "System.DateTime")
                            {
                                if (string.IsNullOrEmpty(dr[dc].ToString().Trim()))
                                {
                                    ser.Serialize(jw, dr[dc].ToString());
                                }
                                else
                                {
                                    try
                                    {
                                        ser.Serialize(jw, DateTime.Parse(dr[dc].ToString()).ToString("yyyy-MM-dd HH:mm:ss"));
                                    }
                                    catch
                                    {
                                        ser.Serialize(jw, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                                    }
                                }
                            }
                            else
                            {
                                ser.Serialize(jw, dr[dc].ToString());
                            }
                        }
                        jw.WriteEndObject();
                    }
                    jw.WriteEndArray();
                    jw.WriteEndObject();
                    jw.Close();
                }
                return sb.ToString();
            }
            catch
            {
                throw;
            }
            finally
            {
                sw.Close();
            }
        }
        /// <summary>
        ///  将DataTable转化成JSON格式
        /// </summary>
        /// <param name="dt">DataTable</param>
        /// <param name="dtName">外部接收的数据名</param>
        /// <returns>string</returns>
        public static string JsonDataTable(DataTable dt, string dataName)
        {
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            try
            {
                using (JsonWriter jw = new JsonTextWriter(sw))
                {
                    JsonSerializer ser = new JsonSerializer();
                    jw.WriteStartObject();
                    jw.WritePropertyName(dataName);
                    jw.WriteStartArray();
                    foreach (DataRow dr in dt.Rows)
                    {
                        jw.WriteStartObject();
                        foreach (DataColumn dc in dt.Columns)
                        {
                            jw.WritePropertyName(dc.ColumnName);
                            if (dc.DataType.FullName == "System.DateTime")
                            {
                                if (string.IsNullOrEmpty(dr[dc].ToString().Trim()))
                                {
                                    ser.Serialize(jw, dr[dc].ToString());
                                }
                                else
                                {
                                    try
                                    {
                                        ser.Serialize(jw, DateTime.Parse(dr[dc].ToString()).ToString("yyyy-MM-dd HH:mm:ss"));
                                    }
                                    catch
                                    {
                                        ser.Serialize(jw, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                                    }
                                }
                            }
                            else
                            {
                                ser.Serialize(jw, dr[dc].ToString());
                            }
                        }
                        jw.WriteEndObject();
                    }
                    jw.WriteEndArray();
                    jw.WriteEndObject();

                    jw.Close();
                }
                return sb.ToString();
            }
            catch
            {
                throw;
            }
            finally
            {
                sw.Close();
            }
        }
    }
}
