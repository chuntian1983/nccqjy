//jQuery(function ($) {
//    $.get("Handler/WebSite.ashx?action=Top", { top: 10 }, function (data) {
//        var tnewsTop = "";
//        if (data != null) {
//            var productData = data.T;
//            $.each(productData, function (i, n) {
//                tnewsTop += "<li><a href=\"NewsDetails.aspx?t=" + n.NewsTypeId + "&id=" + n.Id + "\">" + n.NewsTitle.substring(0, 20) + "</a><span>[" + n.CreateDate.substring(0, 10) + "]</span></li>";
//            });
//            $("#lblNewsTop").html(tnewsTop);
//        }
//    }, "json");
//});

jQuery(function ($) {
    $.get("Handler/WebSite.ashx?action=File", { top: 10 }, function (data) {
        var tnewsTopFile = "";
        if (data != null) {
            var productData = data.T;
            $.each(productData, function (i, n) {
                tnewsTopFile += "<li><a target=\"_blank\" href=\"../newsFile/\"" + n.NewsFile + "\">" + n.NewsTitle + "</a></li>";
            });
            $("#lblNewsTopFile").html(tnewsTopFile);
        }
    }, "json");
});
jQuery(function ($) {
    $.get("Handler/WebSite.ashx?action=IntenTop", { top: 7, IntentionType: 1 }, function (data) {
        var tIntention = "";
        var productData = data.T;
        $.each(productData, function (i, n) {
            tIntention += "<li><a target=\"_blank\" href=\"IntenDetails.aspx?t=" + n.IntentionType + "&id=" + n.Id + "\">" + n.Title + "</a><span>" + n.CheckDate.substring(0, 10) + "</span></li>";
        });
        $("#lblIntention").html(tIntention);
    }, "json");
});
jQuery(function ($) {
    $.get("Handler/WebSite.ashx?action=IntenTop", { top: 7, IntentionType: 2 }, function (data) {
        var tIntention = "";
        var productData = data.T;
        $.each(productData, function (i, n) {
            tIntention += "<li><a target=\"_blank\" href=\"IntenDetails.aspx?t=" + n.IntentionType + "&id=" + n.Id + "\">" + n.Title + "</a><span>" + n.CheckDate.substring(0, 10) + "</span></li>";
        });
        $("#lblIntention2").html(tIntention);
    }, "json");
});
//挂牌公示
jQuery(function ($) {
    OnShowBidClick(10, 1, "ulneirong");
    OnShowBidClick(10, 2, "ulneirong1");
    OnShowBidClick(10, 3, "ulneirong2");
    OnShowBidClick(10, 4, "ulneirong3");
    OnShowBidClick(10, 5, "ulneirong4");
   
});
var rowcount = 0;
function OnShowBidClick(r,ty,neirong) {

    $.get("Handler/WebSite.ashx?action=BidList&flag=" + Math.random(), { rows: r,type:ty }, function (data) {
        var tbid = " ";
        var productData = data.T;
        if (productData == null) { rowcount = productData.length; }
        $.each(productData, function (i, n) {
            tbid += "<li><span class=\"sp3\">HJNS" + n.Admissibility + "</span><span class=\"sp2\"><a target=\"_blank\" href=\"BidDetails.aspx?nid=" + n.FK_LiceTranId + "&id=" + n.Id + "\">" + n.BidName + "</a></span><span class=\"sp5\">" + n.Properties + "</span><span class=\"sp1\">" + n.StartDate.substring(0, 10) + "</span><span class=\"sp1\">" + n.ListingPrice + "</span><span class=\"sp1\">" + n.EndDate.substring(0, 10) + "</span><span class=\"sp1\"><a href=\"\"><!--<img src=\"images/nc_30.jpg\">--></a></span></li>";
        });
        tbid += " ";
        $("."+neirong+"").html(tbid);
        
    }, "json");
};
//wh add 2016-10-11 切换
function tabqh(str) {
    if (str == "1") {
        $('#strli1').attr("class","check");
        $('#stra1').attr("class", "xz01");
        $("#strsp1").attr("class", "or_tab_s1");
        $('#strli2').attr("class", "");
        $('#stra2').attr("class", "");
        $("#strsp2").attr("class", "or_tab_s2_1");
        $('#strli3').attr("class", "");
        $('#stra3').attr("class", "");
        $("#strsp3").attr("class", "or_tab_s3_1");
        $("#strdiv1").css("display", "block");
        $("#strdiv2").css("display", "none");
        $("#strdiv3").css("display", "none");
    }
    else if (str == "2") {
        $('#strli2').attr("class", "check");
        $('#stra2').attr("class", "xz01");
        $("#strsp2").attr("class", "or_tab_s2");
        $('#strli1').attr("class", "");
        $('#stra1').attr("class", "");
        $("#strsp1").attr("class", "or_tab_s1_1");
        $('#strli3').attr("class", "");
        $('#stra3').attr("class", "");
        $("#strsp3").attr("class", "or_tab_s3_1");
        $("#strdiv1").css("display", "none");
        $("#strdiv2").css("display", "block");
        $("#strdiv3").css("display", "none");

    }
    else if (str == "3") {
        $('#strli3').attr("class", "check");
        $('#stra3').attr("class", "xz01");
        $("#strsp3").attr("class", "or_tab_s3");
        $('#strli2').attr("class", "");
        $('#stra2').attr("class", "");
        $("#strsp2").attr("class", "or_tab_s2_1");
        $('#strli1').attr("class", "");
        $('#stra1').attr("class", "");
        $("#strsp1").attr("class", "or_tab_s1_1");
        $("#strdiv1").css("display", "none");
        $("#strdiv2").css("display", "none");
        $("#strdiv3").css("display", "block");

    }
}

