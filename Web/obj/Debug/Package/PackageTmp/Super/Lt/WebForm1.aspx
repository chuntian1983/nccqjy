﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Web.Super.Lt.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Online View PDF</title>
<script type="text/javascript" src="../Scripts/easyUI/jquery.min.js"></script>
<script type="text/javascript" src="jquery.media.js"></script>
<script type="text/javascript">
    $(function () {
        $('a.media').media({ width: 800, height: 600 });
    });
</script>
</head>
 
<body>
<a class="media" href="Acrobat.pdf">PDF File</a>
</body>
</html>
