<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fujianuploadsrf.aspx.cs" Inherits="Web.Super.Bi.fujianuploadsrf" %>

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
        <tr>
            <td height="35">
                上传附件名称：
               
                <asp:DropDownList ID="txtFK_UploadTypeIndicatorId" Width="350px" runat="server">
                </asp:DropDownList>

            </td>
        </tr>
        <tr>
            <td height="35">
                浏览上传附件：<asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                    注意：上传的附件格式后缀名只能为.jpg,.gif,.jpeg,.png,.pdf,其他格式暂不允许上传
            </td>
        </tr>
        <tr align="center">
            <td height="35">
                <asp:Button ID="Button1" runat="server" Text="上  传" onclick="Button1_Click" />
                
            </td>
        </tr>
        <tr align="center">
            <td style=" text-align:center;">
            已上传的附件<br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="500px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="名称">
                            
                            <ItemTemplate>
                                <a  target="_blank" href='../Scan/bsrffujian/<%#Eval("fid")%>/<%#Eval("fjpath") %>'><asp:Label ID="Label1" runat="server"><%#Eval("TypeIndicatorName")%></asp:Label></a> 
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" OnClientClick="return confirm('您确定删除这条信息吗？删除是无法恢复的。')" CommandArgument='<%# Eval("id") %>' onclick="Button2_Click" Text="删  除"  />
                            </ItemTemplate>
                        </asp:TemplateField>
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
                
            </td>
        </tr>
    </table>
    <input type="hidden" id="txtFK_LiceTranId" name="FK_LiceTranId" />
    <input type="hidden" id="txtId" name="Id" />
    </form>
</body>
</html>
