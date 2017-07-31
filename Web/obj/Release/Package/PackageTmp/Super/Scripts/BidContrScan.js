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