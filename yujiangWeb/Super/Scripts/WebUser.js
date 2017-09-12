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
    $('#addOpinion').window('close');
    $('#ScanImg').window('close');
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
        $("#gr1").css("display", "none");
        $("#gr2").css("display", "none");
        $("#gr3").css("display", "none");
        $("#gr4").css("display", "none");
        $("#gs1").css("display", "block");
        $("#gs2").css("display", "block");
        $("#gs3").css("display", "block");
        $("#gs4").css("display", "block");
    }
    else {
        $("#gr1").css("display", "block");
        $("#gr2").css("display", "block");
        $("#gr3").css("display", "block");
        $("#gr4").css("display", "block");
        $("#gs1").css("display", "none");
        $("#gs2").css("display", "none");
        $("#gs3").css("display", "none");
        $("#gs4").css("display", "none");
    }
};
jQuery(function ($) {
    $("#txtOrgCode").combotree({
        url: '../Ashx/Org.ashx?action=tree',
        lines: true,
        required: true,
        onSelect: function (rec) { rec.id; }
    });
});
function GridView() {
    $('#tdg').datagrid({
        nowrap: true,
        striped: true,
        url: '../Ashx/WebUser.ashx?action=paging',
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'desc',
        fitColumns: false,
        rownumbers: true,
        onDblClickRow: function (rowIndex, rowData) {
            OpinionGridView(rowData.Id);
            OnScanClick(rowData.Id);
        },
        frozenColumns: [[
{ field: 'Id', title: '编号', width: 40, align: 'left', sortable: true },
{ field: 'LoginName', title: '登录账号', width: 80, align: 'left', sortable: true },
{ field: 'MemberTypeId', title: '会员类型', width: 80, align: 'left', sortable: true },
{ field: 'VeriName', title: '姓名', width: 80, align: 'left', sortable: true },
{ field: 'AuditType', title: '审核状态', width: 70, align: 'left', sortable: true, formatter: function (value, row, index) { return row.AuditType == 0 ? "<span style='color:red;'>等待审核</span>" : "<span style='color:blue;'>审核通过<span>"; } }
]],
        columns: [[
        { field: 'VeriStatus', title: '帐号状态', width: 60, align: 'left', sortable: true, formatter: function (value, row, index) { return row.VeriStatus == 0 ? "<span style='color:red;'>禁用</span>" : "<span style='color:blue;'>正常<span>"; } },
{ field: 'VeriSex', title: '性别', width: 40, align: 'left', sortable: true },
{ field: 'VeriIDCard', title: '身份证号', width: 150, align: 'left', sortable: true },
{ field: 'OrgCode', title: '组织单位', width: 80, align: 'left', sortable: true },
{ field: 'VeriAddress', title: '住址', width: 180, align: 'left', sortable: true },
{ field: 'VeriTel', title: '联系电话', width: 100, align: 'left', sortable: true },
{ field: 'VeriCorporate', title: '法人代表', width: 80, align: 'left', sortable: true },
{ field: 'VeriCreditCode', title: '社会信用代码号码', width: 150, align: 'left', sortable: true },
{ field: 'LoginnNum', title: '登录次数', width: 50, align: 'left', sortable: true },
{ field: 'VeriApplyDate', title: '申请时间', width: 100, align: 'left', sortable: true },
{ field: 'VeriCheckDate', title: '审核时间', width: 100, align: 'left', sortable: true },
{ field: 'OutDate', title: '最后登录时间', width: 100, align: 'left', sortable: true }
]],
        toolbar: [{
            id: 'btnadd',
            text: '新建',
            iconCls: 'icon-add',
            handler: function () {
                $('#newAdd').window({ title: "添加认证会员信息" });
                $("#newAdd").window("open");
                $("#btnAdd").show();
                $("#btnEdit").hide();
                EmptyTextClick();
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
                            $.get("../Ashx/WebUser.ashx?action=del", { id: rows[0].Id }, function (data) {
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
                    if (rows.length > 1) {
                        msgShow("提示", "修改信息只能选中一条！", "warning");
                        return;
                    }
                    $('#newAdd').window({ title: "修改认证会员信息" });
                    $('#newAdd').window('open');
                    EmptyTextClick();
                    $.get("../Ashx/WebUser.ashx?action=by", { Id: rows[0].Id }, function (data) {
                        $("#txtLoginName").val(data.LoginName);
                        $("#txtLoginPass").val(data.LoginPass);
                        $("#txtMemberTypeId").combotree('setValue', data.MemberTypeId);
                        $("#txtVeriName").val(data.VeriName);
                        $("#txtVeriCorporate").val(data.VeriCorporate);
                        $("#txtVeriSex").combobox('setValue', data.VeriSex);
                        $("#txtVeriIDCard").val(data.VeriIDCard);
                        $("#txtVeriCorporateIDCard").val(data.VeriCorporateIDCard);
                        $("#txtId").val(data.Id);
                        $("#txtOrgCode").combotree('setValue', data.OrgCode);
                        $("#txtVeriAddress").val(data.VeriAddress);
                        showOperDiv(data.MemberTypeId);
                        $("#txtVeriTel").val(data.VeriTel);
                        $("#txtVeriCreditCode").val(data.VeriCreditCode);
                        $("#txtUserName").val(data.UserName);
                        $("#txtUserTel").val(data.UserTel);
                        $("#txtUserEmail").val(data.UserEmail);
                        $("#txtUserStatus").val(data.UserStatus);
                        $("#txtLoginDate").val(data.LoginDate);
                        $("#txtLoginnNum").val(data.LoginnNum);
                        $("#txtOutDate").val(data.OutDate);
                        $("#txtVeri").val(data.Veri);
                        $("#txtVeriStatus").val(data.VeriStatus);
                        $("#txtAuditType").val(data.AuditType);
                        $("#txtVeriCheckName").val(data.VeriCheckName);
                        $("#txtVeriApplyDate").val(data.VeriApplyDate);
                        $("#txtVeriCheckDate").val(data.VeriCheckDate);
                        $("#tVeriIDCardScan").val(data.VeriIDCardScan);
                        $("#tVeriCorporateIDCardScan").val(data.VeriCorporateIDCardScan);
                        $("#tVeriCreditCodeScan").val(data.VeriCreditCodeScan);
                    }, "json");
                    $("#btnAdd").hide();
                    $("#btnEdit").show();
                } else {
                    msgShow("提示", "您还没有选中要修改的列信息？", "warning");
                }

            }
        }, '-', {
            id: 'btnstate',
            text: '更改状态',
            iconCls: 'icon-filter',
            handler: function () {

                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('询问提示', '您确定要更改选中列信息的登录状态吗？', function (data) {
                        if (data) {
                            for (var i = 0; i < rows.length; i++) {
                                $.get("../Ashx/WebUser.ashx?action=rs", { id: rows[i].Id, Rows: "VeriStatus", Vale: rows[i].VeriStatus }, function (data) {
                                    slide("提示", data);
                                }, "text");
                            }
                            $('#tdg').datagrid('clearSelections');
                            $('#tdg').datagrid('reload');
                        }
                    });
                }
                else {
                    msgShow("提示", "您还没有选中要更改的列信息？", "question");
                }

            }
        }, '-',
        {
            id: 'btnlock',
            text: '审核',
            iconCls: 'icon-lock',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('询问提示', '您确定要审核注册会员吗？', function (data) {
                        if (data) {
                            OnShowCheckClick(rows[0].Id, rows[0].AuditType);
                        }
                        else {
                            msgShow("提示", "您还没有选中要更改的列信息？", "question");
                        }
                    });
                }
            }
        }
],
        pagination: true,
        pageSize: 10

    });
    var p = $('#tdg').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
