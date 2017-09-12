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
    $('#ScanFile').window('close');
});
jQuery(function ($) {
    $("#txtOrgCode").combotree({
        url: '../Handler/CommH.ashx?action=tree',
        lines: true,
        required: true,
        onSelect: function (rec) { rec.id; }
    });

});
jQuery(function ($) {
    $('#txtMemberTypeId').combotree({
        url: '../Handler/CommH.ashx?action=mtcombo',
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
jQuery(function ($) {
    $('#tLiceTranType').combotree({
        url: '../Handler/WebLiTrH.ashx?action=t',
        required: true,
        onSelect: function (rec) {
            OnSelectClick(rec.id);
        }
    });
});
jQuery(function ($) {
    $('#txtLiceTranType').combotree({
        url: '../Handler/WebLiTrH.ashx?action=t',
        required: true,
        onSelect: function (rec) {
            rec.id;
        }
    });
});
function OnltCheckGridView(par) {
    $('#ltCheck').datagrid({
        nowrap: true,
        striped: true,
        url: '../Handler/CommH.ashx?' + $.param({ action: "paging", LiceTranId: par }),
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
        url: '../Handler/CommH.ashx?' + $.param({ action: "list", LiceTranId: par }),
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
            $("#showScanImg").attr("src", "../Scan/lt/" + rowData.FK_LiceTranId + "/" + rowData.ScanUrl);
        },
        columns: [[
        { title: '编号', field: 'Id', width: 30, align: 'left', sortable: true },
        { field: 'FK_LiceTranId', title: '附件编号', width: 40, align: 'left', sortable: true, hidden: true },
{ field: 'FK_UploadTypeIndicatorId', title: '附件名称', width: 150, align: 'left', sortable: true },
{ field: 'ScanUrl', title: '文件路径', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'UploadDate', title: '上传时间', width: 80, align: 'left', sortable: true }
]]
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
        url: '../Handler/WebLiTrH.ashx?' + $.param({ action: "paging", LiceTranId: '1' }),
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
{ field: 'LiceTranType', title: '出让/受让方', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.LiceTranType == 1 ? "出让方" : "意向受让方"; } },
{ field: 'AuditType', title: '审核状态', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.AuditType == 0 ? "<span style='color:red;'>等待审核</span>" : "<span style='color:blue;'>审核通过</span>"; } },
        { field: 'FK_WebUserVeriId', title: '上传', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return "<span style='color:blue;' onclick='OnUploadFile(" + row.Id + ");'>上传扫描件</span>"; } }
]],
        columns: [[
{ field: 'MemberTypeId', title: '类型', width: 80, align: 'left', sortable: true },
{ field: 'Name', title: '姓名', width: 80, align: 'left', sortable: true },
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
function OnSelectClick(par) {
    var url = '../Handler/WebLiTrH.ashx?' + $.param({ action: "paging", LiceTranType: par });
    $('#tdg').datagrid({ url: url });
    $('#tdg').datagrid('reload');
};
jQuery(function ($) {
    $("#btnAdd").click(function () {
        OnEmptyTextClick();
        $('#newAdd').window({ title: "添加出让/受让方信息" });
        $('#newAdd').window('open');
        $("#btnCreate").show();
        $("#btnEdit").hide();
    });
});
jQuery(function ($) {
    $("#btnDel").click(function () {
        var rows = $('#tdg').datagrid('getSelections');
        if (rows.length > 0) {
            $.messager.confirm('询问提示', '您确定要删除选中的编号为 [' + rows[0].Id + '] 的信息吗？', function (data) {
                if (data) {
                    $.get("../Handler/WebLiTrH.ashx?action=del", { id: rows[0].Id }, function (data) {
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
        //
        var rows = $('#tdg').datagrid('getSelections');
        if (rows.length > 0) {
            if (rows.length > 1) {
                msgShow("提示", "修改信息只能选中一条！", "warning");
                return;
            }
            $('#newAdd').window({ title: "修改出让/受让方信息" });
            $('#newAdd').window('open');
            OnEmptyTextClick();
            $.get("../Handler/WebLiTrH.ashx?action=by", { Id: rows[0].Id }, function (data) {
                showOperDiv(data.MemberTypeId);
                $("#txtId").val(data.Id);
                $("#txtApplyDate").val(data.ApplyDate);
                $("#txtAuditType").val(data.AuditType);
                $("#txtOrgCode").combotree('setValue', data.OrgCode);
                $("#txtLiceTranType").combotree('setValue', data.LiceTranType);
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
            }, "json");
            $("#btnCreate").hide();
            $("#btnEdit").show();
        } else {
            msgShow("提示", "您还没有选中要修改的列信息？", "warning");
        }
    });
});
function OnEmptyTextClick() {
    $("#txtId").val("");
    $("#txtApplyDate").val("");
    $("#txtAuditType").val("");
    $("#txtOrgCode").combotree('setValue', "");
    $("#txtLiceTranType").combotree('setValue', "");
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
            url: '../Handler/WebLiTrH.ashx?action=up',
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
    $("#btnCreate").click(function () {
        $('#forms').form('submit', {
            url: '../Handler/WebLiTrH.ashx?action=add',
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
function OnUploadFile(p) {
    $('#ScanFile').window('open');
    $("#ScanUpload").attr("src", "../user/LiceTranScanUpload.aspx?p=" + p);
};