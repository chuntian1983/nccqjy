jQuery(function ($) {
    OnLoadBidListClick(0);
});

var count = 0;
function OnLoadBidListClick(pageindex) {
    $.ajax({
        url: "Handler/WebSite.ashx?action=BidList&flag=" + Math.random(),
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
                    tbidList += "<ul><li>HJNS" +  n.Admissibility + "</li><li class=\"gpwidth2\"><a href=\"BidDetails.aspx?t=" + n.FK_LiceTranId + "&id=" + n.Id + "\">" + n.BidName + "</a></li><li class=\"gpwidth3\">" + n.Properties + "</li><li>" + n.ListingPrice + "</li><li>" + n.EndDate.substring(0,10) + "</li><li class=\"gpwidth1\"><a href=\"\"><!--<img src=\"images/nc_30.jpg\">--></a></li></ul>";
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