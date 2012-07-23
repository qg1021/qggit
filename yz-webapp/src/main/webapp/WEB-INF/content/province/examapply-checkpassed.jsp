<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="checkpassed" name="activemenu" />
	<title>通过审核的报名记录</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/module_tab.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {

	<s:if test="status== 2">tab(2,2) </s:if>
	});

	</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<%@ include file="../common/examtop.jsp"%>
		
		<!-- 左侧内容 column  start -->
		<%@ include file="../common/exammenu.jsp"%>
		<!-- 左侧内容 column  end -->
		
			<!-- 右侧内容 column  start -->  

		<div class="right_content">
			<h2>通过审核的报名记录</h2>

			<div class="pagehead01"></div>
			<!--<div class="pagehead02"></div>-->
			
			<ul class="switch_tab mb10 clearb">
				<li id='tab1' onclick='tab(1,2,true)' class="switch_tab_current">待报名确认</li>
				<li id='tab2' onclick='tab(2,2,true)'>已报名确认</li>
			
			</ul>
			     
			<!-- tab01 start -->
				<div id="tabid1">
				<iframe src="${ctx}/province/examapply!confirm.action?id=${examTimes.id}" width="100%"  height="550px" frameborder="0" marginwidth="0" marginheight="0" scrolling="auto"></iframe>
				</div>

		<!-- tab01 end -->
		
		<!-- tab02 start -->
			<div id="tabid2" style="display: none;">  
			<iframe src="${ctx}/province/examapply!confirmed.action?id=${examTimes.id}" width="100%"  height="550px" frameborder="0" marginwidth="0" marginheight="0" scrolling="auto" ></iframe>
			</div><!-- tab02 end -->
		</div>
</div>
</div>
</body>
</html>