<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>纸飞机电影网</title>
<script type="text/javascript" src="<%=basePath %>js/jquery-1.8.3.min.js"></script>
<style>
.ulclassStype li{color:#fff; display:block; float:left; text-align:center; line-height:50px; width:80px;}
.ulclassStype li:hover{background:#101A25; cursor:pointer;}
.ulclassStype li a{display:block; text-decoration:none; color:#FFFFFF;}
.todayDy{margin-left:10px; height:100%; width:200px; float:left; background:url(images/fm4.png);cursor:pointer;}
.todayDy .styName{ margin-top:115px;}
.todayFirst .styName{ margin-top:270px;}
.totherClass{cursor:pointer;}
.styName{ font-size:12px; text-align:center; margin-top:270px; background:rgba(0,0,0,0.5); line-height:30px; color:#FFFFFF;}
.kehuanStyle{ width:204px; height:300px; float:left; background:url(images/fm7.png); margin-left:20px;}
.kehuanStyle:first-child{ margin-left:0px;}
.zainanStyle{ width:204px; height:300px; float:left; background:url(images/fm6.png); margin-left:20px;}
.zainanStyle:first-child{ margin-left:0px;}
.dongzuoStyle{ width:204px; height:300px; float:left; background:url(images/fm1.png); margin-left:20px;}
.dongzuoStyle:first-child{ margin-left:0px;}
.dongmanStyle{ width:204px; height:300px; float:left; background:url(images/fm5.png); margin-left:20px;}
.dongmanStyle:first-child{ margin-left:0px;}
</style>
</head>
<script>
$(function(){
	$("#firstButtom").css("left",$("#chooseMenu").offset().left);
	$(".ulclassStype li").mouseover(function(){
	 	$("#menubuttom").css("left",$(this).offset().left);
	});
	$(".ulclassStype li").mouseout(function(){
	 	$("#menubuttom").css("left","-100px");
	});
	$(".todayDy").mouseover(function(){
	 	$(this).children(".styName").css("margin-top","100px").css("line-height","45px");
	});
	$(".todayDy").mouseout(function(){
	 	$(this).children(".styName").css("margin-top","115px").css("line-height","30px");
	});
	$(".totherClass").mouseover(function(){
	 	$(this).children(".styName").css("margin-top","255px").css("line-height","45px");
	});
	$(".totherClass").mouseout(function(){
	 	$(this).children(".styName").css("margin-top","270px").css("line-height","30px");
	});
})
</script>
<!-- logo -->
<body style="padding:0px; margin:0px; font-family:'微软雅黑'; padding-bottom: 20px;">
<div style="height:100px; width:100%;">
	<div style="margin-left:auto; margin-right:auto; width:1100px; height:80px;">
		<div style="float:left; width:310px; height:100%; background:url(images/logo.png) no-repeat; margin-top:10px;"></div>
		<div style="float:right; width:368px; height:100%; margin-right:20px;">
			<table border="0" cellpadding="0" cellspacing="0" style="height:100%;">
				<tr>
					<td><input style="width:300px; height:40px; border:2px solid #38496A; border-radius:5px 0px 0px 5px; outline:none; font-size:15px; color:#666; padding-left:10px;" placeholder="请输入电影名称"/></td>
					<td><a style="background:url(images/find.png); display:block; width:50px; height:46px; border-radius:0px 5px 5px 0px; cursor:pointer;"></a></td>
				</tr>
			</table>
		</div>
		<div style="clear:both"></div>
	</div>
</div>

<!-- menu -->
<div style="width:100%; height:50px; width:100%; background-color:#364153;">
	<ul class="ulclassStype" style="width:1100px; overflow:hidden; list-style-type:none; margin:0px auto 0px auto; padding:0px; background:url(images/menu_bg.jpg);">
		<li id="chooseMenu" style="background:#101A25;"><a href="index.html">纸飞机</a></li>
		<li><a href="kehuan.jsp">科幻片</a></li>
		<li><a>灾难片</a></li>
		<li><a>动作片</a></li>
		<li><a>喜剧片</a></li>
		<li><a>悬疑片</a></li>
		<li><a>恐怖片</a></li>
		<li><a>战争片</a></li>
		<li><a>爱情片</a></li>
		<li><a>动画片</a></li>
	</ul>
	<div style="clear:both;"></div>
	<div id="firstButtom" style="position:absolute; border-bottom:3px solid #D00060; top:147px; width:80px; z-index:1;"></div>
	<div id="menubuttom" style="position:absolute; border-bottom:3px solid #D00060; top:147px; left:-100px; width:80px; z-index:1;"></div>
</div>

<!-- banner -->
<div style="width:100%; height:320px;">
	<div style="margin:0 auto; height:100%; width:1100px; border-top:none;">
		<img src="images/fm0.png" style="width:100%; height:320px;"/>
	</div>
</div>

<!-- today -->
<div style="width:100%; font-size:25px; color:#609FBF; margin-top:20px; margin-bottom:5px;">
	<div style="width:1100px; height:100%; text-align:left; margin:0px auto;">今日更新</div>
</div>
<div style="width:100%; height:300px;">
	<div style="width:1100px; height:100%; margin:0px auto;">
		<a class="todayFirst totherClass" href="www.baidu.com" target="_blank" style="width:250px; text-decoration:none; height:100%; float:left; background:url(images/fm3.png); display:block;">
			<div class="styName" style="margin-top:270px;">超体在现贝克吉利娅大展烧脑功能</div>
		</a>
		<div style="width:840px; height:100%; float:left; margin-left:10px;">
			<div style="width:100%; height:145px;">
				<a class="todayDy">
					<div class="styName">人民的民义</div>
				</a>
				<a class="todayDy">
					<div class="styName">人民的民义</div>
				</a>
				<a class="todayDy">
					<div class="styName">人民的民义</div>
				</a>
				<a class="todayDy">
					<div class="styName">人民的民义</div>
				</a>
				<div style="clear:both;"></div>
			</div>
			<div style="width:100%; height:145px; margin-top:10px;">
				<a class="todayDy">
					<div class="styName">人民的民义</div>
				</a>
				<a class="todayDy">
					<div class="styName">人民的民义</div>
				</a>
				<a class="todayDy">
					<div class="styName">人民的民义</div>
				</a>
				<a class="todayDy">
					<div class="styName">人民的民义</div>
				</a>
				<a style="clear:both;"></a>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
</div>

<!--kehuanpian-->
<div style="width:100%; font-size:25px; color:#609FBF; margin-top:20px; margin-bottom:5px;">
	<div style="width:1100px; height:100%; text-align:left; margin:0px auto;">科幻大片</div>
</div>
<div style="width:100%; height:610px;">
	<div style="width:1100px; height:100%; margin:0px auto;">
		<div style="width:100%; height:300px;">
			<a class="kehuanStyle totherClass">
				<div class="styName">X战警:逆转时空</div>
			</a>
			<a class="kehuanStyle totherClass">
				<div class="styName">X战警:逆转时空</div>
			</a>
			<a class="kehuanStyle totherClass">
				<div class="styName">X战警:逆转时空</div>
			</a>
			<a class="kehuanStyle totherClass">
				<div class="styName">X战警:逆转时空</div>
			</a>
			<a class="kehuanStyle totherClass">
				<div class="styName">X战警:逆转时空</div>
			</a>
			<div style="clear:both;"></div>
		</div>
		<div style="width:100%; height:300px; margin-top:10px;">
			<a class="kehuanStyle totherClass">
				<div class="styName">X战警:逆转时空</div>
			</a>
			<a class="kehuanStyle totherClass">
				<div class="styName">X战警:逆转时空</div>
			</a>
			<a class="kehuanStyle totherClass">
				<div class="styName">X战警:逆转时空</div>
			</a>
			<a class="kehuanStyle totherClass">
				<div class="styName">X战警:逆转时空</div>
			</a>
			<a class="kehuanStyle totherClass">
				<div class="styName">X战警:逆转时空</div>
			</a>
			<div style="clear:both;"></div>
		</div>
	</div>
</div>

<!--zainanpian-->
<div style="width:100%; font-size:25px; color:#609FBF; margin-top:20px; margin-bottom:5px;">
	<div style="width:1100px; height:100%; text-align:left; margin:0px auto;">灾难大片</div>
</div>
<div style="width:100%; height:610px;">
	<div style="width:1100px; height:100%; margin:0px auto;">
		<div style="width:100%; height:300px;">
			<a class="zainanStyle totherClass">
				<div class="styName">2012</div>
			</a>
			<a class="zainanStyle totherClass">
				<div class="styName">2012</div>
			</a>
			<a class="zainanStyle totherClass">
				<div class="styName">2012</div>
			</a>
			<a class="zainanStyle totherClass">
				<div class="styName">2012</div>
			</a>
			<a class="zainanStyle totherClass">
				<div class="styName">2012</div>
			</a>
		</div>
		<div style="width:100%; height:300px; margin-top:10px;">
			<a class="zainanStyle totherClass">
				<div class="styName">2012</div>
			</a>
			<a class="zainanStyle totherClass">
				<div class="styName">2012</div>
			</a>
			<a class="zainanStyle totherClass">
				<div class="styName">2012</div>
			</a>
			<a class="zainanStyle totherClass">
				<div class="styName">2012</div>
			</a>
			<a class="zainanStyle totherClass">
				<div class="styName">2012</div>
			</a>
			<div style="clear:both;"></div>
		</div>
	</div>
</div>

<!--dongzuopian-->
<div style="width:100%; font-size:25px; color:#609FBF; margin-top:20px; margin-bottom:5px;">
	<div style="width:1100px; height:100%; text-align:left; margin:0px auto;">动作大片</div>
</div>
<div style="width:100%; height:610px;">
	<div style="width:1100px; height:100%; margin:0px auto;">
		<div style="width:100%; height:300px;">
			<a class="dongzuoStyle totherClass">
				<div class="styName">王者之剑</div>
			</a>
			<a class="dongzuoStyle totherClass">
				<div class="styName">王者之剑</div>
			</a>
			<a class="dongzuoStyle totherClass">
				<div class="styName">王者之剑</div>
			</a>
			<a class="dongzuoStyle totherClass">
				<div class="styName">王者之剑</div>
			</a>
			<a class="dongzuoStyle totherClass">
				<div class="styName">王者之剑</div>
			</a>
			<div style="clear:both;"></div>
		</div>
		<div style="width:100%; height:300px; margin-top:10px;">
			<a class="dongzuoStyle totherClass">
				<div class="styName">王者之剑</div>
			</a>
			<a class="dongzuoStyle totherClass">
				<div class="styName">王者之剑</div>
			</a>
			<a class="dongzuoStyle totherClass">
				<div class="styName">王者之剑</div>
			</a>
			<a class="dongzuoStyle totherClass">
				<div class="styName">王者之剑</div>
			</a>
			<a class="dongzuoStyle totherClass">
				<div class="styName">王者之剑</div>
			</a>
			<div style="clear:both;"></div>
		</div>
	</div>
</div>

<!--dongmanpian-->
<div style="width:100%; font-size:25px; color:#609FBF; margin-top:20px; margin-bottom:5px;">
	<div style="width:1100px; height:100%; text-align:left; margin:0px auto;">动漫大片</div>
</div>
<div style="width:100%; height:610px;">
	<div style="width:1100px; height:100%; margin:0px auto;">
		<div style="width:100%; height:300px;">
			<a class="dongmanStyle totherClass">
				<div class="styName">黄金战甲</div>
			</a>
			<a class="dongmanStyle totherClass">
				<div class="styName">黄金战甲</div>
			</a>
			<a class="dongmanStyle totherClass">
				<div class="styName">黄金战甲</div>
			</a>
			<a class="dongmanStyle totherClass">
				<div class="styName">黄金战甲</div>
			</a>
			<a class="dongmanStyle totherClass">
				<div class="styName">黄金战甲</div>
			</a>
			<div style="clear:both;"></div>
		</div>
		<div style="width:100%; height:300px; margin-top:10px;">
			<a class="dongmanStyle totherClass">
				<div class="styName">黄金战甲</div>
			</a>
			<a class="dongmanStyle totherClass">
				<div class="styName">黄金战甲</div>
			</a>
			<a class="dongmanStyle totherClass">
				<div class="styName">黄金战甲</div>
			</a>
			<a class="dongmanStyle totherClass">
				<div class="styName">黄金战甲</div>
			</a>
			<a class="dongmanStyle totherClass">
				<div class="styName">黄金战甲</div>
			</a>
			<div style="clear:both;"></div>
		</div>
	</div>
</div>

<!--youqinglink-->
<div style="width:100%; font-size:25px; color:#609FBF; margin-top:40px;">
	<div style="width:100%; height:100%;  border-bottom:2px solid #ccc; margin:0px auto;"></div>
</div>
<div style="width:100%; height:50px; font-size:12px; color#666; text-align:center;">
	<div style="width:1100px; height:100%; margin:30px auto;">
		<p><a>关于我们</a>&nbsp;|&nbsp;<a>百度地图</a>&nbsp;|&nbsp;<a>版权声明</a>&nbsp;|&nbsp;<a>联系我们</a>&nbsp;|&nbsp;<a>友情链接</a>&nbsp;|&nbsp;<a>CCTV6广告招商</a></p>
		国家广播电影电视总局电影卫星频道节目制作中心 版权所有
	</div>
</div>
<!--<a id="imageBack" style="cursor:pointer; display:block; width:200px; height:145px; position:absolute; z-index:1; background:url(images/logoBack.png) no-repeat center;">
</a>-->
</body>
</html>