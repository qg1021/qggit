<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="applyinfo" name="activemenu" />
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
   <s:if test="examTimes.applyStatus > 1 && examTimes.applyStatus < 5"> 
  <table class="tablebox">
    <tbody>
    <tr>
    <th rowspan="2">考区</th>
    <th>考点预报名结果 </th>
    <th colspan="3">考区审核结果</th>
    <th colspan="4">省考务审核结果</th>

    </tr>
    
    <tr>
    <td>预报名考生数</td>
    <td>不通过</td>
    <td>通过</td>
    <td>状态</td>
    <td>不通过</td>

    <td>通过</td>
    <td>状态</td>
    <td style="background:#ffffc6;">操作</td>
    </tr>
    
    <s:iterator value="areaList" status="st">
    <tr>
    <td>${name}</td>
    <td>${stat.totalpass}</td>
	<s:if test="stat.reportDate != null">
	    <td><a href="examapply!unpassed.action?id=${examTimes.id}">${stat.unpassed}</a></td>
	    <td>${stat.passed}</td>
	
	    <td>已上报省考务<br /><s:date name="stat.reportDate" format="yyyy.MM.dd"/></td>
	    <td><a href="examapply!checkpassed.action?id=${examTimes.id}&status=2">${stat.pvUnpassed}</a></td>
	    <td><a href="examapply!checkpassed.action?id=${examTimes.id}">${stat.passed - stat.pvUnpassed}</a></td>
	    <s:if test="stat.pvReportDate ==null">
	    	<td>未下发考区<br /><s:date name="stat.pvReportDate" format="yyyy.MM.dd"/></td>
	    	<td style="background:#ffffc6;"><button onclick="window.location='${ctx}/province/examapply!report.action?id=${examTimes.id}&aid=${id}'">下发考区</button></td>
	    </s:if><s:else>
		    <td>已下发考区<br /><s:date name="stat.pvReportDate" format="yyyy.MM.dd"/></td>
		    <td style="background:#ffffc6;"><button onclick="window.location='${ctx}/province/examapply!report.action?id=${examTimes.id}&aid=${id}'">重新下发考区</button></td>
	    </s:else>
    </s:if>
    <s:else>
	    <td><a href="#">未知</a></td>
	    <td><a href="#">未知</a></td>
	    <td><span class="colorred">未上报审考</span></td>
	
	    <td>-</td>
	    <td>-</td>
	    <td>-</td>
	    <td style="background:#ffffc6;">-</td>
    </s:else>
   
    </tr>  
    </s:iterator>
    <s:if test="allreported != true">
    	<tr><th colspan="9"><button onclick="window.location='${ctx}/province/examapply!endreport.action?id=${examTimes.id}&aid=${id}'">预报名审核结束</button></th></tr>
    </s:if>    

</tbody>
</table>
</s:if>  
   
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
 
 
  <s:if test="examTimes.applyStatus > 4 "> 
  <table class="tablebox">
    <tbody>
    <tr>
    <th rowspan="2">考区</th>
    <th rowspan="2">预报名记录</th> 
    <th colspan="3">考区审核结果 </th>

    <th colspan="3">省考务审核结果 </th>    
    <th colspan="3">考区报名确认结果 </th> 

    </tr>
    
    <tr>

    <th>不通过</th>
    <th>通过</th>
    <th>状态</th>

    <th>不通过</th>
    <th>通过</th>
    <th>状态</th>
    <th>报名确认</th>
    <th>报名未确认</th>
    <th>状态</th>

    </tr>
    
    <s:iterator value="areaList" status="st">
    <tr>
    <td>${name}</td>
    <td><a href="#">${stat.totalpass}</a></td>
	<s:if test="stat.reportDate != null">
	    <td><a href="#">${stat.unpassed}</a></td>
	    <td><a href="#">${stat.passed}</a></td>
	
	    <td>已上报省考务<br /><s:date name="stat.reportDate" format="yyyy.MM.dd"/></td>
	    <td>${stat.pvUnpassed}</td>
	    <td><a href="#">${stat.passed - stat.pvUnpassed}</a></td>
	    <s:if test="stat.pvReportDate ==null">
	    	<td>未下发考区<br /><s:date name="stat.pvReportDate" format="yyyy.MM.dd"/></td>
	    </s:if><s:else>
		    <td>已下发考区<br /><s:date name="stat.pvReportDate" format="yyyy.MM.dd"/></td>
	    </s:else>
	    
	    	<td><a href="#">${stat.confirmed}</a></td>
	    	<td><a href="#">${stat.passed - stat.pvUnpassed - stat.confirmed}</a></td>
	    	<s:if test="stat.reportDate != null">
	    	<td>考区已上报<br /><s:date name="stat.reportDate" format="yyyy.MM.dd"/></td>
	    </s:if>
	    <s:else>
	    	<td>考区未上报</td>
	    </s:else>
    </s:if>
    <s:else>
	    <td><a href="#">未知</a></td>
	    <td><a href="#">未知</a></td>
	    <td><span class="colorred">未上报审考</span></td>
	
	    <td>-</td>
	    <td>-</td>
	    <td>-</td>
	    <td>-</td>
	    <td>-</td>
	    <td style="background:#ffffc6;">-</td>
    </s:else>
   
    </tr>  
    </s:iterator>
   
    	<tr><th colspan="11">
    	<s:if test="examTimes.publishToOems != null">
    	考次信息已于<s:date name="examTimes.publishToOems" format="yyyy.MM.dd HH:mm"/> 导出至内考务！
    	<button onclick="window.location='${ctx}/province/examapply!export.action?id=${examTimes.id}'">重新导出至内考务排考管理</button>
    	</s:if>
    	<s:else>
    	<button onclick="window.location='${ctx}/province/examapply!export.action?id=${examTimes.id}'">数据导出至内考务排考管理</button>
    	</s:else>
    	</th></tr>
   

</tbody>
</table>
</s:if>  
 
</div>

			<!-- 右侧内容 column  end-->    
	</div> <!-- content  end-->  
</div><!-- wrapper  end-->  
</body>
</html>