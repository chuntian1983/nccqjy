jQuery(function ($) {
    GridView();
    $('#addPrint').window('close');
    $('#ScanFile').window('close');
});

function GridView() {
    $('#tdg').datagrid({
        title: '产权交易鉴证书打印',
        iconCls: 'icon-save',
        nowrap: true,
        striped: true,
        url: '../Ashx/BidH.ashx?' + $.param({ action: "pagingA", DepaStatus: 7, StandardMode: 1 }),
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'desc',
        fitColumns: false,
        rownumbers: true,
        fit: true,
        frozenColumns: [[
{ field: 'Id', title: '序号', width: 50, align: 'left', sortable: true },
{ field: 'OrgCode', title: '组织单位', width: 80, align: 'left', sortable: true },
{ field: 'oCode', title: '组织单位代码', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'FK_LiceTranId', title: '编号', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'LiceTran', title: '出让方姓名', width: 80, align: 'left', sortable: true },
{ field: 'ReturnStatus', title: '状态', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.ReturnStatus == 0 ? "<span style='color:blue;'>正常</span>" : "<span style='color:red;'>撤回<span>"; } }
]], columns: [[
{ field: 'BidName', title: '标的名称', width: 80, align: 'left', sortable: true },
{ field: 'NoAssurance', title: '鉴证号', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return "HJNJ" + row.NoAssurance; } },
{ field: 'ListingPrice', title: '挂牌价格', width: 80, align: 'left', sortable: true },

{ field: 'Ownership', title: '权属', width: 80, align: 'left', sortable: true },
{ field: 'Properties', title: '性质', width: 50, align: 'left', sortable: true },
{ field: 'TurnOut', title: '转出方式', width: 50, align: 'left', sortable: true },
{ field: 'RightsBodies', title: '确权机构', width: 50, align: 'left', sortable: true },
{ field: 'FeedingMechanism', title: '转出批准机构', width: 80, align: 'left', sortable: true },
{ field: 'WarrantNumber', title: '权证编号', width: 80, align: 'left', sortable: true },
{ field: 'StandardMode', title: '交易方式', width: 80, align: 'left', sortable: true },
{ field: 'TradingCenterName', title: '交易中心名称', width: 80, align: 'left', sortable: true },
{ field: 'RelatesNum', title: '涉及农户数', width: 80, align: 'left', sortable: true },
{ field: 'Publicity', title: '公示期', width: 80, align: 'left', sortable: true },
{ field: 'UpManager', title: '上级审核', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'DepaStatusId', title: '分管部门编号', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'DepaStatus', title: '分管部门', width: 80, align: 'left', sortable: true }
]],
        toolbar: [{
            id: 'btnprint',
            text: '打印',
            iconCls: 'icon-print',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $('#addPrint').window('open');
                    $("#txtFK_BidId").val(rows[0].Id);
                    $("#txtReason").val("正常打印鉴证书");
                }
                else {
                    msgShow("提示", "您还没有选中要更改的列信息？", "question");
                }
            }
        }, '-',
        {
            id: 'btnyulan',
            text: '鉴证预览',
            iconCls: 'icon-filter',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    window.open("jzsview.aspx?p=" + rows[0].Id);
                    //                    WinOpen(rows[0].Id);
                    //                    $("#txtId").val(rows[0].Id);


                } else {
                    msgShow("提示", "您还没有选中列的信息？", "question");
                }
            }
        }, '-', {
            id: 'btnprintsq',
            text: '打印申请',
            iconCls: 'icon-print',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                   
                   
                    WinOpen(rows[0].Id)
                }
                else {
                    msgShow("提示", "您还没有选中要申请的列信息？", "question");
                }
            }
        }
],
        pagination: true,
        pageSize: 30
    });
    var p = $('#tdg').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
function msgShow(title, msgString, msgType) {
    $.messager.alert(title, msgString, msgType);
};
jQuery(function ($) {
    $("#btnPrintAdd").click(function () {
        var strid = $("#txtFK_BidId").val();
        $('#forms').form('submit', {
            url: '../Ashx/BidPrint.ashx?action=add&id='+strid,
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                if ("OK" == data) {
                    //2016-10-13修改bug本来默认写死的是传的id=3showModelessDialog
                    var id = $("#txtFK_BidId").val();
                    //window.open('daying.aspx?id='+id,'鉴证书打印','width=1200px,height=800px,resizable=yes,status=yes');
                    window.open('attprint.aspx?id=' + id, '鉴证书打印', 'width=1200px,height=800px,resizable=yes,status=yes');
            }
            else if ("1" == data) {
                msgShow("提示", "您已经打印超过3次，请进行打印申请，通过之后进行打印", "info");
                }
            else if ("2" == data) {
                msgShow("提示", "您选择的信息已经超过3次，正在进行打印申请，通过之后才可以进行打印", "info");
            } 
            else{
                    msgShow("提示", data, "info");
                }
                $('#addPrint').window('close');
            }
        });
    });
});
function WinOpen(p) {
    
    $.get("../Ashx/BidPrint.ashx?action=sqs", { pid:p},
          function (data) {
              if (data == "OK") {
                  $('#ScanFile').window('open');
                  //    $("#ScanUpload").attr("src", "ScanUpload.aspx?p=" + p);
                  $("#ScanUpload").attr("src", "jzsdysq.aspx?p=" + p);
              }
              else if (data=="2") {
                  msgShow("提示", "您选择的信息已结进行申请打印，通过之后才能进行打印。", "info");
              } 
              else{
                  msgShow("提示", "您选择的信息可以进行打印，未超过3次限制，不用进行打印申请。", "info");
              }
          });
   
};