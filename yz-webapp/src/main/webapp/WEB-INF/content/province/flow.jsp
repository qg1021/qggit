<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="flow" name="activemenu" />
	<title>工作进度概况</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<%@ include file="/common/testleft.jsp"%>
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start -->  
		<div class="right_content">
			<h2>本考次工作进度概况</h2>
			<div class="pagehead01"></div>
    			<table class="tablebox"  >
    				<tr>
   						<th width="40%">工作流</th>
   						<th width="20%">截止时间 </th>
   						<th width="20%">状态</th>
   						<th width="20%">最后完成时间</th>
   					</tr>
    				<s:iterator value="page.result" status="st">
					    <tr>
						    <td>${flowTypeName}</td>
						    <td><s:date name="endDate" format="yyyy-MM-dd HH:ss"/></td>
						    <td>
						    	<s:if test="status"><span class="colorgreen">已完成</span></s:if>
						    	<s:else><span class="colorred">未完成</span></s:else>
						    </td>
						    <td><s:date name="completeDate" format="yyyy-MM-dd HH:ss"/></td>
					    </tr>
				    </s:iterator>    
    			</table>
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>