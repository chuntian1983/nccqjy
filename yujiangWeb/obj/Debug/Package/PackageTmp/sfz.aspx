<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sfz.aspx.cs" Inherits="Web.sfz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<OBJECT
	  classid="clsid:F1317711-6BDE-4658-ABAA-39E31D3704D3"                  
	  codebase="SDRdCard.cab#version=1,3,6,4"
	  width=330
	  height=210
	  align=center
	  hspace=0
	  vspace=0
	  id=idcard
	  name=rdcard	
>
</OBJECT>
    <form id="form1" runat="server">
    <div>
    <input type="button" value="根据身份证查询信息"         style="width:140px;"    name="beginread" onClick="beginread_onclick()"/>
    <asp:HiddenField
        ID="hdsfz" runat="server" Value="0" />
    <input name="tcardID" id="tcard" type="text" size="40" runat="server" />
    <input id="txtjg" type="text" size="40" runat="server" />
    <asp:Button ID="Button1" runat="server" Width="0px" Height="0px" Text="" 
            onclick="Button1_Click"  />
    </div>
    </form>
    <script for=idcard event="Readed()">
      //alert('Readed');
      getinfo_onclick();
</script>

    <SCRIPT>
        
        function beginread_onclick() {

            var pp
            pp = rdcard.ReadCard2();
            if (pp == 0) {
                alert("请把身份证放入识别区域，点击确定进行查询");
            }
            else {
                aalert("ReadCard2失败");
            }
        }
      

        function getinfo_onclick() {


            document.getElementsByName("tcardID").value = rdcard.CardNo;
            document.getElementById("hdsfz").value = rdcard.CardNo;
            fu();
            //sendAsynchronRequest("sfzcx.aspx?id=111", null, loadCallBack);
            

        }
        function fu() {
            
            document.getElementById("Button1").click(); 
        }

</SCRIPT>

</body>
</html>
