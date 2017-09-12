<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttPrint.aspx.cs" Inherits="Web.Super.Bi.AttPrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="../Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/print/CheckActivX.js" type="text/javascript"></script>
    <script src="../Scripts/AttPrint.js" language="javascript" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="position: absolute; left: 900px;">
        <input type="button" value="打印" id="btnprint" onclick="btnPrintClick();" />
    </div>
    <div id="showPage" style="width: 1270;">
        <style type="text/css">
            .fnt
            {
                position: absolute;
                border-width: 0px;
                border-style: solid;
                width: 130px;
                height: 35px;
            }
            .fnt0
            {
                position: absolute;
                border-width: 0px;
                border-style: solid;
                width: 170px;
                height: 35px;
            }
            .fnt1
            {
                position: absolute;
                border-width: 0px;
                border-style: solid;
                width: 400px;
            }
            .fnt2
            {
                position: absolute;
                border-width: 0px;
                border-style: solid;
                height: 450px;
                width: 540px;
            }
            .fnt3
            {
                position: absolute;
                border-width: 0px;
                border-style: solid;
                width: 130px;
                font-size: 28px;
                height: 35px;
            }
        </style>
        <div id="njz" class="fnt3">
            <span id="txtnjz"></span>
        </div>
        <div id="djh" class="fnt3">
            <span id="txtdjh"></span>
        </div>
        <div id="jycp" class="fnt0">
            <span id="txtjycp"></span>
        </div>
        <div id="xmbh" class="fnt">
            <span id="txtxmbh"></span>
        </div>
        <div id="syqr" class="fnt">
            <span id="txtsyqr"></span>
        </div>
        <div id="zcf" class="fnt">
            <span id="txtzcf"></span>
        </div>
        <div id="zcxwpzjg" class="fnt">
            <span id="txtzcxwpzjg"></span>
        </div>
        <div id="zcfdb" class="fnt">
            <span id="txtzcfdb"></span>
        </div>
        <div id="zcsfz" class="fnt">
            <span id="txtzcsfz"></span>
        </div>
        <div id="srf" class="fnt">
            <span id="txtsrf"></span>
        </div>
        <div id="srfddb" class="fnt">
            <span id="txtsrfddb"></span>
        </div>
        <div id="gsxz" class="fnt">
            <span id="txtgsxz"></span>
        </div>
        <div id="zczb" class="fnt">
            <span id="txtzczb"></span>
        </div>
        <div id="srsfz" class="fnt">
            <span id="txtsrsfz"></span>
        </div>
        <div id="bdjbqk" class="fnt1">
            <span id="txtbdjbqk"></span>
        </div>
        <div id="zcqx" class="fnt2">
            <span id="txtzcqx"></span>
        </div>
        <div id="qqjg" class="fnt">
            <span id="txtqqjg"></span>
        </div>
        <div id="qzbh" class="fnt">
            <span id="txtqzbh"></span>
        </div>
        <div id="zcfs" class="fnt">
            <span id="txtzcfs"></span>
        </div>
        <div id="jyfs" class="fnt">
            <span id="txtjyfs"></span>
        </div>
        <div id="jydj" class="fnt">
            <span id="txtjydj"></span>
        </div>
        <div id="cjje" class="fnt">
            <span id="txtcjje"></span>
        </div>
        <div id="htqsrq" class="fnt">
            <span id="txthtqsrq"></span>
        </div>
        <div id="htbh" class="fnt">
            <span id="txthtbh"></span>
        </div>
        <div id="beizhu" class="fnt2">
            <span id="txtbeizhu"></span>
        </div>
        <div id="nian" class="fnt">
            <span id="txtnian"></span>
        </div>
        <div id="yue" class="fnt">
            <span id="txtyue"></span>
        </div>
        <div id="ri" class="fnt">
            <span id="txtri"></span>
        </div>
    </div>
    </form>
</body>
</html>
