<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xmbeiansh.aspx.cs" Inherits="Web.Super.Bi.Xmbeiansh" %>

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
    <script src="../Scripts/Xmbeiansh.js" type="text/javascript" language="javascript"></script>
    
</head>
<body class="easyui-layout">
    <div region="center" title="项目备案信息审核列表" split="true" style="overflow: hidden; border: 0px;" border="false">
          <div id="tool">
        &nbsp;&nbsp;产权名称：
        <input type="text" id="tBidName" class="easyui-textbox" style="width: 300px;" required="true" />
        <a href="javascript:void(0)" id="btnQuery" class="easyui-linkbutton" iconcls="icon-search">
            搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: Blue;">(支持模糊查询)</span>
            </div>
              <div class="easyui-layout" style=" height:95%" >
        <table id="tdg"  >
        </table>
        </div>
    </div>
   
    <div id="newAdd" class="easyui-window" modal="false" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" style="width: 80%; height: 95%; padding: 5px;
        background: #fafafa;">
         <%-- <div id="newAdd" style="display: none; width: 100%; height: 100%; ">--%>
        <form id="forms" runat="server">
        <table border="0" class="table" cellpadding="0" cellspacing="0" width="625">
            <tr>
                <td align="right" height="35" colspan="4">
                    
                </td>
            </tr>
            <tr>
                <td align="center" height="35">
                    组织单位
                </td>
                <td colspan="3">
                    <select name="OrgCode" id="txtOrgCode" class="easyui-combotree" style="width: 150px;"
                        missingmessage="必须填写" data-options="required:true">
                    </select>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    产权名称
                </td>
                <td colspan="3">
                    <input type="text" name="BidName" id="txtBidName" maxlength="100" class="easyui-textbox"
                        style="width: 350px;" missingmessage="必须填写" data-options="required:true" />
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    产权类型
                </td>
                <td>
                    <select name="Properties" id="txtProperties" class="easyui-combotree" style="width: 150px;">
                    </select>
                </td>
                <td align="center">
                    产权权属
                </td>
                <td>
                    <select name="Ownership" id="txtOwnership" class="easyui-combobox" style="width: 150px;">
                        <option value="个人所有">个人所有</option>
                        <option value="集体所有">集体所有</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    标的规模
                </td>
                <td colspan="3">
                    <input type="text" name="guimo" id="txtguimo" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true" />
                        <select id="comgmdw" class="easyui-combobox" name="gmdw" style="width:80px;">
    <option value="亩" selected="selected">亩</option>
    <option value="平方米">平方米</option>
    <option value="台">台</option>
    
