﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Web.Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>项目测试专用窗口</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%
            int DepaStatus = 2;
            Response.Write(DepaStatus <= 0);        
        
        %>
    </div>
    </form>
</body>
</html>