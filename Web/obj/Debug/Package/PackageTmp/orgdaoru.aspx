<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orgdaoru.aspx.cs" Inherits="Web.orgdaoru" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <style type="text/css">
       li{ line-height:35px;}
   </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <ul>
    <li>
        省级单位编号：<asp:TextBox ID="txtshengcode" runat="server"></asp:TextBox>
        省级单位名称：<asp:TextBox ID="txtshengname" runat="server"></asp:TextBox>
        <asp:Button ID="Button5"
            runat="server" Text="确定" onclick="Button5_Click" />
        </li>
        <li>省级单位名称：<asp:DropDownList ID="ddlsheng" runat="server" AutoPostBack="True" 
                onselectedindexchanged="ddlsheng_SelectedIndexChanged">
        </asp:DropDownList>市级单位导入：<asp:FileUpload ID="fileshi" runat="server" />
            <asp:Button
            ID="btnshi" runat="server" Text="导入" onclick="btnshi_Click" />
        </li>
        <li>市级单位名称：<asp:DropDownList ID="ddlshi" runat="server" AutoPostBack="True" 
                onselectedindexchanged="ddlshi_SelectedIndexChanged">
        </asp:DropDownList>县级单位导入：<asp:FileUpload ID="filexian" runat="server" />
            <asp:Button
            ID="btnxian" runat="server" Text="导入" onclick="btnxian_Click" />
        </li>
        <li>县级单位名称：<asp:DropDownList ID="ddlxian" runat="server" AutoPostBack="True" 
                onselectedindexchanged="ddlxian_SelectedIndexChanged">
        </asp:DropDownList>镇级单位导入：<asp:FileUpload ID="filezhen" runat="server" />
            <asp:Button
            ID="btnzhen" runat="server" Text="导入" onclick="btnzhen_Click" />
        </li>
        <li>镇级单位名称：<asp:DropDownList ID="ddlzhen" runat="server">
        </asp:DropDownList>村级单位导入：<asp:FileUpload ID="filecun" runat="server" />
            <asp:Button
            ID="btncun" runat="server" Text="导入" onclick="btncun_Click" />
        </li>
        <li>
            <span>说明：导入的txt文件编码格式必须是utf-8</span> ,升级单位录入应该去掉后面的000</li>
        </ul>
    </div>
    </form>
</body>
</html>
