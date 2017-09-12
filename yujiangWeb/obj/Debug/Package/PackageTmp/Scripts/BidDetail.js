Request = {
    QueryString: function (item) {
        var svalue = location.search.match(new RegExp("[\?\&]" + item + "=([^\&]*)(\&?)", "i"));
        return svalue ? svalue[1] : svalue;
    }
};

jQuery(function ($) {
    var id = Request.QueryString("id");
    $.get("Handler/WebSite.ashx?action=byId", { Id: id }, function (data) {
        if (data.T[0] != null) {
            $("#lbl_Details_TitleName").text(data.T[0].BidName);
            $("#lblAddr").text(data.T[0].Addr);
            $("#lblMemberTypeId").text(data.T[0].TypeCertificationName);
            $("#lblCorporate").text(data.T[0].Corporate);
            $("#lblTel").text(data.T[0].Tel);
            $("#lblContact").text(data.T[0].Contact);
            $("#lblOwner").text(data.T[0].Owner);
            $("#lblCapital").text(data.T[0].Capital);
            $("#lblOrganizationCode").text(data.T[0].OrganizationCode);
            $("#lblIDCard").text(data.T[0].IDCard);
            $("#txtFK_LiceTranId").text(data.T[0].Name);
            $("#txtOrgCode").text(data.T[0].OrgCode);
            $("#txtBidName").text(data.T[0].BidName);
            $("#lblAdmissibility").text(data.T[0].Admissibility);
            $("#txtListingPrice").text(data.T[0].ListingPrice);
            $("#txtStartDate").text(data.T[0].StartDate.substring(0, 10));
            $("#txtEndDate").text(data.T[0].EndDate.substring(0, 10));
            $("#txtProperties").text(data.T[0].Properties);
            $("#txtOwnership").text(data.T[0].Ownership);
            $("#txtBidBasic").text(data.T[0].BidBasic);
            $("#txtTurnOut").text(data.T[0].TurnOut);
            $("#txtWarrantNumber").text(data.T[0].WarrantNumber);
            $("#txtRightsBodies").text(data.T[0].RightsBodies);
            $("#txtFeedingMechanism").text(data.T[0].FeedingMechanism);
            $("#txtStandardMode").text(data.T[0].StandardMode);
            $("#txtRelatesNum").text(data.T[0].RelatesNum);
            $("#txtStandardType").text(data.T[0].StandardType);
            $("#txtPublicity").text(data.T[0].Publicity);
            $("#txtTradingCenterName").text(data.T[0].TradingCenterName);
        } else {
            $("#txtBidName").html("<span style='color:red;font-size:30px;'>暂无数据信息！</span>");
        }
    }, "json");
});