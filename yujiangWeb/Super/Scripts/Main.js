$(document).ready(function () {
    tabClose();
    tabCloseEven();
});

$(document).ready(function () {
    $.get("Ashx/Login.ashx?action=adminname", {}, function (data) {
        $("#lblUserName").html(data);
    }, "text");
});
$(document).ready(function () {
    $(".easyui-accordion1").empty();
    var menulist = "";
    $.get("Ashx/Main.ashx?action=fun&flag=" + Math.random(), {}, function (data) {
        $.each(data, function (i, n) {
            menulist += '<div title="※ ' + n.menuname + '" icon="icon-sys" style="overflow:auto;">';
            menulist += '<ul>';
            $.each(n.menus, function (j, o) {
                menulist += '<div><a ref="' + o.menuid + '" href="#" rel="' + o.url + '"><span class="icon icon-nav">&nbsp;</span><span class="nav">' + o.menuname + '</span></a></div><br/>';
            })
            menulist += '</ul></div>';
        })
        $(".easyui-accordion1").append(menulist);
        $('.easyui-accordion1 a').click(function () {
            var tabTitle = $(this).children('.nav').text();
            var url = $(this).attr("rel");
            var icon = 'icon-save';
            addTab(tabTitle, url, icon);
            $('.easyui-accordion1 div').removeClass("selected");
            $(this).parent().addClass("selected");
        }).hover(function () {
            $(this).parent().addClass("hover");
        }, function () {
            $(this).parent().removeClass("hover");
        });
        $(".easyui-accordion1").accordion();
    }, "json");
});
function OnOpenNewPageLoadTab(url, title, icon) {
    addTab(title, url, icon);
};
function tabClose() {
    $(".tabs-inner").dblclick(function () {
        var subtitle = $(this).children(".tabs-closable").text();
        $('#tabs').tabs('close', subtitle);
    })
    $(".tabs-inner").bind('contextmenu', function (e) {
        $('#mm').menu('show', {
            left: e.pageX,
            top: e.pageY
        });
        var subtitle = $(this).children(".tabs-closable").text();

        $('#mm').data("currtab", subtitle);
        $('#tabs').tabs('select', subtitle);
        return false;
    });
};
function createFrame(url) {
    return '<iframe scrolling="auto" frameborder="0" style="width:100%;height:100%;"  src="' + url + '"></iframe>';
};
function addTab(subtitle, url, icon) {
    if (!$('#tabs').tabs('exists', subtitle)) {
        $('#tabs').tabs('add', {
            title: subtitle,
            content: createFrame(url),
            closable: true,
            cache: false,
            icon: icon
        });
    } else {
        $('#tabs').tabs('select', subtitle);
    }
    tabClose();
};
function tabCloseEven() {
    $('#mm-tabclose').click(function () {
        var currtab_title = $('#mm').data("currtab");
        $('#tabs').tabs('close', currtab_title);
    })
    $('#mm-tabcloseall').click(function () {
        $('.tabs-inner span').each(function (i, n) {
            var t = $(n).text();
            $('#tabs').tabs('close', t);
        });
    });
    $('#mm-tabcloseother').click(function () {
        var currtab_title = $('#mm').data("currtab");
        $('.tabs-inner span').each(function (i, n) {
            var t = $(n).text();
            if (t != currtab_title)
                $('#tabs').tabs('close', t);
        });
    });
    $('#mm-tabcloseright').click(function () {
        var nextall = $('.tabs-selected').nextAll();
        if (nextall.length == 0) {
            msgShow('系统提示', '后边没有啦....', 'error');
            return false;
        }
        nextall.each(function (i, n) {
            var t = $('a:eq(0) span', $(n)).text();
            $('#tabs').tabs('close', t);
        });
        return false;
    });
    $('#mm-tabcloseleft').click(function () {
        var prevall = $('.tabs-selected').prevAll();
        if (prevall.length == 0) {
            msgShow('系统提示', '到头了，前边没有啦....', 'error');
            return false;
        }
        prevall.each(function (i, n) {
            var t = $('a:eq(0) span', $(n)).text();
            $('#tabs').tabs('close', t);
        });
        return false;
    });

    $("#mm-exit").click(function () {
        $('#mm').menu('hide');
    })
};
jQuery(function ($) {
    $('#loginOut').click(function () {
        $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function (r) {
            if (r) {
                $.get("Ashx/Login.ashx?action=out?flag=" + Math.random(), { p: "" }, function (d) {
                    window.location.href = "/Super/Default.aspx";
                }, "text");
            }
        });
    });
});
jQuery(function ($) {
    $("#home").attr("src", "index.aspx?flag=" + Math.random());
});
$.ajaxSetup({
    global: false,
    cache: false
});