//wh add2016-10-08
jQuery(function ($) {

    $(".sys_s1").click(function () {
        
        OnShowBidClickByType(1);
    });
    $(".sys_s2").click(function () {

        OnShowBidClickByType(2);
    });
    $(".sys_s3").click(function () {

        OnShowBidClickByType(3);
    });
    $(".sys_s4").click(function () {

        OnShowBidClickByType(5);
    });
});
function OnShowBidClickByType2(lb) {
    
    $.get("Handler/WebSite.ashx?action=BidList&flag=" + Math.random(), {type:lb}, function (data) {
        var tbid = "<ul>";
        var productData = data.T;
        if (productData == null) { rowcount = productData.length; }
        $.each(productData, function (i, n) {
            tbid += "<li><span class=\"sp3\">HJNS" + n.Admissibility + "</span><span class=\"sp2\"><a href=\"BidDetails.aspx?t=" + n.FK_LiceTranId + "&id=" + n.Id + "\">" + n.BidName + "</a></span><span class=\"sp1\">" + n.Properties + "</span><span class=\"sp1\">" + n.StartDate.substring(0, 10) + "</span><span class=\"sp1\">" + n.ListingPrice + "</span><span class=\"sp1\">" + n.EndDate.substring(0, 10) + "</span><span class=\"sp1\"><a href=\"\"><!--<img src=\"images/nc_30.jpg\">--></a></span></li>";
        });
        tbid += "</ul>";
        $(".list_lh").html(tbid);
    }, "json");
};
function OnShowBidClickByType(lb) {

    $.get("Handler/WebSite.ashx?action=BidList&flag=" + Math.random(), { type: lb }, function (data) {
        var tbid = "";
        var productData = data.T;
        if (productData == null) { rowcount = productData.length; }
        $.each(productData, function (i, n) {
            tbid += "<tr><td class=\"th3\">HJNS" + n.Admissibility + "</td><td class=\"th2\"><a href=\"BidDetails.aspx?t=" + n.FK_LiceTranId + "&id=" + n.Id + "\">" + n.BidName + "</a></td><td class=\"th1\">" + n.Properties + "</td><td class=\"th1\">" + n.StartDate.substring(0, 10) + "</td><td class=\"th1\">" + n.ListingPrice + "</td><td class=\"th1\">" + n.EndDate.substring(0, 10) + "</td><td class=\"th1\"><a href=\"\"><!--<img src=\"images/nc_30.jpg\">--></a></td></tr>";
        });
        $("#ShowBidList").html(tbid);
        $("ShowBidList").fadeIn("slow");
    }, "json");
};
function OnSelAdmissibility() {
    $.get("Handler/WebSite.ashx?action=SelAdmissNo", { Admissibility: $("#txtAdmissibility").val() }, function (data) {
        alert(data);
    }, "text");
};
function CreateMarquee(marqueeID, marqueeWidth, marqueeHeight, scrollDirection, scrollStep, scrollHeight) {
    new Marquee(
            marqueeID,
            scrollDirection,
            scrollStep,
            marqueeWidth,
            marqueeHeight,
            50,
            1000,
            1000,
            scrollHeight
        );
};
function Marquee() {
    this.ID = document.getElementById(arguments[0]);
    this.Direction = arguments[1];
    this.Step = arguments[2];
    this.Width = arguments[3];
    this.Height = arguments[4];
    this.Timer = arguments[5];
    this.WaitTime = arguments[6];
    this.StopTime = arguments[7];
    if (arguments[8]) { this.ScrollStep = arguments[8]; } else { this.ScrollStep = this.Direction > 1 ? this.Width : this.Height; }
    if (this.Direction > 1 ? this.ID.scrollWidth < this.Width : this.ID.scrollHeight < this.Height) {
        return;
    }
    this.CTL = this.StartID = this.Stop = this.MouseOver = 0;
    this.ID.noWrap = true;
    this.ID.style.width = this.Width;
    this.ID.style.height = this.Height;
    this.ClientScroll = this.Direction > 1 ? this.ID.scrollWidth : this.ID.scrollHeight;
    var rc = eval(rowcount);
    if (rc > 4) {
        this.ID.innerHTML += this.ID.innerHTML;
    }
    this.Start(this, this.Timer, this.WaitTime, this.StopTime);
}
Marquee.prototype.Start = function (msobj, timer, waittime, stoptime) {
    msobj.StartID = function () { msobj.Scroll(); }
    msobj.Continue = function () {
        if (msobj.MouseOver == 1) { setTimeout(msobj.Continue, waittime); }
        else { clearInterval(msobj.TimerID); msobj.CTL = msobj.Stop = 0; msobj.TimerID = setInterval(msobj.StartID, timer); }
    }
    msobj.Pause = function () { msobj.Stop = 1; clearInterval(msobj.TimerID); setTimeout(msobj.Continue, waittime); }
    msobj.Begin = function () {
        msobj.TimerID = setInterval(msobj.StartID, timer);
        msobj.ID.onmouseover = function () { msobj.MouseOver = 1; clearInterval(msobj.TimerID); }
        msobj.ID.onmouseout = function () { msobj.MouseOver = 0; if (msobj.Stop == 0) { clearInterval(msobj.TimerID); msobj.TimerID = setInterval(msobj.StartID, timer); } }
    }
    setTimeout(msobj.Begin, stoptime);
}
Marquee.prototype.Scroll = function () {
    switch (this.Direction) {
        case 0:
            this.CTL += this.Step;
            if (this.CTL >= this.ScrollStep && this.WaitTime > 0) { this.ID.scrollTop += this.ScrollStep + this.Step - this.CTL; this.Pause(); return; }
            else { if (this.ID.scrollTop >= this.ClientScroll) this.ID.scrollTop -= this.ClientScroll; this.ID.scrollTop += this.Step; }
            break;
        case 1:
            this.CTL += this.Step;
            if (this.CTL >= this.ScrollStep && this.WaitTime > 0) { this.ID.scrollTop -= this.ScrollStep + this.Step - this.CTL; this.Pause(); return; }
            else { if (this.ID.scrollTop <= 0) this.ID.scrollTop += this.ClientScroll; this.ID.scrollTop -= this.Step; }
            break;
        case 2:
            this.CTL += this.Step;
            if (this.CTL >= this.ScrollStep && this.WaitTime > 0) { this.ID.scrollLeft += this.ScrollStep + this.Step - this.CTL; this.Pause(); return; }
            else { if (this.ID.scrollLeft >= this.ClientScroll) this.ID.scrollLeft -= this.ClientScroll; this.ID.scrollLeft += this.Step; }
            break;
        case 3:
            this.CTL += this.Step;
            if (this.CTL >= this.ScrollStep && this.WaitTime > 0) { this.ID.scrollLeft -= this.ScrollStep + this.Step - this.CTL; this.Pause(); return; }
            else { if (this.ID.scrollLeft <= 0) this.ID.scrollLeft += this.ClientScroll; this.ID.scrollLeft -= this.Step; }
            break;
    }
};
//$(document).ready(function () {
//    CreateMarquee("divOut", 990, 200, 0, 2, 26);
//});