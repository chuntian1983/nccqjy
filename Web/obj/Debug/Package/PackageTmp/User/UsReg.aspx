<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true"
    CodeBehind="UsReg.aspx.cs" Inherits="Web.User.UsReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../super/Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../super/Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="../super/Styles/tbcss.css" rel="stylesheet" type="text/css" />
    <link href="../super/Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../super/Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../super/Scripts/easyUI/jquery.easyui.min.js" type="text/javascript"
        language="javascript"></script>
    <script src="../super/Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript"
        language="javascript"></script>
    <script src="../Scripts/UsReg.js" type="text/javascript" language="javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="top list_wz">
    </div>
    <div class="top zhuce1">
        <form id="forms" runat="server">
        <div class="zhuce">
            <h2>
                用户注册</h2>
            <ul>
                <li class="zc1">用户名：</li>
                <li class="zc2">
                    <input type="text" id="txtLoginName" name="LoginName" onblur="OnCheckLogNameClick();" /></li>
                <li class="zc3">
                    <img id="imgLoginName" src="../Images/no.jpg" />
                    <span id="lblLoginName"></span></li>
            </ul>
            <ul>
                <li class="zc1">密 码：</li>
                <li class="zc2">
                    <input type="password" id="txtLoginPass" name="LoginPass" onblur="OnCheckTextClick('LoginPass');" /></li>
                <li class="zc3">
                    <img id="imgLoginPass" src="../Images/no.jpg" />
                </li>
            </ul>
            <ul>
                <li class="zc1">确认密码：</li>
                <li class="zc2">
                    <input type="password" id="txttLoginPass" onblur="OnCheckTextClick('LoginPass');OnComparisonClick('LoginPass','tLoginPass','两次密码不相同？');" /></li>
                <li class="zc3">
                    <img id="imgtLoginPass" src="../Images/no.jpg" />
                    <span id="lbltLoginPass"></span></li>
            </ul>
            <ul>
                <li class="zc1">姓 名：</li>
                <li class="zc2">
                    <input type="text" id="txtUserName" name="UserName" onblur="OnCheckTextClick('UserName');" /></li>
                <li class="zc3">
                    <img id="imgUserName" src="../Images/no.jpg" />
                </li>
            </ul>
            <ul>
                <li class="zc1">邮 箱：</li>
                <li class="zc2">
                    <input type="text" id="txtUserEmail" name="UserEmail" onblur="OnCheckTextClick('UserEmail');" /></li>
                <li class="zc3">
                    <img id="imgUserEmail" src="../Images/no.jpg" />
                </li>
            </ul>
            <ul>
                <li class="zc1">手机号：</li>
                <li class="zc2">
                    <input type="text" id="txtUserTel" name="UserTel" onblur="OnCheckTextClick('UserTel');" /><br />
                    <input type="button" id="TelCode" class="telyz" style=" height:30px;" onclick="OnGetTelCodeClick();" value="点击获得手机验证码" />
                </li>
                <li class="zc3">
                    <img id="imgUserTel" src="../Images/no.jpg" />
                </li>
            </ul>
            <ul>
                <li class="zc1">手机验证码：</li>
                <li class="zc2">
                    <input type="text" id="txtCheckTelCode" name="CheckTelCode" onblur="OnCheckTextClick('CheckTelCode');OnComparisonClick('tCheckTelCode','CheckTelCode','验证码不正确？');" />
                    <input type="hidden" id="txttCheckTelCode" />
                </li>
                <li class="zc3">
                    <img id="imgCheckTelCode" src="../Images/no.jpg" />
                    <span id="lblCheckTelCode"></span></li>
            </ul>
            <ul>
                <li class="zc1">&nbsp;</li>
                <li class="zc2">
                    <input type="button" class="tijiao" value=" 注 册 " id="btnAdd" /></li>
            </ul>
        </div>
        </form>
    </div>
</asp:Content>
