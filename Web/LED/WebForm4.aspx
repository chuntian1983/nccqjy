<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="Web.LED.WebForm4" %>

<!DOCTYPE html>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>table��div���Թ��������£�</title>
    <style>
        #tables tr { height:35px;
        }
    </style>
</head>

<body>
    
    <form id="form1" runat="server">
    
<div id="show" style="overflow:hidden;height:235px;border:1px solid red;">   
  <table id="tables"  width="100%";height=235px; border="1px solid red;" cellspacing="0" style="border-collapse:collapse;">
        	
            <tbody>
				  <tr>
                  	<td>�������ķ��ɵط����ȷ�1</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  </tr>    
				  <tr>
                  	<td>�������ķ��ɵط����ȷ�2</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  </tr> 
				  <tr>
                  	<td>�������ķ��ɵط����ȷ�3</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  </tr> 
				  <tr>
                  	<td>�������ķ��ɵط����ȷ�4</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  </tr> 
				  <tr>
                  	<td>�������ķ��ɵط����ȷ�5</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  </tr> 
				  <tr>
                  	<td>�������ķ��ɵط����ȷ�6</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  </tr> 
				  <tr>
                  	<td>�������ķ��ɵط����ȷ�7</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  </tr> 
				  <tr>
                  	<td>�������ķ��ɵط����ȷ�8</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  </tr>   
				  <tr>
                  	<td>�������ķ��ɵط����ȷ�9</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  </tr>     
				  <tr>
                  	<td>�������ķ��ɵط����ȷ�10</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  </tr>     
				  <tr>
                  	<td>�������ķ��ɵط����ȷ�11</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  </tr>     
				  <tr>
                  	<td>�������ķ��ɵط����ȷ�12</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  	<td>�������ķ��ɵط����ȷ�</td>
                  </tr>         
            </tbody>
  </table>
</div>   
<script>   
	function marques(lh,speed,delay){    
		var intervalFunction;    
		var oHeight = 210; /** div�ĸ߶� **/  
		var scrollDiv=document.getElementById("show");    
		var preTop = 0;   
		scrollDiv.scrollTop = 0;   
		//var p=false;   
		 
		function start(){    
			intervalFunction=setInterval(scrolling,speed);       
		};    
		
		function scrolling(){  
		    if( scrollDiv.scrollHeight-scrollDiv.offsetHeight<scrollDiv.scrollTop){   
				preTop = scrollDiv.scrollTop;   
				scrollDiv.scrollTop+=1;   
				if(preTop >= scrollDiv.scrollHeight || preTop==scrollDiv.scrollTop){   
					scrollDiv.scrollTop = 0;   
				}   
			}else{   
			  // clearInterval(intervalFunction);    �����ʱ��
			  // setTimeout(start,delay);    ������ʱ��
			}  
			 scrollDiv.scrollTop+=1; 
			 //mouse�¼�ֻ��д�ڷ����ڲ��ܱ�֤over��out��scrollTop�߶�һ����
	         scrollDiv.onmouseover=function() {clearInterval(intervalFunction)}; 
	         scrollDiv.onmouseout=function() {intervalFunction=setInterval(scrolling,speed)};  
		};
		    
		setTimeout(start,delay);    
	};
	marques(25,40,500);    
    /**marquees(һ�ι����߶�,�ٶ�,ͣ��ʱ��);**/    
