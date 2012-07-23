<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="outsidesite" name="activemenu" />
	<title>考点管理员设置</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<%@ include file="/common/left.jsp"%>
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start -->  
		<div class="right_content">
			<h2>考点管理员帐号设置</h2>
			<div class="pagehead01"></div>
				<div id="message" style="line-height: 35px;">
					<s:actionmessage theme="custom" cssClass="tipbox"/>
				</div>
				<div class="top_serach_box">
					<p class="examination_info">主管理员</p>
 					<table class="tablebox">
    					<tr>
        					<td width="350">${siteUser.loginName}</td>
        					<td><a href="examsite!user.action?siteid=${siteid}&userid=${siteUser.id}">设置</a></td>
    					</tr>
    				</table>
					<p class="examination_info">业务管理员</p>   
 					<table class="tablebox">
 						<s:iterator value="siteUserList">
						    <tr>
						        <td width="350">${loginName}</td>
						        <td><a href="examsite!user.action?siteid=${siteid}&userid=${id}">设置</a></td>
						        <td><a href="javaScript:delRecord('examsite!deleteUser.action?siteid=${siteid}&userid=${id}');">删除</a></td>
						    </tr>
					    </s:iterator>
    				</table>
					<p class="button_box"><button class="btn_confirm" onclick="location.href='examsite!user.action?siteid=${siteid}'">新增考点业务管理员</button></p>
				</div>
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>