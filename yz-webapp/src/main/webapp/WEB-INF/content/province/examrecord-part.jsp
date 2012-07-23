<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.drcl.yz.contant.Global"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="arrange" name="activemenu" />
	<title>报考记录修改</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/css/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script type="text/javascript">
	
	
	$(document).ready(function() {

			
	 		$("#inputForm").validate({
				rules: {
					idcard: {
						required: true, 
						validateIDCard:true,
						remote: "student!checkIdCard.action?oldIdcard=${idcard}"
					},
					name: "required"
				},		
				messages: {
					idcard:{
						required:"请输入身份证号",
						remote:"身份证号的用户已存在,请重新输入"
					}, 
					name:{
						required:"请输入姓名" 
					} 
				} ,
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
	function onClose(){
		parent.location.reload();
		parent.$.fancybox.close();
	}
	</script>
</head>
<body>
	<!--修改个人信息 start-->  
	<div class="layer_box">
	<p class="examination_info">修改报考信息</p>
		<form id="inputForm" name="inputForm" action="examrecord!save.action" method="post" >
		<input type="hidden" id="id" name="id" value="${id}"/>
		<input type="hidden" id="returnType" name="returnType" value="part"/>
		<input type="hidden" id="timesid" name="timesid" value="${examTimes.id}"/>
		<div id="message" style="line-height: 35px;">
			<s:actionmessage theme="custom" cssClass="tipbox"/>
		</div>
		<ul class="form_02">
    		<li>
    			<label>考试项目</label>
    			<select style="width:300px;"><option>${examTimes.examItem.name}</option></select>
    		</li>
    		<li>
    			<label>考试编号</label>${examTimes.examItem.code}
    		</li>
    		<li>
    			<label>考次名称</label>
    			<select style="width:300px;"><option>${examTimes.name}</option></select>
    		</li>
    		<li>
    			<label>考次年月</label>${examTimes.year}.${examTimes.month}
    		</li>
    		<li>
    			<label>考次编号</label>${examTimes.code}
    		</li>
    		<li>
    			<label>考区选择</label>
    			<s:select onchange="getSiteByAreaIDAndTimesID();" list="examAreaList" listKey="value" listValue="label" id="areaid" name="areaid"  value="examArea.id" headerKey="" headerValue="--选择--"  theme="simple" cssStyle="width:300px;"/>
    		</li>
    		<li>
    			<label>考点选择</label>
    			<s:select list="examSiteList" listKey="value" listValue="label" id="siteid" name="siteid"  value="examSite.id"  theme="simple" cssStyle="width:300px;" headerKey="" headerValue="--选择--"/>
    		</li>
    		<li>
    			<label>报考科目</label>
    			<s:select list="subjectList" listKey="value" listValue="label" id="subjectid" name="subjectid"  value="subject.id"  theme="simple" cssStyle="width:300px;" headerKey="" headerValue="--选择--"/>
    		</li>
    		<li><label>报名时间</label><s:date name="reportDate" format="yyyy.MM.dd HH:mm"/></li>
    	</ul>
    	<p class="button_box">
    		<button id="btnSave" type="submit">确定</button> 
    		<button id="btnCancel" type="button" onclick="onClose();">取消</button>
    	</p>
    	</form>
	</div>
<!--修改个人信息 end -->
</body>
</html>