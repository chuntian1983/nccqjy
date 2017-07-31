using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Bll;
using NCPEP.Model;
using Maticsoft.Common;
using System.Data;
using System.IO;

namespace Web
{
    public partial class orgdaoru : System.Web.UI.Page
    {
        NCPEP.Bll.T_Organization bll = new NCPEP.Bll.T_Organization();
        NCPEP.Model.T_Organization model = new NCPEP.Model.T_Organization();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                dt = bll.GetList("UpOrgCode='00'").Tables[0];
                this.ddlsheng.DataSource = dt;
                this.ddlsheng.DataTextField = "orgshortname";
                this.ddlsheng.DataValueField = "orgcode";
                this.ddlsheng.DataBind();
                dt = new DataTable();
                dt = bll.GetList(" 1=1 order by level desc").Tables[0];
                if (dt.Rows.Count>0)
                {
                    string level =dt.Rows[0]["level"].ToString();
                    switch (level)
                    {
                        case "4":
                            dt = new DataTable();
                            dt = bll.GetList(" level='"+level+"'").Tables[0];
                            BindDll(this.ddlshi, dt);
                            break;
                        default:
                            break;
                    }

                }
            }
            
        }
        protected void BindDll(DropDownList ddl,DataTable dt)
        {
            ddl.DataSource = dt;
            ddl.DataTextField = "orgshortname";
            ddl.DataValueField = "orgcode";
            ddl.DataBind();
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            model.OrgCode = this.txtshengcode.Text.Trim();
            model.OrgName = this.txtshengname.Text.Trim();
            model.OrgShortName = this.txtshengname.Text.Trim();
            model.Seq = 1;
            model.Level = 5;
            model.UpOrgCode = "00";
            if (bll.Add(model))
            {
                MessageBox.Show(this, "省级导入成功");
            }

        }

        protected void btnshi_Click(object sender, EventArgs e)
        {
            Daoru(this.fileshi, 4, ddlsheng);
        }

        protected void ddlsheng_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlsheng.SelectedValue!="")
            {
                DataTable dt = bll.GetList("UpOrgCode='"+this.ddlsheng.SelectedValue+"'").Tables[0];
                if (dt.Rows.Count>0)
                {
                    this.ddlshi.DataSource = dt;
                    this.ddlshi.DataTextField = "orgshortname";
                    this.ddlshi.DataValueField = "orgcode";
                    this.ddlshi.DataBind();
                }
            }
        }
        /// <summary>
        /// 绑定单位
        /// </summary>
        /// <param name="ddl">当前ddl</param>
        /// <param name="ddlxj">下级ddl</param>
        protected void BindDdl(DropDownList ddl,DropDownList ddlxj)
        {
            if (ddl.SelectedValue != "")
            {
                DataTable dt = bll.GetList("UpOrgCode='" + ddl.SelectedValue + "'").Tables[0];
                if (dt.Rows.Count > 0)
                {
                    ddlxj.DataSource = dt;
                    ddlxj.DataTextField = "orgshortname";
                    ddlxj.DataValueField = "orgcode";
                    ddlxj.DataBind();
                }
            }
        }
        /// <summary>
        /// 导入组织单位
        /// </summary>
        /// <param name="strfile">上传控件</param>
        /// <param name="level">级别5省4市3县2镇1村0组</param>
        /// <param name="ddldw">上级单位</param>
        protected void Daoru(FileUpload strfile,int level,DropDownList ddldw)
        {
            if (strfile.HasFile)
            {
                string strtype = System.IO.Path.GetExtension(strfile.FileName).ToLower();//ToLower转化为小写
                if (strtype == ".txt")
                {
                    //获得上传文件的大小

                    int filesize = fileshi.PostedFile.ContentLength;

                    if (filesize > 1024 * 1024 * 2)
                    {
                        MessageBox.Show(this, "你上传的文件太大！");
                        return;
                    }
                    else
                    {

                        string strpath = Server.MapPath("~/upload");
                        if (!System.IO.Directory.Exists(strpath))
                        {
                            System.IO.Directory.CreateDirectory(strpath);
                        }
                        string strname = Guid.NewGuid().ToString("N") + System.IO.Path.GetExtension(fileshi.FileName);
                        strfile.SaveAs(strpath + "/" + strname);
                        //按行读取为字符串数组
                        string[] lines = System.IO.File.ReadAllLines(strpath + "/" + strname, System.Text.Encoding.UTF8);
                        foreach (string line in lines)
                        {
                            if (line != null && line != "")
                            {
                                string[] str = line.Split(' ');
                                if (str[0] != null && str[0] != "")
                                {
                                    model = new NCPEP.Model.T_Organization();
                                    model.OrgCode = str[0].Trim();
                                    model.OrgName = str[1].Trim();
                                    model.OrgShortName = str[1].Trim();
                                    switch (level.ToString())
                                    {
                                        case "5":
                                            model.OrgCode = model.OrgCode.Substring(0,2);
                                            break;
                                        case "4":
                                            model.OrgCode = model.OrgCode.Substring(0, 4);
                                            break;
                                        case "3":
                                            model.OrgCode = model.OrgCode.Substring(0, 6);
                                            break;
                                        case "2":
                                            model.OrgCode = model.OrgCode.Substring(0, 9);
                                            break;
                                        case "1":
                                            model.OrgName = str[2].Trim();
                                            model.OrgShortName = str[2].Trim();
                                            break;

                                    }
                                    
                                    model.Seq = 1;
                                    model.Level = level;
                                    model.UpOrgCode = ddldw.SelectedValue;
                                    if (bll.Add(model))
                                    {
                                        MessageBox.Show(this, "导入成功");
                                    }
                                }
                            }
                        }


                    }
                }
                else
                {
                    MessageBox.Show(this, "上传的附件格式后缀名只能为.txt,其他格式暂不允许上传");
                    return;

                }

            }
            else { MessageBox.Show(this, "请上传txt格式的导入文件"); return; }
        }
        protected void btnxian_Click(object sender, EventArgs e)
        {
            Daoru(this.filexian, 3, ddlshi);
        }

        protected void ddlshi_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDdl(this.ddlshi, this.ddlxian);
        }

        protected void btnzhen_Click(object sender, EventArgs e)
        {
            Daoru(this.filezhen, 2, ddlxian);
        }

        protected void ddlxian_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDdl(this.ddlxian, this.ddlzhen);
        }

        protected void btncun_Click(object sender, EventArgs e)
        {
            Daoru(this.filecun, 1, this.ddlzhen);
        }
    }
}