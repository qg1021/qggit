<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="outsidesite" name="activemenu" />
	<title>科目方向</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script  type="text/javascript">
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#code").focus();
			$("#inputForm").validate({
				rules: {
					code: {
						required: true, 
						maxlength:5,
						remote: "subjectdirection!checkCode.action"
					},
					name: {
						required: true, 
						maxlength:10,
						remote: "subjectdirection!checkName.action?subjectid=${subjectid}"
					}
				},
				messages: {
					code: {
						required: "输入科目方向编号", 
						maxlength:"科目方向编号最大为5位",
						remote: "编号已存在"
					},
					name: {
						required: "输入科目方向名称", 
						maxlength:"科目方向名称最大为10位",
						remote: "名称已存在"
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
	<div id="content">  

		<div class="right_content">
			
			<div class="layer_box" style="width:550px;">
				<p class="right3pxborder">方向科目管理</p>
				<form id="inputForm" name="inputForm" action="subjectdirection!save.action" method="post">
					<input type="hidden" id="subjectid" name="subjectid" value="${subjectid}"/>
					<input type="hidden" id="id" name="id" value="${id}"/>
					<p class="m10">编号：<input  type="text" id="code" name="code" value="${code}" style="width:100px"/></p>
					<p class="m10">名称：<input  type="text" id="name" name="name" value="${name}" style="width:100px"/></p>
					<p class="m10">
						<button type="submit"2>保存</button>
						<button type="button" onclick="location.href='subjectdirection.action?subjectid=${subjectid}'">返回</button>
					</p>
				
	    		</form>
				
				


			</div>   
		</div> <!-- content  end-->  
	</div><!-- wrapper  end--> 
	</div> 
</body>
</html>