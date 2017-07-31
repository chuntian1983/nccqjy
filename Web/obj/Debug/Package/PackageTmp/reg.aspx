<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg.aspx.cs" Inherits="Web.reg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>软件注册</title>
    <style type="text/css">
body{padding:0; margin: 0; font-family: tahoma,Arial,"Hiragino Sans GB","Microsoft Yahei","微软雅黑","宋体",sans-serif; }
.zc{text-align: center; margin-top:85px;}
h1{color:#3080e2;}
.cont{font-size: 14px;padding: 35px 0;font-weight:100;color:#454545;}
.zcm{margin: 15px; color: #ff5d16;font-size: 25px;font-weight: 400; }
.zcm input{border:1px solid #e5e5e5;width:280px; height: 28px;color: #a8a8a8; line-height: 28px;padding-left:5px;}
.tj input{border-radius: 3px;background: #3080e2; height: 30px; width: 189px; line-height: 30px;font-size: 16px;color: #fff;font-weight: 600; border: 0;}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="zc">
		<h1>软件注册</h1>
        
		<div class="cont">
			<strong>您的机器码：</strong><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
			<div class="zcm"><span>输入注册码：</span><asp:TextBox ID="TextBox1" runat="server" Width="331px"></asp:TextBox></div>
            <p style="line-height: 150%;">
                    &nbsp;&nbsp;&nbsp;欢迎您成为我公司的正式软件用户！请将您的软件序列号告知我公司客户服务中心工作人员进行备案登记，<Br />进而索取软件注册号，进行登记确认，已确保我公司能够向您提供及时的售后服务以及软件升级服务。
                </p>
                <p>
                    &nbsp;&nbsp;&nbsp;注册电话：0631-5626025 5626026
                </p>
                <p>
                    &nbsp;&nbsp;&nbsp;注册时间：上午8:00至下午17:30（周一至周五）<br />
                    <br />
                </p>
			
		</div>
		<div class="tj"><asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="注  册" /></div>
	</div>
    </form>
</body>
</html>