jQuery(function ($) {
    $("#btnEdit").click(function () { OnUpdateClick(); });
});
function OnUpdateClick() {
    $('#forms').form('submit', {
        url: '../Ashx/WebUser.ashx?action=up',
        async: false,
        onSubmit: function () {
            return $(this).form('validate');
        },
        success: function (data) {
            msgShow("提示", data, "info");
        }
    });
    EmptyTextClick();
    $('#newAdd').window('close');
    $('#tdg').datagrid('reload');
};
jQuery(function ($) {
    $("#btnAdd").click(function () { OnCreateClick(); });
});
function OnCreateClick() {
    $('#forms').form('submit', {
        url: '../Ashx/WebUser.ashx?action=add',
        async: false,
        onSubmit: function () {
            return $(this).form('validate');
        },
        success: function (data) {
            msgShow("提示", data, "info");
        }
    });
    EmptyTextClick();
    $('#newAdd').window('close');
    $('#tdg').datagrid('reload');
};
jQuery(function ($) {
    $("#btnQuery").click(function () { OnSelectClick(); });
});
function OnSelectClick() {
    var txt_AdminName = $("#txt_AdminName").textbox('getValue');
    var url = '../Ashx/WebUser.ashx?' + $.param({ action: "paging", AdminName: txt_AdminName });
    $('#tdg').datagrid({ url: url });
    $('#tdg').datagrid('reload');
};
function EmptyTextClick() {
    $("#txtLoginName").val("");
    $("#txtLoginPass").val("");
    $("#txtMemberTypeId").combotree('setValue', "");
    $("#txtVeriName").val("");
    $("#txtVeriCorporate").val("");
    $("#txtVeriSex").combobox('setValue', "");
    $("#txtVeriIDCard").val("");
    $("#txtVeriCorporateIDCard").val("");
    $("#txtId").val("");
    $("#txtOrgCode").combotree('setValue', "");
    $("#txtVeriAddress").val("");
    $("#txtVeriTel").val("");
    $("#txtVeriCreditCode").val("");
    $("#txtUserName").val("");
    $("#txtUserTel").val("");
    $("#txtUserEmail").val("");
    $("#txtUserStatus").val("");
    $("#txtLoginDate").val("");
    $("#txtLoginnNum").val("");
    $("#txtOutDate").val("");
    $("#txtVeri").val("1");
    $("#txtVeriStatus").val("");
    $("#txtAuditType").val("");
    $("#txtVeriCheckName").val("");
    $("#txtVeriApplyDate").val("");
    $("#txtVeriCheckDate").val("");
    $("#tVeriIDCardScan").val("");
    $("#tVeriCorporateIDCardScan").val("");
    $("#tVeriCreditCodeScan").val("");
};
function OpinionGridView(p) {
    $('#Opinion').datagrid({
        nowrap: true,
        striped: true,
        url: '../Ashx/Opinion.ashx?' + $.param({ action: "paging", WebUserVeriId: p }),
        remoteSort: false,
        sortName: 'Id',
        singleSelect: false,
        sortOrder: 'asc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        frozenColumns: [[
            { title: '编号', field: 'Id', width: 50, align: 'left', sortable: true },
            { field: 'CheckOpinion', title: '审核意见', width: 300, align: 'left', sortable: true },
            { field: 'CheckName', title: '审核人', width: 100, align: 'left', sortable: true },
            { field: 'OpinionDate', title: '审核时间', width: 150, align: 'left', sortable: true }
         ]],
        pagination: false
    });
    var p = $('#Opinion').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
