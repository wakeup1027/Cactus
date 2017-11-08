<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>科幻片编辑</title>
<link rel="stylesheet" type="text/css"href="<%=basePath%>easyui/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css"href="<%=basePath%>easyui/themes/icon.css"/>
<link rel="stylesheet" type="text/css"href="<%=basePath%>easyui/themes/gray/datagrid.css"/>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.form.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<style>
body{background:#fff;}
</style>
<body>
<script>
$(function(){
	$('#dg').datagrid({
	    height: '100%',
	    fit:true,
	    url: '<%=basePath%>framework/tab/TabList.action',
	    method: 'POST',
	    striped: true,
	    nowrap: true,
	    pageSize: 10,
	    pageNumber:1, 
	    pageList: [10, 20, 50, 100, 150, 200],
		pagination : true,
	    showFooter: true, 
		loadMsg : '数据加载中请稍后……',
	    toolbar:"#tb",
	    singleSelect: false,
		rownumbers:true,
		columns: [[
				    {field: 'ck', checkbox:true},
				    {field: 'tabName', title:'标签名称', width:250}
	    ]]
	});
});

var numUrl = "";
function newMajor(){
	$("#importfm").form("clear");
	numUrl = "<%=basePath%>framework/tab/addTab.action";
	$('#dlg').dialog('open').dialog('setTitle','增加电影信息');
}

function submitForm(){
	$('#importfm').ajaxSubmit({  
		url: numUrl,
		dataType: 'text',
		success: resutlMsg,
		error: errorMsg
	}); 
	
	function resutlMsg(msg){
		if(msg==1){
       		$('#dlg').dialog('close');
           	$('#dg').datagrid('reload');
           	$.messager.alert('操作提示', "数据保存成功！", 'info');
       	}else {
       		$.messager.alert('操作提示', "数据保存不成功！", 'warning');
       	}
	}
	
	function errorMsg(){
		$.messager.alert('操作提示', "导入excel出错！", 'warning');
	}
}

</script>
<div>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="newMajor()">新增</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cut',plain:true" onclick="dele()">删除</a>
</div>
<div style="width:100%; height:400px;">
	<div id="dg" style="width:100%; height:100%;"></div>
</div>

<div id="dlg" class="easyui-dialog" style="width:520px; height:400px; padding: 10px 20px" closed="true" buttons="#dlg-buttons">
	<form id="importfm" method="post"  enctype="multipart/form-data" novalidate >
	<table cellspacing="5" style="font-size:13px;">
		<tr>
			<td><label>标签名称：</label></td>
			<td><input type="text" id="tabName" name="tabName" class="easyui-textbox" style="width:250px;"/></td>
		</tr>
	</table>
	</form>
</div>
<div id="dlg-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton" id="saveBean" iconCls="icon-ok" onclick="submitForm()" style="displaly:block;width: 90px">保存</a> 
	<a href="javascript:void(0)" class="easyui-linkbutton" id="saveCancel" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
</div>
</body>
</html>