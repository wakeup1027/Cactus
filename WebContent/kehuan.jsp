<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>科幻片专栏</title>
<link rel="stylesheet" href="<%=basePath %>css/cypager.min.css" />
<script type="text/javascript" src="<%=basePath %>js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/cypager.min.js" charset="gb2312"></script>
<style>
.ulclassStype li{color:#fff; display:block; float:left; text-align:center; line-height:50px; width:80px;}
.ulclassStype li:hover{background:#101A25; cursor:pointer;}
.ulclassStype li a{display:block; text-decoration:none; color:#FFFFFF;}
.aClass{display:block; float:left; width:173px; height:300px; border:1px solid #E9E9E9; margin-left:10px; margin-top:15px; cursor:pointer; overflow:hidden; color:#333; font-size:13px;}
.aClass:hover{border:1px solid #4876ff;}
.aClass:nth-child(6n+1){ margin-left:0px; }
.aClass .dyImg{width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; }
.aClass .dyInfoBox{width:168px; height:auto; padding-left:5px;}
.aClass .dyInfoBox .dyTitle{line-height:25px; text-align:left; color:#444;}
.aClass .dyInfoBox .dyInfo{line-height:25px; text-align:left; color:#999;}
</style>
<script>
$(function(){
	$("#firstButtom").css("left",$("#chooseMenu").offset().left);
	$(".ulclassStype li").mouseover(function(){
	 	$("#menubuttom").css("left",$(this).offset().left);
	});
	$(".ulclassStype li").mouseout(function(){
	 	$("#menubuttom").css("left","-100px");
	});
	
	var date = [];
	for(var i=0; i<371; i++){
		date.push(FormJson("images/fm9.png","机械公敌_"+(i+1),"2017","欧美","科幻,惊悚"));
	}
	//console.log(date);
		
    $("#pagerArea").cypager({pg_size: 30, pg_nav_count: 8, pg_total_count: date.length, pg_call_fun: function(count) {
		$("#contentBox").html("");
		for(var j=(count-1)*30; j<count*30; j++){
			if(j<date.length){
				var ali = '<a class="aClass"><div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url('+date[j].imgUrl+');"></div><div style="width:168px; height:auto; padding-left:5px;"><div style="line-height:25px; text-align:left; color:#444;">'+date[j].title+'</div><div style="line-height:25px; text-align:left; color:#999;">'+date[j].createTime+' '+date[j].country+' '+date[j].dyType+'</div></div></a>';
				$("#contentBox").append(ali);
			}
		}
    }});
});
		
function FormJson(imgUrl,title,createTime,country,dyType){
	var jsonFrom = {};
	jsonFrom.imgUrl=imgUrl;
	jsonFrom.title=title;
	jsonFrom.createTime=createTime;
	jsonFrom.country=country;
	jsonFrom.dyType=dyType;
	return jsonFrom;
}
	
</script>
</head>

<body>
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
		<li><a href="index.jsp">纸飞机</a></li>
		<li id="chooseMenu" style="background:#101A25;"><a href="kehuan.html">科幻片</a></li>
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

<!--conter-->
<div style="width:100%; height:auto;">
	<div id="contentBox" style="width:1100px; margin-left:auto; margin-right:auto; height:auto; overflow:auto;">
		<a class="aClass">
			<div class="dyImg" style="background:url(images/fm9.png);"></div>
			<div class="dyInfoBox">
				<div class="dyTitle">机械公敌</div>
				<div class="dyInfo">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
		<a class="aClass">
			<div style="width:100%; height:249px; border-bottom:#e9e9e9 solid 1px; background:url(images/fm9.png);"></div>
			<div style="width:168px; height:auto; padding-left:5px;">
				<div style="line-height:25px; text-align:left; color:#444;">机械公敌</div>
				<div style="line-height:25px; text-align:left; color:#999;">2017 欧美 科幻,惊悚</div>
			</div>
		</a>
	</div>
	<div id="pagerArea" unselectable="on" onselectstart="return false;" style="-moz-user-select:none; margin-top:30px;"></div>
</div>
<!--banquan-->
<div style="width:100%; font-size:25px; color:#609FBF; margin-top:40px;">
	<div style="width:100%; height:100%;  border-bottom:2px solid #ccc; margin:0px auto;"></div>
</div>
<div style="width:100%; height:50px; font-size:12px; color#666; text-align:center;">
	<div style="width:1100px; height:100%; margin:30px auto;">
		<p><a>关于我们</a>&nbsp;|&nbsp;<a>百度地图</a>&nbsp;|&nbsp;<a>版权声明</a>&nbsp;|&nbsp;<a>联系我们</a>&nbsp;|&nbsp;<a>友情链接</a>&nbsp;|&nbsp;<a>CCTV6广告招商</a></p>
		国家广播电影电视总局电影卫星频道节目制作中心 版权所有
	</div>
</div>
</body>
</html>
