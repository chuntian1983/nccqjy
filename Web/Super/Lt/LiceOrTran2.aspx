﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LiceOrTran2.aspx.cs" Inherits="Web.Super.Lt.LiceOrTran2" %>

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
    <script type="text/javascript" language="javascript">
        function msgShow(title, msgString, msgType) {
            $.messager.alert(title, msgString, msgType);
        };

        function slide(_title, _msg) {
            $.messager.show({
                title: _title,
                msg: _msg,
                timeout: 3500,
                showType: 'slide'
            });
        };
        jQuery(function ($) {
            GridView();
            $('#newAdd').window('close');
            $('#ScanImg').window('close');
            $('#addCheck').window('close');
            $('#ScanFile').window('close');
        });
        jQuery(function ($) {
            $("#txtOrgCode").combotree({
                url: '../Ashx/Org.ashx?action=tree',
                lines: true,
                required: true,
                onSelect: function (rec) { rec.id; }
            });

        });
        jQuery(function ($) {
            $('#txtMemberTypeId').combotree({
                url: '../Ashx/MemberType.ashx?action=combo',
                required: true,
                onSelect: function (rec) {
                    showOperDiv(rec.id);
                }
            });
        });
        function showOperDiv(p) {
            if (3 == p) {
                $("#show3").css("display", "block");
            } else {
                $("#show3").css("display", "none");
            }
            
        };
        
//        jQuery(function ($) {
//            $('#txtLiceTranType').combotree({
//                url: '../Ashx/LiceOrTran.ashx?action=t',
//                required: true,
//                onSelect: function (rec) {
//                    var va = rec.id;
//                    if (va == "2") {
//                        $('#trjingbiao').show();
//                    } else { $('#trjingbiao').css("display", "none"); }

