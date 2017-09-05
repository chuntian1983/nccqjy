jQuery(function ($) {
    GridView();
    $('#newAdd').window('close');
    $('#ScanImg').window('close');
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
        url: '../Handler/CommH.ashx?action=tree',
        lines: true,
        required: true,
        onSelect: function (rec) {
            $("#txtTradingCenterName").textbox("setValue", rec.text + "农村综合产权交易中心");
            OnLoadLiceOrTran();
        }
    });
});
function OnLoadLiceOrTran() {
    $("#txtFK_LiceTranId").combotree({
        url: '../Handler/WebLiTrH.ashx?' + $.param({ action: "ltcombo", LiceTranId: 1 }),
        lines: true,
        required: true,
        onSelect: function (rec) {
            OnShowLiceTran(rec.id);
        }
    });
};
function OnShowLiceTran(par) {
    $.get("../Handler/WebLiTrH.ashx?action=by", { Id: par }, function (data) {
        $("#lblAddr").text(data.Addr);
        $("#lblMemberTypeId").text(data.MemberTypeId);
        $("#lblCorporate").text(data.Corporate);
        $("#lblTel").text(data.Tel);
        $("#lblIDCard").text(data.IDCard);
        $("#lblContact").text(data.Contact);
        $("#lblOwner").text(data.Owner);
        $("#lblCapital").text(data.Capital);
        $("#lblOrganizationCode").text(data.OrganizationCode);
    }, "json");
};
jQuery(function ($) {
    $("#txtProperties").combotree({
        url: '../Handler/CommH.ashx?action=ptcombo',
        lines: true,
        required: true,
        onSelect: function (rec) { rec.id; }
    });
});
jQuery(function ($) {
    $("#txtTurnOut").combotree({
        url: '../Handler/CommH.ashx?action=ttcombo',
        lines: true,
        required: true,
        onSelect: function (rec) { rec.id; }
    });
});
jQuery(function ($) {
    $("#txtStandardMode").combotree({
        url: '../Handler/CommH.ashx?action=smcombo',
        lines: true,
        required: true,
        onSelect: function (rec) { rec.id; }
    });
});
jQuery(function ($) {
    $("#txtStandardType").combotree({
        url: '../Handler/CommH.ashx?action=stcombo',
        lines: true,
        required: true,
        onSelect: function (rec) { rec.id; }
    });
});
function GridView() {
    $('#tdg').datagrid({
        nowrap: true,
        striped: true,
        url: '../Handler/WebBidH.ashx?' + $.param({ action: "paging" }),
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'desc',
        fitColumns: false,
        rownumbers: true,
        fit: true,
        onDblClickRow: function (rowIndex, rowData) {
            OnProcessClick(rowData.Id);
            OnBidInfoGridView(rowData.Id);
            OnltScanGridView(rowData.FK_LiceTranId);
        },
        frozenColumns: [[
{ field: 'Id', title: '序号', width: 50, align: 'left', sortable: true },
{ field: 'OrgCode', title: '组织单位', width: 80, align: 'left', sortable: true },
{ field: 'oCode', title: '组织单位代码', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'FK_LiceTranId', title: '编号', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'LiceTran', title: '出让方姓名', width: 80, align: 'left', sortable: true },
{ field: 'ReturnStatus', title: '状态', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.ReturnStatus == 0 ? "<span style='color:blue;'>正常</span>" : "<span style='color:red;'>撤回<span>"; } }
]], columns: [[
{ field: 'BidName', title: '标的名称', width: 80, align: 'left', sortable: true },
{ field: 'ListingPrice', title: '挂牌价格', width: 80, align: 'left', sortable: true },
{ field: 'StartDate', title: '转出开始时间', width: 80, align: 'left', sortable: true },
{ field: 'EndDate', title: '转出结束时间', width: 80, align: 'left', sortable: true },
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
            id: 'btnadd',
            text: '新建',
            iconCls: 'icon-add',
            handler: function () {
                $('#newAdd').window({ title: "添加出让标信息" });
                $("#newAdd").window("open");
                $("#btnAdd").show();
                $("#btnEdit").hide();
                $.get("../Handler/WebBidH.ashx?action=max", function (data) {                
                    $("#lblAdmissibility").text(data.N);
                    $("#txtAdmissibility").val(data.N);                  
                }, "json");
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
                            $.get("../Handler/WebBidH.ashx?action=del", { id: rows[0].Id, UpManager: rows[0].UpManager, OrgCode: rows[0].oCode }, function (data) {
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
                    $('#newAdd').window({ title: "修改出让标信息" });
                    $('#newAdd').window('open');
                    OnEmptyTextClick();
                    $.get("../Handler/WebBidH.ashx?action=by", { Id: rows[0].Id }, function (data) {                     
                        $("#lblAdmissibility").text(data.Admissibility);                      
                        $("#txtAdmissibility").val(data.Admissibility);
                        $("#txtOrgCode").combotree("setValue", data.OrgCode);
                        OnLoadLiceOrTran(data.OrgCode);
                        $("#txtFK_LiceTranId").combotree("setValue", data.FK_LiceTranId);
                        OnShowLiceTran(data.FK_LiceTranId);
                        $("#txtBidName").textbox("setValue", data.BidName);
                        $("#txtListingPrice").textbox("setValue", data.ListingPrice);
                        $("#txtStartDate").datebox("setValue", data.StartDate);
                        $("#txtEndDate").datebox("setValue", data.EndDate);
                        $("#txtBidBasic").val(data.BidBasic);
                        $("#txtProperties").combotree("setValue", data.Properties);
                        $("#txtTurnOut").combotree("setValue", data.TurnOut);
                        $("#txtWarrantNumber").textbox("setValue", data.WarrantNumber);
                        $("#txtRightsBodies").textbox("setValue", data.RightsBodies);
                        $("#txtFeedingMechanism").textbox("setValue", data.FeedingMechanism);
                        $("#txtStandardMode").combotree("setValue", data.StandardMode);
                        $("#txtLowTransaction").textbox("setValue", data.LowTransaction);
                        $("#txtTurnover").textbox("setValue", data.Turnover);
                        $("#txtRelatesNum").textbox("setValue", data.RelatesNum);
                        $("#txtStandardType").combotree("setValue", data.StandardType);
                        $("#txtPublicity").textbox("setValue", data.Publicity);
                        $("#txtUpManager").combobox("setValue", data.UpManager);
                        $("#txtTradingCenterName").textbox("setValue", data.TradingCenterName);
                        $("#txtLost").val(data.Lost);
                        $("#txtId").val(data.Id);
                        $("#txtCancel").val(data.Cancel);
                        $("#txtChange").val(data.Change);
                        $("#txtReturnStatus").val(data.ReturnStatus);
                        $("#txtDepaStatus").val(data.DepaStatus);
                        $("#txtAreContract").val(data.AreContract);
                        $("#txtNoAssurance").val(data.NoAssurance);                     
                        $("#txtContractNo").val(data.ContractNo);
                        $("#txtContractDate").val(data.ContractDate);
                    }, "json");
                    $("#btnAdd").hide();
                    $("#btnEdit").show();
                } else {
                    msgShow("提示", "您还没有选中要修改的列信息？", "warning");
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
function OnEmptyTextClick() { 
    $("#txtAdmissibility").val("");
    $("#txtOrgCode").combotree("setValue", "");
    $("#txtFK_LiceTranId").combotree("setValue", "");
    $("#lblAddr").text("");
    $("#lblMemberTypeId").text("");
    $("#lblCorporate").text("");
    $("#lblTel").text("");
    $("#lblIDCard").text("");   
    $("#lblAdmissibility").text("");
    $("#txtBidName").textbox("setValue", "");
    $("#txtListingPrice").textbox("setValue", "");
    $("#txtStartDate").datebox("setValue", "");
    $("#txtEndDate").datebox("setValue", "");
    $("#txtBidBasic").val("");
    $("#txtProperties").combotree("setValue", "");
    $("#txtTurnOut").combotree("setValue", "");
    $("#txtWarrantNumber").textbox("setValue", "");
    $("#txtRightsBodies").textbox("setValue", "");
    $("#txtFeedingMechanism").textbox("setValue", "");
    $("#txtStandardMode").combotree("setValue", "");
    $("#txtLowTransaction").textbox("setValue", "");
    $("#txtTurnover").textbox("setValue", "");
    $("#txtRelatesNum").textbox("setValue", "");
    $("#txtStandardType").combotree("setValue", "");
    $("#txtPublicity").textbox("setValue", "");
    $("#txtUpManager").combobox("setValue", "0");
    $("#txtTradingCenterName").textbox("setValue", "");
    $("#txtLost").val("");
    $("#txtId").val("");
    $("#txtCancel").val("");
    $("#txtChange").val("");
    $("#txtReturnStatus").val("");
    $("#txtDepaStatus").val("");
    $("#txtAreContract").val("");
    $("#txtNoAssurance").val("");   
    $("#txtContractNo").val("");
    $("#txtContractDate").val("");
    $("#lblContact").text("");
    $("#lblOwner").text("");
    $("#lblCapital").text("");
    $("#lblOrganizationCode").text("");
};
jQuery(function ($) {
    $("#btnEdit").click(function () {
        $('#forms').form('submit', {
            url: '../Handler/WebBidH.ashx?action=up',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
            }
        });
        OnEmptyTextClick();
        $('#newAdd').window('close');
        $('#tdg').datagrid('reload');
    });
});
jQuery(function ($) {
    $("#btnAdd").click(function () {
        $('#forms').form('submit', {
            url: '../Handler/WebBidH.ashx?action=add',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
            }
        });
        OnEmptyTextClick();
        $('#newAdd').window('close');
        $('#tdg').datagrid('reload');
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
        url: '../Handler/LiTrScanH.ashx?' + $.param({ action: "LiTrScanpaging", LiceTranId: par }),
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
        url: '../Handler/LiTrScanH.ashx?' + $.param({ action: "bidInfopaging", BidId: par }),
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
    $.get("../Handler/LiTrScanH.ashx?action=TranProcessby", { BidId: par }, function (data) {      
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