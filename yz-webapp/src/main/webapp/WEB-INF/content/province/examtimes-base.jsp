<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examtimes" name="activemenu" />
	<title>考次设置</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#itemid").focus();
			$("#inputForm").validate({
				rules: {
					itemid:"required",
					name:{required:true,maxlength:50},
					year:"required",
					month:"required"
				},
				messages: {
					itemid:"请选择考试项目",
					name: {
						required: "请输入考次名称",
						maxlength:"长度不超过100字符"
					},
					year:"&nbsp;",
					month:"&nbsp;"
					
				},
		        errorPlacement: function(error, element) {   
			        if (document.getElementById("error_"+element.attr("name")))  {
			            error.appendTo("#error_"+element.attr("name"));  
			        }
			        else       
			            error.insertAfter(element);   
			        }
			}); 
			initItemList();//初始化考试项目列表
		});
		function initItemList(){
			if(document.getElementById("id").value==""){
				$("#itemid").val(${itemid});
			}
		}
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
			<h2>新增考次</h2>
			<div class="pagehead01"></div>
				<form id="inputForm" action="examtimes!save.action" method="post">
					<input type="hidden" id="id" name="id" value="${id}"/>
					<input type="hidden" id="returnType" name="returnType" value="subject"/>
					<table class="tablebox"  >
	    				<tr>
	    					<th width="25%">1 考次设置</th>
	    					<th width="25%">2 科目设置 </th>
	    					<th width="25%">3 质量管理</th>
	    					<th width="25%">4 场次（时间单元）设置</th>
	    				</tr>
					</table>    
	    			<div class="top_serach_box">
	       				<p class="examination_info">考次设置</p>
	       				<p class=" box_dotline_top"></p>
	      				<ul class="form district_edit_form">
		      				<li>
		      					<label>考试项目<span class="colorred">*</span></label>
		      					<s:select list="itemList" listKey="value" listValue="label" id="itemid" name="itemid"  value="examItem.id"  theme="simple" cssStyle="width:300px;" headerKey="" headerValue="--选择--"/>  
		      				</li>
		      				<li>
		      					<label>考次名称<span class="colorred">*</span></label>
		      					<input id="name" name="name" value="${name}"  type="text" style="width:300px;" />
		      				</li>
		      				<li>
		      					<label>选择年/月<span class="colorred">*</span></label>
		      					<s:select list="yearList" listKey="label" listValue="value" id="year" name="year"  value="year"  theme="simple" cssStyle="width:150px;" headerKey="" headerValue="--选择--"/> 年 
		      					<s:select list="monthList" listKey="label" listValue="value" id="month" name="month"  value="month"  theme="simple" cssStyle="width:150px;" headerKey="" headerValue="--选择--"/> 月
		      				</li>
	      				</ul>  
	    			</div>
	 				<div class="box_solid_blue"><button type="submit" class="rr">下一步</button></div>
				</form>
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>