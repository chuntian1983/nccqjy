<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidContrScan.aspx.cs" Inherits="Web.Super.Bi.BidContrScan" %>

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
   
    <%--<script src="../Scripts/BidContrScan.js" type="text/javascript" language="javascript"></script>--%>
    <script type="text/javascript">
        Request = {
            QueryString: function (item) {
                var svalue = location.search.match(new RegExp("[\?\&]" + item + "=([^\&]*)(\&?)", "i"));
                return svalue ? svalue[1] : svalue;
            }
        };
        jQuery(function ($) {
            $("#txtFK_BidId").val(Request.QueryString("FK_BidId"));
            GridView();
            $('#newAdd').window('close');
        });

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
        function GridView() {
            $('#tdg').datagrid({
                nowrap: true,
                striped: true,
                url: '../Ashx/BidContractScanH.ashx?' + $.param({ action: "paging", FK_BidId: Request.QueryString("FK_BidId") }),
                remoteSort: false,
                sortName: 'Id',
                singleSelect: true,
                sortOrder: 'desc',
                fitColumns: false,
                rownumbers: true,
                fit: false,
                onDblClickRow: function (rowIndex, rowData) {
                    $(function () {
                        parent.OnShowScan(rowData.ScanName, "../Scan/htscan/" + rowData.FK_BidId + "/" + rowData.ScanUrl);
                    });
                },
                columns: [[
{ field: 'Id', title: '序号', width: 40, align: 'left', sortable: true },
{ field: 'ScanName', title: '合同附件名称', width: 150, align: 'left', sortable: true },
{ field: 'FK_BidId', title: '标代码', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'ScanUrl', title: '合同附件路径名称', width: 150, align: 'left', sortable: true, hidden: true },
{ field: 'UploadName', title: '上传人', width: 100, align: 'left', sortable: true },
{ field: 'UploadDate', title: '上传时间', width: 130, align: 'left', sortable: true }
]],
                toolbar: [
        {
            id: 'btnadd',
            text: '新建',
            iconCls: 'icon-add',
            handler: function () {
                $('#newAdd').window({ title: "添加合同附件信息" });
                $("#newAdd").window("open");
                $("#btnAdd").show();
                $("#btnEdit").hide();
                OnEmptyTextClick();
            }
        }, '-', {
            id: 'btndel',
            text: '删除',
            iconCls: 'icon-no',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('询问提示', '您确定要删除选中的编号为 [' + rows[0].Id + '] 的信息吗？', function (data) {
                        if (data) {
                            $.get("../Ashx/BidContractScanH.ashx?action=del", { id: rows[0].Id }, function (data) {
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
            }
        }, '-', {
            id: 'btncut',
            text: '修改',
            iconCls: 'icon-cut',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $('#newAdd').window({ title: "添加合同附件信息" });
                    $('#newAdd').window('open');
                    OnEmptyTextClick();
                    $.get("../Ashx/BidContractScanH.ashx?action=by", { Id: rows[0].Id }, function (data) {
                        $("#txtId").val(data.Id);
                        $("#txtScanName").textbox('setValue', data.ScanName);
                        $("#FScanUrl").val("");
                        $("#txtFK_BidId").val(data.FK_BidId);
                        $("#txtScanUrl").val(data.ScanUrl);

                    }, "json");
                    //
                    $("#btnAdd").hide();
                    $("#btnEdit").show();
                } else {
                    msgShow("提示", "您还没有选中要修改的列信息？", "warning");
                }
            }
        }, '-'

        ],
                pagination: false,
                pageSize: 10
            });
            var p = $('#tdg').datagrid('getPager');
            $(p).pagination({
                onBeforeRefresh: function () {
                }
            });
        };
        function OnEmptyTextClick() {
            $("#txtId").val("");
            $("#txtScanName").textbox('setValue', "");
            $("#FScanUrl").val("");
            $("#txtFK_BidId").val(Request.QueryString("FK_BidId"));
            $("#txtScanUrl").val("");
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
                    url: '../Ashx/BidContractScanH.ashx?action=up',
                    async: false,
                    onSubmit: function () {
                        return $(this).form('validate');
                    },
                    success: function (data) {
                        msgShow("提示", data, "info");
                        OnEmptyTextClick();
                        $('#newAdd').window('close');
                        $('#tdg').datagrid('reload');
                    }
                });
            });
        });
        jQuery(function ($) {
            $("#btnAdd").click(function () {
                $('#forms').form('submit', {
                    url: '../Ashx/BidContractScanH.ashx?action=add',
                    async: false,
                    onSubmit: function () {
                        return $(this).form('validate');
                    },
                    success: function (data) {
                        msgShow("提示", data, "info");
                        OnEmptyTextClick();
                        $('#newAdd').window('close');
                        $('#tdg').datagrid('reload');
                    }
                });
            });
        });
        function OnCheckImg(ControlName) {
            var imgDom = document.getElementById(ControlName);
            var location = imgDom.value;
            if (location != "") {
                var point = location.lastIndexOf(".");
                var type = location.substr(point).toLowerCase();
                if (type == ".jpg" || type == ".gif" || type == ".jpeg" || type == ".png" || type == ".pdf") {
                    var imgSize = 0;
                    if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
                        imgSize = imgDom.files[0].fileSize;
                    } else {
                        imgSize = imgDom.fileSize;
                    }
                    if (imgSize > 1024000) {
                        msgShow("提示", "文件大小请不要大于1000KB", "info");
                        return false;
                    }
                }
                else {
                    var afile = $("#" + ControlName);
                    afile.replaceWith(afile.clone());
                    msgShow("提示", "只能上传jpg,jpge,gif,png,pdf格式的文件", "info");
                    return false;
                }
            }
        };
    </script>
</head>
<body class="easyui-layout">
    <div id="center" region="center">
        <table id="tdg">
        </table>
    </div>
    <div id="newAdd" class="easyui-window" modal="true" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" style="width: 480px; height: 150px; padding: 5px;
        background: #fafafa;">
        <form id="forms" runat="server">
        <table border="0" class="table" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td height="35" align="center">
                    合同附件名称
                </td>
                <td>
                    <input type="text" name="ScanName" id="txtScanName" maxlength="100" class="easyui-textbox"
                        style="width: 250px;" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    上传附件文件
                </td>
                <td>
                    <input name="FScanUrl" type="file" id="FScanUrl" onchange="OnCheckImg('FScanUrl');"
                        runat="server" style="width: 250px;" class="txt" />
                </td>
            </tr>
            <tr align="center">
                <td colspan="5" height="35">
                    <a id="btnAdd" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">添加</a>
                    <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)"
                        style="display: none">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="btnCancel"
                            class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
                </td>
            </tr>
        </table>
        <input type="hidden" id="txtId" name="Id" />
        <input type="text" id="txtFK_BidId" name="FK_BidId" />
        <input type="hidden" id="txtScanUrl" name="ScanUrl" />
        </form>
    </div>
</body>
</html>

