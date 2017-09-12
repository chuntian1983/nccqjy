jQuery(function ($) {
    GridView();
    $('#newAdd').window('close');
    $("#showById").window('close');
});

var editor1;
KindEditor.ready(function (K) {
    editor1 = K.create('textarea[name="NewsContent"]', {
        cssPath: '../Scripts/kindeditor/plugins/code/prettify.css',
        uploadJson: '../ashx/upload_json.ashx',
        fileManagerJson: '../ashx/file_manager_json.ashx',
        afterBlur: function () { editor1.sync(); },
        allowFileManager: true,
        items: ['fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', 'insertunorderedlist', '|', 'image', 'link']
    });
});
function msgShow(title, msgString, msgType) {
    $.messager.alert(title, msgString, msgType);
};
function slide(_title, _msg) {
    $.messager.show({
        title: _title,
        msg: _msg,
        timeout: 3500,
        showType: 'slide'
    });
};
function GridView() {
    $('#tdg').datagrid({
        title: '新闻信息列表',
        iconCls: 'icon-save',
        nowrap: true,
        striped: true,
        url: '../ashx/news.ashx?action=paging',
        remoteSort: false,
        sortName: 'CreateDate',
        singleSelect: false,
        sortOrder: 'desc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        frozenColumns: [[
{ field: 'ck', align: 'center', checkbox: true },
{ title: '编号', field: 'Id', width: 50, align: 'left', sortable: true },
{ field: 'NewsTypeId', title: '新闻类型', width: 80, align: 'left', sortable: true },
{ field: 'NewsTitle', title: '新闻主标题', width: 80, align: 'left', sortable: true }
]],
        columns: [[
        { field: 'NewsSubheading', title: '新闻副标题', width: 80, align: 'left', sortable: true },
{ field: 'NewsContent', title: '新闻内容', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return "<span class='icon icon-edit' onclick='OnShowNews(" + row.Id + ");'>&nbsp;&nbsp;&nbsp;&nbsp;查看详情</span>"; } },
{ field: 'NewsImg', title: '新闻图片', width: 80, align: 'left', sortable: true },
{ field: 'NumClicks', title: '点击数', width: 25, align: 'left', sortable: true },
{ field: 'IsCheck', title: '审核状态', width: 30, align: 'left', sortable: true, formatter: function (value, row, index) { return row.IsCheck == 0 ? "<span style='color:red;'>未审核</span>" : "<span style='color:blue;'>通过</span>"; } },
{ field: 'Editor', title: '发布人', width: 25, align: 'left', sortable: true },
{ field: 'CreateDate', title: '创建时间', width: 40, align: 'left', sortable: true, formatter: function (value, row, index) { return row.CreateDate.substring(0, 10); } }
]],
        toolbar: [{
            id: 'btnadd',
            text: '新建',
            iconCls: 'icon-add',
            handler: function () {
                $('#newAdd').window({ title: "添加新闻信息" });
                $("#newAdd").window("open");
                $("#btnAdd").show();
                $("#btnEdit").hide();
                OnEmptyTextClick();
            }
        }, '-', {
            id: 'btndel',
            text: '删除',
            iconCls: 'icon-no',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    var idList = "";
                    for (var i = 0; i < rows.length; i++) {
                        idList += rows[i].Id;
                        if (i < rows.length - 1) { idList += ","; }
                    }
                    $.messager.confirm('询问提示', '您确定要删除选中的编号为 [' + idList + '] 的新闻内容吗？', function (data) {
                        if (data) {
                            $.get("../ashx/news.ashx?action=del", { idList: idList }, function (data) {
                                slide("提示", data);
                                $('#tdg').datagrid('reload');
                                $('#tdg').datagrid('clearSelections');
                            }, "text");
                        }
                    });
                }
                else {
                    msgShow("提示", "您还没有选中要删除的列信息？", "question");
                }
            }
        }, '-', {
            id: 'btncut',
            text: '修改',
            iconCls: 'icon-cut',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    if (rows.length > 1) {
                        msgShow("提示", "修改信息只能选中一条！", "warning");
                        return;
                    }
                    $('#newAdd').window({ title: "修改新闻信息" });
                    $('#newAdd').window('open');
                    OnEmptyTextClick();
                    $.get("../ashx/news.ashx?action=by", { id: rows[0].Id }, function (data) {
                        $("#txtNewsTitle").val(data.NewsTitle);
                        $("#txtNewsTypeId").combobox('setValue', data.NewsTypeId);
                        $("#txtNewsSubheading").val(data.NewsSubheading);
                        $("#txtNewsSource").val(data.NewsSource);
                        $("#txtContent").val(data.Content);
                        $("#txtKeyword").val(data.Keyword);
                        editor1.html(data.NewsContent);
                        $("#txtId").val(data.Id);
                        $("#txtNumClicks").val(data.NumClicks);
                        $("#txtNewsImg").val(data.NewsImg);
                        $("#txtNewsFile").val(data.NewsFile);
                        /**/
                        $("#lblNewsImg").html(data.NewsImg);
                        $("#aNewsImg").attr("src", "../../newsImg/max/" + data.NewsImg);
                        $("#lblNewsFile").html(data.NewsFile);
                        $("#aNewsFile").attr("href", "../../newsFile/" + data.NewsFile);
                    }, "json");

                    $("#btnAdd").hide();
                    $("#btnEdit").show();
                } else {
                    msgShow("提示", "您还没有选中要修改的列信息？", "warning");
                }
            }
        }, '-', {
            id: 'btnlock',
            text: '审核状态',
            iconCls: 'icon-lock',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('询问提示', '您确定要更改选中的新闻信息的审核状态吗？', function (data) {
                        if (data) {
                            for (var i = 0; i < rows.length; i++) {
                                $.get("../ashx/news.ashx?action=rs", { id: rows[i].Id, Rows: "IsCheck", Vale: rows[i].IsCheck }, function (data) {
                                    slide("提示", data);
                                }, "text");
                            }
                            $('#tdg').datagrid('clearSelections');
                            $('#tdg').datagrid('reload');
                        }
                    });
                }
                else {
                    msgShow("提示", "您还没有选中要更改的列信息？", "question");
                }
            }
        }
],
        pagination: true,
        pageSize: 20
    });
    var p = $('#tdg').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
