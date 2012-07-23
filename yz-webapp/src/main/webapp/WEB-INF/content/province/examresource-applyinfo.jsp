<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="flow" name="activemenu" />
	<title>报名情况汇总</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
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

<h2>报名情况汇总</h2>

<div class="pagehead01"></div>
<!--<div class="pagehead02"></div>-->
	
 <div class=" box_solid_grey mb20"><p class="fontbold"><span class="rr">考点上报截止时间：&nbsp;<span class="colorred"><s:date name="examTimes.siteApplydate" format="yyyy年MM月dd日 HH:mm"/></span></span>
 <s:if test="examTimes.applyStatus == 0">
 <span class="icon_cross">&nbsp;</span>
 </s:if>
 <s:elseif test="examTimes.applyStatus == 1">
 <span class="icon_exclamation">&nbsp;</span>
 </s:elseif>
 <s:else>
 <span class="icon_success">&nbsp;</span>
 </s:else>
 预报名阶段</p></div>
 

 
  <div class=" box_solid_grey mb20"><p class="fontbold"><span class="rr">考区上报截止时间：&nbsp;<span class="colorred"><s:date name="examTimes.areaConfirmdate" format="yyyy年MM月dd日 HH:mm"/></span></span>
  <s:if test="examTimes.applyStatus < 3">
 <span class="icon_cross">&nbsp;</span>
 </s:if>
 <s:elseif test="examTimes.applyStatus == 3">
 <span class="icon_exclamation">&nbsp;</span>
 </s:elseif>
 <s:else>
 <span class="icon_success">&nbsp;</span>
 </s:else>
  预报名审核阶段</p></div>
  
   
    <div class=" box_solid_grey mb20"><p class="fontbold"><span class="rr">考区上报截止时间：&nbsp;<span class="colorred"><s:date name="examTimes.areaEnddate" format="yyyy年MM月dd日 HH:mm"/></span></span>
 <s:if test="examTimes.applyStatus < 5">
 <span class="icon_cross">&nbsp;</span>
 </s:if>
 <s:elseif test="examTimes.applyStatus == 5">
 <span class="icon_exclamation">&nbsp;</span>
 </s:elseif>
 <s:else>
 <span class="icon_success">&nbsp;</span>
 </s:else>
    报名确认阶段</p></div>
 
 
</div>

			<!-- 右侧内容 column  end-->    
	</div> <!-- content  end-->  
</div><!-- wrapper  end-->  
</body>
</html>