jQuery(function ($) {
    $("#btnCancel").click(function () {
        EmptyTextClick();
        $('#newAdd').window('close');
        $('#tdg').datagrid('reload');
    });
});
function OnScanClick(id) {
    $.get("../Ashx/WebUser.ashx?action=by", { Id: id }, function (data) {
        var panl = "";
        if ("" != data.VeriIDCardScan) {
            panl += " <p>" + data.VeriName + "：<a style='cursor: hand;' onclick=\"OnShowScans('" + data.LoginName + "','" + data.VeriIDCardScan + "');\">身份证扫描件</a></p>";          
        }
        if ("" != data.VeriCorporateIDCardScan) {
            panl += " <p>" + data.VeriCorporate + ":<a style='cursor: hand;' onclick=\"OnShowScans('" + data.LoginName + "','" + data.VeriCorporateIDCardScan + "');\">法人身份证扫描件</a></p>";
        }
        if ("" != data.VeriCreditCodeScan) {
            panl += " <p>公司：<a style='cursor: hand;' onclick=\"OnShowScans('" + data.LoginName + "','" + data.VeriCreditCodeScan + "');\">社会信用代码扫描件</a></p>";
        }
        $("#Scan").html(panl);
    }, "json");
};
var AuditTypeData;
function OnShowCheckClick(p, atd) {
    $('#addOpinion').window('open');
    $("#txtFK_WebUserVeriId").val(p);
    $("#txtCheckOpinion").val("审核通过");
    AuditTypeData = atd;
};
jQuery(function ($) {
    $("#btnAuditOpinionAdd").click(function () {
        $.get("../Ashx/Opinion.ashx?action=add", { WebUserVeriId: $("#txtFK_WebUserVeriId").val(), CheckOpinion: $("#txtCheckOpinion").val(), Id: $("#txtAuditOpinionId").val(), AuditType: AuditTypeData }, function (data) {
            $('#addOpinion').window('close');
            slide("提示", data);
            OpinionGridView($("#txtFK_WebUserVeriId").val());
            OnScanClick($("#txtFK_WebUserVeriId").val());
            $('#tdg').datagrid('clearSelections');
            $('#tdg').datagrid('reload');
        }, "text");
    });
});
function OnShowScans(p1, p2) {
    $('#ScanImg').window('open');
    $("#showScanImg").attr("src", "../Scan/us/" + p1 + "/" + p2);
};
function OnCheckImg(ControlName) {
    var imgDom = document.getElementById(ControlName);
    var location = imgDom.value;
    if (location != "") {
        var point = location.lastIndexOf(".");
        var type = location.substr(point).toLowerCase();
        if (type == ".jpg" || type == ".gif" || type == ".jpeg" || type == ".png") {
            var imgSize = 0;
            if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
                imgSize = imgDom.files[0].fileSize;
            } else {
                imgSize = imgDom.fileSize;
            }
            if (imgSize > 102400) {
                msgShow("提示", "图片大小请不要大于100KB", "info");
                return false;
            }
        }
        else {
            var afile = $("#" + ControlName);
            afile.replaceWith(afile.clone());
            msgShow("提示", "只能上传jpg,jpge,gif,png格式的图片", "info");
            return false;
        }
    }
};