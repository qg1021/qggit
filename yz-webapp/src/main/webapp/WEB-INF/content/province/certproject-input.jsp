<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="addcert" name="activemenu" />
	<title>创建证书项目</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		//聚焦第一个输入框
		$("#name").focus();
		 
		$("#form1").validate({
			rules: {
				name:"required",
				organ:"required",   
				unitName:"required"  
			},
			messages: {
				name: "请输入证书项目名称", 
				organ: "请输入发证机构", 
				unitName: "请输入岗位名称"
			},
	        errorPlacement: function(error, element) {   
		        if (document.getElementById("error_"+element.attr("name")))  {
		            error.appendTo("#error_"+element.attr("name"));  
		        }
		        else       
		            error.insertAfter(element);   
		        },
		        errorElement: "em"
		}); 
	});
	 
	</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<div id="content">  
	<!--左边tab-->
	<%@ include file="/common/left.jsp"%>
	<!--左边tab结束-->
	<!--右边-->
	<form action="${ctx}/province/certproject!save.action" method="post" id="form1" name="form1">
	<input type="hidden" name="id" value="${id}" /> 
	<div class="right_content">
		<h2>创建证书项目</h2>
		<div class="pagehead01"></div>
		<!--<div class="pagehead02"></div>-->
		<div class="top_serach_box">
		 <div class="district_edit_form">
		    <ul class="form">
		    <li><label>证书项目名称</label><input type="text" name="name" id="name" value="${name}" maxlength="50" style="width:300px;" /></li>
		    <li><label>证书项目编号</label><input type="text" name="code" id="code" value="${code}" maxlength="10" style="width:300px;color: gray;" readonly="readonly"/><span class="color999"> (系统生成)</span></li>
		    <li><label>发证机构</label><input type="text" name="organ" id="organ" value="${organ}" maxlength="100" style="width:300px;" /></li>
		    <li><label>岗位名称</label><input type="text" name="unitName" id="unitName" value="${unitName}" maxlength="100" style="width:300px;" /></li>
		    </ul>
		    <p class="dotline"></p>  
		    <p class="button_box"><input type="submit" class="btn_confirm" value="确定"/> <input type="button" class="btn_cancell" value="取消" onclick="location.href='${ctx}/province/certproject.action';"/></p>
		  </div>
		  </div> 
	</div>
	</form>
	<!--右边结束--> 
</div> <!-- content  end-->  
</div><!-- wrapper  end-->  
</body>
</html>