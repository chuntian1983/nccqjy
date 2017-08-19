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
    $('#txtFK_MemberTypeCertificationId').combotree({
        url: '../ashx/MemberType.ashx?action=combo',
        required: true
    });
});
jQuery(function ($) {
    $('#newAdd').window('close');
    GridView();
});
function GridView() {
    $('#tdg').datagrid({
        title: '指标对应关系信息列表',
        iconCls: 'icon-save',
        nowrap: true,
        striped: true,
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'asc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        frozenColumns: [[
{ title: '编号', field: 'Id', width: 50, align: 'left', sortable: true },
{ field: 'ApplicationType', title: '流转类型名称', width: 90, align: 'left', sortable: true, formatter: function (value, row, index) { var str = "出让方"; if (row.ApplicationType == 1) { str = "出让方备案"; } else if (row.ApplicationType == 2) { str = "受让方备案"; } else if (row.ApplicationType == 3) { str = "出让方申请"; } else if (row.ApplicationType == 4) { str = "意向受让方申请"; } return str; } },
{ field: 'MemberTypeCertificationName', title: '申请类型名称', width: 100, align: 'left', sortable: true },
{ field: 'TypeIndicatorName', title: '指标关系名称', width: 450, align: 'left', sortable: true },
{ field: 'CreateDate', title: '创建时间', width: 150, align: 'left', sortable: true }
]],
        toolbar: [{
            id: 'btnadd',
            text: '新建指标对应关系',
            iconCls: 'icon-add',
            handler: function () {
                var txtApplicationType = $("#txtApplicationType").combobox('getValue');
                var txtFK_MemberTypeCertificationId = $("#txtFK_MemberTypeCertificationId").combobox('getValue');
                if ("" != txtFK_MemberTypeCertificationId && "" != txtApplicationType) {
                    OnLoadTree();
                    $('#newAdd').window({ title: "指标关系" });
                    $("#newAdd").window("open");

                } else { msgShow("提示", "您还没有选择要查看的类型名称？", "question"); }
            }
        }, '-'
],
        pagination: false
    });
    var p = $('#tdg').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
jQuery(function ($) {
    $("#btnQuery").click(function () { OnSelectClick(); });
});
function OnSelectClick() {
    var txtApplicationType = $("#txtApplicationType").combobox('getValue');
    var txtFK_MemberTypeCertificationId = $("#txtFK_MemberTypeCertificationId").combobox('getValue');
    if ("" != txtFK_MemberTypeCertificationId && "" != txtApplicationType) {
        var url = '../ashx/IndRel.ashx?' + $.param({ action: "paging", FK_MemberTypeCertificationId: $("#txtFK_MemberTypeCertificationId").combobox('getValue'), ApplicationType: $("#txtApplicationType").combobox('getValue') });
        $('#tdg').datagrid({ url: url });
        $('#tdg').datagrid('reload');
    } else {
        msgShow("提示", "您还没有选择要查看的类型名称？", "question");
    }
};
jQuery(function ($) {
    $("#funIndicator").tree({
        url: '../Ashx/UploadTypeIndicator.ashx?action=combo',
        lines: true,
        checkbox: true,
        cascadeCheck: false
    });
});
jQuery(function ($) {
    $("#btnAdd").click(function () {
        var funList = "";
        var selected = $('#funIndicator').tree('getChecked');
        if ("" != selected) {
            for (var i = 0; i < selected.length; i++) {
                funList += selected[i].id + "|";
            }
            $.get("../Ashx/IndRel.ashx?action=add", { FunId: funList, ApplicationType: $("#txtApplicationType").combobox('getValue'), FK_MemberTypeCertificationId: $("#txtFK_MemberTypeCertificationId").combobox('getValue') }, function (data) {
                var url = '../ashx/IndRel.ashx?' + $.param({ action: "paging", FK_MemberTypeCertificationId: $("#txtFK_MemberTypeCertificationId").combobox('getValue'), ApplicationType: $("#txtApplicationType").combobox('getValue') });
                $('#tdg').datagrid({ url: url });
                $('#tdg').datagrid('reload');
                slide("提示", data);
                $("#newAdd").window("close");
            }, "text");
        } else {
            slide("提示", "您还没有选择指标名称选项！");
        }
    });
});
function OnLoadTree() {
    var nodes = $('#funIndicator').tree('getChecked');
    if ("" != nodes) {
        for (var i = 0; i < nodes.length; i++) {
            $('#funIndicator').tree("uncheck", nodes[i].target);
        }
    }
    $.get("../Ashx/IndRel.ashx?action=list", { ApplicationType: $("#txtApplicationType").combobox('getValue'), FK_MemberTypeCertificationId: $("#txtFK_MemberTypeCertificationId").combobox('getValue') }, function (data) {
        var dt = data.T;
        for (var i = 0; i < dt.length; i++) {
            var node = $('#funIndicator').tree('find', dt[i].FK_TypeIndicatorNameId); 
            $('#funIndicator').tree('check', node.target);
        }
    }, "json");
};