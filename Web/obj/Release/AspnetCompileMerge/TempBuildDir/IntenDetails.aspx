<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="IntenDetails.aspx.cs" Inherits="Web.IntenDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="top list_wz">
        位置：<a href="Default.aspx">首页</a> >> <span id="lbl_Details_TypeName" runat="server">
        </span>>> <span id="lbl_Details_TitleName" runat="server"></span>
    </div>
    <table border="0" cellpadding="0" cellspacing="0" style="width: 1000px; background: #ffffff;
        margin: 0 auto">
        <tr>
            <td style="vertical-align: top">
                <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%; margin-top: 5px">
                    <tr>
                        <td style="vertical-align: top; border: 1px solid #f6f6f6; height: 280px">
                            <table cellpadding="0" cellspacing="0" style="width: 750px; margin: 0px auto">
                                <tr>
                                    <td style="text-align: center; height: 50px; border-bottom: 1px solid #d4ecfc" colspan="4">
                                        <span id="lblDetailsTypeName" runat="server" style="font-size: 16px;"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 5px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; width: 15%; height: 30px">
                                        联系人：
                                    </td>
                                    <td style="text-align: left; width: 35%">
                                        <span id="lblWebUser" runat="server"></span>
                                    </td>
                                    <td style="text-align: right; width: 15%">
                                        联系电话：
                                    </td>
                                    <td style="text-align: left; width: 35%">
                                        <span id="lblTel" runat="server"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 5px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; height: 30px">
                                        发布时间：
                                    </td>
                                    <td style="text-align: left">
                                        <span id="lblRegDate" runat="server"></span>
                                    </td>
                                    <td style="text-align: right; height: 30px">
                                        截止日期：
                                    </td>
                                    <td style="text-align: left">
                                        <span id="lblEndDte" runat="server"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 5px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 25px; text-align: right">
                                        信息标题：
                                    </td>
                                    <td style="height: 25px" colspan="3">
                                        <span id="lblTitle" runat="server"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="t2" style="height: 25px; text-align: center; border-bottom: 1px solid #d4ecfc" colspan="4">
                                        信息详细介绍
                                    </td>
                                </tr>
                                <tr>
                                    <td class="t4" style="height: 300px; text-align: left; vertical-align: top; padding: 5px"
                                        colspan="4">
                                        <span id="lblContent" runat="server"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 10px">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 5px">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
