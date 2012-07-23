<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="apply" name="activemenu" />
	<title>报名条件和时间表管理</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/DatePicker/WdatePicker.js" ></script>
	<script type="text/javascript" >
	$(document).ready(function(){  
		
		initSelect('#applyhour',24);
		initSelect('#applymin',60);

		initSelect('#applyhour2',24);
		initSelect('#applymin2',60);
		
		initSelect('#siteApplyhour',24);
		initSelect('#siteApplymin',60);
		
		initSelect('#areaConfirmhour',24);
		initSelect('#areaConfirmmin',60);
		
		initSelect('#siteEndhour',24);
		initSelect('#siteEndmin',60);

		initSelect('#areaEndhour',24);
		initSelect('#areaEndmin',60);

		$.validator.addMethod("endReportDateCheck",function(value,element,params){
			var endReportDate = $('#endReportDate').val();
			var applydate = $('#applydate').val() + $('#applyhour').val() + $('#applymin').val();
 	 		if(endReportDate == null || endReportDate == '' || endReportDate > applydate){
				return false;
 	 		}else
 	 	 		return true;

		},"预报名的开始时间要大于考区考试资源上报截止时间 ");

		$.validator.addMethod("applyminCheck",function(value,element,params){
			var applydate = $('#applydate').val() + $('#applyhour').val() + $('#applymin').val();
 	 		var applydate2 = $('#applydate2').val() + $('#applyhour2').val() + $('#applymin2').val();
 	 		if(applydate >= applydate2){
 	 	 		return false;
 	 		}else
 	 	 		return true;

		},"预报名开始时间不能晚于结束时间!");

		$.validator.addMethod("siteApplymin",function(value,element,params){
 	 		var siteApplydate = $('#siteApplydate').val() + $('#siteApplyhour').val() + $('#siteApplymin').val();
 	 		var applydate2 = $('#applydate2').val() + $('#applyhour2').val() + $('#applymin2').val();
 	 		if(applydate2 >= siteApplydate)
 	 	 		return false;
 	 		else
 	 	 		return true;

		},"上报时间必须晚于预报名结束时间!");

		$.validator.addMethod("areaConfirmmin",function(value,element,params){
 	 		var siteApplydate = $('#siteApplydate').val() + $('#siteApplyhour').val() + $('#siteApplymin').val();
 	 		var areaConfirmdate = $('#areaConfirmdate').val() + $('#areaConfirmhour').val() + $('#areaConfirmmin').val();
 	 		if(siteApplydate >= areaConfirmdate)
 	 	 		return false;
 	 		else
 	 	 		return true;

		},"审核时间必须晚于考点上报时间!");

		$.validator.addMethod("siteEndmin",function(value,element,params){
 	 		var siteEnddate = $('#siteEnddate').val() + $('#siteEndhour').val() + $('#siteEndmin').val();
 	 		var areaConfirmdate = $('#areaConfirmdate').val() + $('#areaConfirmhour').val() + $('#areaConfirmmin').val();
 	 		if(areaConfirmdate >= siteEnddate)
 	 	 		return false;
 	 		else
 	 	 		return true;

		},"确认时间必须晚于考区审核时间!");

		$.validator.addMethod("areaEndmin",function(value,element,params){
 	 		var siteEnddate = $('#siteEnddate').val() + $('#siteEndhour').val() + $('#siteEndmin').val();
 	 		var areaEnddate = $('#areaEnddate').val() + $('#areaEndhour').val() + $('#areaEndmin').val();
 	 		if(siteEnddate >= areaEnddate)
 	 	 		return false;
 	 		else
 	 	 		return true;

		},"考区确认时间必须晚于考点确认时间!");

		$.validator.addMethod("ageCheck",function(value,element,params){
 	 		if(document.getElementById('agelimit').checked){
 	 	 		var endAge = $('#endAge').val();
 	 	 		var beginAge = $('#beginAge').val();
	 			if(endAge == "" || beginAge=="" || beginAge > endAge){
					return false;
	 			}
			
				return true;
 	 		}else{
	 				return true;
 	 		}

		},"请填写年纪，结束年纪大于开始。");

		$("#mainForm").validate({
			rules: {
			endAge:"ageCheck",
			applymin2:{"applyminCheck":true,"endReportDateCheck":true},
			siteApplymin:"siteApplymin",
			areaConfirmmin:"areaConfirmmin",
			siteEndmin:"siteEndmin",
			areaEndmin:"areaEndmin"
				},
			messages: {}
			});

		ageCheck();
	});

	function initSelect(name,length){
		var val = $(name).attr('val');
		if(val == null || val=="") val=-1;
		for(var i=0;i<length;i++){
			if(i == val)
				$(name).append('<option value="'+format(i)+'" selected>'+ format(i) +'</option>');
			else
				$(name).append('<option value="'+format(i)+'" >'+ format(i) +'</option>');
		}
	}
	
	function format(i){
		if(i > 9)
			return i;
		return "0"+i;
	}

	function ageCheck(){
		if(document.getElementById('agelimit').checked){
			$('#endAge').attr('readonly','');
			$('#beginAge').attr('readonly','');
		}else{
			$('#endAge').attr('readonly','readonly').val("");
			$('#beginAge').attr('readonly','readonly').val("");
		}
	}
	</script>
	
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<%@ include file="../common/examtop.jsp"%>
		
		<!-- 左侧内容 column  start -->
		<%@ include file="../common/exammenu.jsp"%>
		<!-- 左侧内容 column  end -->
		
			<!-- 右侧内容 column  start -->  
			<div class="right_content">
			
			<h2>报名条件和时间表管理</h2>
			
			<div class="pagehead01"></div>
			<!--<div class="pagehead02"></div>-->
			
			<p class=" box_solid_grey mb20">报名条件设置</p>
			
			<p class="mb20"><span class="fontbold">报名条件公告</span> <span class="color999">- 用于在网络报名平台上公布，以及考务管理平台上向各考区/考点发布</span></p>
			
			<form id="mainForm" action="${ctx}/province/examresource!applysave.action?id=${examTimes.id}" method="post">
			<!-- top_serach_box 报名条件  start -->
			<textarea name="notice"rows="15" style="width:730px" class="grey_boder_box required">${examTimes.notice}</textarea>
			<!-- top_serach_box 报名条件  end -->
			
			<p class="mb20"><span class="fontbold">报名限制</span></p>
			
			<p><s:checkbox name="weblimit" value="examTimes.weblimit" /> 开通网络报名</p>
			<p><s:checkbox name="agelimit" onchange="ageCheck()" id="agelimit" value="examTimes.agelimit" /> 年龄限制 <input type="text" name="beginAge" id="beginAge" value="${examTimes.beginAge}" size="3" maxlength="2"/>  岁  至  <input id="endAge" name="endAge" value="${examTimes.endAge}" type="text" maxlength="2" size="3" />  岁  <span class="color999">（用于在报名年龄条件判断）</span></p>
			<p><s:checkbox name="datelimit" value="examTimes.datelimit" /> 需校验数据库内的证书有效期（有效期内不准报考）</p>
			
			<p class=" box_solid_grey mt20">报名时间表</p>
			
			<div class="top_serach_box">
			<p class="right3pxborder m10">预报名阶段   （从“预报名时间开始时间”至“考点预报名上报截止时间”止）</p>
			
			<span class="fontbold">预报名时间</span>  -  <span class="color999">  对公众显示的网络报名/考点报名时间</span>
			
			<input type="hidden" value="<s:date name="examTimes.endReportDate" format="yyyy-MM-ddHHmm"/>" id="endReportDate"/>
			<p class="m10">
			<input id="applydate" name="applydate" readonly="readonly" class="required" value="${applydate}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" size="11"></input>日
      		<select name="applyhour" id="applyhour" val="${applyhour}" class="required"><option value=""></option></select>时
      		<select name="applymin" id="applymin" val="${applymin}" class="required"><option value=""></option></select>分 
			  <span class="fontbold">开始  至</span>  
			  
			  <input id="applydate2" name="applydate2" readonly="readonly" class="required" value="${applydate2}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" size="11"></input>日
      		<select name="applyhour2" id="applyhour2" val="${applyhour2}" class="required"><option value=""></option></select>时
      		<select name="applymin2" id="applymin2" val="${applymin2}" class="required"><option value=""></option></select>分 
			  <span class="fontbold">结束</span></p> 
			
			
			<span class="fontbold">考点预报名上报截止时间</span>  -  <span class="color999">  对考点预报名核实和上报工作进行最后时间限制，各考点须在截止时间前上报结果</span>
			<p class="m10"><input id="siteApplydate"  name="siteApplydate" readonly="readonly" class="required" value="${siteApplydate}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" size="11"></input>日
      		<select name="siteApplyhour" id="siteApplyhour" val="${siteApplyhour}" class="required"><option value=""></option></select>时
      		<select name="siteApplymin" id="siteApplymin" val="${siteApplymin}" class="required"><option value=""></option></select>分   <span class="fontbold">结束</span></p> 
			</div>
			
			<div class="top_serach_box">
			
			<p class="right3pxborder m10">预报名审核阶段  （从“考点预报名上报截止时间”至“省考务确认预报名审核阶段结束”止）</p>
			
			<span class="fontbold">考区预报名审核截止时间</span>  -  <span class="color999">对考区报名审核工作进行最后时间限制，各考区须在截止时间前上报审核结果</span> 
			
			<p class="m10"><input id="areaConfirmdate" name="areaConfirmdate" readonly="readonly" class="required" value="${areaConfirmdate}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" size="11"></input>日
      		<select name="areaConfirmhour" id="areaConfirmhour" val="${areaConfirmhour}" class="required"><option value=""></option></select>时
      		<select name="areaConfirmmin" id="areaConfirmmin" val="${areaConfirmmin}" class="required"><option value=""></option></select>分   <span class="fontbold">结束</span></p> 
			</div>
			
			
			
			
			<div class="top_serach_box">
			<p class="right3pxborder m10">报名确认阶段  （从“省考务确认预报名审核阶段结束”至“考区报名确认上报截止时间”止）</p>
			
			<span class="fontbold">考点报名确认截止时间</span> - <span class="color999">对考点的报名确认工作设置最后时间期限，超过时间则不可再进行报名确认</span>
			<p class="m10"><input id="siteEnddate" name="siteEnddate" readonly="readonly" class="required" value="${siteEnddate}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" size="11"></input>日
      		<select name="siteEndhour" id="siteEndhour" val="${siteEndhour}" class="required"><option value=""></option></select>时
      		<select name="siteEndmin" id="siteEndmin" val="${siteEndmin}" class="required"><option value=""></option></select>分   <span class="fontbold">结束</span></p> 
			
			
			<span class="fontbold">考区报名确认上报截止时间</span> - <span class="color999">对考区的报名确认汇总上报工作设置最后时间期限，各考区须在截止时间前上报结果</span>
			<p class="m10"><input id="areaEnddate" name="areaEnddate" readonly="readonly" class="required" value="${areaEnddate}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" size="11"></input>日
      		<select name="areaEndhour" id="areaEndhour" val="${areaEndhour}" class="required"><option value=""></option></select>时
      		<select name="areaEndmin" id="areaEndmin" val="${areaEndmin}" class="required"><option value=""></option></select>分   <span class="fontbold">结束</span></p>
			</div>
			<s:if test="applydate != null">
			<input type="submit" value="重新发布报名信息" />
			</s:if>
			<s:else>
			<input type="submit" value="发布报名信息" />
			</s:else>
			<br/>
			<br/>
			</form>
			
			
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>