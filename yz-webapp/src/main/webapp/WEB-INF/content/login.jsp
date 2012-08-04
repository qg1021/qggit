<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ page import="org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter" %>
<%@ page import="org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter" %>
<%@ page import="org.springframework.security.core.AuthenticationException" %>
<%@page import="org.springside.modules.security.springsecurity.SpringSecurityUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>后台登录</title>
<%@ include file="/common/meta.jsp" %>
<link href="${ctx}/css/admin.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet" />
<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	//聚焦第一个输入框
	$("#j_username").focus();
	$("#inputForm").validate({
		rules: {
			j_username: "required", 
			j_password: "required" 
		},
		messages: {
			j_username: {
				required: " "
			},
			j_password: {
				required: " "
			} 
		},
        errorPlacement: function(error, element) {   
	        if (document.getElementById("error_"+element.attr("name")))  {
	            error.appendTo("#error_"+element.attr("name"));  
	        }
	        else       
	            error.insertAfter(element);   
	        }
	}); 
});
function onSubmit() {
	 if($("#inputForm").valid()){
	 	$("#inputForm").submit();
	 }	
}
document.onkeydown = function(e){    
	e = e || window.event;   
	if(e.keyCode === 13){        
	 onSubmit();   
	}
};
</script>
</head>
<BODY bgcolor="#002779">
	<table height="100%" cellSpacing=0 cellPadding=0 width="100%" bgColor="#002779" border="0">
		<tr>
			<td align="center" height="100%">
				<table align="center"  cellspacing="0" cellpadding="0" width="100%" border="0">
					<tr>
						<td align="center" height="120">
						<div class="errormsg">   
							<%
							if (session.getAttribute(AbstractAuthenticationProcessingFilter.SPRING_SECURITY_LAST_EXCEPTION_KEY) != null) {
							%>
								<font color="red">登录失败，用户名或密码错误.</font>
							<%
								session.removeAttribute(AbstractAuthenticationProcessingFilter.SPRING_SECURITY_LAST_EXCEPTION_KEY);
							}
							%>
						</div>
						</td>
					</tr>
				</table>

				<table align="center"  cellspacing="0" cellpadding="0" width="100%" border="0">
					<tr>
						<td align="center"><img height="23" src="image/admin/login_1.jpg" width="468"></td>
					</tr>
					<tr>
						<td align="center"><img height="147" src="image/admin/login_2.jpg" width="468"></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" width="468" bgColor="#ffffff" border="0">
					<tr>
						<td width="16"><img height="122" src="image/admin/login_3.jpg" width="16"></td>
						<td align="center">
							<form id="inputForm" name="inputForm" action="${ctx}/j_spring_security_check"  method="post">
								<table cellspacing="0" cellpadding="0" width="230" border="0">
									<tr height="5">
										<td width="5"></td>
										<td width="56"></td>
										<td></td>
									</tr>
									<tr height="36">
										<td></td>
										<td>用户名</td>
										<td>
										<input style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid"
											maxLength="30" size="23" id="j_username"  name="j_username"><span id="error_j_username"></span></td>
									</tr>
									<tr height="36">
										<td></td>
										<td>口&nbsp;&nbsp;令</td>
										<td>
										<input style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid"
											type="password" maxLength="30" size="24" id="j_password" name="j_password"><span id="error_j_password"></span>
										</td>
									</tr>
									<tr height="5">
										<td colSpan="3"></td>
									</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>
										<img  height="18" width="70" src="image/admin/bt_login.gif" onclick="onSubmit();">
									</td>
								</tr>
							</table>
						</form>
					</td>
					<td width="16"><img height="122"  src="image/admin/login_4.jpg" width="16"></td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" width="468"  border="0">
				<tr>
					<td><img height="16" src="image/admin/login_5.jpg" width="468"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</BODY>
</HTML>

