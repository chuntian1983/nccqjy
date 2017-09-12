Request = {
    QueryString: function (item) {
        var svalue = location.search.match(new RegExp("[\?\&]" + item + "=([^\&]*)(\&?)", "i"));
        return svalue ? svalue[1] : svalue;
    }
};

var typeId = Request.QueryString("type");
jQuery(function ($) {
    OnIntenListClick(0, typeId);
});
var count = 0;
function OnIntenListClick(pageindex, par) {
    $.ajax({
        url: "Handler/WebSite.ashx?action=IntenList",
        data: "IntentionType=" + par + "&page=" + pageindex + "&rows=20",
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
                if (1 == typeId) { $("#lbl_List_TypeName").text("意向受让信息"); }
                if (2 == typeId) { $("#lbl_List_TypeName").text("意向转让信息"); }
                if (3 == typeId) { $("#lbl_List_TypeName").text("抵押融资信息"); }                
                $.each(productData, function (i, n) {
                    news += " <li><span>" + n.CheckDate + "</span><a target=\"_blank\" href=\"IntenDetails.aspx?t=" + n.IntentionType + "&id=" + n.Id + "\">" + n.Title + "</a></li>";
                    if (i % 5 == 0 && i != 0) {
                        news += "</ul><ul class=\"list_ul\">";
                    }
                });
                if (0 == json.T.length) { news = "<li>暂无数据!</li>"; }
                $("#lblIntenList").html(news);
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
    OnIntenListClick(page_id, typeId);
};