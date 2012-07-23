<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="outsidesite" name="activemenu" />
	<title>考点管理员</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		//聚焦第一个输入框
		$("#name").focus();
		$("#inputForm").validate({
			rules: {
				loginName: {
					required: true, 
					maxlength:10,
					remote: "user!checkLoginName.action?oldName=${siteUser.loginName}"
				},
				password: {
						required:true,
						maxlength:20
				},
				qpassword: {
					required:true,
					equalTo: "#password"
				}
			},
			messages: {
				name: {
					required: "请输入考区名称",
					maxlength:"长度不超过100字符"
				},
				loginName: {
					required: "请输入用户名", 
					maxlength:"用户名长度不能超过10位",
					remote: "用户名已存在"
				},
				password: {
					required: "请输入密码",
					maxlength:"长度不超过20字符"
				},
				qpassword: {
					required: "请输入确认密码",
					equalTo: "两次密码输入不同"
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
				<div class="top_serach_box">
					<form id="inputForm" name="inputForm" action="examsite!saveUser.action?siteid=${siteid}" method="post">
							<input type="hidden" id="userid" name="userid" value="${siteUser.id}"/>
						 	<p class="dotline"></p>  
						 	<ul class="form district_edit_form">
							  <li>	
							  	<p class="examination_info"><s:if test="siteUser!=null">${siteUser.roleType}</s:if><s:else>考点业务管理员</s:else></p>
							  </li>
							  <li>
							  	<label>用户名 <span class="colorred">*</span></label>
							  	<input id="loginName" name="loginName" value="${siteUser.loginName}" type="text" style="width:300px;" class="required" maxlength="30"/>
							  </li>
							  <li>
							  	<label>密码 <span class="colorred">*</span></label>
							  	<input id="password" name="password" value="${siteUser.password}" type="password" style="width:300px;" class="required" maxlength="30"/>
							  </li>
							  <li>
							  	<label>密码确认 <span class="colorred">*</span></label>
							  	<input id="qpassword" name="qpassword" value="${siteUser.password}" type="password" style="width:300px;" class="required" maxlength="30"/>
							  </li>
							 </ul> 
						<p class="button_box">
							<button class="btn_confirm" type="submit">确定</button> 
							<button class="btn_cancell" type="button" onclick="location.href='examsite!setList.action?siteid=${siteid}'">取消</button>
						</p>
						
					</form>
				</div>
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>