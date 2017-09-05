<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Org.aspx.cs" Inherits="Web.Super.Sys.Org" %>

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
    <script src="../Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript" language="javascript"></script>
  
   
    <script src="../Scripts/Org.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout" scroll="no">
    <div region="west" title="组织单位信息列表" split="true" style="width: 180px;" id="west">
        <ul id="orgTree" class="easyui-tree">
        </ul>
    </div>
    <div region="center" title="组织单位详细信息">
        <div class="easyui-panel" style="padding: 5px;">
           <a href="javascript:void(0)" id="btnUp" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cut'">
                    修改</a> <a href="javascript:void(0)" id="btnDel" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-no'">
                        删除</a> <a href="javascript:void(0)" id="btnLower" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-filter'">
                            增加下级</a>
                             <a href="javascript:void(0)" id="btnAdd" style="display:none;" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">
                保存</a> 
        </div>
        <form id="forms" runat="server">
        <br />
        <table width="600px" border="1" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="80" align="center" bgcolor="#F1F8FC" height="40">
                    单位级别
                </td>
                <td colspan="5">
                    <select id="txtLevel" name="Level" class="txt" onmousedown="this.blur();">            
                        <option value="6">部级</option>
                        <option value="5">省级</option>
                        <option value="4">市地级</option>
                        <option value="3">区县级</option>
                        <option value="2">乡镇级</option>
                        <option value="1">村级</option>
                        <option value="0">组级</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F1F8FC" height="40">
                    上级单位代码
                </td>
                <td colspan="5">
                    <input id="txtUpOrgCode" name="UpOrgCode" style="width: 300px; background-color: #f5f5f5; color: #910000;
                        font-weight: bolder;" onfocus="this.blur();" class="txt" type="text" />
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F1F8FC" height="40">
                    单位简称
                </td>
                <td colspan="5">
                    <input id="txtOrgShortName" name ="OrgShortName" class="txt" type="text" onblur ="onCombinClick();" /><span style="color: Red;">**</span>
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F1F8FC" height="40">
                    单位全称
                </td>
                <td colspan="5">
                    <input id="txtOrgName" name="OrgName" class="txt" type="text" style="width: 430px; background-color: #f5f5f5; color: #910000;
                        font-weight: bolder;" />
                    <span style="color: Red;">**</span>
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F1F8FC" height="40">
                    省级代码
                </td>
                <td width="76">
                    <input id="txtShengCode" name="ShengCode" style="width: 40px" class="txt" type="text" onfocus="this.blur();" />
                </td>
                <td width="56" align="center" bgcolor="#F1F8FC">
                    地市代码
                </td>
                <td>
                    <input id="txtShiCode" name="ShiCode" style="width: 40px" class="txt" type="text" onfocus="this.blur();" />
                </td>
                <td width="70" align="center" bgcolor="#F1F8FC">
                    区县代码
                </td>
                <td width="101">
                    <input id="txtXianCode" name="XianCode" style="width: 40px" class="txt" type="text" onfocus="this.blur();" />
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F1F8FC" height="40">
                    乡镇代码
                </td>
                <td>
                    <input id="txtXiangCode" name="XiangCode" style="width: 40px" class="txt" type="text" onfocus="this.blur();" />
                </td>
                <td align="center" bgcolor="#F1F8FC">
                    村级代码
                </td>
                <td>
                    <input id="txtCunCode" name="CunCode" style="width: 40px" class="txt" type="text" onfocus="this.blur();" />
                </td>
                <td align="center" bgcolor="#F1F8FC">
                    组队代码
                </td>
                <td>
                    <input id="txtZuCode" name="ZuCode" style="width: 40px" class="txt" type="text" onfocus="this.blur();" />
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F1F8FC" height="40">
                    单位编码
                </td>
                <td colspan="5">
                    <input id="txtOrgCode" name="OrgCode" class="txt" type="text" style="width: 300px; background-color: #f5f5f5; color: #910000;
                        font-weight: bolder;"/>
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F1F8FC" height="40">
                    单位序号
                </td>
                <td colspan="5">
                    <input id="txtSeq" name="Seq" style="width: 33px" class="txt" type="text" />
                </td>
            </tr>
        </table>
        </form>
    </div>
</body>
</html>