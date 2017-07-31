
document.write("<object id='LODOP' classid='clsid:2105C259-1E0C-4534-8141-A753534CB4CA' width=0 height=0>");
document.write("<param name='CompanyName' value='山东农友软件有限公司' /><param name='License' value='449637775718688748719056235623' />");
document.write("</object>");

var LODOP=document.getElementById("LODOP");

function CheckLodop(){
   var oldVersion=LODOP.Version;
   var newVerion="5.0.4.5";
   if (oldVersion==null){
	   document.write("<h3><font color='#FF00FF'>打印控件未安装!点击这里<a href='/images/print/install_lodop.exe'>执行安装</a>,安装后请刷新页面。</font></h3>");
	   if (navigator.appName=="Netscape")
	       document.write("<h3><font color='#FF00FF'>（Firefox浏览器用户需先点击这里<a href='/images/print/npActiveXFirefox4x.xpi'>安装运行环境</a>）</font></h3>");
   }
   else if (oldVersion<newVerion)
	   document.write("<h3><font color='#FF00FF'>打印控件需要升级!点击这里<a href='/images/print/install_lodop.exe'>执行升级</a>,升级后请重新进入。</font></h3>");
}

CheckLodop();

function PrintOneURL0(printUrl){
    if(!printUrl)
    {
        if(document.all("PrintUrl"))
        {
            printUrl=document.getElementById("PrintUrl").value;
        }
        else
        {
            alert("缺少打印地址！");
            return false;
        }
    }
	LODOP.ADD_PRINT_URL(30,20,746,539,printUrl);
	LODOP.SET_PRINT_STYLEA(1,"HOrient",3);
	LODOP.SET_PRINT_STYLEA(1,"VOrient",3);
	LODOP.PREVIEW();
	return false;
}
function PrintOneURL1(printUrl){
    if(!printUrl)
    {
        if(document.all("PrintUrl"))
        {
            printUrl=document.getElementById("PrintUrl").value;
        }
        else
        {
            alert("缺少打印地址！");
            return false;
        }
    }
	LODOP.ADD_PRINT_URL(30,20,746,539,printUrl);
	LODOP.SET_PRINT_STYLEA(1,"HOrient",3);
	LODOP.SET_PRINT_STYLEA(1,"VOrient",3);
	LODOP.PRINT();
	return false;
}