function OnEmptyTextClick() {
    $("#txtNewsTitle").val("");
    $("#txtNewsTypeId").combobox('setValue', "1");
    $("#txtOrgCode").val("");
    $("#txtNewsSubheading").val("");
    $("#txtNewsSource").val("");
    $("#txtContent").val("");
    $("#txtKeyword").val("");
    editor1.html("");
    $("#txtId").val("0");
    $("#txtNumClicks").val("0");
    $("#txtNewsImg").val("");
    $("#txtNewsFile").val("");
};
jQuery(function ($) {
    $('#txtNewsTypeId').combobox({
        url: '../ashx/newsType.ashx?action=combo',
        valueField: 'id',
        textField: 'text',
        onSelect: function (rec) { rec.id; }
    });
});
jQuery(function ($) {
    $('#selNewsTypeId').combobox({
        url: '../ashx/newsType.ashx?action=combo',
        valueField: 'id',
        textField: 'text',
        onSelect: function (rec) { rec.id; }
    });
});
jQuery(function ($) {
    $("#btnQuery").click(function () {
        var selNewsTitle = $("#selNewsTitle").textbox('getValue');
        if ("" != selNewsTitle) {
            var url = '../ashx/news.ashx?' + $.param({ action: "paging", NewsTitle: $("#selNewsTitle").textbox('getValue'), NewsTypeId: $("#selNewsTypeId").combobox('getValue'), IsCheck: $("#selIsCheck").combobox('getValue') });
            $('#tdg').datagrid({ url: url });
            $('#tdg').datagrid('reload');
        } else {
            msgShow("提示", "您还没有输入要搜索的新闻标题？", "question");
        }
    });
});
jQuery(function ($) {
    $("#btnCancel").click(function () {
        OnEmptyTextClick();
        $('#newAdd').window('close');
        $('#tdg').datagrid('reload');
    });
});
jQuery(function ($) {
    $("#btnAdd").click(function () {
        $('#forms').form('submit', {
            url: '../ashx/news.ashx?action=add',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
                $('#tdg').datagrid('reload');
                OnEmptyTextClick();
                $('#newAdd').window('close');
            }
        });
    });
});
jQuery(function ($) {
    $("#btnEdit").click(function () {
        $('#forms').form('submit', {
            url: '../ashx/news.ashx?action=up',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
                $('#tdg').datagrid('reload');
                OnEmptyTextClick();
                $('#newAdd').window('close');
            }
        });
    });
});
function OnShowNews(id) {
    $.get("../ashx/news.ashx?action=by", { id: id }, function (data) {
        $("#lbltitle").html(data.NewsTitle);
        $("#lblnews").html(data.NewsContent);
        $("#showById").window('open');
        if ("" != data.NewsImg) {
            $("#imgImg").attr("src", "../../newsImg/max/" + data.NewsImg);
            $("#imgImg").attr("style", "display:block");
        }
    }, "json");
};
function OnCheckImg(ControlName) {
    var imgDom = document.getElementById(ControlName);
    var location = imgDom.value;
    if (location != "") {
        var point = location.lastIndexOf(".");
        var type = location.substr(point).toLowerCase();
        if (type == ".jpg" || type == ".gif" || type == ".jpeg" || type == ".png") {
            var imgSize = 0;
            if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
                imgSize = imgDom.files[0].fileSize;
            } else {
                imgSize = imgDom.fileSize;
            }
            if (imgSize > 102400) {
                msgShow("提示", "图片大小请不要大于100KB", "info");
                return false;
            }
        }
        else {
            var afile = $("#" + ControlName);
            afile.replaceWith(afile.clone());
            msgShow("提示", "只能上传jpg,jpge,gif,png格式的图片", "info");
            return false;
        }
    }
};
function OnCheckFile(ControlName) {
    var fileDom = document.getElementById(ControlName);
    var location = fileDom.value;
    if (location != "") {
        var point = location.lastIndexOf(".");
        var type = location.substr(point).toLowerCase();
        if (type == ".doc" || type == ".txt" || type == ".xls" || type == ".pdf" || type == ".rtf") {
            var imgSize = 0;
            if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
                imgSize = fileDom.files[0].fileSize;
            } else {
                imgSize = fileDom.fileSize;
            }
        }
        else {
            var afile = $("#" + ControlName);
            afile.replaceWith(afile.clone());
            msgShow("提示", "只能上传doc,txt,xls,pdf,rtf格式的文件", "info");
            return false;
        }
    }
};