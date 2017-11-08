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
	    url: '<%=basePath%>framework/kehuan/khList.action',
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
				    {field: 'dyName', title:'电影名称', width:250},
				    {field: 'dyType', title:'电影类型', width:150},
				    {field: 'linkName', title:'链接名称', width:150},
				    {field: 'linkAdd', title:'链接地址', width:150},
				    {field: 'createTime', title:'创建时间', width:150,formatter:fotmateDate}
	    ]]
	});
});

var numUrl = "";
function newMajor(){
	$("#importfm").form("clear");
	$('#dyTabSel').combobox({
	    url:'<%=basePath%>framework/tab/getTab.action',
	    valueField:'id',
	    textField:'tabName',
	    onSelect: function(rec){
	    	console.log(rec);
	        //alert(rec.id);
	    }
	});
	numUrl = "<%=basePath%>framework/kehuan/addKehuan.action";
	$('#dlg').dialog('open').dialog('setTitle','增加电影信息');
}

function update(){
	var rows = $('#dg').datagrid('getChecked');	
	if(rows.length<1||rows.length>1){
		$.messager.alert('操作提示', "请选择一条数据！", 'warning');
		return false;
	}
	console.log(rows[0]);
	$('#importfm').form('load',rows[0]);
	numUrl = "<%=basePath%>framework/kehuan/upDyInfo.action";
	$('#dlg').dialog('open').dialog('setTitle','修改电影信息');
}

function submitForm(){
	if(checkData()){
			$('#importfm').ajaxSubmit({  
				url: numUrl,
				dataType: 'text',
				beforeSend:function(){$("#loadBox").show();},
			complete:function(){$("#loadBox").hide();},
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
	
}

//JS校验form表单信息
function checkData(){
	var fileDir = $("#fenMian").filebox('getValue');
	var suffix = fileDir.substr(fileDir.lastIndexOf("."));
	if("" == fileDir){
		$.messager.alert('操作提示', "选择需要导入的Excel文件！", 'warning');
		return false;
	}
	if(".jpg" != suffix && ".jpeg" != suffix && ".gif" != suffix && ".png" != suffix && ".bmp" != suffix ){
		$.messager.alert('操作提示', "图片格式不支持，请重新选择！", 'warning');
		return false;
	}
	return true;
}

//格式化的方法
function fotmateDate(value){
	var dateStr = "";
	if(value=="undefined"||value=="null"||value==null){}else{
		var date = new Date(value);
		dateStr = date.format("yyyy-MM-dd HH:mm:ss");
	}
    return dateStr;    
}

//js格式化日期插件代码
Date.prototype.format = function (format) {  
		 var o = {  
		        "M+": this.getMonth() + 1, // month  
		        "d+": this.getDate(), // day  
		        "H+": this.getHours(), // hour  
		        "m+": this.getMinutes(), // minute  
		        "s+": this.getSeconds(), // second  
		        "q+": Math.floor((this.getMonth() + 3) / 3), // quarter  
		        "S": this.getMilliseconds()  
		        // millisecond  
		 }
		 if (/(y+)/.test(format)){
		        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length)); 
		 } 
		 for (var k in o){  
		      if (new RegExp("(" + k + ")").test(format)){
		            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length)); 
		 	  }
		 } 
		 return format;  
}
</script>
<div>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="newMajor()">新增</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cut',plain:true" onclick="dele()">删除</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cut',plain:true" onclick="update()">修改</a>
</div>
<div style="width:100%; height:400px;">
	<div id="dg" style="width:100%; height:100%;"></div>
</div>

<div id="dlg" class="easyui-dialog" style="width:520px; height:400px; padding: 10px 20px" closed="true" buttons="#dlg-buttons">
	<form id="importfm" method="post"  enctype="multipart/form-data" novalidate >
	<table cellspacing="5" style="font-size:13px;">
		<tr style="display:none;">
			<td colspan="3"><input type="text" id="uuid" name="uuid" class="easyui-textbox"/></td>
		</tr>
		<tr>
			<td><label>电影名称：</label></td>
			<td colspan="2"><input type="text" id="dyName" name="dyName" class="easyui-textbox" style="width:250px;"/></td>
		</tr>
		<tr>
			<td><label>上映时间：</label></td>
			<td colspan="2"><input type="text" id="dyDate" name="dyDate" class="easyui-datebox" style="width:250px;"/></td>
		</tr>
		<tr>
			<td><label>电影类型：</label></td>
			<td><input type="text" id="dyType" name="dyType" class="easyui-textbox" style="width:250px;"/></td>
			<td>
				<select id="dyTypeSel" class="easyui-combobox" data-options="panelHeight:'auto'" style="width:100px;">
				  <option value="1">科幻片</option>
				  <option value="2">灾难片</option>
				  <option value="3">动作片</option>
				  <option value="4">喜剧片</option>
				  <option value="5">悬疑片</option>
				  <option value="6">恐怖片</option>
				  <option value="7">战争片</option>
				  <option value="8">爱情片</option>
				  <option value="9">动画片</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><label>电影标签：</label></td>
			<td><input type="text" id="dyTab" name="dyTab" class="easyui-textbox" style="width:250px;"/></td>
			<td>
				<select id="dyTabSel" class="easyui-combobox" data-options="panelHeight:'auto'" style="width:100px;"></select>
			</td>
		</tr>
		<!-- <tr>
			<td><label>链接标题：</label></td>
			<td colspan="2"><input type="text" id="linkName" name="linkName" class="easyui-textbox" style="width:250px;"/></td>
		</tr>
		<tr>
			<td><label>链接地址：</label></td>
			<td colspan="2"><input type="text" id="linkAdd" name="linkAdd" class="easyui-textbox" style="width:250px;"/></td>
		</tr> -->
		<tr>
			<td><label>封面：</label></td>
			<td colspan="2"><input name="fenMian" id="fenMian" data-options="prompt:'请选择上传图片'" class="easyui-filebox" style="width:250px;"/></td>
		</tr>
		<tr>
			<td style="vertical-align: baseline;"><label>简短描述：</label></td>
			<td colspan="2"><input type="text" id="smallText" name="smallText" class="easyui-textbox" data-options="multiline:true" style="width:320px; height:100px"/></td>
		</tr>
		<tr>
			<td style="vertical-align: baseline;"><label>剧情介绍：</label></td>
			<td colspan="2"><input type="text" id="bigText" name="bigText" class="easyui-textbox" data-options="multiline:true" style="width:320px; height:200px"/></td>
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