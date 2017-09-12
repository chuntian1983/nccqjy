<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editnews.aspx.cs" Inherits="Web.Super.WebMana.editnews" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/tbcss.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/jquery.easyui.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript"
        language="javascript"></script>

        
        <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"
        language="javascript"></script>
        <style>
            body{font-size:12px; font-family:微软雅黑;}
    #custom-demo .uploadifyQueueItem {
      background-color: #FFFFFF;
      border: none;
      border-bottom: 1px solid #E5E5E5;
      font: 11px Verdana, Geneva, sans-serif;
      height: 20px;
      margin-top: 0;
      padding: 10px;
      width: 350px;
    }
    #custom-demo #custom-queue {
      border: 1px solid #E5E5E5;
      margin-bottom: 10px;
      width: 370px;
    }
        </style>
        <link rel="Stylesheet" href="Scripts/uploadify.css" />
   
    <script type="text/javascript" src="Scripts/swfobject.js"></script>
    <script type="text/javascript" src="Scripts/jquery.uploadify.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#custom_file_upload').uploadify({
                'uploader': 'Scripts/uploadify.swf',
                'script': 'Upload.ashx?id=2',
                'cancelImg': 'Scripts/uploadify-cancel.png',
                'folder': 'Upload/1',
                'sizeLimit': 50000000,
                'multi': true,
                'auto': true,
                'fileExt': '*.doc;*.txt;*.pdf;*.rar;*.xls',
                'fileDesc': 'Image Files (.DOC,.TXT,.PDF,.RAR,.XLS)',
                'queueID': 'custom-queue',
                'queueSizeLimit': 999,
                'simUploadLimit': 999,
                'buttonText': '选择文件',
                'removeCompleted': false,
                'onSelectOnce': function (event, data) {
                    $('#status-message').text(data.filesSelected + ' 个文件加入上传队列');
                },
                'onComplete': function (event, queueId, fileObj, response, data) {
                    //alert(response.split('|')[1]); //这里获取上传后的URL路径，用来在前台显示 
                    $('#hdfile').val($('#hdfile').val() + "|" + response.split('|')[1]);
                    $('#hdfilename').val($('#hdfilename').val() + "|" + response.split('|')[2]);
                    //alert($('#hdfile').val());
                },
                'onAllComplete': function (event, data) {
                    $('#status-message').text(data.filesUploaded + ' 个文件已上传');
                },
                'onError': function (event, ID, fileObj, errorObj) {
                    if (errorObj.type === "File Size") {
                        alert(errorObj.name + '超过文件上传大小限制（50m）！');
                        countinue;
                    }
                }
            });
        });
       
    </script>

   <link rel="stylesheet" href="../../kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="../../kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="../../kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="../../kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="../../kindeditor/plugins/code/prettify.js"></script>
	<script>
	    KindEditor.ready(function (K) {
	        var editor1 = K.create('#content1', {
	            cssPath: '../../kindeditor/plugins/code/prettify.css',
	            uploadJson: '../../kindeditor/asp.net/upload_json.ashx',
	            fileManagerJson: '../../kindeditor/asp.net/file_manager_json.ashx',
	            allowFileManager: true,
	            afterCreate: function () {
	                var self = this;
	                K.ctrl(document, 13, function () {
	                    self.sync();
	                    K('form[name=form1]')[0].submit();
	                });
	                K.ctrl(self.edit.doc, 13, function () {
	                    self.sync();
	                    K('form[name=form1]')[0].submit();
	                });
	            }
	        });
	        prettyPrint();
	    });
	</script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
 <form  runat="server" id="form1">
    <input id="hdfile" type="hidden" runat="server" />
        <input id="hdfilename" type="hidden" runat="server" />
        <input id="hdfile2" type="hidden" runat="server" />
        <input id="hdfilename2" type="hidden" runat="server" />
    <div region="center" title="新闻信息" style=" overflow:auto;">
        
        <div id="newAdd" style="display:block; width: 100%; height: 100%; overflow: auto;">
       
        <table class="table" border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 200px" height="43">
                    新闻标题<span style="color: Red;">**</span>
                </td>
                <td>
                    <asp:TextBox ID="txtNewsTitle" runat="server" Width="500px"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td height="43">
                    新闻类型<span style="color: Red;">**</span>
                </td>
                <td>
                    <asp:DropDownList ID="txtNewsTypeId" runat="server">
                    </asp:DropDownList>
                    
                </td>
            </tr>
            <tr>
                <td height="43">
                    新闻副标题
                </td>
                <td>
                    <asp:TextBox ID="txtNewsSubheading" runat="server" style="width: 500px;" ></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td height="43">
                    新闻来源
                </td>
                <td>
                    <asp:TextBox ID="txtNewsSource" runat="server" style="width: 500px;"></asp:TextBox>
                   
                </td>
            </tr>
            <tr>
                <td height="43">
                    摘要
                </td>
                <td>
                    <asp:TextBox ID="txtContent" runat="server" style="width: 500px;" ></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
<td height="43">
                    时间
                </td>
                <td>
                    <asp:TextBox ID="txtsj" runat="server" class="Wdate"  onClick="WdatePicker()"></asp:TextBox>
                    
                </td>
           
            </tr>
            <tr>
                <td height="43">
                    关键字
                </td>
                <td>
                    <asp:TextBox ID="txtKeyword" runat="server" style="width: 500px;"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td height="43">
                    新闻图片
                </td>
                <td>
                    <asp:FileUpload ID="fileNewsImg" runat="server" />
                    
                    <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank"></asp:HyperLink>
                    
                </td>
            </tr>
            <tr>
                <td height="43">
                    新闻附件
                </td>
                <td>
                <asp:Repeater ID="repsfz" runat=server onitemcommand="repsfz_ItemCommand" >
                   <ItemTemplate>
                   <a href="../../newsfile/<%#Eval("fjpath")%>"   target="_blank"><%#Eval("fjname") %></a><asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('您确认要删除附件吗删除了将无法恢复！')" CommandArgument='<%#Eval("id") %>' CommandName="del" runat="server">   删除</asp:LinkButton><br />
                   </ItemTemplate>
                   </asp:Repeater>
                    <div id="custom-demo" class="demo">
        <div class="demo-box">
            <div id="status-message">请选择要上传的文件:</div>
            <div id="custom-queue"></div>
            <input id="custom_file_upload" type="file" name="Filedata" />
        </div>
    </div>注意：为了保证文件上传速度，单个文件大小控制在1M以内。
                </td>
            </tr>
            <tr>
                <td>
                    新闻内容<span style="color: Red;">**</span>
                </td>
                <td>
                    <!--开始HTML编辑器-->
                    <textarea id="content1" runat="server" cols="100" name="S1" rows="8" style="width:700px;height:400px;visibility:hidden;" ></textarea>

                    <!--结束-->
                </td>
            </tr>
            <tr>
                <td colspan="2" height="43">
                    <div style="text-align: left; padding-left: 30%; height: 30px; line-height: 30px;">
                        <asp:Button ID="Button1" runat="server"  Text="保    存" onclick="Button1_Click" />
                        <asp:Button ID="btncanel" runat="server" Text="返回列表" CausesValidation="False" 
                            onclick="btncanel_Click" />
                    </div>
                </td>
            </tr>
        </table>
        <input id="txtNewsImg" name="NewsImg" type="hidden" />
        <input id="txtNewsFile" name="NewsFile" type="hidden" />
        <input id="txtId" name="Id" type="hidden" value="0" />
        <input id="txtNumClicks" name="NumClicks" type="hidden" value="0" />       
       
    </div>
    </div>
    
    
     </form>
</body>
</html>
