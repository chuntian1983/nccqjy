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
    $('#permisWin').window('close');
});
function GridView() {
    $('#tdg').datagrid({
        title: '管理员权限类型信息列表',
        iconCls: 'icon-save',
        nowrap: true,
        striped: true,
        url: '../Ashx/AdminType.ashx?action=paging&flag=' + Math.random(),
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'asc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        frozenColumns: [[
{ field: 'ck', align: 'center', checkbox: true },
{ title: '编号', field: 'Id', width: 50, align: 'left', sortable: true },
{ field: 'AdminTypeName', title: '管理员类型名称', width: 150, align: 'left', sortable: true },
{ field: 'CreateDate', title: '查看管理员类型权限', width: 150, align: 'left', sortable: true, sortable: true, formatter: function (value, row, index) { return "<span class='icon icon-edit' onclick='OnShowPermis(" + row.Id + ");'>&nbsp;&nbsp;&nbsp;&nbsp;查看详情</span>"; } }
]],
        toolbar: [],
        pagination: false
    });
    var p = $('#tdg').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
function OnShowPermis(p) {
    $("#txtAdminTypeId").val(p);
   var nodes = $('#funTree').tree('getChecked');
    if ("" != nodes) {
        for (var i = 0; i < nodes.length; i++) {
            $('#funTree').tree("uncheck", nodes[i].target);
        }
    }
    $.get("../Ashx/Permis.ashx?action=list&flag=" + Math.random(), { AdminTypeId: p }, function (data) {
        var dt = data.T;
        if ("" != dt) {
            for (var i = 0; i < dt.length; i++) {              
                var node = $('#funTree').tree('find', dt[i].NodeId); 
                $('#funTree').tree('check', node.target); 
            }
        }
    }, "json");
    $('#permisWin').window('open');
};
jQuery(function ($) {
    $("#funTree").tree({
        url: '../Ashx/SysFun.ashx?action=tree',
        lines: true,
        checkbox: true,
        cascadeCheck: false
    });
});
jQuery(function ($) {
    $("#btnAdd").click(function () {
        var funList = "";
        var selected = $('#funTree').tree('getChecked');
        if ("" != selected) {
            for (var i = 0; i < selected.length; i++) {
                funList += selected[i].id;
                if (i < selected.length - 1) { funList += "|"; }
            }
            $.get("../Ashx/Permis.ashx?action=add", { SysFunId: funList, AdminTypeId: $("#txtAdminTypeId").val() }, function (data) {
                slide("提示", data);
                $("#permisWin").window("close");
            }, "text");
        } else {
            slide("提示", "您还没有选择授权的系统菜单选项！");
        }
    });
});