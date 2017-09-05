Request = {
    QueryString: function (item) {
        var svalue = location.search.match(new RegExp("[\?\&]" + item + "=([^\&]*)(\&?)", "i"));
        return svalue ? svalue[1] : svalue;
    }
};

var p = Request.QueryString("p");
jQuery(function ($) {
    var par = Request.QueryString("p");
    $("#txtFK_LiceTranId").val(par);
    $('#txtFK_UploadTypeIndicatorId').combotree({
        url: '../Handler/WebLiTrH.ashx?' + $.param({ action: "combo", LiceTranId: par }),
        required: true,
        onSelect: function (rec) {
            rec.id;
        }
    });
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
jQuery(function ($) {
    $("#btnAdd").click(function () {
        $('#forms').form('submit', {
            url: '../Handler/CommH.ashx?action=scanadd',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
                $('#txtFK_UploadTypeIndicatorId').combotree('setValue', '');
                $("#txtScanUrl").val("");
                $('#txtFK_UploadTypeIndicatorId').combotree('reload');
            }
        });
    });
});
function OnCheckImg(ControlName) {
    var imgDom = document.getElementById(ControlName);
    var location = imgDom.value;
    if (location != "") {
        var point = location.lastIndexOf(".");
        var type = location.substr(point).toLowerCase();
        if (type == ".jpg" || type == ".gif" || type == ".jpeg" || type == ".png") {
            var imgSize = 0;
            if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
                imgSize = imgDom.files[0].fileSize;
            } else {
                imgSize = imgDom.fileSize;
            }
            if (imgSize > 102400) {
                msgShow("提示", "图片大小请不要大于100KB", "info");
                return false;
            }
        }
        else {
            var afile = $("#" + ControlName);
            afile.replaceWith(afile.clone());
            msgShow("提示", "只能上传jpg,jpge,gif,png格式的图片", "info");
            return false;
        }
    }
};