<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jzsdysq.aspx.cs" Inherits="Web.Super.Bi.jzsdysq" %>

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
        <script>
            //            //鉴证修改页面添加按钮
            //            jQuery(function ($) {
            //                $("#btnadd").click(function () {

            //                            return $("#form1").form('validate');

            //                    });

            //                });
            //            });
           
        </script>
   
   
</head>
<body class="easyui-layout" style="overflow-y: hidden; background-color:White;" scroll="no" >
    <form id="form1" runat="server">
     
        
        <table border="0" class="table" cellpadding="0" cellspacing="0" width="625">
            
            
            
            
            <tr>
               
                <td width="130" height="35" align="center">
                    再次打印申请内容
                </td>
                <td>
                    <input class="easyui-textbox" runat="server"  labelPosition="top" multiline="true"  name="beizhu" id="txtbeizhu" style="width:100%;height:180px" data-options="required:true" />
                </td>
            </tr>
            <tr>
               
                <td  height="35" align="center" colspan="2" style=" text-align:center;">
                <asp:LinkButton ID="btnadd" icon="icon-ok" runat="server" 
                        CssClass="easyui-linkbutton" onclick="btnadd_Click" OnClientClick="return $('#form1').form('validate');" >添加</asp:LinkButton>
                 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        
       
    </form>
</body>
</html>
