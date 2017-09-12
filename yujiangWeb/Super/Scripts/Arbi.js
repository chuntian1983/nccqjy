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
    $('#txtBidName').combotree({
        url: '../ashx/ArbitH.ashx?action=combo',
        required: true,
        onSelect: function (rec) { OnLoadLiceOrTran(rec.id); }
    });

});
function OnLoadLiceOrTran(id) {
    $("#txtFK_BidId").val(id);
    $.get("../Ashx/ArbitH.ashx?action=lt", { Id: id }, function (data) {
        OnShowLiceTran(data.T[0].A1, 1);
        OnShowLiceTran(data.T[0].A2, 2);
        $("#txtFK_LiceId").val(data.T[0].A1);
        $("#txtFK_TranId").val(data.T[0].A2);
    }, "json");
};
function OnShowLiceTran(par, index) {
    $.get("../Ashx/LiceOrTran.ashx?action=byId", { Id: par }, function (data) {
        if (null != data.rows[0]) {
            if (index == 1) {
                $("#lblAAddr").text(data.rows[0].Addr);
                $("#lblAMemberTypeId").text(data.rows[0].MemberTypeId);
                $("#lblACorporate").text(data.rows[0].Corporate);
                $("#lblATel").text(data.rows[0].Tel);
                $("#lblAIDCard").text(data.rows[0].IDCard);
                $("#lblAName").text(data.rows[0].Name);
                $("#lblAContact").text(data.rows[0].Contact);
                $("#lblAOwner").text(data.rows[0].Owner);
                $("#lblACapital").text(data.rows[0].Capital);
                $("#lblAOrganizationCode").text(data.rows[0].OrganizationCode);
            } else {
                $("#lblBAddr").text(data.rows[0].Addr);
                $("#lblBMemberTypeId").text(data.rows[0].MemberTypeId);
                $("#lblBCorporate").text(data.rows[0].Corporate);
                $("#lblBTel").text(data.rows[0].Tel);
                $("#lblBIDCard").text(data.rows[0].IDCard);
                $("#lblBName").text(data.rows[0].Name);
                $("#lblBContact").text(data.rows[0].Contact);
                $("#lblBOwner").text(data.rows[0].Owner);
                $("#lblBCapital").text(data.rows[0].Capital);
                $("#lblBOrganizationCode").text(data.rows[0].OrganizationCode);
            }
        } else {
            if (index == 1) {
                $("#lblAAddr").text("");
                $("#lblAMemberTypeId").text("");
                $("#lblACorporate").text("");
                $("#lblATel").text("");
                $("#lblAIDCard").text("");
                $("#lblAName").text("");
                $("#lblAContact").text("");
                $("#lblAOwner").text("");
                $("#lblACapital").text("");
                $("#lblAOrganizationCode").text("");
            } else {
                $("#lblBAddr").text("");
                $("#lblBMemberTypeId").text("");
                $("#lblBCorporate").text("");
                $("#lblBTel").text("");
                $("#lblBIDCard").text("");
                $("#lblBName").text("");
                $("#lblBContact").text("");
                $("#lblBOwner").text("");
                $("#lblBCapital").text("");
                $("#lblBOrganizationCode").text("");
            }
        }
    }, "json");
};
function GridView() {
    $('#tdg').datagrid({
        title: '纠纷仲裁信息列表',
        iconCls: 'icon-save',
        nowrap: true,
        striped: true,
        url: '../ashx/ArbitH.ashx?action=paging',
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'asc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        frozenColumns: [[
{ field: 'Id', title: '序号', width: 50, align: 'left', sortable: true },
{ field: 'BidName', title: '标的名称', width: 150, align: 'left', sortable: true },
{ field: 'AName', title: '申请人', width: 100, align: 'left', sortable: true },
{ field: 'BName', title: '被申请人', width: 100, align: 'left', sortable: true }
]], columns: [[
{ field: 'Fact', title: '事实理由', width: 150, align: 'left', sortable: true },
{ field: 'Grounds', title: '仲裁请求', width: 150, align: 'left', sortable: true },
{ field: 'Results', title: '处理结果', width: 150, align: 'left', sortable: true },
{ field: 'AcceptName', title: '受理人', width: 100, align: 'left', sortable: true },
{ field: 'AcceptDate', title: '受理时间', width: 120, align: 'left', sortable: true }
]],
        toolbar: [{
            id: 'btnadd',
            text: '新建',
            iconCls: 'icon-add',
            handler: function () {
                $('#newAdd').window({ title: "添加纠纷仲裁信息" });
                $("#newAdd").window("open");
                $("#btnAdd").show();
                $("#btnEdit").hide();
                OnEmptyTextClick();
            }
        }, '-',
        {
            id: 'btndel',
            text: '删除',
            iconCls: 'icon-no',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('询问提示', '您确定要删除选中的编号为 [' + rows[0].Id + '] 的信息吗？', function (data) {
                        if (data) {
                            $.get("../Ashx/ArbitH.ashx?action=del", { Id: rows[0].Id }, function (data) {
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
        }
         , '-', {
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
                     $('#newAdd').window({ title: "修改纠纷仲裁信息" });
                     $('#newAdd').window('open');
                     OnEmptyTextClick();
                     $.get("../ashx/ArbitH.ashx?action=by", { Id: rows[0].Id }, function (data) {
                         $("#txtId").val(data.Id);
                         $('#txtBidName').combotree('setValue', data.FK_BidId);
                         $("#txtFK_LiceId").val(data.FK_LiceId);
                         $("#txtFK_TranId").val(data.FK_TranId);
                         $("#txtFact").val(data.Fact);
                         $("#txtGrounds").val(data.Grounds);
                         $("#txtResults").val(data.Results);
                         OnShowLiceTran(data.FK_LiceId, 1);
                         OnShowLiceTran(data.FK_TranId, 2);
                     }, "json");
                     $("#btnAdd").hide();
                     $("#btnEdit").show();
                 } else {
                     msgShow("提示", "您还没有选中要修改的列信息？", "warning");
                 }
             }
         }
],
        pagination: true,
        pageSize: 20
    });
    var p = $('#tdg').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
function OnEmptyTextClick() {
    $("#txtId").val("");
    $('#txtBidName').combotree('setValue', "");
    $("#FK_LiceId").val("");
    $("#FK_TranId").val("");
    $("#txtFact").val("");
    $("#txtGrounds").val("");
    $("#txtResults").val("");
    $("#lblAAddr").text("");
    $("#lblAMemberTypeId").text("");
    $("#lblACorporate").text("");
    $("#lblATel").text("");
    $("#lblAIDCard").text("");
    $("#lblAName").text("");
    $("#lblAContact").text("");
    $("#lblAOwner").text("");
    $("#lblACapital").text("");
    $("#lblAOrganizationCode").text("");
    $("#lblBAddr").text("");
    $("#lblBMemberTypeId").text("");
    $("#lblBCorporate").text("");
    $("#lblBTel").text("");
    $("#lblBIDCard").text("");
    $("#lblBName").text("");
    $("#lblBContact").text("");
    $("#lblBOwner").text("");
    $("#lblBCapital").text("");
    $("#lblBOrganizationCode").text("");
};
jQuery(function ($) {
    $("#btnCancel").click(function () {
        OnEmptyTextClick();
        $('#newAdd').window('close');
    });
});
jQuery(function ($) {
    $("#btnEdit").click(function () {
        $('#forms').form('submit', {
            url: '../ashx/ArbitH.ashx?action=up',
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
            url: '../ashx/ArbitH.ashx?action=add',
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
    $("#lblAAddr").attr("class", "tbtd");
    $("#lblAMemberTypeId").attr("class", "tbtd");
    $("#lblACorporate").attr("class", "tbtd");
    $("#lblATel").attr("class", "tbtd");
    $("#lblAIDCard").attr("class", "tbtd");
    $("#lblAName").attr("class", "tbtd");
    $("#lblAContact").attr("class", "tbtd");
    $("#lblAOwner").attr("class", "tbtd");
    $("#lblACapital").attr("class", "tbtd");
    $("#lblAOrganizationCode").attr("class", "tbtd");
    $("#lblBAddr").attr("class", "tbtd");
    $("#lblBMemberTypeId").attr("class", "tbtd");
    $("#lblBCorporate").attr("class", "tbtd");
    $("#lblBTel").attr("class", "tbtd");
    $("#lblBIDCard").attr("class", "tbtd");
    $("#lblBName").attr("class", "tbtd");
    $("#lblBContact").attr("class", "tbtd");
    $("#lblBOwner").attr("class", "tbtd");
    $("#lblBCapital").attr("class", "tbtd");
    $("#lblBOrganizationCode").attr("class", "tbtd");
});