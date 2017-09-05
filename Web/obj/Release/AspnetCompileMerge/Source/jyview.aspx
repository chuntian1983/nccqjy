<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="jyview.aspx.cs" Inherits="Web.jyview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <link href="../super/Styles/tbcss.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/BidDetail.js" type="text/javascript" language="javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="top list_wz">
        位置：<a href="Default.aspx">首页</a> >> 项目信息 <span id="lbl_Details_TitleName" style=" display:none;"></span>
    </div>
    <div class="list top">
        <div class="top">
            <br />
            <table border="0" class="table" cellpadding="0" cellspacing="0" width="625" align="center">
                <tr>
                    <td align="right" height="35" colspan="5">
                        项目编号：<asp:Label ID="lbxmbh" 
        runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" height="35">
                        产权名称
                    </td>
                    <td >
                        <asp:Label ID="lbjycp" 
        runat="server"></asp:Label>
                    </td>
                    <td>产权类型</td>
                    <td>
    <asp:Label ID="lbcqlx" runat="server" Font-Size="12px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td height="132" rowspan="3" width="35" align="center">
                        转<br />
                        出<br />
                        方<br />
                       
                    </td>
                    <td width="130" height="35" align="center">
                        出让方
                    </td>
                    <td colspan="3">
                       
                        <asp:Label ID="lbsyqr" 
        runat="server"></asp:Label>
                      
                    </td>
                </tr>
                <tr>
                    <td height="35" align="center">
                        法定代表人
                    </td>
                    <td width="169">
                        
                        <asp:Label ID="lbzcf" 
        runat="server"></asp:Label>
                        
                    </td>
                    <td width="123" align="center">
                        性质
                    </td>
                    <td width="168">
        <asp:Label 
            ID="lbzcxwpzjg" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td height="35" align="center">
                        注册资本</td>
                    <td width="169">
                        <asp:Label 
        ID="lbzcfdb" runat="server"></asp:Label>
                    </td>
                    <td width="123" align="center">
                        注册号<br />
                        （身份证号）
                    </td>
                    <td width="168">
    <asp:Label 
        ID="lbzcfsfz" runat="server" Font-Size="12px"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td height="35" align="center" rowspan="3">
                       受<br />
                       让<br />
                       方<br />
                    </td>
                    <td width="130" height="35" align="center">
                        受让方
                    </td>
                    <td colspan="3">
                         <asp:Label 
        ID="lbsrf" runat="server"></asp:Label>
                    </td>
                </tr>
                  <tr>
                    <td height="35" align="center">
                        法定代表人
                    </td>
                    <td width="169">
                        <asp:Label 
        ID="lbsrffddbr" runat="server"></asp:Label>
                    </td>
                    <td width="123" align="center">
                        性质
                    </td>
                    <td width="168">
                         <asp:Label 
        ID="lbgsxz" runat="server"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td height="35" align="center">
                        注册资本</td>
                    <td width="169">
    <asp:Label 
        ID="lbzczb" runat="server" ></asp:Label>
                    </td>
                    <td width="123" align="center">
                        注册号<br />
                        （身份证号）
                    </td>
                    <td width="168">
    <asp:Label 
        ID="lbsrfsfz" runat="server" Font-Size="12px"></asp:Label>
                    </td>
                </tr>
                <tr>
                <td rowspan="6">转<br />
                    出<br />
                    标<br />
                    的<br />
                    内<br />
                    容<br />
                    及<br />
                    方<br />
                    式</td>
                    <td height="135" width="130" align="center">
                        标&nbsp;&nbsp;的<br />
                        <br />
                        基&nbsp;&nbsp;本<br />
                        <br />
                        情&nbsp;&nbsp;况
                    </td>
                    <td colspan="3" valign="top">
                         <asp:Label 
            ID="lbbdjbqk" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        转出期限</td>
                    <td align="center" colspan="3">
                         <asp:Label ID="lbzcqx" 
            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        转出批准机构</td>
                    <td align="center">
                        &nbsp; 
        <asp:Label ID="lbqqjg" 
            runat="server" Font-Size="10px"></asp:Label>
                    </td>
                    <td>
                        规模</td>
                    <td>&nbsp; <asp:Label ID="lbguimo" 
            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        转出方式</td>
                    <td align="center">
                        &nbsp; <asp:Label 
            ID="lbzcfs" runat="server"></asp:Label>
                    </td>
                    <td>
                        交易方式</td>
                    <td>&nbsp; <asp:Label ID="lbjyfs" 
            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        交易单价</td>
                    <td align="center">
                        &nbsp; <asp:Label ID="lbjydj" 
            runat="server"></asp:Label>
                    </td>
                    <td>
                        成交金额</td>
                    <td>&nbsp; <asp:Label ID="lbcjje" 
            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        支付方式</td>
                    <td align="center">
                        &nbsp; <asp:Label 
            ID="lbhtqsrq" runat="server"></asp:Label>
                    </td>
                    <td>
                        合同编号</td>
                    <td>&nbsp; <asp:Label ID="lbhtbh" 
            runat="server"></asp:Label>
                    </td>
                </tr>
                </table>
        </div>
    </div>
</asp:Content>
