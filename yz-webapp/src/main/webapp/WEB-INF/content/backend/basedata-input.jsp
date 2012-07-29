<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="outsidearea" name="activemenu" />
	<title>基础数据</title>
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
				name: {
					required:true
				},
				type: {
					required: true
				}
			},
			messages: {
				name: {
					required: "请输入名称"
				},
				type: {
					required: "请输入数据类型"
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
					<td  background="${ctx}/image/admin/title_bg1.jpg">当前位置&gt;&gt;基础数据</td>
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
					<form id="inputForm" name="inputForm" action="basedata!save.action" method="post">
						<input type="hidden" id="id" name="id" value="${id}"/>
						<ul class="form district_edit_form">
					  		<li>
					  			<label>数据名称<span class="colorred">*</span></label>
					  			<input id="name" name="name" value="${name}" type="text" maxlength="100" style="width:300px;" />
					  		</li>
					  		<li>
					  			<label>数据类型<span class="colorred">*</span></label>
					  			<s:select list="dataTypeList" listKey="value" listValue="label" id="type" name="type"  value="type"  theme="simple" cssStyle="width:270px;" headerKey="" headerValue="--选择--"/>
					  		</li>
					  		<li >
					  			<label style="vertical-align: top;">备注</label>
					  			<textarea rows="3" cols="40" id="remark" name="remark">${remark}</textarea>
					  		</li>
					  	</ul>
						<p class="button_box">
							<button class="btn_confirm" type="submit">保存</button> 
							<button class="btn_cancell" type="button" onclick="window.location.href='basedata.action'">取消</button>
						</p>
						
					</form>
				</div>
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>