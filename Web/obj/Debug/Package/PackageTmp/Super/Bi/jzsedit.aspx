<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jzsedit.aspx.cs" Inherits="Web.Super.Bi.jzsedit" %>

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
                    支付方式
                </td>
                <td>
                    <input type="text" runat="server" name="zffs" id="txtzffs" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true" />
                </td>
            </tr>
            
            <tr>
               
                <td width="130" height="35" align="center">
                    转出期限
                </td>
                <td>
                    起
                    <input type="text" runat="server" name="jzsStartDate" id="txtStartDatejzs" maxlength="100" class="easyui-datebox"
                        style="width: 100px;" missingmessage="必须填写" data-options="required:true" />至
                    <input type="text" runat="server" name="jzsEndDate" id="txtEndDatejzs" maxlength="100" class="easyui-datebox"
                        style="width: 100px;" missingmessage="必须填写" data-options="required:true" />止
                </td>
            </tr>
            <tr>
               
                <td width="130" height="35" align="center">
                    交易单价</td>
                <td>
                    <input type="text" runat="server" name="jydj" id="txtjydj" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true" /></td>
            </tr>
            <tr>
               
                <td width="130" height="35" align="center">
                    成交金额
                </td>
                <td>
                    <input type="text" runat="server" name="cjje" id="txtcjje" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true" />
                </td>
            </tr>
             <tr>
               
                <td width="130" height="35" align="center">
                    合同编号
                </td>
                <td>
                    <input type="text" runat="server" name="htbh" id="txthtbh" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true" />
                </td>
            </tr>
            <tr>
               
                <td width="130" height="35" align="center">
                    备注
                </td>
                <td>
                    <input class="easyui-textbox" runat="server"  labelPosition="top" multiline="true"  name="beizhu" id="txtbeizhu" style="width:100%;height:180px" />
                </td>
            </tr>
            <tr>
               
                <td  height="35" align="center" colspan="2" style=" text-align:center;">
                    <asp:Button ID="Button1" runat="server" Text="添加" OnClick="Button1_Click" />
               
                 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        
       
    </form>
</body>
</html>
