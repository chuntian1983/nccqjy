jQuery(function ($) {
    $.get("Handler/WebSite.ashx?action=Top", { top: 12, TypeId: 1 }, function (data) {
        var tnewsTop = "";
        var productData = data.T;
        if (productData == null) { tnewsTop = "暂无信息"; }
        $.each(productData, function (i, n) {
            tnewsTop += "<li><span>·</span><a href=\"NewsDetails.aspx?t=" + n.NewsTypeId + "&id=" + n.Id + "\">" + n.NewsTitle + "</a></li>";
        });
        $("#lblNewsTop").html(tnewsTop);
    }, "json");
});
jQuery(function ($) {
    $.get("Handler/WebSite.ashx?action=File", { top: 10 }, function (data) {
        var tnewsTopFile = "";
        var productData = data.T;
        $.each(productData, function (i, n) {
            tnewsTopFile += "<li><a target=\"_blank\" href=\"../newsFile/\"" + n.NewsFile + "\">" + n.NewsTitle + "</a></li>";
        });
        $("#lblNewsTopFile").html(tnewsTopFile);
    }, "json");
});
jQuery(function ($) {
    $.get("Handler/WebSite.ashx?action=IntenTop", { top: 7, IntentionType: 1 }, function (data) {
        var tIntention = "";
        var productData = data.T;
        $.each(productData, function (i, n) {
            tIntention += "<li><a href=\"IntenDetails.aspx?t=" + n.IntentionType + "&id=" + n.Id + "\">" + n.Title + "</a>——<span>" + n.CheckDate + "</span></li>";
        });
        $("#lblIntention").html(tIntention);
    }, "json");
});
jQuery(function ($) {
    $.get("Handler/WebSite.ashx?action=IntenTop", { top: 7, IntentionType: 2 }, function (data) {
        var tIntention = "";
        var productData = data.T;
        $.each(productData, function (i, n) {
            tIntention += "<li><a href=\"IntenDetails.aspx?t=" + n.IntentionType + "&id=" + n.Id + "\">" + n.Title + "</a>——<span>" + n.CheckDate + "</span></li>";
        });
        $("#lblIntention2").html(tIntention);
    }, "json");
});
jQuery(function ($) {
    $.get("Handler/WebSite.ashx?action=IntenTop", { top: 7, IntentionType: 3 }, function (data) {
        var tIntention = "";
        var productData = data.T;
        $.each(productData, function (i, n) {
            tIntention += "<li><a href=\"IntenDetails.aspx?t=" + n.IntentionType + "&id=" + n.Id + "\">" + n.Title + "</a>——<span>" + n.CheckDate + "</span></li>";
        });
        $("#lblIntention3").html(tIntention);
    }, "json");
});
jQuery(function ($) {
    OnShowBidClick(0);
});
var rowcount = 0;
function OnShowBidClick(r) {
    $.get("Handler/WebSite.ashx?action=BidList&flag=" + Math.random(), { rows: r }, function (data) {
        var tbid = "";
        var productData = data.T;
        if (productData == null) { rowcount = productData.length; }
        $.each(productData, function (i, n) {
            tbid += "<ul><li>HJNS" + n.Admissibility + "</li><li class=\"gpwidth2\"><a href=\"BidDetails.aspx?t=" + n.FK_LiceTranId + "&id=" + n.Id + "\">" + n.BidName + "</a></li><li>" + n.StartDate.substring(0, 10) + "</li><li class=\"gpwidth3\">" + n.Properties + "</li><li>" + n.ListingPrice + "</li><li>" + n.EndDate.substring(0, 10) + "</li><li class=\"gpwidth1\"><a href=\"#\"><!--<img src=\"images/nc_30.jpg\">--></a></li></ul>";
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
};
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
$(document).ready(function () {
    CreateMarquee("divOut", 990, 200, 0, 2, 26);
});
$(document).ready(function () {
    $(".guapai_list_c").mouseover(function () {
        $(this).css("background-color", "#ffeec4");
        $(this).find(".jingjia").css("display", "block");
    });
    $(".guapai_list_c").mouseout(function () {
        $(this).css("background-color", "#fff");
        $(this).find(".jingjia").css("display", "none");
    });
});
function shitabs(fid, sid, num, active, c) {
    for (i = 1; i <= num; i++) {
        if (i == active) {
            document.getElementById(fid + i).className = c;
            document.getElementById(sid + i).style.display = 'block';
        }
        else {
            document.getElementById(fid + i).className = "";
            document.getElementById(sid + i).style.display = 'none';
        }
    }
};
function yxtab(fid, sid, num, active) {
    for (i = 1; i <= num; i++) {

        if (i == active) {
            document.getElementById(sid + i).style.display = 'block';
        }
        else {
            document.getElementById(sid + i).style.display = 'none';
        }
    }
};
function qhtab(str) {
    if (str == "1") {
        document.getElementById("dtcontent1").style.display = 'block';
        document.getElementById("dtcontent2").style.display = 'none';
        document.getElementById("dtcontent3").style.display = 'none';

    }
    else if (str == "2") {
        document.getElementById("dtcontent1").style.display = 'none';
        document.getElementById("dtcontent2").style.display = 'block';
        document.getElementById("dtcontent3").style.display = 'none';

    }
    else if (str == "3") {
        document.getElementById("dtcontent1").style.display = 'none';
        document.getElementById("dtcontent2").style.display = 'none';
        document.getElementById("dtcontent3").style.display = 'block';
    }
}
jQuery(function ($) {
    $.get("/Handler/WebSite.ashx?action=org", {}, function (data) {
        var orgList = "";
        for (var i = 0; i < data.T.length; i++) {
            orgList += " <li><span>·</span><a href=\"#\">" + data.T[i].OrgShortName + "</a></li>";
        }
        $("#orgList").html(orgList);
    }, "json");
});
jQuery(function ($) {
    $.get("Handler/WebSite.ashx?action=Top", { top: 5, TypeId: 10 }, function (data) {
        var tnewsTop = "";
        var productData = data.T;
        if (productData == null) { tnewsTop = "暂无信息"; }
        $.each(productData, function (i, n) {
            tnewsTop += "<li><span>·</span><a href=\"NewsDetails.aspx?t=" + n.NewsTypeId + "&id=" + n.Id + "\">" + n.NewsTitle + "</a></li>";
        });
        $("#lblgqgg").html(tnewsTop);
    }, "json");
});