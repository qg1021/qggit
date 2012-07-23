<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examscore" name="activemenu" />
	<title>成绩汇总</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
	function onLink(itemurl){
		if(itemurl!=null && itemurl!=''){
			window.location.href = itemurl;
		}
	}
	$(document).ready(function(){ 
		$("#fid").val('${param['filter_EQL_fid']}');
	});
	</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<%@ include file="/common/score-header.jsp"%>
		<p class="mt10 clearb"></p>
	    <ul class="switch_tab mb20">
	        <li id='tab1'  onclick="location.href='scoresum.action?timesid=${timesid}'">成绩汇总</li>
	        <li id='tab2' onclick="location.href='examscore.action?timesid=${timesid}'">成绩列表</li>
	        <li id='tab3' class="switch_tab_current">成绩分析统计</li>
	        <!--<li id='tab4' >批量调分处理</li>-->
	        <li id='tab5' onclick="location.href='examscore!initPublish.action?timesid=${timesid}'">成绩发布管理</li>
		</ul>
		<!-- tab03 start -->
		<div id="tabid3">
			<%@ include file="../common/scoreleft.jsp"%>
	    	<!--<div class="score_right">
	    
	    	</div>-->
		</div>
<!-- tab03 end -->

<!--右边结束-->
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>