//                }
//            });
//        });
        ////2017-8-2
        //jQuery(function ($) {
        //    $("#txtLiceTranType").onSelect(function () {
        //        alert('3');
        //        var t = $('#txtLiceTranType').combotree('tree'); // get the tree object
        //        var n = t.tree('getSelected'); 	// get selected node
        //        alert(n.text);
        //        // 这里可以写些验证代码
        //    });
        //});
        function OnltCheckGridView(p) {
            $('#ltCheck').datagrid({
                nowrap: true,
                striped: true,
                url: '../Ashx/LiTrCheck.ashx?' + $.param({ action: "paging", LiceTranId: p }),
                remoteSort: false,
                sortName: 'Id',
                singleSelect: true,
                sortOrder: 'desc',
                fit: true,
                fitColumns: true,
                rownumbers: true,
                columns: [[
        { title: '编号', field: 'Id', width: 30, align: 'left', sortable: true },
{ field: 'Reviewer', title: '审核人', width: 60, align: 'left', sortable: true },
{ field: 'AuditSay', title: '审核意见', width: 150, align: 'left', sortable: true },
{ field: 'AuditDate', title: '审核时间', width: 80, align: 'left', sortable: true }
]]
            });
            var p = $('#ltCheck').datagrid('getPager');
            $(p).pagination({
                onBeforeRefresh: function () {
                }
            });
        };
        function OnltScanGridView(par) {
            $('#ltScan').datagrid({
                nowrap: true,
                striped: true,
                url: '../Ashx/LiTrScan.ashx?' + $.param({ action: "paging", LiceTranId: par }),
                remoteSort: false,
                sortName: 'Id',
                singleSelect: true,
                sortOrder: 'desc',
                fit: true,
                fitColumns: true,
                rownumbers: true,
                onDblClickRow: function (rowIndex, rowData) {
                    $('#ScanImg').window('open');
                    $('#ScanImg').window({ title: rowData.FK_UploadTypeIndicatorId });
                    //$("#showScanImg").attr("src", "../Scan/lt/" + rowData.FK_LiceTranId + "/" + rowData.ScanUrl);
                    $("#showScanImg").attr("src", "fujianview.aspx?id=" + rowData.FK_LiceTranId + "|" + rowData.ScanUrl);
                },
                columns: [[
        { title: '编号', field: 'Id', width: 30, align: 'left', sortable: true },
        { field: 'FK_LiceTranId', title: '附件编号', width: 40, align: 'left', sortable: true, hidden: true },
{ field: 'FK_UploadTypeIndicatorId', title: '附件名称', width: 150, align: 'left', sortable: true },
{ field: 'ScanUrl', title: '文件路径', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'UploadDate', title: '上传时间', width: 80, align: 'left', sortable: true }
]],
                toolbar: [{
                    id: 'btnadd',
                    text: '删除',
                    iconCls: 'icon-no',
                    handler: function () {
                        var rows = $('#ltScan').datagrid('getSelections');
                        if (rows.length > 0) {

                            $.messager.confirm('询问提示', '您确定要删除选中的编号为 [' + rows[0].Id + '] 的信息吗？', function (data) {
                                if (data) {
                                    $.get("../ashx/LiTrScan.ashx?action=del", { Id: rows[0].Id }, function (data) {
                                        slide("提示", data);
                                        $('#ltScan').datagrid('reload');
                                        $('#ltScan').datagrid('clearSelections');
                                    }, "text");
                                }
                            });
                        }
                        else {
                            msgShow("提示", "您还没有选中要删除的列信息？", "question");
                        }
                    }
                }, '-'],
                pagination: false
            });
            var p = $('#ltScan').datagrid('getPager');
            $(p).pagination({
                onBeforeRefresh: function () {
                }
            });
        };
        function GridView() {
            $('#tdg').datagrid({
                nowrap: true,
                striped: true,
                url: '../Ashx/LiceOrTran.ashx?' + $.param({ action: "paging", LiceTranId: '2' }),
                remoteSort: false,
                sortName: 'Id',
                singleSelect: true,
                sortOrder: 'desc',
                fit: true,
                fitColumns: false,
                rownumbers: true,
                onDblClickRow: function (rowIndex, rowData) {
                    OnltCheckGridView(rowData.Id);
                    OnltScanGridView(rowData.Id);
                },
                frozenColumns: [[
{ title: '编号', field: 'Id', width: 30, align: 'left', sortable: true },
{ field: 'OrgCode', title: '组织单位', width: 80, align: 'left', sortable: true },
{ field: 'LiceTranType', title: '受让方', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.LiceTranType == 1 ? "出让方" : "意向受让方"; } }
]],
                columns: [[
{ field: 'AuditType', title: '审核状态', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.AuditType == 0 ? "<span style='color:red;'>等待审核</span>" : "<span style='color:blue;'>审核通过</span>"; } },
{ field: 'string', title: '上传', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) { return row.AuditType == 1 ? "<span style='color:blue;'>双击查看附件</span>" : "<span style='color:blue;' onclick='OnUploadFile(" + row.Id + ");'>上传扫描件</span>"; } },
{ field: 'MemberTypeId', title: '类型', width: 80, align: 'left', sortable: true },
{ field: 'Name', title: '姓名', width: 80, align: 'left', sortable: true },
{ field: 'jbyhm', title: '竞标用户名', width: 80, align: 'left', sortable: true },
{ field: 'Addr', title: '住址', width: 150, align: 'left', sortable: true },
{ field: 'Contact', title: '联系人', width: 80, align: 'left', sortable: true },
{ field: 'Corporate', title: '法人代表', width: 80, align: 'left', sortable: true },
{ field: 'IDCard', title: '身份证号码', width: 150, align: 'left', sortable: true },
{ field: 'Tel', title: '电话', width: 100, align: 'left', sortable: true },
{ field: 'OrganizationCode', title: '组织机构代码', width: 150, align: 'left', sortable: true },
{ field: 'Capital', title: '注册资本', width: 80, align: 'left', sortable: true }
]],
                pagination: true,
                pageSize: 10
            });
            var p = $('#tdg').datagrid('getPager');
            $(p).pagination({
                onBeforeRefresh: function () {
                }
            });
        };
        
        function OnSelectClick(p) {
            var url = '../Ashx/LiceOrTran.ashx?' + $.param({ action: "paging", LiceTranType: p, Name: $("#txt_Name").textbox("getValue") });
            $('#tdg').datagrid({ url: url });
            $('#tdg').datagrid('reload');
        };
        jQuery(function ($) {
            $("#btnAdd").click(function () {
                OnEmptyTextClick();
                $('#newAdd').window({ title: "添加受让方信息" });
                $('#newAdd').window('open');
                $("#btnCreate").show();
                $("#btnEdit").hide();
            });
        });
        jQuery(function ($) {
            $("#btnDel").click(function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    var rowzt = rows[0].AuditType;
                    if (rowzt == 1) {
                        msgShow("提示", "审核通过的信息不能删除！", "warning");
                        return;

                    }
                    $.messager.confirm('询问提示', '您确定要删除选中的编号为 [' + rows[0].Id + '] 的信息吗？', function (data) {
                        if (data) {
                            $.get("../Ashx/LiceOrTran.ashx?action=del", { id: rows[0].Id }, function (data) {
                                slide("提示", data);
                                $('#tdg').datagrid('reload');
                                $('#tdg').datagrid('clearSelections');
                            }, "text");
                        }
                    });
                }
                else {
                    msgShow("提示", "您还没有选中要删除的列信息？", "question");
                }
            });
        });
        jQuery(function ($) {
            $("#btnCut").click(function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    var rowzt = rows[0].AuditType;
                    if (rowzt == 1) {
                        msgShow("提示", "审核通过的信息不能进行修改！", "warning");
                        return;

                    }
                    if (rows.length > 1) {
                        msgShow("提示", "修改信息只能选中一条！", "warning");
                        return;
                    }
                    $('#newAdd').window({ title: "修改受让方信息" });
                    $('#newAdd').window('open');
                    OnEmptyTextClick();
                    $.get("../Ashx/LiceOrTran.ashx?action=by", { Id: rows[0].Id }, function (data) {
                        showOperDiv(data.MemberTypeId);
                        $("#txtId").val(data.Id);
                        $("#txtApplyDate").val(data.ApplyDate);
                        $("#txtAuditType").val(data.AuditType);
                        $("#txtOrgCode").combotree('setValue', data.OrgCode);
//                        $("#txtLiceTranType").combotree('setValue', data.LiceTranType);
                        $("#txtMemberTypeId").combotree('setValue', data.MemberTypeId);
                        $("#txtName").textbox('setValue', data.Name);
                        $("#txtAddr").textbox('setValue', data.Addr);
                        $("#txtContact").textbox('setValue', data.Contact);
                        $("#txtCorporate").textbox('setValue', data.Corporate);
                        $("#txtIDCard").textbox('setValue', data.IDCard);
                        $("#txtTel").textbox('setValue', data.Tel);
                        $("#txtOwner").textbox('setValue', data.Owner);
                        $("#txtOrganizationCode").textbox('setValue', data.OrganizationCode);
                        $("#txtCapital").textbox('setValue', data.Capital);
                        $("#txtFK_WebUserVeriId").val(data.FK_WebUserVeriId);
                        $("#txtJBYhm").textbox('setValue', data.JBYhm);
                        $("#txtJBmm").textbox('setValue', data.JBmm);
                    }, "json");
                    $("#btnCreate").hide();
                    $("#btnEdit").show();
                } else {
                    msgShow("提示", "您还没有选中要修改的列信息？", "warning");
                }
            });
        });
        jQuery(function ($) {
            $("#btnLock").click(function () {
                $('#addCheck').window('open');
                $("#txtAuditSay").val("审核通过");
            });
        });
        //反审核
        jQuery(function ($) {

            $("#btnfanshenhe").click(function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    var rowzt = rows[0].AuditType;
                    if (rowzt != 1) {
                        msgShow("提示", "审核通过的信息才能进行反审核！", "warning");
                        return;

                    }
                    $.messager.confirm('询问提示', '您确定要反审核选中的编号为 [' + rows[0].Id + '] 的信息吗？', function (data) {
                        if (data) {
                            $.get("../Ashx/LiceOrTran.ashx?action=fanshenhe", { id: rows[0].Id }, function (data) {
                                slide("提示", data);
                                $('#tdg').datagrid('reload');
                                $('#tdg').datagrid('clearSelections');
                            }, "text");
                        }
                    });
                }
                else {
                    msgShow("提示", "您还没有选中信息？", "question");
                }
            });
        });
        function OnEmptyTextClick() {
            $("#txtId").val("");
            $("#txtApplyDate").val("");
            $("#txtAuditType").val("");
            $("#txtOrgCode").combotree('setValue', "");
          
            $("#txtMemberTypeId").combotree('setValue', "");
            $("#txtName").textbox('setValue', "");
            $("#txtAddr").textbox('setValue', "");
            $("#txtContact").textbox('setValue', "");
            $("#txtCorporate").textbox('setValue', "");
            $("#txtIDCard").textbox('setValue', "");
            $("#txtTel").textbox('setValue', "");
            $("#txtOwner").textbox('setValue', "");
            $("#txtOrganizationCode").textbox('setValue', "");
            $("#txtCapital").textbox('setValue', "");
            $("#txtFK_WebUserVeriId").val("");
        };
        jQuery(function ($) {
            $("#btnCancel").click(function () {
                OnEmptyTextClick();
                $('#newAdd').window('close');
                $('#tdg').datagrid('reload');
            });
        });
        jQuery(function ($) {
            $("#btnEdit").click(function () {
                $('#forms').form('submit', {
                    url: '../Ashx/LiceOrTran.ashx?action=upsrf',
                    async: false,
                    onSubmit: function () {
                        return $(this).form('validate');
                    },
                    success: function (data) {
                        msgShow("提示", data, "info");
                    }
                });
                OnEmptyTextClick();
                $('#newAdd').window('close');
                $('#tdg').datagrid('reload');
            });
        });
        jQuery(function ($) {
            $("#btnCreate").click(function () {

                $('#forms').form('submit', {
                    url: '../Ashx/LiceOrTran.ashx?action=addsrf',
                    async: false,
                    onSubmit: function () {
                        return $(this).form('validate');
                    },
                    success: function (data) {

                        msgShow("提示", data, "info");
                        //                OnEmptyTextClick();
                        //                $('#newAdd').window('close');
                        $('#tdg').datagrid('reload');
                    }
                });

            });
        });
        jQuery(function ($) {
            $("#btnCheckAdd").click(function () {
                if ("" != $("#txtAuditSay").val()) {
                    $.get("../Ashx/LiceOrTran.ashx?action=checkadd", { AuditSay: $("#txtAuditSay").val(), FK_LiceTranId: $('#tdg').datagrid('getSelections')[0].Id }, function (data) {
                        msgShow("提示", data, "info");
                        $('#addCheck').window('close');
                        $("#txtAuditSay").val("");
                        $('#tdg').datagrid('reload');
                        $('#tdg').datagrid('clearSelections');
                    }, "text");
                }
                else {
                    msgShow("提示", "审核意见还没有填写！", "info");
                }
            });
        });
        function OnUploadFile(p) {

            $('#ScanFile').window('open');
            //    $("#ScanUpload").attr("src", "ScanUpload.aspx?p=" + p);
            $("#ScanUpload").attr("src", "fujianupload.aspx?p=" + p);
        };
    </script>
    <style type="text/css">
        .divhide
        {
            display: none;
        }
    </style>
