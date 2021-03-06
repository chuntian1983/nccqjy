﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="xmlist.aspx.cs" Inherits="Web.xmlist" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="showLoad" style="display: none; position: absolute; top: 0%; left: 0%; width: 100%;
        height: 100%; background-color: #F6F6F6; z-index: 1001; -moz-opacity: 0.8; opacity: 0.8;
        filter: alpha(opacity=80);">
        <div style="top: 50%; right: 40%; position: absolute; padding: 0px; margin: 0px;
            z-index: 999; border-color: #94BEE7; border-style: solid; border-width: 2px;">
            <img src="Images/ajax_loading.gif" alt="正在加载" align="middle" /><span style="color: Red;
                font-size: 16px; font-weight: bold;">正在加载数据中。。。。。。</span>
        </div>
    </div>
    <div class="list_wz top">
        位置：<a href="../Default.aspx">首页</a> >> 项目公告
    </div>
    <div class="list top">
        <div class="gplist">
              <table class="tr_list">
                <tr>
                    
                    <th class="th2" style="width:80%;">
                        项目名称
                    </th>
                    
                    <th class="th1">
                        公告时间
                    </th>
                   
                   
                </tr>
                  
            
                <asp:Repeater runat="server" ID="rep"><ItemTemplate>
                <tr>
                    <td  >
                        <a href='xmview.aspx?id=<%#Eval("id") %>' target="_blank">
                            <%#Eval("xmtitle").ToString().Length>85?Eval("xmtitle").ToString().Substring(0,85):Eval("xmtitle").ToString() %>
                        </a>
                    </td>
                   
                    <td >
                        <%#DateTime.Parse( Eval("xmsj").ToString()).ToString("yyyy-MM-dd") %>
                    </td>
                    
                    
                </tr>
                </ItemTemplate></asp:Repeater>
          </table>
            
        </div>
        <div>
            <div class="panelBar pager">
            <webdiyer:AspNetPager ID="pg" runat="server" ShowBoxThreshold="5" ShowCustomInfoSection="Left"
                HorizontalAlign="Right" OnPageChanged="Pager_PageChanged" CustomInfoClass="pager-1"
                CustomInfoTextAlign="Left" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页"
                PrevPageText="上一页" CustomInfoHTML="数据：%RecordCount%条  第%CurrentPageIndex%/%PageCount%页 "
                AlwaysShow="true" PageIndexBoxClass="homeLogin" PageSize="20" PageIndexBoxStyle="pagerindexbox"
                PageIndexBoxType="TextBox" ShowPageIndexBox="Always" SubmitButtonText="Go">
            </webdiyer:AspNetPager>
            <asp:HiddenField ID="hdpage" runat="server" Value="1" />
        </div>
        </div>
    </div>
</asp:Content>
