jQuery(function ($) {
OnLoadSerialNumber();
});
function OnLoadSerialNumber() {
$.get("Ashx/SoftRegh.ashx?action=sn", {}, function (data) {
$("#txtSerialNumber").val(data);
}, "text");
};
jQuery(function ($) {
$("#btnReg").click(function () { OnRegistrationClick(); });
});
function OnRegistrationClick() {
if ("" != $("#txtRegistration").val()) {
$.get("Ashx/SoftRegh.ashx?action=reg", { r: $("#txtRegistration").val() }, function (data) {           
if (data == "Y") {
window.location.replace("Default.aspx");
}
else {
alert("注册号不正确，软件注册失败！");
$("#txtRegistration").val("");
}
}, "text");
} else {
alert("注册号为空，请录入软件注册号！");
}
};