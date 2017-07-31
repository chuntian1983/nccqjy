<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bidview.aspx.cs" Inherits="Web.Super.Bi.Bidview" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>档案信息</title>
	<link rel="stylesheet" type="text/css" href="../Scripts/easyUI/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../Scripts/easyUI/themes/icon.css">
	
    <link href="../Styles/tbcss.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../Scripts/easyUI/jquery.min.js"></script>
	<script type="text/javascript" src="../Scripts/easyUI/jquery.easyui.min.js"></script>
</head>
<body>
    <form runat="server" id="form1">
	<h2>档案信息</h2>
	<p></p>
	<div style="margin:20px 0 10px 0;"></div>
	<div class="easyui-tabs" style="width:1300px;height:900px;">
		<div title="标的基本信息" style="padding:10px">
			<table border="0" class="table" cellpadding="0" cellspacing="0" width="625">
            
            <tr>
                <td align="center" height="35">
                    组织单位
                </td>
                <td colspan="3">
                    <asp:Label ID="lbzzdw" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    产权名称
                </td>
                <td colspan="3">
                    <asp:Label ID="lbcqmc" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    产权类型
                </td>
                <td>
                    <asp:Label ID="lbchanquanleixing" runat="server" Text=""></asp:Label>
                </td>
                <td align="center">
                    产权权属
                </td>
                <td>
                    <asp:Label ID="lbchanquanquanshu" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    标的规模
                </td>
                <td colspan="3">
                    <asp:Label ID="lbbiaodeguimo" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    出让方</td>
                <td colspan="3">
                    <asp:Label ID="lbchurangfang" runat="server" Text=""></asp:Label>

                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    出让方性质</td>
                <td colspan="3">
                   <asp:Label ID="lbchurangfangxingzhi" runat="server" Text=""></asp:Label>

                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    受让方</td>
                <td colspan="3">
                    <asp:Label ID="lbshourangfang" runat="server" Text=""></asp:Label>

                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    受让方性质</td>
                <td colspan="3">
                    <asp:Label ID="lbshourangfangxingzhi" runat="server" Text=""></asp:Label>

                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    交易方式</td>
                <td colspan="3">
                    <asp:Label ID="lbjiaoyifangshi" runat="server" Text=""></asp:Label>

                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    合同起始日期
                </td>
                <td colspan="3">
                   <asp:Label ID="lbqishiriqi" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            
            <tr>
                <td height="35" align="center">
                    成交单价</td>
                <td colspan="3">
                    <asp:Label ID="lbchengjiaodanjia" runat="server" Text=""></asp:Label>

                </td>
            </tr>
            
            <tr>
                <td height="35" align="center">
                    成交总价</td>
                <td colspan="3">
                   <asp:Label ID="lbchengjiaozongjia" runat="server" Text=""></asp:Label>

                </td>
            </tr>
            
            <tr>
                <td height="35" align="center">
                    支付方式</td>
                <td colspan="3">
                   <asp:Label ID="lbzhifufangshi" runat="server" Text=""></asp:Label>

                </td>
            </tr>
            
            <tr>
                <td height="35" align="center">
                    备注</td>
                <td colspan="3">
                   <asp:Label ID="lbbeizhu2" runat="server" Text=""></asp:Label>

                </td>
            </tr>
            
            <tr align="center">
                <td colspan="4" height="35">
                   
                </td>
            </tr>
        </table>
		</div>
        <div title="出让方信息" style="padding:10px">
			 <table width="640" class="table" border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td height="35">
                    组织单位
                </td>
                <td colspan="3">
                    <asp:Label ID="lbzzdw_crf" runat="server" Text=""></asp:Label>
                    
                </td>
                
            </tr>
            <tr>
                <td height="35">
                    经济类型
                </td>
                <td>
                   <asp:Label ID="lbjjlx_crf" runat="server" Text="" Width="150px"></asp:Label>
                </td>
                <td>
                    姓名
                </td>
                <td>
                    <asp:Label ID="lbxm_crf" runat="server" Text="" Width="150px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    住址
                </td>
                <td>
                    <asp:Label ID="lbzz_crf" runat="server" Text=""></asp:Label>
                </td>
                <td height="35">
                    联系人
                </td>
                <td>
                   <asp:Label ID="lblxr_crf" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    法人代表
                </td>
                <td>
                  <asp:Label ID="lbfrdb_crf" runat="server" Text=""></asp:Label>
                </td>
                <td height="35">
                    身份证号码
                </td>
                <td>
                    <asp:Label ID="lbsfz_crf" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="35">
                    联系电话
                </td>
                <td>
                    <asp:Label ID="lblxdh_crf" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    所有权人
                </td>
                <td>
                    <asp:Label ID="lbsyqr_crf" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            
                <tr>
                    <td height="35">
                        组织机构代码
                    </td>
                    <td>
                       <asp:Label ID="lbzzjg_crf" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        注册资本
                    </td>
                    <td>
                        <asp:Label ID="lbzczb_crf" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            
            
        </table>
		</div>
        <div title="受让方信息" style="padding:10px">
			<table width="640" class="table" border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td height="35">
                    组织单位
                </td>
                <td colspan="3">
                    <asp:Label ID="lbzzdw_srf" runat="server" Text=""></asp:Label>
                    
                </td>
                
            </tr>
            <tr>
                <td height="35">
                    经济类型
                </td>
                <td>
                   <asp:Label ID="lbjjlx_srf" runat="server" Text="" Width="150px"></asp:Label>
                </td>
                <td>
                    姓名
                </td>
                <td>
                    <asp:Label ID="lbxm_srf" runat="server" Text="" Width="150px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    住址
                </td>
                <td>
                    <asp:Label ID="lbzz_srf" runat="server" Text=""></asp:Label>
                </td>
                <td height="35">
                    联系人
                </td>
                <td>
                   <asp:Label ID="lblxr_srf" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    法人代表
                </td>
                <td>
                  <asp:Label ID="lbfrdb_srf" runat="server" Text=""></asp:Label>
                </td>
                <td height="35">
                    身份证号码
                </td>
                <td>
                    <asp:Label ID="lbsfz_srf" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="35">
                    联系电话
                </td>
                <td>
                    <asp:Label ID="lblxdh_srf" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    所有权人
                </td>
                <td>
                    <asp:Label ID="lbsyqr_srf" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            
                <tr>
                    <td height="35">
                        组织机构代码
                    </td>
                    <td>
                       <asp:Label ID="lbzzjg_srf" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        注册资本
                    </td>
                    <td>
                        <asp:Label ID="lbzczb_srf" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            
            
        </table>
		</div>
        
        <div title="鉴证书预览信息" style="padding:10px">
			<div style=" background-image:url('zs.jpg'); background-repeat:no-repeat; width:1240px; height:880px;position:relative;">
    <div style="position:absolute; left:450px; top:190px;white-space:normal;word-wrap:break-word">
        <asp:Label 
            ID="lbzcxwpzjg" runat="server" Font-Size="10pt"></asp:Label>
        </div>
    <div style="position:absolute; left:260px; top:69px;"><asp:Label ID="lbnjz" runat="server" Text="" Visible="false"></asp:Label></div>
