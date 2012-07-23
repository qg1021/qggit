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
				<p class="rr"><a href="outsideseat!area.action?id=${examTimes.id}">返回所有考区汇总列表&gt;&gt;</a></p>
				<p class="examination_info">考区详细</p>
				<table class="tablebox">
        			<tbody>
            			<tr>
			                <th width="100">考区</th>
			                <td>${areaSVO.area.name}</td>
			                <th width="100">考区编号</th>
			                <td>${areaSVO.area.code}</td>
			                <th>考试资源总数</th>
			                <td>${areaSVO.resourceNum}</td>
            			</tr>
			            <tr>
			                <th>考区面审时间</th>
			                <td class="ta_l" colspan="5"><s:date name="areaSVO.areaStat.auditDate" format="yyyy.MM.dd HH:mm"/></td>
			            </tr>
			            <tr>
			                <th>考区面审地址</th>
			                <td class="ta_l" colspan="5">${areaSVO.areaStat.address}</td>
			            </tr>
			            <tr>
			                <th>考区联系方式</th>
			                <td class="ta_l" colspan="5">${areaSVO.areaStat.linktel}</td>
			            </tr>
        			</tbody>
        		</table>
				<table class="tablebox">
        			<tbody>
				        <tr>
				          <th>考点名称</th>
				          <th>考点编号 </th>
				          <th>考试资源上报状态</th>
				          <th>考试资源数</th>
				          <th>上报日期</th>
				          <th>操作</th>
				        </tr>
				        <s:iterator value="ssvoList">
					        <tr>
					          <td>${site.name}</td>
					          <td>${site.code}</td>
					          <td>
					          	<s:if test="siteStat.status">
					          		<span class="colorgreen">考点已上报</span>
					          	</s:if>
					          	<s:else>
					          		考点未确认
					          	</s:else>
					          </td>
					          <td>${resourceNum}</td>
					          <td><s:date name="siteStat.resourceReportDate" format="yyyy.MM.dd HH:mm"/></td>
					          <td>
					          	<s:if test="siteStat.status">
					          		<a href="outsideseat!siteDetail.action?siteid=${site.id}&id=${examTimes.id}">查看详细</a>
					          	</s:if>
					          </td>
					        </tr>
				        </s:iterator>
      				</tbody>
 				</table>
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>