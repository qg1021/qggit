<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="timecell" name="activemenu" />
	<title>考试资源汇总</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript" >
		function onTab(){
			location.href="timecell!search.action?id=${examTimes.id}";
		}
	</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<%@ include file="../common/examtop.jsp"%>
		<%@ include file="../common/exammenu.jsp"%>
		<!-- 左侧内容 column  end -->
			<!-- 右侧内容 column  start -->  
			<div class="right_content">
				<div class="pagehead01"></div>
				<ul class="switch_tab mb10">
					<li id='tab1' onclick="onTab()"  >时间单元分配</li>
					<li id='tab2' class="switch_tab_current">考试资源汇总上报</li>
				</ul> 
	      		<!--资源汇总-->
				
					<!-- <p class="rr">考试资源汇总完成：<span class="strong">1/4</span></p> -->
					<p class="examination_info">考试资源汇总</p>
					<table class="tablebox">
	        			<tr>
	          				<th width="15%">考区名称</th>
	          				<th width="10%">考区编号 </th>
	          				<th width="10%">上报状态</th>
	          				<th width="12%">设置的考点</th>
	          				<th width="12%">有效的考点</th>
	          				<th width="15%">考试资源数</th>
	          				<th width="16%">上报日期</th>
	          				<th width="10%">操作</th>
	        			</tr>
	        			<s:iterator value="asvoList">
					        <tr>
					          <td>${area.name}</td>
					          <td>${area.code}</td>
					          <td>
					          	<s:if test="areaStat.status">
					          		<span class="colorgreen">考区已上报</span>
					          	</s:if>
					          	<s:else>
					          		考区未确认
					          	</s:else>
					          </td>
					          <td>${areaStat.ssiteNum}</td>
					          <td>${areaStat.validSiteNum}</td>
					          <td>${resourceNum}</td>
					          <td><s:date name="areaStat.resourceReportDate" format="yyyy.MM.dd HH:mm"/></td>
					          <td>
					          	<s:if test="areaStat.status">
					          		<a href="outsideseat!areaDetail.action?areaid=${area.id}&id=${examTimes.id}">查看详细</a>
					          	</s:if>
					          </td>
					        </tr>
				        </s:iterator>
	 			</table>
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>