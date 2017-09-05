<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="dzjj.aspx.cs" Inherits="Web.dzjj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      <div class="list_wz top">
        位置：<a href="../Default.aspx">首页</a> >> 电子竞价
    </div>
   <table width="1000" border="0" cellspacing="0" cellpadding="0" style="background-image:url(images/liuru.jpg);margin:auto auto">
        <tr>
        <td style="height:100px;text-align:right">
            
        </td>
        </tr>
        <tr>
        <td style="height:195px;vertical-align:top;text-align:left;">
            <table cellpadding="0" cellspacing="0" class="bdata" style="text-align:left;margin-left:5px;width:983px">
                <tr style="background:#ffc0d1">
                    <td style="width:250px">项目名称</td>
                    <td style="width:230px">出让方名称</td>
                    <td style="width:100px">联系人</td>
                    <td style="width:130px">联系电话</td>
                    <td style="width:150px">开标时间</td>
                    <td style="width:102px">倒计时</td>
                </tr>
                <%--<asp:Repeater ID="biddata" runat="server">
                    <ItemTemplate>
                    <tr id="bid<%#Eval("id")%>" onmouseover="this.style.background='#F6F6F6'" onmouseout="this.style.background='#FFFFFF'" onclick="window.open('TradeShow.aspx?id=<%#Eval("id")%>')" style="cursor:pointer">
                        <td><%#Eval("ubidname")%>&nbsp;</td>
                        <td><%#Eval("ucompany")%>&nbsp;</td>
                        <td><%#Eval("urealname")%>&nbsp;</td>
                        <td><%#Eval("utel")%>&nbsp;</td>
                        <td><%#Eval("BidSDate")%>&nbsp;</td>
                        <td>
                            <div id="countdown<%#Eval("id")%>" style="color:red"><%#Eval("countdown")%></div>
                        </td>
                    </tr>
                    </ItemTemplate>
                </asp:Repeater>--%>
            </table>
        </td>
        </tr>
        <tr>
        <td style=" height:10px"></td>
        </tr>
    </table>
</asp:Content>
