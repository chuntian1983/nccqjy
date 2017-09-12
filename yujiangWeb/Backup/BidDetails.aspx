<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="BidDetails.aspx.cs" Inherits="Web.BidDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../super/Styles/tbcss.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/BidDetail.js" type="text/javascript" language="javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="top list_wz">
        位置：<a href="Default.aspx">首页</a> >> 交易项目 >> <span id="lbl_Details_TitleName"></span>
    </div>
    <div class="list top">
        <div class="top">
            <br />
            <table border="0" class="table" cellpadding="0" cellspacing="0" width="625" align="center">
                <tr>
                    <td align="right" height="35" colspan="5">
                        项目编号：HJNS<span id="lblAdmissibility"></span>&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" height="35">
                        组织单位
                    </td>
                    <td colspan="3">
                        <span id="txtOrgCode"></span>
                    </td>
                </tr>
                <tr>
                    <td height="132" rowspan="6" width="35" align="center">
                        出<br />
                        让<br />
                        方<br />
                        基<br />
                        本<br />
                        情<br />
                        况
                    </td>
                    <td width="130" height="35" align="center">
                        出让方名称
                    </td>
                    <td colspan="3">
                        <span id="txtFK_LiceTranId"></span>
                    </td>
                </tr>
                <tr>
                    <td height="35" align="center">
                        住址
                    </td>
                    <td colspan="3">
                        <span id="lblAddr"></span>
                    </td>
                </tr>
                <tr>
                    <td height="35" align="center">
                        经济类型
                    </td>
                    <td width="169">
                        <span id="lblMemberTypeId"></span>
                    </td>
                    <td width="123" align="center">
                        法定代表人
                    </td>
                    <td width="168">
                        <span id="lblCorporate"></span>
                    </td>
                </tr>
                <tr>
                    <td height="35" align="center">
                        联系人
                    </td>
                    <td width="169">
                        <span id="lblContact"></span>
                    </td>
                    <td width="123" align="center">
                        所有权人
                    </td>
                    <td width="168">
                        <span id="lblOwner"></span>
                    </td>
                </tr>
                <tr>
                    <td height="35" align="center">
                        联系电话
                    </td>
                    <td>
                        <span id="lblTel"></span>
                    </td>
                    <td align="center">
                        身份证号码
                    </td>
                    <td>
                        <span id="lblIDCard"></span>
                    </td>
                </tr>
                <tr>
                    <td height="35" align="center">
                        注册资本
                    </td>
                    <td>
                        <span id="lblCapital"></span>
                    </td>
                    <td align="center">
                        组织机构代码
                    </td>
                    <td>
                        <span id="lblOrganizationCode"></span>
                    </td>
                </tr>
                <tr>
                    <td height="399" rowspan="10" width="35" align="center">
                        标<br />
                        的<br />
                        基<br />
                        本<br />
                        情<br />
                        况
                    </td>
                    <td height="35" align="center">
                        转出标的名称
                    </td>
                    <td colspan="3">
                        <span id="txtBidName"></span>
                    </td>
                </tr>
                <tr>
                    <td height="35" align="center">
                        挂牌价格
                    </td>
                    <td colspan="3">
                        <span id="txtListingPrice"></span>
                    </td>
                </tr>
                <tr>
                    <td height="35" align="center">
                        拟转出期限
                    </td>
                    <td colspan="3">
                        起 <span id="txtStartDate"></span>至 <span id="txtEndDate"></span>止
                    </td>
                </tr>
                <tr>
                    <td height="135" width="130" align="center">
                        标&nbsp;&nbsp;的<br />
                        <br />
                        基&nbsp;&nbsp;本<br />
                        <br />
                        情&nbsp;&nbsp;况
                    </td>
                    <td colspan="3" valign="top">
                        <span id="txtBidBasic"></span>
                    </td>
                </tr>
                <tr>
                    <td height="35" align="center">
                        产权类型
                    </td>
                    <td>
                        <span id="txtProperties"></span>
                    </td>
                    <td align="center">
                        权属
                    </td>
                    <td>
                        <span id="txtOwnership"></span>
                    </td>
                </tr>
                <tr>
                    <td height="35" align="center">
                        转出方式
                    </td>
                    <td>
                        <span id="txtTurnOut"></span>
                    </td>
                    <td align="center">
                        权证编号
                    </td>
                    <td>
                        <span id="txtWarrantNumber"></span>
                    </td>
                </tr>
                <tr>
                    <td height="35" align="center">
                        确权机构
                    </td>
                    <td>
                        <span id="txtRightsBodies"></span>
                    </td>
                    <td align="center">
                        转出批准机构
                    </td>
                    <td>
                        <span id="txtFeedingMechanism"></span>
                    </td>
                </tr>
                <tr>
                    <td height="35" align="center">
                        交易方式
                    </td>
                    <td>
                        <span id="txtStandardMode"></span>
                    </td>
                    <td align="center">
                        交易低价
                    </td>
                    <td>
                        <span id="txtLowTransaction"></span>
                    </td>
                </tr>
                <tr>
                    <td height="35" align="center">
                        成交金额
                    </td>
                    <td>
                        <span id="txtTurnover"></span>
                    </td>
                    <td align="center">
                        涉及农户数
                    </td>
                    <td>
                        <span id="txtRelatesNum"></span>
                    </td>
                </tr>
                <tr>
                    <td height="35" align="center">
                        挂牌方式
                    </td>
                    <td>
                        <span id="txtStandardType"></span>
                    </td>
                    <td align="center">
                        公示期
                    </td>
                    <td>
                        <span id="txtPublicity"></span>天
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" height="35">
                        交易中心名称
                    </td>
                    <td colspan="3">
                        <span id="txtTradingCenterName"></span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
