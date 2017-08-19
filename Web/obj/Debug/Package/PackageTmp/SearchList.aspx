<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchList.aspx.cs" Inherits="Web.SearchList" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <form runat=server>
    
    <div class="list_wz top">
        位置：<a href="../Default.aspx">首页</a> >> 查询项目
    </div>
    <div class="list top">
        <div class="gplist">
            <table class="tr_list">
                <tr>
                    <th class="th3">
                        项目编号
                    </th>
                    <th class="th2">
                        标的名称
                    </th>
                    <th class="th1">
                        项目类型
                    </th>
                    <th class="th1">
                        挂牌时间
                    </th>
                    <th class="th1">
                        公告价格
                    </th>
                    <th class="th1">
                        截止时间
                    </th>
                </tr>
                 <asp:Repeater runat=server ID="rep1"><ItemTemplate>
                                                           <tr>
                                                           <td>HJNS<%#Eval("Admissibility")%></td>
                                                           <td><a href='BidDetails.aspx?id=<%#Eval("id")%>' target="_blank"> <%#Eval("BidName")%></a></td>
                                                           <td><%#Eval("PropertyTypeName")%></td>
                                                           <td><%#DateTime.Parse(Eval("StartDate").ToString()).ToString("yyyy-MM-dd")%></td>
                                                           <td><%#Eval("ListingPrice")%></td>
                                                           <td><%#DateTime.Parse(Eval("EndDate").ToString()).ToString("yyyy-MM-dd")%></td>
                                                           </tr>
                                                           </ItemTemplate></asp:Repeater>
            </table>
            
            
        </div>
        <webdiyer:aspnetpager id="pg" runat="server" ShowBoxThreshold="5"
										ShowCustomInfoSection="Left" HorizontalAlign="Right" 
    OnPageChanged="Pager_PageChanged"  
    
    CustomInfoClass="pager-1"
    CustomInfoTextAlign="Left"  FirstPageText="首页" 
    LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页" 
    CustomInfoHTML="数据：%RecordCount%条  第%CurrentPageIndex%/%PageCount%页 " 
     AlwaysShow=true PageIndexBoxClass=homeLogin PageSize=20 
       PageIndexBoxStyle="pagerindexbox" 
        PageIndexBoxType="TextBox" ShowPageIndexBox="Always" SubmitButtonText="Go" UrlPaging="false" 
     
     ></webdiyer:aspnetpager>
     <asp:HiddenField ID="hdpage"  runat="server" Value="1" />
    </div>
    </form>
</asp:Content>


