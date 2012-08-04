<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@page import="com.drcl.yz.contant.Global"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/common/meta.jsp" %>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#opassword").focus();
		$("#inputForm").validate({
			rules: {
				opassword: {
					required:true,
					equalTo: "#opass"
				},
				password: {
					required:true
				},
				qpassword: {
					required:true,
					equalTo: "#password"
				}
			},
			messages: {
				opassword: {
					required:"输入旧密码",
					equalTo: "旧密码输入不正确"
				},
				password: {
					required:"输入新密码"
				},
				qpassword: {
					required:"再输入一次新密码",
					equalTo: "两次输入的密码不相同"
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
<!-- JS遮罩层 --> 
	<div id="fullbg"></div> 
	<!-- end JS遮罩层 --> 
	<!-- 对话框 --> 
	<div id="dialog"> 
		<div id="dialog_content"></div> 
	</div>
<div id="wrapper">
	<%@ include file="/common/top.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<%@ include file="/common/menu.jsp"%>
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start -->  
		<div class="right_content">
			<table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
				<tr  height="28">
					<td  background="${ctx}/image/admin/title_bg1.jpg">当前位置&gt;&gt;修改口令</td>
				</tr>
				<tr>
					<td bgcolor="#b1ceef" height="1"></td>
				</tr>
				<tr height="20">
					<td background="${ctx}/image/admin/shadow_bg.jpg"></td>
				</tr>
			</table>
			<div class="pagehead01"></div>
				<div class="top_serach_box">
					<div id="message" style="line-height: 35px;">
						<s:actionmessage theme="custom" cssClass="tipbox"/>
					</div>
					<form id="inputForm" name="inputForm" action="user!save.action" method="post">
						<input type="hidden" id="id" name="id" value="${id}"/>
						<input type="hidden" id="opass" name="opass" value="${password}"/>
						<ul class="form district_edit_form">
					  		<li>
					  			<label>用户名</label>
					  			<input id="loginName" name="loginName" value="${loginName}" type="text"  readonly="readonly" style="width:350px;" />
					  		</li>
					  		<li>
					  			<label>旧密码</label>
					  			<input id="opassword" name="opassword" value="" type="password" maxlength="10" style="width:350px;" />
					  		</li>
					  		<li>
					  			<label>新密码</label>
					  			<input id="password" name="password" value="" type="password" maxlength="10" style="width:350px;" />
					  		</li>
					  		<li>
					  			<label>确认新密码</label>
					  			<input id="qpassword" name="qpassword" value="" type="password" maxlength="10" style="width:350px;" />
					  		</li>
					  		
					  	</ul>
						<p class="button_box">
							<button class="btn_confirm" type="submit">保存</button> 
						</p>
						
					</form>
				</div>
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>