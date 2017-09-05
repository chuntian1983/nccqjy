jQuery(function ($) {
    OnLoadBidListClick(1);
});

var count = 0;
function OnLoadBidListClick(pageindex) {
    $.ajax({
        url: "Handler/WebSite.ashx?action=BidList&zt=7",
        data: "page=" + pageindex + "&rows=20",
        type: "post",
        cache: "false",
        dataType: "json",
        beforeSend: function () { $("#showLoad").show(); },
        complete: function () { $("#showLoad").hide(); },
        error: function (XMLHttpRequest, textStatus, errorThrown) { $("#showLoad").hide(); },
        success: function (json) {
            var tbidList = "";
            if (null != json) {
                var productData = json.T;
                count = json.page.pagecount;               
                $.each(productData, function (i, n) {
                    tbidList += "<tr><td class=\"th3\">HJNS" + n.Admissibility + "</td><td  style=\"width:520px;\"><a href=\"BidDetails.aspx?t=" + n.FK_LiceTranId + "&id=" + n.Id + "\">" + n.BidName + "</a></td><td class=\"th1\">" + n.Properties + "</td><td class=\"th1\">" + n.ListingPrice + "</td><td class=\"th1\">交易完成</td></tr>";
                });
                if (0 == productData.length) { tbidList = "<li>暂无数据!</li>"; }
                $("#lblBidList").html(tbidList);
            }
            $("#Pagination").pagination(count, {
                callback: pageselectCallback,
                prev_text: '<<上一页',
                next_text: '下一页>>',
                items_per_page: 20,
                num_display_entries: 6,
                current_page: pageindex,
                num_edge_entries: 2
            });
        }
    });
};
function pageselectCallback(page_id, jq) {
    OnLoadBidListClick(page_id);
};