</head>
<body class="easyui-layout">
    <div region="north" title="受让方信息列表" split="true" style="height: 370px; overflow: hidden;
        border: 0px;" border="false">
        <div id="tool">
            <a id="btnAdd" class="easyui-linkbutton" icon="icon-add" href="javascript:void(0)">新建</a>
            <a id="btnDel" class="easyui-linkbutton" icon="icon-no" href="javascript:void(0)">删除</a>
            <a id="btnCut" class="easyui-linkbutton" icon="icon-cut" href="javascript:void(0)">修改</a>
            <a id="btnLock" class="easyui-linkbutton" icon="icon-lock" href="javascript:void(0)">
                审核</a> 
                <a id="btnfanshenhe" class="easyui-linkbutton" icon="icon-lock" href="javascript:void(0)">
                反审核</a>&nbsp;&nbsp;&nbsp;&nbsp; 
            
            &nbsp;&nbsp;姓名：
            <input type="text" id="txt_Name" class="easyui-textbox" style="width: 150px;" required="true" />
            <a href="javascript:void(0)" id="btnQuery" class="easyui-linkbutton" iconcls="icon-search">
                搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: Blue;">(支持模糊查询)</span>
        </div>
        <table id="tdg" toolbar="#tool">
        </table>
    </div>
    <div id="center" region="center" title="审核意见" style="width: 50%;">
        <table id="ltCheck">
        </table>
    </div>
    <div id="east" region="east" title="附件信息" style="width: 50%;">
    <a href="pdf.rar" >pdf插件下载</a> 
        <table id="ltScan">
        </table>
    </div>
    <div id="newAdd" class="easyui-window" modal="true" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" style="width: 660px; height: 350px; padding: 5px;
        background: #fafafa;">
        <form id="forms" runat="server">
        <table width="640" class="tb" border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td height="35">
                    组织单位<span style="color: Red;">**</span>
                </td>
                <td colspan=3>
                    <select name="OrgCode" id="txtOrgCode" class="easyui-combotree" style="width: 250px;">
                    </select>
                </td>
                
            </tr>
            <tr>
                <td height="35">
                    经济类型<span style="color: Red;">**</span>
                </td>
                <td>
                    <select name="MemberTypeId" id="txtMemberTypeId" class="easyui-combotree" style="width: 150px;">
                    </select>
                </td>
                <td>
                    姓名<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="Name" id="txtName" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true" />
                </td>
            </tr>
            <tr>
                <td>
                    住址<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="Addr" id="txtAddr" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true" />
                </td>
                <td height="35">
                    联系人<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="Contact" id="txtContact" class="easyui-textbox" style="width: 150px;"
                        missingmessage="必须填写" data-options="required:true" />
                </td>
            </tr>
            <tr>
                <td>
                    法人代表<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="Corporate" id="txtCorporate" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" />
                </td>
                <td height="35">
                    身份证号码<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="IDCard" id="txtIDCard" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true" />
                </td>
            </tr>
            <tr>
                <td height="35">
                    联系电话<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="Tel" id="txtTel" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true,validType:'length[6,13]'" />
                </td>
                <td>
                    所有权人<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="Owner" id="txtOwner" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true" />
                </td>
            </tr>
            <span id="show3" style="display: none;">
                <tr>
                    <td height="35">
                        组织机构代码<span style="color: Red;">**</span>
                    </td>
                    <td>
                        <input type="text" name="OrganizationCode" id="txtOrganizationCode" maxlength="100"
                            class="easyui-textbox" style="width: 150px;" />
                    </td>
                    <td>
                        注册资本<span style="color: Red;">**</span>
                    </td>
                    <td>
                        <input type="text" name="Capital" id="txtCapital" maxlength="100" class="easyui-textbox"
                            style="width: 150px;" />
                    </td>
                </tr>
            </span>
          
                <tr id="trjingbiao"  >
                    <td height="35">
                        竞标用户名<span style="color: Red;">**</span>
                    </td>
                    <td>
                        <input type="text" name="JBYhm" id="txtJBYhm" maxlength="100"
                            class="easyui-textbox" style="width: 150px;" />
                    </td>
                    <td>
                        竞标登陆密码<span style="color: Red;">**</span>
                    </td>
                    <td>
                        <input type="text" name="JBmm" id="txtJBmm" maxlength="100" class="easyui-textbox"
                            style="width: 150px;" />
                    </td>
                </tr>
            
            <tr align="center">
                <td colspan="4" height="40">
                    <a id="btnCreate" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">
                        添加</a> <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)"
                            style="display: none">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="btnCancel"
                                class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
                </td>
            </tr>
        </table>
        <input id="txtId" name="Id" type="hidden" value="0" />
        <input id="txtApplyDate" name="ApplyDate" type="hidden" value="" />
        <input id="txtAuditType" name="AuditType" type="hidden" value="" />
        <input id="txtFK_WebUserVeriId" name="FK_WebUserVeriId" type="hidden" value="0" />
        </form>
    </div>
    <div id="ScanImg" class="easyui-window" modal="true" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" style="width: 700px; height: 480px; padding: 5px;
        background: #fafafa;">
        <iframe id="showScanImg" scrolling="no" src="fujianview.aspx" frameborder="0" style="width: 100%; height: 100%;">
        </iframe>
    </div>
    <div id="addCheck" title="审核意见" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" modal="true" style="width: 400px; height: 160px;
        padding: 5px; background: #fafafa;">
        <table>
            <tr>
                <td>
                    <textarea id="txtAuditSay" name="AuditSay" style="width: 350px; height: 70px;" class="easyui-validatebox"
                        missingmessage="必须填写" required="true" ></textarea>
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
    <div id="ScanFile" title="附件上传" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" modal="true" style="width: 650px; height: 200px;
        padding: 5px; background: #fafafa;">
        <iframe id="ScanUpload" scrolling="no" frameborder="0" style="width: 100%; height: 100%;">
        </iframe>
    </div>
   
    
</body>
</html>
