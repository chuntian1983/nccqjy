<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shouye.aspx.cs" Inherits="Web.Super.shouye" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div  style=" color:#15428b">
    <h2>
    欢迎您登陆<%=Application["OrgShortName"] %><%= Application["AllTitle"]%>
    </h2>
    <h3>请选择左边的功能菜单进行操作！</h3>
    </div>
    </form>
</body>
</html>
