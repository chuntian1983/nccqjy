Request = {
    QueryString: function (item) {
        var svalue = location.search.match(new RegExp("[\?\&]" + item + "=([^\&]*)(\&?)", "i"));
        return svalue ? svalue[1] : svalue;
    }
};

var typeId = Request.QueryString("ntid");
jQuery(function ($) {
    OnLoadNewsListClick(0, typeId);
});
var count = 0;
function OnLoadNewsListClick(pageindex, par) {
    $.ajax({
        url: "Handler/WebSite.ashx?action=NewList",
        data: "NewsTypeId=" + par + "&page=" + pageindex + "&rows=20",
        type: "post",
        cache: "false",
        dataType: "json",
        beforeSend: function () { $("#showLoad").show(); },
        complete: function () { $("#showLoad").hide(); },
        error: function (XMLHttpRequest, textStatus, errorThrown) { $("#showLoad").hide(); },
        success: function (json) {
            var news = " <ul class=\"list_ul\">";
            if (null != json) {
                var productData = json.T;
                count = json.page.pagecount;
                $("#lbl_List_NewsTypeName").text(json.page.type);
                $.each(productData, function (i, n) {
                    news += " <li><span>" + n.CreateDate.substring(0,10) + "</span><a target=\"_blank\" href=\"NewsDetails.aspx?t=" + n.NewsTypeId + "&id=" + n.Id + "\">" + n.NewsTitle + "</a></li>";
                    if (i % 5 == 0 && i != 0) {
                        news += "</ul><ul class=\"list_ul\">";
                    }
                });
                if (0 == json.T.length) { news = "<li>暂无数据!</li>"; }
                $("#lblNewsList").html(news);
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
    OnLoadNewsListClick(page_id, typeId);
};