</script> 
    <div id="showdiv3" style="overflow:scroll; height: 235px;border:1px solid red;">
                <table style="height:235px; width:100%" border="1px solid red;" cellspacing="0" style="border-collapse:collapse;">
                    <tbody>
                    <tr>
                        <td>HJNS2017000033</td>
                        <td>�ϲ��ж�������ɽ�ֵ����´����������豸ת��1</td>
                        <td>ũ�弯�徭Ӫ���ʲ�</td>
                        <td>289/Ķ</td>
                        <td>2017-01-12</td>
                    </tr>
                    <tr>
                        <td>HJNS2017000033</td>
                        <td  >�ϲ��ж�������ɽ�ֵ����´����������豸ת��2</td>
                        <td>ũ�弯�徭Ӫ���ʲ�</td>
                        <td>289/Ķ</td>
                        <td>2017-01-12</td>
                    </tr>
                    <tr>
                        <td>HJNS2017000033</td>
                        <td  >�ϲ��ж�������ɽ�ֵ����´����������豸ת��3</td>
                        <td>ũ�弯�徭Ӫ���ʲ�</td>
                        <td>289/Ķ</td>
                        <td>2017-01-12</td>
                    </tr>
                    <tr>
                        <td>HJNS2017000033</td>
                        <td>�ϲ��ж�������ɽ�ֵ����´����������豸ת��4</td>
                        <td>ũ�弯�徭Ӫ���ʲ�</td>
                        <td>289/Ķ</td>
                        <td>2017-01-12</td>
                    </tr>
                    <tr>
                        <td>HJNS2017000033</td>
                        <td  >�ϲ��ж�������ɽ�ֵ����´����������豸ת��5</td>
                        <td>ũ�弯�徭Ӫ���ʲ�</td>
                        <td>289/Ķ</td>
                        <td>2017-01-12</td>
                    </tr>
                    <tr>
                        <td>HJNS2017000033</td>
                        <td  >�ϲ��ж�������ɽ�ֵ����´����������豸ת��6</td>
                        <td>ũ�弯�徭Ӫ���ʲ�</td>
                        <td>289/Ķ</td>
                        <td>2017-01-12</td>
                    </tr>
                        <tr>
                        <td>HJNS2017000033</td>
                        <td>�ϲ��ж�������ɽ�ֵ����´����������豸ת��7</td>
                        <td>ũ�弯�徭Ӫ���ʲ�</td>
                        <td>289/Ķ</td>
                        <td>2017-01-12</td>
                    </tr>
                        <tr>
                        <td>HJNS2017000033</td>
                        <td>�ϲ��ж�������ɽ�ֵ����´����������豸ת��8</td>
                        <td>ũ�弯�徭Ӫ���ʲ�</td>
                        <td>289/Ķ</td>
                        <td>2017-01-12</td>
                    </tr>
                        <tr>
                        <td>HJNS2017000033</td>
                        <td>�ϲ��ж�������ɽ�ֵ����´����������豸ת��9</td>
                        <td>ũ�弯�徭Ӫ���ʲ�</td>
                        <td>289/Ķ</td>
                        <td>2017-01-12</td>
                    </tr>
                        <tr>
                        <td>HJNS2017000033</td>
                        <td>�ϲ��ж�������ɽ�ֵ����´����������豸ת��10</td>
                        <td>ũ�弯�徭Ӫ���ʲ�</td>
                        <td>289/Ķ</td>
                        <td>2017-01-12</td>
                    </tr>
                        <tr>
                        <td>HJNS2017000033</td>
                        <td>�ϲ��ж�������ɽ�ֵ����´����������豸ת��11</td>
                        <td>ũ�弯�徭Ӫ���ʲ�</td>
                        <td>289/Ķ</td>
                        <td>2017-01-12</td>
                    </tr>
                        <tr>
                        <td>HJNS2017000033</td>
                        <td>�ϲ��ж�������ɽ�ֵ����´����������豸ת��12</td>
                        <td>ũ�弯�徭Ӫ���ʲ�</td>
                        <td>289/Ķ</td>
                        <td>2017-01-12</td>
                    </tr>
                        <tr>
                        <td>HJNS2017000033</td>
                        <td>�ϲ��ж�������ɽ�ֵ����´����������豸ת��13</td>
                        <td>ũ�弯�徭Ӫ���ʲ�</td>
                        <td>289/Ķ</td>
                        <td>2017-01-12</td>
                    </tr>
                        <tr>
                        <td>HJNS2017000033</td>
                        <td>�ϲ��ж�������ɽ�ֵ����´����������豸ת��14</td>
                        <td>ũ�弯�徭Ӫ���ʲ�</td>
                        <td>289/Ķ</td>
                        <td>2017-01-12</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <script>
                function marques2(lh, speed, delay) {
                    var intervalFunction;
                    var oHeight = 235; /** div�ĸ߶� **/
                    var scrollDiv = document.getElementById("showdiv3");
                    var preTop = 0;
                    //alert(scrollDiv.innerHTML);
                    scrollDiv.scrollTop = 0;
                    //var p=false;   

                    function start() {
                        
                        intervalFunction = setInterval(scrolling, speed);
                    };

                    function scrolling() {
                        
                        if (scrollDiv.scrollHeight - scrollDiv.offsetHeight < scrollDiv.scrollTop) {
                            preTop = scrollDiv.scrollTop;
                            scrollDiv.scrollTop += 1;
                            if (preTop >= scrollDiv.scrollHeight || preTop == scrollDiv.scrollTop) {
                                scrollDiv.scrollTop = 0;
                            }
                        } else {
                            // clearInterval(intervalFunction);    �����ʱ��
                            // setTimeout(start,delay);    ������ʱ��
                        }
                        scrollDiv.scrollTop += 1;
                        //mouse�¼�ֻ��д�ڷ����ڲ��ܱ�֤over��out��scrollTop�߶�һ����
                        scrollDiv.onmouseover = function () { clearInterval(intervalFunction) };
                        scrollDiv.onmouseout = function () { intervalFunction = setInterval(scrolling, speed) };
                    };

                    setTimeout(start, delay);
                };
                marques2(35, 80, 500);
                /**marquees(һ�ι����߶�,�ٶ�,ͣ��ʱ��);**/
            </script>  
        <asp:Button ID="Button1" runat="server" Text="�������Pdf��ҳ" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Button" />
        <asp:Button ID="Button3" runat="server" Text="Button" />
        <asp:Button ID="Button4" runat="server" Text="Button" />
        <asp:Button ID="Button5" runat="server" Text="Button" />
    </form>
</body>

</html>
