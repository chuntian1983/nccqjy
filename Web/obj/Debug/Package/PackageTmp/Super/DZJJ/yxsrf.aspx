﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yxsrf.aspx.cs" Inherits="Web.Super.DZJJ.yxsrf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/tbcss.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/jquery.easyui.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript"
        language="javascript"></script>
   
   
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
    <form id="forms" runat="server">
    <table width="100%" border="0px" cellpadding="0" cellspacing="0" style="position: absolute;
        padding-left: 30px; padding-top: 10px;">
       
        <tr align="center">
            <td style=" text-align:center;">
            受让方信息<br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="600px" 
                    onrowdatabound="GridView1_RowDataBound">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="组织单位">
                            <ItemTemplate>
                                <asp:Label ID="lborg" runat="server" Text='<%# Bind("OrgCode") %>'></asp:Label>
                            </ItemTemplate>
                          
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名">
                            
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"><%#Eval("name")%></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="经济类型">
                            <ItemTemplate>
                                <asp:Label ID="lbjjlx" runat="server" Text='<%# Bind("LiceTranType") %>'></asp:Label>
                            </ItemTemplate>
                           
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="联系人" DataField="Contact" />
                        <asp:BoundField DataField="tel" HeaderText="联系电话" />
                        <asp:BoundField DataField="Capital" HeaderText="注册资本" />
                        <asp:BoundField DataField="Owner" HeaderText="法人代表" />
                        
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    <input type="hidden" id="txtFK_LiceTranId" name="FK_LiceTranId" />
    <input type="hidden" id="txtId" name="Id" />
    </form>
</body>
</html>