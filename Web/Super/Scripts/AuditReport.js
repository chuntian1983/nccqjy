jQuery(function ($) {
    GridView();
    $('#newAdd').window('close');
    $('#addOpinion').window('close');
    $('#ScanImg').window('close');
    $('#addCheck').window('close');
    $('#ReturnInfo').window('close');
    $('#BidPla').window('close');
    $('#BidTrans').window('close');
    $('#BidScan').window('close');
    $('#BidAuct').window('close');
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
    height:350,
        nowrap: true,
        striped: true,
        url: '../Ashx/BidH.ashx?' + $.param({ action: "paging", DepaStatus: 3, StandardMode: 1 ,bt:"OK"}),
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'desc',
        fitColumns: false,
        rownumbers: true,
        fit: false,
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
{ field: 'DepaStatus', title: '分管部门', width: 80, align: 'left', sortable: true },
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
{ field: 'DepaStatusId', title: '分管部门编号', width: 80, align: 'left', sortable: true, hidden: true }

]],
        toolbar: [{
            id: 'btnundo',
            text: '退回审核',
            iconCls: 'icon-undo',
            handler: function () {
                $('#ReturnInfo').window('open');
            }
        }, '-', {
            id: 'btnstate',
            text: '审核上报',
            iconCls: 'icon-filter',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $('#addCheck').window('open');
                    $("#txtSay").val("审核通过");
                }
                else {
                    msgShow("提示", "您还没有选中要更改的列信息？", "question");
                }
            }
        }, '-', {
            id: 'btnok',
            text: '详细信息',
            iconCls: 'icon-ok',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $('#newAdd').window('open');
                    $.get("../Ashx/BidH.ashx?action=byId", { Id: rows[0].Id }, function (data) {
                        $("#lblAddr").text(data.T[0].Addr);
                        $("#lblMemberTypeId").text(data.T[0].TypeCertificationName);
                        $("#lblCorporate").text(data.T[0].Corporate);
                        $("#lblTel").text(data.T[0].Tel);
                        $("#lblContact").text(data.T[0].Contact);
                        $("#lblOwner").text(data.T[0].Owner);
                        $("#lblCapital").text(data.T[0].Capital);
                        $("#lblOrganizationCode").text(data.T[0].OrganizationCode);
                        $("#lblIDCard").text(data.T[0].IDCard);
                        $("#txtFK_LiceTranId").text(data.T[0].Name);
                        $("#txtOrgCode").text(data.T[0].OrgCode);
                        $("#txtBidName").text(data.T[0].BidName);                    
                        $("#lblAdmissibility").text(data.T[0].Admissibility);
                        $("#txtListingPrice").text(data.T[0].ListingPrice);
                        $("#txtStartDate").text(data.T[0].StartDate.substring(0, 10));
                        $("#txtEndDate").text(data.T[0].EndDate.substring(0, 10));
                        $("#txtProperties").text(data.T[0].Properties);
                        $("#txtOwnership").text(data.T[0].Ownership);
                        $("#txtBidBasic").text(data.T[0].BidBasic);
                        $("#txtTurnOut").text(data.T[0].TurnOut);
                        $("#txtWarrantNumber").text(data.T[0].WarrantNumber);
                        $("#txtRightsBodies").text(data.T[0].RightsBodies);
                        $("#txtFeedingMechanism").text(data.T[0].FeedingMechanism);
                        $("#txtStandardMode").text(data.T[0].StandardMode);
                        $("#txtRelatesNum").text(data.T[0].RelatesNum);
                        $("#txtStandardType").text(data.T[0].StandardType);
                        $("#txtPublicity").text(data.T[0].Publicity);
                        $("#txtTradingCenterName").text(data.T[0].TradingCenterName);
                    }, "json");
                } else {
                    msgShow("提示", "您还没有选中要查看的列信息？", "question");
                }
            }
        }, '-', {
            id: 'btnadd',
            text: '招标公告',
            iconCls: 'icon-add',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $('#BidPla').window('open');
                    $.get("../Ashx/BidPlac.ashx?action=byId", { Id: rows[0].Id }, function (data) {
                        if (null == data) {
                            $("#txtBidPlacardTitle").text("");
                            $("#txtBidPlacardContent").text("");
                        } else {
                            $("#txtBidPlacardTitle").text(data.BidPlacardTitle);
                            $("#txtBidPlacardContent").text(data.BidPlacardContent);
                        }

                    }, "json");
                } else {
                    msgShow("提示", "您还没有选中一列信息？", "question");
                }
            }
        }, '-', {
            id: 'btnedit',
            text: '竞价单',
            iconCls: 'icon-edit',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $('#BidAuct').window('open');                   
                    OnBidAuctionList(rows[0].Id);
                } else {
                    msgShow("提示", "您还没有选中一列信息？", "question");
                }
            }
        }, '-', {
            id: 'btnsave',
            text: '标成交附件',
            iconCls: 'icon-save',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $('#BidScan').window('open');
                    $("#BidScanPage").attr("src", "BidClinchScan.aspx?FK_BidId=" + rows[0].Id);
                } else {
                    msgShow("提示", "您还没有选中一列信息？", "question");
                }
            }
        }, '-', {
            id: 'btnsave',
            text: '意向受让方信息',
            iconCls: 'icon-man',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $('#BidTrans').window('open');
                    OnBidTraGridView('../Ashx/BidTran.ashx?' + $.param({ action: "list", Id: rows[0].Id }));
                } else {
                    msgShow("提示", "您还没有选中一列信息？", "question");
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
function OnBidAuctionList(id) {
    $.get("../Ashx/BidAucti.ashx?action=paging", { Id: id }, function (data) {
        $("#BidAuctList tr").remove();
        var t = "";
        var productData = data.T;
        $.each(productData, function (i, n) {
            t += "<tr><td height=\"35\" colspan=\"4\" align=\"center\">&nbsp;[" + n.BidName + "]标第[" + n.SeveralBid + "]次竞价单</td></tr><tr><td width=\"83\" align=\"center\" height=\"35\">标的名称</td><td width=\"151\">&nbsp;" + n.BidName + "</td><td width=\"80\" align=\"center\">竞价方名称</td><td width=\"158\">&nbsp;" + n.Name + "</td></tr><tr><td align=\"center\" height=\"35\">几次竞价</td><td>&nbsp;" + n.SeveralBid + "</td><td align=\"center\">价格</td><td>&nbsp;" + n.Price + "元</td></tr><tr><td align=\"center\" height=\"35\">竞价时间</td><td>&nbsp;" + n.AuctionDate + "</td><td align=\"center\">操作人</td><td>&nbsp;" + n.Editor + "</td></tr>";
        });
        $("#BidAuctList").append(t);
    }, "json");
};
function OnBidTraGridView(u) {
    $('#BidTra').datagrid({
        nowrap: true,
        striped: true,
        url: u,
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'desc',
        fitColumns: false,
        rownumbers: true,
        fit: false,
        onDblClickRow: function (rowIndex, rowData) {
            $(function () {
                OnltScanGridView(rowData.FK_LiceTranId);
            });
        },
        columns: [[
        { field: 'FK_LiceTranId', title: '编号', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'Id', title: '序号', width: 40, align: 'left', sortable: true },
{ field: 'Name', title: '受让方名称', width: 100, align: 'left', sortable: true },
{ field: 'Addr', title: '住址', width: 180, align: 'left', sortable: true },
{ field: 'TypeCertificationName', title: '经济类型', width: 150, align: 'left', sortable: true },
{ field: 'Corporate', title: '法定代表人', width: 100, align: 'left', sortable: true },
{ field: 'Contact', title: '联系人', width: 100, align: 'left', sortable: true },
{ field: 'Owner', title: '所有权人', width: 100, align: 'left', sortable: true },
{ field: 'Tel', title: '联系电话', width: 100, align: 'left', sortable: true },
{ field: 'IDCard', title: '身份证号码', width: 130, align: 'left', sortable: true },
{ field: 'Capital', title: '注册资本', width: 80, align: 'left', sortable: true },
{ field: 'OrganizationCode', title: '组织机构代码', width: 130, align: 'left', sortable: true }
]],
        pagination: false,
        pageSize: 10
    });
    var p = $('#BidTra').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
jQuery(function ($) {
    $("#btnCheckAdd").click(function () {
        if ("" != $("#txtSay").val()) {
            $.get("../Ashx/TranPro.ashx?action=add", { AcceptSay: $("#txtSay").val(), BidId: $('#tdg').datagrid('getSelections')[0].Id, UpManager: $('#tdg').datagrid('getSelections')[0].UpManager, OrgCode: $('#tdg').datagrid('getSelections')[0].oCode, DepaStatusId: $('#tdg').datagrid('getSelections')[0].DepaStatusId }, function (data) {
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
        var url = '../Ashx/BidH.ashx?' + $.param({ action: "pagingA", BidName: tBidName, DepaStatus: 1, StandardMode: 1 });
        $('#tdg').datagrid({ url: url });
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
            OnShowScan(rowData.FK_UploadTypeIndicatorId, "../Scan/lt/" + rowData.FK_LiceTranId + "/" + rowData.ScanUrl);
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
function OnShowScan(t, u) {
    $('#ScanImg').window('open');
    $('#ScanImg').window({ title: t });
    $("#showScanImg").attr("src", u);
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
        data.AcceptDate != null ? vt += "<p style=''>受理时间：" + data.AcceptDate.replace('T', ' ') + "&nbsp;&nbsp;<br/>" : vt += "<p>受理时间：&nbsp;&nbsp;<br/>";
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
jQuery(function ($) {
    $("#btnRetuen").click(function () {
        if ("" != $("#txtReturnDepaSay").val()) {
            $.get("../Ashx/BidInfo.ashx?action=add", { ReturnDepaSay: $("#txtReturnDepaSay").val(), FK_BidId: $('#tdg').datagrid('getSelections')[0].Id, UpManager: $('#tdg').datagrid('getSelections')[0].UpManager, OrgCode: $('#tdg').datagrid('getSelections')[0].oCode, DepaStatusId: $('#tdg').datagrid('getSelections')[0].DepaStatusId }, function (data) {
                msgShow("提示", data, "info");
                $('#ReturnInfo').window('close');
                $("#txtReturnDepaSay").val("");
                $('#tdg').datagrid('reload');
                $('#tdg').datagrid('clearSelections');
            }, "text");
        }
        else {
            msgShow("提示", "审核意见还没有填写！", "info");
        }
    });
});
