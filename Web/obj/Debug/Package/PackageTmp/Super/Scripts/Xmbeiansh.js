jQuery(function ($) {
    GridView();
    $('#newAdd').window('close');

    $('#addOpinion').window('close');
    $('#ScanImg').window('close');
    $('#addCheck').window('close');
    $('#ScanFile').window('close');
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
jQuery(function ($) {
    $("#txtOrgCode").combotree({
        url: '../Ashx/Org.ashx?action=tree',
        lines: true,
        required: true,
        onSelect: function (rec) { OnLoadLiceOrTran(rec.id); }
    });
});
function OnLoadLiceOrTran(par) {
    $("#txtFK_LiceTranId").combotree({
        url: '../Ashx/LiceOrTran.ashx?' + $.param({ action: "ltcombo", OrgCode: par, LiceTranType: 1 }),
        lines: true,
        required: true,
        onSelect: function (rec) {
            OnShowLiceTran(rec.id);
        }
    });
};
function OnShowLiceTran(par) {
    $.get("../Ashx/LiceOrTran.ashx?action=byId", { Id: par }, function (data) {
        $("#lblAddr").text(data.rows[0].Addr);
        $("#lblMemberTypeId").text(data.rows[0].MemberTypeId);
        $("#lblCorporate").text(data.rows[0].Corporate);
        $("#lblTel").text(data.rows[0].Tel);
        $("#lblIDCard").text(data.rows[0].IDCard);
        $("#lblContact").text(data.rows[0].Contact);
        $("#lblOwner").text(data.rows[0].Owner);
        $("#lblCapital").text(data.rows[0].Capital);
        $("#lblOrganizationCode").text(data.rows[0].OrganizationCode);
    }, "json");
};
jQuery(function ($) {
    $("#txtProperties").combotree({
        url: '../Ashx/PropertyType.ashx?action=combo',
        lines: true,
        required: true,
        onSelect: function (rec) { rec.id; }
    });
});
jQuery(function ($) {
    $("#txtTurnOut").combotree({
        url: '../Ashx/TurnOutType.ashx?action=combo',
        lines: true,
        required: true,
        onSelect: function (rec) { rec.id; }
    });
});
jQuery(function ($) {
    $("#txtStandardMode").combotree({
        url: '../Ashx/StandardMode.ashx?action=combo',
        lines: true,
        required: true,
        onSelect: function (rec) { rec.id; }
    });
});
jQuery(function ($) {
    $("#txtStandardType").combotree({
        url: '../Ashx/StandardType.ashx?action=combo',
        lines: true,
        required: true,
        onSelect: function (rec) { rec.id; }
    });
});
function GridView() {
    $('#tdg').datagrid({
        fit: true,
        url: '../Ashx/Xmbeian.ashx?' + $.param({ action: "pagingxx", DepaStatus: 1 }),
        singleSelect: true,
        sortName: 'id',

        sortOrder: 'desc',

        onDblClickRow: function (rowIndex, rowData) {
            OnProcessClick(rowData.Id);
            OnBidInfoGridView(rowData.Id);
            OnltScanGridView(rowData.FK_LiceTranId);
        },
        frozenColumns: [[
{ field: 'id', title: '序号', width: 50, align: 'left', sortable: true },
{ field: 'cqname', title: '产权名称', width: 80, align: 'left', sortable: true },
{ field: 'OrgName', title: '组织单位', width: 80, align: 'left', sortable: true },
{ field: 'PropertyTypeName', title: '产权类型', width: 80, align: 'left', sortable: true },
{ field: 'guimo', title: '规模', width: 80, align: 'left', sortable: true },
{ field: 'danwei', title: '单位', width: 80, align: 'left', sortable: true },


{ field: 'cqquanshu', title: '产权权属', width: 80, align: 'left', sortable: true },
{ field: 'churangfang', title: '出让方', width: 80, align: 'left', sortable: true },
{ field: 'beiyong', title: '审核状态', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
    if (row.beiyong == "1") {
        return "未提交";

    } else if (row.beiyong == "2") {
        return "提交审核";

    } else if (row.beiyong == "3") {
        return "审核通过";

    }
}
}

]], columns: [[

{ field: 'churangfangxingzhi', title: '出让方性质', width: 80, align: 'left', sortable: true },
{ field: 'shourangfang', title: '受让方', width: 80, align: 'left', sortable: true },
{ field: 'shourangfangxingzhi', title: '受让方性质', width: 80, align: 'left', sortable: true },
{ field: 'jiaoyifangshi', title: '交易方式', width: 80, align: 'left', sortable: true },

{ field: 'hetongksrq', title: '合同起始日期', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
    return getMyDate(row.hetongksrq).substring(0, 10);
}
},
{ field: 'hetongjsrq', title: '合同结束日期', width: 50, align: 'left', sortable: true, formatter: function (value, row, index) {
    return getMyDate(row.hetongksrq).substring(0, 10);
}
},
{ field: 'chengjiaodanjia', title: '成交单价', width: 50, align: 'left', sortable: true },
{ field: 'changjiaozongjia', title: '成交总价', width: 50, align: 'left', sortable: true },
{ field: 'zhifufangshi', title: '支付方式', width: 80, align: 'left', sortable: true },
{ field: 'beizhu', title: '备注', width: 80, align: 'left', sortable: true }


]],
        toolbar: [{
            id: 'btnstate',
            text: '审核信息',
            iconCls: 'icon-filter',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    var fgid = rows[0].beiyong;
                    if (fgid == "2") {
                        $('#addCheck').window('open');
                        $("#txtSay").val("审核通过");
                    }
                    else { msgShow("提示", "您没有权限进行操作！"); }
                }
                else {
                    msgShow("提示", "您还没有选中要更改的列信息？", "question");
                }
            }
        }, '-'
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
    $("#btnCheckAdd").click(function () {
        if ("" != $("#txtSay").val()) {
            $.get("../Ashx/Xmbeian.ashx?action=shenheSC", { AcceptSay: $("#txtSay").val(), BidId: $('#tdg').datagrid('getSelections')[0].id, UpManager: $('#tdg').datagrid('getSelections')[0].UpManager, OrgCode: $('#tdg').datagrid('getSelections')[0].oCode, DepaStatusId: $('#tdg').datagrid('getSelections')[0].DepaStatusId }, function (data) {
                msgShow("提示", data, "info");
                $('#addCheck').window('close');
                $("#txtSay").val("");
                $('#tdg').datagrid('reload');
                $('#tdg').datagrid('clearSelections');
            }, "text");
        }
        else {
            msgShow("提示", "审核意见还没有填写！", "info");
        }
    });
});
jQuery(function ($) {
    $("#btnQuery").click(function () {
        var tBidName = $("#tBidName").textbox('getValue');
        var url = '../Ashx/BidH.ashx?' + $.param({ action: "paging", BidName: tBidName, DepaStatus: 1 });
        $('#tdg').datagrid({ url: url });
        $('#tdg').datagrid('reload');
    });
});
function OnEmptyTextClick() {
    $("#txtOrgCode").combotree("setValue", "");


    $("#txtBidName").textbox("setValue", "");
    $("#txtProperties").combotree("setValue", "");
    $("#txtOwnership").textbox("setValue", "");
    $("#txtguimo").textbox("setValue", "");
    //    $("#comgmdw").textbox("setValue", "");
    $("#txtcrf").textbox("setValue", "");
    $("#txtcrfxz").textbox("setValue", "");
    $("#txtsrf").textbox("setValue", "");
    $("#txtsrfxz").textbox("setValue", "");
    $("#txtStandardMode").combotree("setValue", "");
    $("#txtStartDate").datebox("setValue", "");
    $("#txtEndDate").datebox("setValue", "");
    $("#txtdanjia").textbox("setValue", "");
    $("#txtzongjia").textbox("setValue", "");
    $("#txtzffs").textbox("setValue", "");
    $("#txtbeizhu").textbox("setValue", "");
};
jQuery(function ($) {
    $("#btnEdit").click(function () {
        $('#forms').form('submit', {
            url: '../Ashx/Xmbeian.ashx?action=up',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
                $('#newAdd').window('close');
                $('#tdg').datagrid('reload');
            }
        });
        //OnEmptyTextClick();

    });
});
jQuery(function ($) {
    $("#btnAdd").click(function () {
        $('#forms').form('submit', {
            url: '../Ashx/Xmbeian.ashx?action=add',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                OnEmptyTextClick();
                $('#newAdd').window('close');
                $('#tdg').datagrid('reload');
                msgShow("提示", data, "info");
            }
        });

    });
});
jQuery(function ($) {
    $("#btnCancel").click(function () {
        OnEmptyTextClick();
        $('#newAdd').window('close');
        $('#tdg').datagrid('reload');
    });
});
function OnltScanGridView(par) {
    $('#Scan').datagrid({
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
    var p = $('#Scan').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
function OnBidInfoGridView(par) {
    $('#BidInfo').datagrid({
        nowrap: true,
        striped: true,
        url: '../Ashx/BidInfo.ashx?' + $.param({ action: "paging", BidId: par }),
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'desc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        columns: [[
            { field: 'Id', title: '编号', width: 30, align: 'left', sortable: true },
            { field: 'FK_JobId', title: '部门名称', width: 80, align: 'left', sortable: true },
            { field: 'ReturnDepaName', title: '撤回人', width: 80, align: 'left', sortable: true },
            { field: 'ReturnDepaSay', title: '撤回意见', width: 150, align: 'left', sortable: true },
            { field: 'ReturnDate', title: '撤回时间', width: 80, align: 'left', sortable: true }
        ]]
    });
    var p = $('#BidInfo').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
function OnProcessClick(par) {
    $.get("../Ashx/TranPro.ashx?action=by", { BidId: par }, function (data) {
        var vt = "";
        data.AcceptDate != null ? vt += "<p>受理时间：" + data.AcceptDate.replace('T', ' ') + "&nbsp;&nbsp;<br/>" : vt += "<p>受理时间：&nbsp;&nbsp;<br/>";
        vt += "受理人姓名：" + data.AcceptName + "&nbsp;&nbsp;<br/>";
        vt += "受理意见：" + data.AcceptSay + "&nbsp;&nbsp;<br/>";
        data.AcceptSayDate != null ? vt += "受理意见时间：" + data.AcceptSayDate.replace('T', ' ') + "<hr/></p>" : vt += "受理意见时间：<hr/></p>";
        data.AuditDate != null ? vt += "<p>审核受理时间：" + data.AuditDate.replace('T', ' ') + "&nbsp;&nbsp;<br/>" : vt += "<p>审核受理时间：&nbsp;&nbsp;<br/>";
        vt += "审核人姓名：" + data.AuditName + "&nbsp;&nbsp;<br/>";
        vt += "审核挂牌意见：" + data.AuditSay + "&nbsp;&nbsp;<br/>";
        data.AuditSayDate != null ? vt += "审核意见时间：" + data.AuditSayDate.replace('T', ' ') + "<hr/></p>" : vt += "审核意见时间：<hr/></p>";
        data.TradingDate != null ? vt += "<p>交易受理时间：" + data.TradingDate.replace('T', ' ') + "&nbsp;&nbsp;<br/>" : vt += "<p>交易受理时间：&nbsp;&nbsp;<br/>";
        vt += "交易受理姓名：" + data.TradingName + "&nbsp;&nbsp;<br/>";
        vt += "交易受理意见：" + data.TradingSay + "&nbsp;&nbsp;<br/>";
        data.TradingSayDate != null ? vt += "交易意见时间：" + data.TradingSayDate.replace('T', ' ') + "<hr/></p>" : vt += "交易意见时间：<hr/></p>";

        data.AttestationDate != null ? vt += "<p>鉴证受理时间：" + data.AttestationDate.replace('T', ' ') + "&nbsp;&nbsp;<br/>" : vt += "<p>鉴证受理时间：&nbsp;&nbsp;<br/>";
        vt += "鉴证受理姓名：" + data.AttestationName + "&nbsp;&nbsp;<br/>";
        vt += "鉴证受理意见：" + data.AttestationSay + "&nbsp;&nbsp;<br/>";
        data.AttestationSayDate != null ? vt += "鉴证意见时间：" + data.AttestationSayDate.replace('T', ' ') + "<hr/></p>" : vt += "鉴证意见时间：<hr/></p>";
        data.HeadDate != null ? vt += "<p>分管受理时间：" + data.HeadDate.replace('T', ' ') + "&nbsp;&nbsp;<br/>" : vt += "<p>分管受理时间：&nbsp;&nbsp;<br/>"
        vt += "分管受理姓名：" + data.HeadName + "&nbsp;&nbsp;<br/>";
        vt += "分管受理意见：" + data.HeadSay + "&nbsp;&nbsp;<br/>";
        data.HeadSayDate != null ?
        vt += "分管意见时间：" + data.HeadSayDate.replace('T', ' ') + "<hr/></p>" : vt += "分管意见时间：<hr/></p>";
        data.SuperDate != null ?
        vt += "<p>主管受理时间：" + data.SuperDate.replace('T', ' ') + "&nbsp;&nbsp;<br/>" : vt += "<p>主管受理时间：&nbsp;&nbsp;<br/>";
        vt += "主管受理姓名：" + data.SuperName + "&nbsp;&nbsp;<br/>";
        vt += "主管受理意见：" + data.SuperSay + "&nbsp;&nbsp;<br/>";
        data.SuperSayDate != null ?
        vt += "主管意见时间：" + data.SuperSayDate.replace('T', ' ') + "</p>" : vt += "主管意见时间：</p>";
        $("#lblProcess").html(vt);
    }, "json");
};
function OnUploadFile(p) {

    $('#ScanFile').window('open');
    //    $("#ScanUpload").attr("src", "ScanUpload.aspx?p=" + p);
    $("#ScanUpload").attr("src", "fujianupload.aspx?p=" + p);
};
function OnUploadFileView(p) {

    $('#ScanFile').window('open');
    //    $("#ScanUpload").attr("src", "ScanUpload.aspx?p=" + p);
    $("#ScanUpload").attr("src", "fujianview.aspx?p=" + p);
};
//获得年月日      得到日期oTime  
function getMyDate(str) {
    var oDate = new Date(str),
            oYear = oDate.getFullYear(),
            oMonth = oDate.getMonth() + 1,
            oDay = oDate.getDate(),
            oHour = oDate.getHours(),
            oMin = oDate.getMinutes(),
            oSen = oDate.getSeconds(),
            oTime = oYear + '-' + getzf(oMonth) + '-' + getzf(oDay) + ' ' + getzf(oHour) + ':' + getzf(oMin) + ':' + getzf(oSen); //最后拼接时间  
    return oTime;
};
//补0操作  
function getzf(num) {
    if (parseInt(num) < 10) {
        num = '0' + num;
    }
    return num;
}  