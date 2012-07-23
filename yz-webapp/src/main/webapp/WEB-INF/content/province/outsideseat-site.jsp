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
			location.href="timecell!search.action?&id=${examTimes.id}";
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
				 <!--考试资源详细-->
				<p class="rr"><a href="outsideseat!area.action?areaid=${examSite.examArea.id}&id=${examTimes.id}">返回所有考区汇总列表&gt;&gt;</a></p>
				<p class="examination_info">考点考试资源详细</p>
				<table class="tablebox">
        			<tbody>
			            <tr>
			                <th>考区</th>
			                <td><a href="outsideseat!areaDetail.action?areaid=${examSite.examArea.id }&id=${examTimes.id}">${examSite.examArea.name}</a></td>
			                <th>考区编号</th>
			                <td colspan="3">${examSite.examArea.code}</td>
			            </tr>
			            <tr>
			                <th>考点</th>
			                <td>${examSite.name}</td>
			                <th>考点编号</th>
			                <td>${examSite.code}</td>
			                <th>考试资源总数</th>
			                <td>${siteSVO.resourceNum}</td>
			            </tr>
        			</tbody>
        	</table>
        	<ul class="switch_tab mb10">
	        	<button class="rr" type="button" onclick="location.href='outsideseat!areaDetail.action?areaid=${examSite.examArea.id}&id=${examTimes.id}'">返回考点列表</button>
				<li id='tab1' class="switch_tab_current">按时间单元查看</li>
				<li id='tab2' onclick="location.href='outsideseat!siteField.action?id=${examTimes.id}&siteid=${siteid}'">按考场安排详细查看</li>
			</ul>
    		<div id="tabid1">
				<table class="tablebox">
		        	<tr>
			          	<th>考区分配的时间单元</th>
			          	<th>可用的考场数</th>
			          	<th>可用考试资源汇总</th>
		        	</tr>
		        	<s:iterator value="fieldSVOList">
			        <tr>
			          <td><s:date name="field.startdate" format="MM月dd日 HH:mm"/>-<s:date name="field.enddate" format="HH:mm"/>(${field.dateTimeBetween}分钟)</td>
			          <td>${roomSize}</td>
			          <td><a href="outsideseat!siteField.action?id=${examTimes.id}&siteid=${siteid}&fieldid=${field.id}">${resourseSize}</a></td>
			        </tr>
			        </s:iterator>
	      		</table>
      		</div>
  
		</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>