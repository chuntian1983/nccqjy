using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using NPOI.HSSF.UserModel;
using Maticsoft.Common;
using Maticsoft.DBUtility;

namespace Web.Super.hzs
{
    public partial class daoru : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (fuhzs.HasFile)
            {
                string strf = Path.GetExtension(fuhzs.FileName);
            if (strf != ".xls")
            {
                MessageBox.Show(this, "请按照模板excel文件格式导入！谢谢！");
                return;
            }
            string filepath = Server.MapPath("../../upload/" + "dr" + Guid.NewGuid().ToString("N") + strf);
            fuhzs.SaveAs(filepath);
            //数据导入
            //  string pathcs = Server.MapPath("moban.xls");
            FileStream file = new FileStream(filepath, FileMode.Open, FileAccess.Read);
            HSSFWorkbook hssfworkbook = new HSSFWorkbook(file);
            #region 合作社导入
            HSSFSheet ws = (HSSFSheet)hssfworkbook.GetSheet("名单");
            DbHelperSQL.ExecuteSql("delete from t_hzs");
            
            
            for (int t = 3; t < ws.LastRowNum; t++)
            {
                NCPEP.Model.T_hzs model = new NCPEP.Model.T_hzs();
                try
                {
                    string str = ws.GetRow(t).GetCell(0).ToString();
                    model.xh =Convert.ToInt32( str);
                    
                }
                catch { }

                try
                {
                    string str = ws.GetRow(t).GetCell(1).ToString();
                    model.quyu = str;
                }
                catch { }

                try
                {
                    string str = ws.GetRow(t).GetCell(2).ToString();
                    model.mingcheng = str;
                }
                catch { }

                try
                {
                    string str = ws.GetRow(t).GetCell(3).ToString();
                    model.dizhi = str;
                }
                catch { }
                try
                {
                    string str = ws.GetRow(t).GetCell(4).ToString();
                    model.zhuceshijian = Convert.ToDateTime(str).ToString("yyyy-MM-dd");
                }
                catch { }
                try
                {
                    string str = ws.GetRow(t).GetCell(5).ToString();
                    
                    model.jingyingfanwei = str;
                }
                catch { }
                try
                {
                    string str = ws.GetRow(t).GetCell(6).ToString();
                    model.chengyuanshu = str;
                }
                catch { }

                try
                {
                    string str = ws.GetRow(t).GetCell(7).ToString();
                    model.nianshouru = str;
                }
                catch { }

                try
                {
                    string str = ws.GetRow(t).GetCell(8).ToString();
                    model.lishizhang = str;
                }
                catch { }

                try
                {
                    string str = ws.GetRow(t).GetCell(9).ToString();
                    model.lianxidianhua = str;
                }
                catch { }
                try
                {
                    string str = ws.GetRow(t).GetCell(10).ToString();
                    model.pinpaiqingkuang = str;
                }
                catch { }

                try
                {
                    string str = ws.GetRow(t).GetCell(11).ToString();
                    model.niandujibie = str;
                }
                catch { }
               
              
                try
                {
                    if (!string.IsNullOrEmpty(ws.GetRow(t).GetCell(0).ToString().Trim()))
                    {
                        NCPEP.Bll.T_hzs bll = new NCPEP.Bll.T_hzs();
                        bll.Add(model);
                    }
                }
                catch { MessageBox.Show(this, "第"+t+"条信息导入失败"); return; }

            }
            #endregion 
            }

            if (this.fujtnc.HasFile)
            {
                string strf = Path.GetExtension(fujtnc.FileName);
                if (strf != ".xls")
                {
                    MessageBox.Show(this, "请按照模板excel文件格式导入！谢谢！");
                    return;
                }
                string filepath = Server.MapPath("../../upload/" + "dr" + Guid.NewGuid().ToString("N") + strf);
                fujtnc.SaveAs(filepath);
                //数据导入
                //  string pathcs = Server.MapPath("moban.xls");
                FileStream file = new FileStream(filepath, FileMode.Open, FileAccess.Read);
                HSSFWorkbook hssfworkbook = new HSSFWorkbook(file);
                #region 家庭农场导入
                HSSFSheet ws = (HSSFSheet)hssfworkbook.GetSheet("名单");
                DbHelperSQL.ExecuteSql("delete from t_jtnc");


                for (int t = 3; t < ws.LastRowNum; t++)
                {
                    NCPEP.Model.T_jtnc model = new NCPEP.Model.T_jtnc();
                    try
                    {
                        string str = ws.GetRow(t).GetCell(0).ToString();
                        model.xh = Convert.ToInt32(str);

                    }
                    catch { }

                    try
                    {
                        string str = ws.GetRow(t).GetCell(1).ToString();
                        model.quyu = str;
                    }
                    catch { }

                    try
                    {
                        string str = ws.GetRow(t).GetCell(2).ToString();
                        model.mingcheng = str;
                    }
                    catch { }

                    try
                    {
                        string str = ws.GetRow(t).GetCell(3).ToString();
                        model.dizhi = str;
                    }
                    catch { }
                    try
                    {
                        string str = ws.GetRow(t).GetCell(4).ToString();
                        model.zhuceshijian = Convert.ToDateTime(str).ToString("yyyy-MM-dd");
                    }
                    catch { }
                    try
                    {
                        string str = ws.GetRow(t).GetCell(5).ToString();

                        model.jingyingfanwei = str;
                    }
                    catch { }
                    try
                    {
                        string str = ws.GetRow(t).GetCell(6).ToString();
                        model.chengyuanshu = str;
                    }
                    catch { }

                    try
                    {
                        string str = ws.GetRow(t).GetCell(7).ToString();
                        model.nianshouru = str;
                    }
                    catch { }

                    try
                    {
                        string str = ws.GetRow(t).GetCell(8).ToString();
                        model.lishizhang = str;
                    }
                    catch { }

                    try
                    {
                        string str = ws.GetRow(t).GetCell(9).ToString();
                        model.lianxidianhua = str;
                    }
                    catch { }
                    try
                    {
                        string str = ws.GetRow(t).GetCell(10).ToString();
                        model.pinpaiqingkuang = str;
                    }
                    catch { }

                    try
                    {
                        string str = ws.GetRow(t).GetCell(11).ToString();
                        model.niandujibie = str;
                    }
                    catch { }


                    try
                    {
                        if (!string.IsNullOrEmpty(ws.GetRow(t).GetCell(0).ToString().Trim()))
                        {
                            NCPEP.Bll.T_jtnc bll = new NCPEP.Bll.T_jtnc();
                            bll.Add(model);
                        }
                    }
                    catch { MessageBox.Show(this, "第" + t + "条信息导入失败"); return; }

                }
                #endregion
            }
        }
    }
}