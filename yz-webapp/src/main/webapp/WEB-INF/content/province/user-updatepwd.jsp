<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 
	<title>修改密码</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>  
	<script type="text/javascript">
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#newPwd").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate({
				rules: {
					newPwd: {
						"required":true
						//minlength: 6
					},	 
					confirmPwd: {
						required: true,
						equalTo:"#newPwd"
					} 
				},
				messages: { 
					newPwd:{
							required:"请输入新密码"
							//minlength:"新密码长度至少为{0}位" 
						},
					confirmPwd: { 	
						required:"请输入确认新密码",
						equalTo: "输入与上面相同的密码"
					}
				}, 
		        errorElement: "em"
			});
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
			<h2>修改密码</h2>
			<div class="pagehead01"></div>
			<div id="message">
		<s:actionmessage theme="custom" cssClass="success"/>
	</div>
    			<form id="inputForm" action="user!updatePwd.action" method="post">
					<ul class="form box_dotline_bottom">
     					<li> 
     						<label>用户名：</label>
     						<input type="text" id="userName" name="userName" value="${userName }" readonly="readonly" />
     					 
     					</li>
     					<li>
      						<label>新密码：</label>
     						<input type="password" id="newPwd" name="newPwd"  maxlength="10"/>

     					</li>
     					<li>
      						<label>确认新密码：</label>
     						<input type="password" id="confirmPwd" name="confirmPwd" maxlength="10"/>
     					</li>
     					<li><label>&nbsp;</label><button name="" type="submit"> 确定</button>&nbsp;&nbsp;<button name="" type="reset">重置</button></li>
   					</ul>
				</form>
				
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>