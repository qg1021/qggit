<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examtimes" name="activemenu" />
	<title>组织机构代码管理</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/DatePicker/WdatePicker.js" ></script>
	<script type="text/javascript">
	$(document).ready(function() {
		//聚焦第一个输入框
		$("#orgName").focus();
		$("#inputForm").validate({
			rules: {
				orgName:"required",
				orgCode: {
					required: true,
					remote: "${ctx}/province/organ!checkOrgCode.action?oldOrgCode=" + encodeURIComponent('${orgCode}')
				}
			},
			messages: {
				orgName: "请输入组织机构名称",
				orgCode: {
					required:"请输入组织机构代码",
					remote: "组织机构代码已存在"
				}
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
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<%@ include file="/common/left.jsp"%>
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start -->  
		<div class="right_content">
			<h2>组织机构代码管理</h2>
			<div class="pagehead01"></div>
			  
    		<form id="inputForm" action="${ctx}/province/organ!save.action" method="post">
    			<input id="id" name="id" type="hidden" value="${id}"/>
	    		<div class="top_serach_box">
       				<p class="examination_info"><s:if test="id==null">新建</s:if><s:else>修改</s:else>组织机构代码</p>
     				<ul class="form box_dotline_bottom">
     					<li> 
     						<label>组织机构名称：</label>
     						<input type="text" id="orgName" name="orgName" value="${orgName}" size="30" maxlength="50"/>
     					</li>
     					<li>
     						<label>组织机构代码：</label>
     						<input type="text" id="orgCode" name="orgCode" value="${orgCode}" size="30" maxlength="25"/>
     					</li>
   					</ul>
   					<p class="button_box">
   						<input type="submit" value="保存" />
   					</p>
   				</div>	
			</form>
				
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>