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
    $("#btnQuery").click(OnSelectClick);
    $('#logsWin').window('close');
    $('#winMap').window('close');
});
function GridView() {
    $('#tdg').datagrid({
        title: '系统操作日志记录',
        iconCls: 'icon-save',
        nowrap: false,
        striped: true,
        url: '../Ashx/Logs.ashx?action=paging',
        remoteSort: false,
        singleSelect: true,
        sortName: 'CreateDate',
        sortOrder: 'desc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        onDblClickRow: function (rowIndex, rowData) {
            OnShowIpAddress(rowData.IpAdd);
        },
        frozenColumns: [[
{ title: '编号', field: 'Id', width: 50, align: 'left' }
]],
        columns: [[
{ field: 'LogValue', title: '操作模块', width: 80, align: 'left' },
{ field: 'Operates', title: '操作类型内容', width: 80, align: 'left' },
{ field: 'IpAdd', title: 'IP地址', width: 80, align: 'left' },
{ field: 'MacAdd', title: 'Mac地址', width: 80, align: 'left' },
{ field: 'Editor', title: '操作人', width: 80, align: 'left' },
{ field: 'CreateDate', title: '操作时间', width: 80, align: 'left', sortable: true }
]],
        toolbar: ['-', {
            id: 'btncut',
            text: '删除',
            iconCls: 'icon-no',
            handler: function () {
                $.messager.confirm('询问提示', '您确定要清空操作日志吗？', function (data) {
                    if (data) {
                        $.get("../Ashx/Logs.ashx?action=del", {}, function (data) {
                            msgShow("提示", data, "info");
                            $('#tdg').datagrid('reload');
                        }, "text");
                    }
                });
            }
        }, '-'],
        pagination: true,
        pageSize: 20
    });
    var p = $('#tdg').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
function OnSelectClick() {
    if ($("#txtstateDate").datebox('getValue') == "") {
        msgShow("提示", "查询开始时间不能为空！", "error");
        $("#txtstateDate").focus();
        return;
    }
    if ($("#txtendDate").datebox('getValue') == "") {
        msgShow("提示", "结束查询时间不能为空！", "error");
        $("#txtendDate").focus();
        return;
    }
    var stateDate = $("#txtstateDate").datebox('getValue');
    var endDate = $("#txtendDate").datebox('getValue');
    var url = '../Ashx/Logs.ashx?' + $.param({ action: "paging", StateDate: stateDate, EndDate: endDate });
    $('#tdg').datagrid({ url: url });
    $('#tdg').datagrid('reload');
};
function OnShowIpAddress(ip) {
    $.get("../Ashx/Logs.ashx?action=sel", { Ip: ip }, function (json) {
        if ("0" == json.error) {
            $('#logsWin').window('open');
            $("#lblcountry").text(json.data.country);
            $("#lblprovince").text(json.data.province);
            $("#lblcity").text(json.data.city);
            $("#lbloperator").text(json.data.operator);
            $("#lbllat").text(json.data.lat.replace("null", ""));
            $("#lbllng").text(json.data.lng.replace("null", ""));
        } else {
            msgShow("提示", json.msg, "info");
        }
    }, "json");
};
jQuery(function ($) {
    $("#btnShoeMap").click(function () {
        if ("" != $("#lbllat").text() || "" != $("#lbllng").text()) {
            $('#winMap').window('open');
            $("#imMap").attr("src", "Map.aspx?lat=" + $("#lbllat").text() + "&lng=" + $("#lbllng").text());
        } else {
            msgShow("提示", "没有经纬度坐标数据！", "info");
        }
    });
});