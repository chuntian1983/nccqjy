jQuery(function ($) {
    $('#txtMemberTypeId').combotree({
        url: '../Handler/UserManager.ashx?action=membertypecombo',
        required: true,
        onSelect: function (rec) {
            showOperDiv(rec.id);
        }
    });
});

function showOperDiv(p) {
    if (3 == p) {
        $("#gr1").css("display", "none");
        $("#gr2").css("display", "none");
        $("#gr3").css("display", "none");
        $("#gr4").css("display", "none");
        $("#gs1").css("display", "block");
        $("#gs2").css("display", "block");
        $("#gs3").css("display", "block");
        $("#gs4").css("display", "block");
    }
    else {
        $("#gr1").css("display", "block");
        $("#gr2").css("display", "block");
        $("#gr3").css("display", "block");
        $("#gr4").css("display", "block");
        $("#gs1").css("display", "none");
        $("#gs2").css("display", "none");
        $("#gs3").css("display", "none");
        $("#gs4").css("display", "none");
    }
};
jQuery(function ($) {
    $("#txtOrgCode").combotree({
        url: '../Handler/UserManager.ashx?action=orgtree',
        lines: true,
        required: true,
        onSelect: function (rec) { rec.id; }
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
jQuery(function ($) {
    $.get("../Handler/UserManager.ashx?action=veriuserbyid", {}, function (data) {
        $("#txtLoginName").val(data.LoginName);
        $("#txtLoginPass").val(data.LoginPass);
        $("#txtMemberTypeId").combotree('setValue', data.MemberTypeId);
        $("#txtVeriName").val(data.VeriName);
        $("#txtVeriCorporate").val(data.VeriCorporate);
        $("#txtVeriSex").combobox('setValue', data.VeriSex);
        $("#txtVeriIDCard").val(data.VeriIDCard);
        $("#txtVeriCorporateIDCard").val(data.VeriCorporateIDCard);
        $("#txtId").val(data.Id);
        $("#txtOrgCode").combotree('setValue', data.OrgCode);
        $("#txtVeriAddress").val(data.VeriAddress);
        showOperDiv(data.MemberTypeId);
        $("#txtVeriTel").val(data.VeriTel);
        $("#txtVeriCreditCode").val(data.VeriCreditCode);
        $("#txtUserName").val(data.UserName);
        $("#txtUserTel").val(data.UserTel);
        $("#txtUserEmail").val(data.UserEmail);
        $("#txtUserStatus").val(data.UserStatus);
        $("#txtLoginDate").val(data.LoginDate);
        $("#txtLoginnNum").val(data.LoginnNum);
        $("#txtOutDate").val(data.OutDate);
        if ("1" == data.Veri) { $("#txtVeri").val(data.Veri); } else { $("#txtVeri").val("1"); }  
        $("#txtVeriStatus").val(data.VeriStatus);
        $("#txtAuditType").val(data.AuditType);
        $("#txtVeriCheckName").val(data.VeriCheckName);
        $("#txtVeriApplyDate").val(data.VeriApplyDate);
        $("#txtVeriCheckDate").val(data.VeriCheckDate);
        $("#tVeriIDCardScan").val(data.VeriIDCardScan);
        $("#tVeriCorporateIDCardScan").val(data.VeriCorporateIDCardScan);
        $("#tVeriCreditCodeScan").val(data.VeriCreditCodeScan);
        $("#txtVeriCheckName").val(data.VeriCheckName);
        if ("1" == data.Veri) { $("#btnVeriEdit").hide(); }
        else { $("#btnVeriEdit").show(); }
    }, "json");
});
jQuery(function ($) {
    $("#btnVeriEdit").click(function () {
        $('#VeriUserForms').form('submit', {
            url: '../Handler/UserManager.ashx?action=veriuserup',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
            }
        });
    });
});