<div style="position:absolute; left:222px; top:344px;">
    <asp:Label 
        ID="lbzczb" runat="server" ></asp:Label>
        </div>
<div style="position:absolute; left:459px; top:344px;">
    <asp:Label 
        ID="lbsrfsfz" runat="server" Font-Size="12px"></asp:Label>
        </div>
<div style="position:absolute; left:458px; top:308px;"><asp:Label 
        ID="lbgsxz" runat="server"></asp:Label>
        </div>
<div style="position:absolute; left:223px; top:308px;"><asp:Label 
        ID="lbsrffddbr" runat="server"></asp:Label>
        </div>
<div style="position:absolute; left:222px; top:273px;"><asp:Label 
        ID="lbsrf" runat="server"></asp:Label>
        </div>
<div style="position:absolute; left:451px; top:233px; right: 709px;">
    <asp:Label 
        ID="lbzcfsfz" runat="server" Font-Size="12px"></asp:Label>
        </div>
<div style="position:absolute; left:221px; top:232px;"><asp:Label 
        ID="lbzcfdb" runat="server"></asp:Label>
        </div>
<div style="position:absolute; left:219px; top:187px;"><asp:Label ID="lbzcf" 
        runat="server"></asp:Label>
        </div>
<div style="position:absolute; left:222px; top:147px;"><asp:Label ID="lbsyqr" 
        runat="server"></asp:Label>
        </div>
<div style="position:absolute; left:455px; top:113px;">
    <asp:Label ID="lbcqlx" runat="server" Font-Size="12px"></asp:Label>
        </div>
<div style="position:absolute; left:179px; top:112px;"><asp:Label ID="lbjycp" 
        runat="server"></asp:Label>
        </div>
    <div style="position:absolute; left:738px; top:143px;"><asp:Label 
            ID="lbbeizhu" runat="server"></asp:Label>
        </div>
    <div style="position:absolute; left:235px; top:420px;"><asp:Label 
            ID="lbbdjbqk" runat="server"></asp:Label>
        </div>
    <div style="position:absolute; left:217px; top:724px; height: 17px;"><asp:Label 
            ID="lbzcfs" runat="server"></asp:Label>
        </div>
    <div style="position:absolute; left:460px; top:797px;"><asp:Label ID="lbhtbh" 
            runat="server"></asp:Label>
        </div>
    <div style="position:absolute; left:444px; top:71px;"><span style=" font-weight:200">HJNJ</span> <asp:Label ID="lbxmbh" 
        runat="server"></asp:Label></div>
    <div style="position:absolute; left:216px; top:794px;"><asp:Label 
            ID="lbhtqsrq" runat="server"></asp:Label>
        </div>
    <div style="position:absolute; left:458px; top:762px;"><asp:Label ID="lbcjje" 
            runat="server"></asp:Label>
        </div>
    <div style="position:absolute; left:457px; top:726px;"><asp:Label ID="lbjyfs" 
            runat="server"></asp:Label>
        </div>
    <div style="position:absolute; left:217px; top:761px;"><asp:Label ID="lbjydj" 
            runat="server"></asp:Label>
        </div>
    <div style="position:absolute; left:460px; top:690px;"><asp:Label ID="lbguimo" 
            runat="server"></asp:Label>
        </div>
    <div style="position:absolute; left:218px; top:691px;">
        <asp:Label ID="lbqqjg" 
            runat="server" Font-Size="10px"></asp:Label>
        </div>
    <div style="position:absolute; left:218px; top:656px;"><asp:Label ID="lbzcqx" 
            runat="server"></asp:Label>
        </div>

     <div style="position:absolute; left:1097px; top:743px;"><asp:Label ID="lbri" runat="server"></asp:Label></div>
      <div style="position:absolute; left:1048px; top:742px;"><asp:Label ID="lbyue" runat="server"></asp:Label></div>
       <div style="position:absolute; left:967px; top:744px;"><asp:Label ID="lbnian" 
               runat="server"></asp:Label>
        </div>
    </div>
		</div>
		
	</div>
        </form>
</body>
</html>