</select>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    出让方</td>
                <td colspan="3">
                    <input type="text" name="crf" id="txtcrf" maxlength="100" class="easyui-textbox"
                        style="width: 350px;" missingmessage="必须填写" data-options="required:true" /></td>
            </tr>
            <tr>
                <td height="35" align="center">
                    出让方性质</td>
                <td colspan="3">
                    <input type="text" name="crfxz" id="txtcrfxz" maxlength="100" class="easyui-textbox"
                        style="width: 350px;" missingmessage="必须填写" data-options="required:true" /></td>
            </tr>
            <tr>
                <td height="35" align="center">
                    受让方</td>
                <td colspan="3">
                    <input type="text" name="srf" id="txtsrf" maxlength="100" class="easyui-textbox"
                        style="width: 350px;" missingmessage="必须填写" data-options="required:true" /></td>
            </tr>
            <tr>
                <td height="35" align="center">
                    受让方性质</td>
                <td colspan="3">
                    <input type="text" name="srfxz" id="txtsrfxz" maxlength="100" class="easyui-textbox"
                        style="width: 350px;" missingmessage="必须填写" data-options="required:true" /></td>
            </tr>
            <tr>
                <td height="35" align="center">
                    交易方式</td>
                <td colspan="3">
                    <select name="StandardMode" id="txtStandardMode" class="easyui-combotree" style="width: 150px;">
                    </select></td>
            </tr>
            <tr>
                <td height="35" align="center">
                    合同起始日期
                </td>
                <td colspan="3">
                    起
                    <input type="text" name="StartDate" id="txtStartDate" maxlength="100" class="easyui-datebox"
                        style="width: 100px;" missingmessage="必须填写" data-options="required:true" />至
                    <input type="text" name="EndDate" id="txtEndDate" maxlength="100" class="easyui-datebox"
                        style="width: 100px;" missingmessage="必须填写" data-options="required:true" />止
                </td>
            </tr>
            
            <tr>
                <td height="35" align="center">
                    成交单价</td>
                <td colspan="3">
                    <input type="text" name="danjia" id="txtdanjia" maxlength="100" class="easyui-textbox"
                        style="width: 350px;" missingmessage="必须填写" data-options="required:true" /></td>
            </tr>
            
            <tr>
                <td height="35" align="center">
                    成交总价</td>
                <td colspan="3">
                   <input type="text" name="zongjia" id="txtzongjia" maxlength="100" class="easyui-textbox"
                        style="width: 350px;" missingmessage="必须填写" data-options="required:true" /></td>
            </tr>
            
            <tr>
                <td height="35" align="center">
                    支付方式</td>
                <td colspan="3">
                    <input type="text" name="zffs" id="txtzffs" maxlength="100" class="easyui-textbox"
                        style="width: 350px;" missingmessage="必须填写" data-options="required:true" /></td>
            </tr>
            
            <tr>
                <td height="35" align="center">
                    备注</td>
                <td colspan="3">
                    <input type="text" name="beizhu" id="txtbeizhu" maxlength="100" class="easyui-textbox"
                        style="width: 350px;" missingmessage="必须填写" data-options="required:true" /></td>
            </tr>
            
            <tr align="center">
                <td colspan="4" height="35">
                    <a id="btnAdd" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">添加</a>
                    <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)"
                        style="display: none">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="btnCancel"
                            class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
                </td>
            </tr>
        </table>
      
        <input type="hidden" id="txtAdmissibility" name="Admissibility" />
        <input type="hidden" id="txtId" name="Id" />
        <input type="hidden" id="txtLost" name="Lost" />
        <input type="hidden" id="txtCancel" name="Cancel" />
        <input type="hidden" id="txtChange" name="Change" />
        <input type="hidden" id="txtReturnStatus" name="ReturnStatus" />
        <input type="hidden" id="txtDepaStatus" name="DepaStatus" />
        <input type="hidden" id="txtAreContract" name="AreContract" />
        <input type="hidden" id="txtNoAssurance" name="NoAssurance" />
       
        <input type="hidden" id="txtContractNo" name="ContractNo" />
        <input type="hidden" id="txtContractDate" name="ContractDate" />
        </form>
    </div>
    <div id="ScanImg" title="附件查看" class="easyui-window" modal="true" collapsible="false"
        minimizable="false" maximizable="false" icon="icon-save" style="width: 700px;
        height: 480px; padding: 5px; background: #fafafa;">
        <iframe id="showScanImg" scrolling="no" frameborder="0" style="width: 100%; height: 100%;">
        </iframe>
    </div>
    <div id="addCheck" title="审核意见" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" modal="true" closable="true" style="width: 400px;
        height: 160px; padding: 5px; background: #fafafa;">
        <table>
            <tr>
                <td>
                    <textarea id="txtSay" name="Say" style="width: 350px; height: 70px;" class="easyui-validatebox"
                        missingmessage="必须填写" required="true"></textarea>
                </td>
            </tr>
            <tr align="center">
                <td>
                    <a href="javascript:void(0)" id="btnCheckAdd" class="easyui-linkbutton" icon="icon-ok">
                        审核</a>
                </td>
            </tr>
        </table>
    </div>
    <div id="ScanFile" title="附件信息" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" modal="true" style="width: 650px; height: 90%;
        padding: 5px; background: #fafafa;">
        <iframe id="ScanUpload" scrolling="no" frameborder="0" style="width: 100%; height: 100%;">
        </iframe>
    </div>
</body>
</html>
