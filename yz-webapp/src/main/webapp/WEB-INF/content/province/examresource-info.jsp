<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="subject" name="activemenu" />
	<title>考试科目查看</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
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
		<%@ include file="../common/examresource-info.jsp"%>
		</div>
			<!-- 右侧内容 column  end-->    
	</div> <!-- content  end-->  
</div><!-- wrapper  end-->  
</body>
</html>