jQuery(function ($) {
    OnLoadPlacardListClick(0);
});
var count = 0;

function OnLoadPlacardListClick(pageindex) {
    $.ajax({
        url: "Handler/WebSite.ashx?action=PlacardList",
        data: "page=" + pageindex + "&rows=20",
        type: "post",
        cache: "false",
        dataType: "json",
        beforeSend: function () { $("#showLoad").show(); },
        complete: function () { $("#showLoad").hide(); },
        error: function (XMLHttpRequest, textStatus, errorThrown) { $("#showLoad").hide(); },
        success: function (json) {
            var placard = " <ul class=\"list_ul\">";
            if (null != json) {
                var productData = json.T;
                count = json.page.pagecount;              
                $.each(productData, function (i, n) {

                    placard += " <li><span>" + n.ReleaseTime + "</span><a target=\"_blank\" href=\"PlacardDetails.aspx?id=" + n.Id + "\">" + n.BidPlacardTitle + "</a></li>";

                    if (i % 5 == 0 && i != 0) {
                        placard += "</ul><ul class=\"list_ul\">";
                    }

                });
                if (0 == json.T.length) { placard = "<li>暂无数据!</li>"; }
                $("#lblPlacardList").html(placard);
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
    OnLoadPlacardListClick(page_id);
};