<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="Web.LED.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
   
 
    <table style="width:100%">
    <tr>
        <td>

            <div id="marquees"> <!-- 这些是字幕的内容，你可以任意定义 --> 

                <table  style="width:500px;">
                    <tr>
                        <td>

                            <a href="#">早在年初本人就开始构思建立个人主页</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">到今天为止，本站共上传了近200个页面。（9.1)</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">FLASH选修课案例完工，DW选修课案例可望在10、1前搞定。（9、9） </a>
                        </td>
                    </tr>
                </table>

            </div> 
        </td>
    </tr>
</table>



<!-- 以下是javascript代码 -->
<script>

marqueesHeight=80; //内容区高度
stopscroll=false; //这个变量控制是否停止滚动
with(marquees){
    noWrap=true; //这句表内容区不自动换行
    style.width=0; //于是我们可以将它的宽度设为0，因为它会被撑大
    style.height=marqueesHeight;
    style.overflowY="hidden"; //滚动条不可见
    onmouseover=new Function("stopscroll=true"); //鼠标经过，停止滚动
    onmouseout=new Function("stopscroll=false"); //鼠标离开，开始滚动
}
//这时候，内容区的高度是无法读取了。下面输出一个不可见的层"templayer"，稍后将内容复制到里面：
document.write('<div id="templayer" style="position:absolute;z-index:1;visibility:hidden"></div>');
function init(){ //初始化滚动内容
    //多次复制原内容到"templayer"，直到"templayer"的高度大于内容区高度：
    while(templayer.offsetHeight<marqueesHeight){
        templayer.innerHTML+=marquees.innerHTML;
    } 
    //把"templayer"的内容的“两倍”复制回原内容区：
    marquees.innerHTML=templayer.innerHTML+templayer.innerHTML;
    //设置连续超时，调用"scrollUp()"函数驱动滚动条：
    setInterval("scrollUp()",20);
}
document.body.onload=init;
preTop=0; //这个变量用于判断滚动条是否已经到了尽头
function scrollUp(){ //滚动条的驱动函数
    if(stopscroll==true) return; //如果变量"stopscroll"为真，则停止滚动 
    preTop=marquees.scrollTop; //记录滚动前的滚动条位置
    marquees.scrollTop+=1; //滚动条向下移动一个像素
    //如果滚动条不动了，则向上滚动到和当前画面一样的位置
    //当然不仅如此，同样还要向下滚动一个像素(+1)：
    if(preTop==marquees.scrollTop){
        marquees.scrollTop=templayer.offsetHeight-marqueesHeight+1;
    }
}

</script>
  
  
</body>
</html>
