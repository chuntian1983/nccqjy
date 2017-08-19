<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OneAgree.aspx.cs" Inherits="Web.Super.Bi.OneAgree" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/tbcss.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/jquery.easyui.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript"
        language="javascript"></script>

    <%--<script src="../Scripts/OneAgree1.js"  type="text/javascript" language="javascript">--%>
    <script type="text/javascript">
        jQuery(function ($) {
            GridView();
            $('#newAdd').window('close');
            $('#ScanImg').window('close');
            $('#BidPla').window('close');
            $('#BidTrans').window('close');
            $('#BidScan').window('close');
            $('#BidAuct').window('close');
            $('#BidClinch').window('close');
            $('#dzjb').window('close');
            $('#jingbiaojieshu').window('close');
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
                height: 350,
                nowrap: true,
                striped: true,
                url: '../Ashx/BidH.ashx?' + $.param({ action: "paging", DepaStatus: 3, StandardMode: 2 }),
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
{ field: 'BidName', title: '标的名称', width: 80, align: 'left', sortable: true },
{ field: 'Jbzt', title: '竞价状态', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.Jbzt == 1 ? "<span style='color:blue;'>竞价中</span>" : "<span style='color:red;'>未竞价<span>"; } }
]], columns: [[
{ field: 'Jbqbj', title: '竞价起拍价格', width: 80, align: 'left', sortable: true },
{ field: 'Jbjzsj', title: '竞标截止时间', width: 120, align: 'left', sortable: true },
{ field: 'StandardMode', title: '交易方式', width: 80, align: 'left', sortable: true },
{ field: 'EndDate', title: '转出结束时间', width: 80, align: 'left', sortable: true },
{ field: 'Ownership', title: '权属', width: 80, align: 'left', sortable: true },
{ field: 'Properties', title: '性质', width: 50, align: 'left', sortable: true },
{ field: 'TurnOut', title: '转出方式', width: 50, align: 'left', sortable: true },
{ field: 'RightsBodies', title: '确权机构', width: 50, align: 'left', sortable: true },
{ field: 'FeedingMechanism', title: '转出批准机构', width: 80, align: 'left', sortable: true },
{ field: 'WarrantNumber', title: '权证编号', width: 80, align: 'left', sortable: true },

{ field: 'TradingCenterName', title: '交易中心名称', width: 80, align: 'left', sortable: true },
{ field: 'RelatesNum', title: '涉及农户数', width: 80, align: 'left', sortable: true },
{ field: 'Publicity', title: '公示期', width: 80, align: 'left', sortable: true },
{ field: 'UpManager', title: '上级审核', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'DepaStatusId', title: '分管部门编号', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'DepaStatus', title: '分管部门', width: 80, align: 'left', sortable: true }
]],
                toolbar: [{
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
                                    $("#btnAdd").show();
                                    $("#btnEdit").hide();
                                    $("#txtBidPlacardTitle").val(rows[0].BidName + "-招标公告事宜");
                                    $("#txtBidPlacardContent").val("");
                                    $("#txtId").val("0");
                                } else {
                                    $("#btnAdd").hide();
                                    $("#btnEdit").show();
                                    $("#txtBidPlacardTitle").val(data.BidPlacardTitle);
                                    $("#txtBidPlacardContent").val(data.BidPlacardContent);
                                    $("#txtId").val(data.Id);
                                }

                            }, "json");
                        } else {
                            msgShow("提示", "您还没有选中一列信息？", "question");
                        }
                    }
                }, '-', {
                    id: 'btnedit',
                    text: '组织交易',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var rows = $('#tdg').datagrid('getSelections');
                        if (rows.length > 0) {
                            // $('#BidAuct').window('open');
                            $('#dzjb').window('open');
                            //clearInterval(iCount);
                            //                            $.get("../Ashx/BidAucti.ashx?action=is", { BidId: rows[0].Id, SeveralBid: "1" }, function (data) {
                            //                                if (data == "0") {
                            //                                    $("#btnAuct").show();
                            //                                } else {
                            //                                    $("#btnAuct").hide();
                            //                                }
                            //                            }, "text");
                        } else {
                            msgShow("提示", "您还没有选中一列信息？", "question");
                        }
                    }
                },
                '-', {
                    id: 'btnover',
                    text: '竞价结束',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var rows = $('#tdg').datagrid('getSelections');
                        if (rows.length > 0) {
                            // $('#BidAuct').window('open');
                            location.href = "jzsview.aspx"; return;
                            $('#jingbiaojieshu').window('open');
                            $('#tdjbjs').datagrid({
                                height: 300,
                                nowrap: true,
                                striped: true,
                                url: '../Ashx/dzjj.ashx?' + $.param({ action: "paging", BidId: rows[0].Id }),
                                remoteSort: false,
                                sortName: 'Id',
                                singleSelect: true,
                                sortOrder: 'desc',
                                fit: false,
                                fitColumns: true,
                                rownumbers: true,
                                columns: [[
            { field: 'sid', title: '编号', width: 30, align: 'left', sortable: true },
            { field: 'jbyhm', title: '竞标用户', width: 80, align: 'left', sortable: true },
            { field: 'jbjg', title: '竞标价格', width: 80, align: 'left', sortable: true },
            { field: 'jbdj', title: '竞标底价', width: 80, align: 'left', sortable: true }

        ]]
                            });


                        } else {
                            msgShow("提示", "您还没有选中一列信息？", "question");
                        }
                    }
                },
                 '-', {
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
            $("#btnEdit").click(function () {
                if ($("#txtBidPlacardTitle").val() == "" && $("#txtBidPlacardContent").val() == "") {
                    msgShow("提示", "你还没有填写公告信息！", "info");
                    return;
                }
                $.get("../Ashx/BidPlac.ashx?action=up", { FK_BidId: $('#tdg').datagrid('getSelections')[0].Id, BidPlacardTitle: $("#txtBidPlacardTitle").val(), BidPlacardContent: $("#txtBidPlacardContent").val(), Id: $("#txtId").val() }, function (data) {
                    msgShow("提示", data, "info");
                    $('#BidPla').window('close');
                }, "text");
            });
        });
        jQuery(function ($) {
            $("#btnAdd").click(function () {
                if ($("#txtBidPlacardTitle").val() == "" && $("#txtBidPlacardContent").val() == "") {
                    msgShow("提示", "你还没有填写公告信息！", "info");
                    return;
                }
                $.get("../Ashx/BidPlac.ashx?action=add", { FK_BidId: $('#tdg').datagrid('getSelections')[0].Id, BidPlacardTitle: $("#txtBidPlacardTitle").val(), BidPlacardContent: $("#txtBidPlacardContent").val(), Id: $("#txtId").val() }, function (data) {
                    msgShow("提示", data, "info");
                    $('#BidPla').window('close');
                }, "text");
            });
        });
        jQuery(function ($) {
            $("#jbjsadd").click(function () {
                var rows = $('#tdjbjs').datagrid('getSelections');
                
                    msgShow("提示", rows[0].sid, "info");
                    return;
                
                $.get("../Ashx/BidPlac.ashx?action=add", { FK_BidId: $('#tdg').datagrid('getSelections')[0].Id, BidPlacardTitle: $("#txtBidPlacardTitle").val(), BidPlacardContent: $("#txtBidPlacardContent").val(), Id: $("#txtId").val() }, function (data) {
                    msgShow("提示", data, "info");
                    $('#BidPla').window('close');
                }, "text");
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
        function OnBidAuctionList(id) {
            $.get("../Ashx/OneAgreeH.ashx?action=one", { Id: id }, function (data) {
                $("#BidAuctList tr").remove();
                var t = "";
                var productData = data.T;
                $.each(productData, function (i, n) {
                    t += "<tr><td height=\"30\" colspan=\"4\" align=\"center\">&nbsp;[" + n.BidName + "]标第[" + n.SeveralBid + "]次竞价单</td></tr><tr><td width=\"83\" align=\"center\" height=\"30\">标的名称</td><td width=\"151\">&nbsp;" + n.BidName + "</td><td width=\"80\" align=\"center\">竞价方名称</td><td width=\"158\">&nbsp;" + n.Name + "</td></tr><tr><td align=\"center\" height=\"30\">几次竞价</td><td>&nbsp;" + n.SeveralBid + "</td><td align=\"center\">价格</td><td>&nbsp;" + n.Price + "元</td></tr><tr><td align=\"center\" height=\"30\">竞价时间</td><td>&nbsp;" + n.AuctionDate + "</td><td align=\"center\">操作人</td><td>&nbsp;" + n.Editor + "</td></tr>";
                });
                $("#BidAuctList").append(t);
            }, "json");
        };
        var iCount;
        jQuery(function ($) {
            $("#btnAuct").click(function () {
                $("#btnAuct").hide();
                $("#btnTransaction").show();
                var rows = $('#tdg').datagrid('getSelections');
                OnBidAuctionList(rows[0].Id);
                $("#tFK_BidId").textbox('setValue', rows[0].BidName);
                iCount = setInterval(function () { OnBidAuctionList(rows[0].Id); }, 5000);
            });
        });
        jQuery(function ($) {
            $("#btnAuctAdd").click(function () {
                var rows = $('#tdg').datagrid('getSelections');
                $.get("../Ashx/OneAgreeH.ashx?action=add", { LiceTran: $("#tLiceTran").combotree('getValue'), BidId: rows[0].Id }, function (data) {
                    $('#BidClinch').window('close');
                    msgShow("提示", data, "info");
                    $("#btnAuct").hide();
                    $("#btnTransaction").hide();
                    OnBidAuctionList(rows[0].Id);
                }, "text");
            });
        });
        jQuery(function ($) {
            $("#btnksjj").click(function () {

                var rows = $('#tdg').datagrid('getSelections');
                var va = $('#txtqpjg').textbox('getValue');
                if (va.length < 1) {
                    msgShow("提示", "起拍价格不能为空", "info");
                    return;
                }
                $.get("../Ashx/OneAgreeH.ashx?action=ksjj", { jjsj: $("#selshijian").combobox('getValue'), bid: rows[0].Id, qpjg: $('#txtqpjg').textbox('getValue') }, function (data) {
                    msgShow("提示", data, "info");


                }, "text");
                $('#dzjb').window('close');
                $('#tdg').datagrid('reload');

            });
        });
        jQuery(function ($) {
            $("#btnTransaction").click(function () {
                var rows = $('#tdg').datagrid('getSelections');
                $('#BidClinch').window('open');
                jQuery(function ($) {
                    $("#tLiceTran").combotree({
                        url: '../Ashx/OneAgreeH.ashx?' + $.param({ action: "tree", BidId: rows[0].Id }),
                        lines: true,
                        onSelect: function (node) {
                            $("#tPrice").textbox('setValue', node.text.split('-')[1]);
                        }
                    });
                });
            });
        });
    </script>
</head>
<body class="easyui-layout">
    <div region="north" title="出让标信息列表" split="true" style="height: 415px; border: 0px;"
        border="false">
        &nbsp;&nbsp;标的名称：
        <input type="text" id="tBidName" class="easyui-textbox" style="width: 300px;" required="true" />
        <a href="javascript:void(0)" id="btnQuery" class="easyui-linkbutton" iconcls="icon-search">
            搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: Blue;">(支持模糊查询)</span>
        <table id="tdg">
        </table>
    </div>
    <div id="west" region="west" title="退回审核信息" style="width: 45%;">
        <table id="BidInfo">
        </table>
    </div>
    <div id="center" region="center" title="审核意见" style="width: 25%;">
        <span id="lblProcess"></span>
    </div>
    <div id="east" region="east" title="附件信息" style="width: 30%;">
        <table id="Scan">
        </table>
    </div>
    <div id="ScanImg" title="附件查看" class="easyui-window" modal="true" collapsible="false"
        minimizable="false" maximizable="false" icon="icon-save" style="width: 700px;
        height: 480px; padding: 5px; background: #fafafa;">
        <iframe id="showScanImg" scrolling="no" frameborder="0" style="width: 100%; height: 100%;">
        </iframe>
    </div>
    <div id="newAdd" title="出让标详细信息" class="easyui-window" modal="true" collapsible="false"
        minimizable="false" maximizable="false" icon="icon-save" style="width: 680px;
        height: 420px; padding: 5px; background: #fafafa;">
        <form id="forms" runat="server">
        <table border="0" class="table" cellpadding="0" cellspacing="0" width="625">
            <tr>
                <td align="right" height="35" colspan="5">
                    项目编号：HJNS</span><span id="lblAdmissibility"></span>&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" height="35">
                    组织单位
                </td>
                <td colspan="3">
                    <span id="txtOrgCode"></span>
                </td>
            </tr>
            <tr>
                <td height="132" rowspan="6" width="35" align="center">
                    出<br />
                    让<br />
                    方<br />
                    基<br />
                    本<br />
                    情<br />
                    况
                </td>
                <td width="130" height="35" align="center">
                    出让方名称
                </td>
                <td colspan="3">
                    <span id="txtFK_LiceTranId"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    住址
                </td>
                <td colspan="3">
                    <span id="lblAddr"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    经济类型
                </td>
                <td width="169">
                    <span id="lblMemberTypeId"></span>
                </td>
                <td width="123" align="center">
                    法定代表人
                </td>
                <td width="168">
                    <span id="lblCorporate"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    联系人
                </td>
                <td width="169">
                    <span id="lblContact"></span>
                </td>
                <td width="123" align="center">
                    所有权人
                </td>
                <td width="168">
                    <span id="lblOwner"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    联系电话
                </td>
                <td>
                    <span id="lblTel"></span>
                </td>
                <td align="center">
                    身份证号码
                </td>
                <td>
                    <span id="lblIDCard"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    注册资本
                </td>
                <td>
                    <span id="lblCapital"></span>
                </td>
                <td align="center">
                    组织机构代码
                </td>
                <td>
                    <span id="lblOrganizationCode"></span>
                </td>
            </tr>
            <tr>
                <td height="399" rowspan="10" width="35" align="center">
                    标<br />
                    的<br />
                    基<br />
                    本<br />
                    情<br />
                    况
                </td>
                <td height="35" align="center">
                    转出标的名称
                </td>
                <td colspan="3">
                    <span id="txtBidName"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    挂牌价格
                </td>
                <td colspan="3">
                    <span id="txtListingPrice"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    拟转出期限
                </td>
                <td colspan="3">
                    起 <span id="txtStartDate"></span>至 <span id="txtEndDate"></span>止
                </td>
            </tr>
            <tr>
                <td height="135" width="130" align="center">
                    标&nbsp;&nbsp;的<br />
                    <br />
                    基&nbsp;&nbsp;本<br />
                    <br />
                    情&nbsp;&nbsp;况
                </td>
                <td colspan="3" valign="top">
                    <span id="txtBidBasic"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    产权类型
                </td>
                <td>
                    <span id="txtProperties"></span>
                </td>
                <td align="center">
                    权属
                </td>
                <td>
                    <span id="txtOwnership"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    转出方式
                </td>
                <td>
                    <span id="txtTurnOut"></span>
                </td>
                <td align="center">
                    权证编号
                </td>
                <td>
                    <span id="txtWarrantNumber"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    确权机构
                </td>
                <td>
                    <span id="txtRightsBodies"></span>
                </td>
                <td align="center">
                    转出批准机构
                </td>
                <td>
                    <span id="txtFeedingMechanism"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    交易方式
                </td>
                <td>
                    <span id="txtStandardMode"></span>
                </td>
                <td align="center">
                    交易低价
                </td>
                <td>
                    <span id="txtLowTransaction"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    成交金额
                </td>
                <td>
                    <span id="txtTurnover"></span>
                </td>
                <td align="center">
                    涉及农户数
                </td>
                <td>
                    <span id="txtRelatesNum"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    挂牌方式
                </td>
                <td>
                    <span id="txtStandardType"></span>
                </td>
                <td align="center">
                    公示期
                </td>
                <td>
                    <span id="txtPublicity"></span>天
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" height="35">
                    交易中心名称
                </td>
                <td colspan="3">
                    <span id="txtTradingCenterName"></span>
                </td>
            </tr>
        </table>
        </form>
    </div>
    <div id="BidPla" title="招标公告" class="easyui-window" modal="true" collapsible="false"
        minimizable="false" maximizable="false" icon="icon-save" style="width: 680px;
        height: 360px; padding: 5px; background: #fafafa;">
        <table>
            <tr>
                <td>
                    公告名称
                </td>
                <td>
                    <input type="text" id="txtBidPlacardTitle" name="BidPlacardTitle" class="easyui-validatebox"
                        missingmessage="必须填写" required="true" style="width: 500px;" />
                </td>
            </tr>
            <tr>
                <td>
                    公告内容
                </td>
                <td>
                    <textarea id="txtBidPlacardContent" name="BidPlacardContent" style="width: 500px;
                        height: 250px;" class="easyui-validatebox" missingmessage="必须填写" required="true"></textarea>
                </td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <a id="btnAdd" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">添加</a>
                    <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)"
                        style="display: none">修改</a>
                </td>
            </tr>
        </table>
        <input type="hidden" id="txtId" name="Id" />
    </div>
    <div id="BidTrans" title="意向受让方信息" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" style="width: 800px; height: 200px; padding: 5px; background: #fafafa;">
        <table id="BidTra">
        </table>
    </div>
    <div id="BidScan" title="标成交附件" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" style="width: 500px; height: 400px; padding: 5px; background: #fafafa;">
        <iframe name="BidScanPage" id="BidScanPage" scrolling="no" frameborder="0" style="width: 100%;
            height: 100%;"></iframe>
    </div>
    <div id="BidAuct" title="竞价单" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" style="width: 550px; height: 450px; padding: 5px; background: #fafafa;">
        <div id="tb" style="padding-left: 15px; height: auto">
            <a id="btnAuct" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)"
                style="display: none">开始竞价</a> <a id="btnTransaction" class="easyui-linkbutton" icon="icon-ok"
                    href="javascript:void(0)" style="display: none">交易</a>
        </div>
        <table id="BidAuctList" border="0" class="table" cellpadding="0" cellspacing="0"
            toolbar="#tb">
        </table>
    </div>
    <div id="BidClinch" title="交易" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" modal="true" closable="true" style="width: 520px;
        height: 180px; padding: 5px; background: #fafafa;">
        <table width="500" border="0">
            <tr>
                <td width="83" align="center" height="35">
                    竞价方名称
                </td>
                <td width="151">
                    <select id="tLiceTran" class="easyui-combotree" style="width: 120px;">
                    </select>
                </td>
                <td width="80" align="center">
                    价格
                </td>
                <td width="158">
                    <input id="tPrice" name="tPrice" class="easyui-textbox" />元
                </td>
            </tr>
            <tr>
                <td height="35" colspan="4" align="center">
                    <a href="javascript:void(0)" id="btnAuctAdd" class="easyui-linkbutton" icon="icon-ok">
                        成交</a>
                </td>
            </tr>
        </table>
    </div>
     <div id="dzjb" title="组织交易" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" modal="true" closable="true" style="width: 520px;
        height: 180px; padding: 5px; background: #fafafa;">
        <table width="500" border="0">
            <tr>
                <td width="83" align="center" height="35">
                    竞价时间
                </td>
                <td width="151">
                    <select id="selshijian" class="easyui-combobox" style="width: 120px;">
                    <option  value="5" selected=selected>5分钟</option>
                    <option value="10">10分钟</option>
                    <option value="15">15分钟</option>
                    </select>
                </td>
                <td width="80" align="center">
                    竞价起拍价格
                </td>
                <td width="158">
                    <input id="txtqpjg" name="tPrice" class="easyui-textbox" data-options="required:true" />元
                </td>
            </tr>
            <tr>
                <td height="35" colspan="4" align="center">
                    <a href="javascript:void(0)" id="btnksjj" class="easyui-linkbutton" icon="icon-ok">
                        开始竞价</a>
                </td>
            </tr>
        </table>
    </div>
     <div id="jingbiaojieshu" title="竞标结束" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" modal="true" closable="true" style="width: 520px;
        height: 420px; padding: 5px; background: #fafafa;">
        请选项下面的竞标信息
        <table id="tdjbjs">
        </table>
       <a href="javascript:void(0)" id="jbjsadd" class="easyui-linkbutton" icon="icon-ok">
                        确定</a>
    </div>
</body>
</html>
