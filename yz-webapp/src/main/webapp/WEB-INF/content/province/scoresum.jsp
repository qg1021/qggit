<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examscore" name="activemenu" />
	<title>成绩汇总</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
	function onLink(itemurl){
		if(itemurl!=null && itemurl!=''){
			window.location.href = itemurl;
		}
	}
	$(document).ready(function(){ 
		$("#fid").val('${param['filter_EQL_fid']}');
	});
	</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<%@ include file="/common/score-header.jsp"%>
		<p class="mt10 clearb"></p>
	    <ul class="switch_tab mb20">
	        <li id='tab1'  class="switch_tab_current">成绩汇总</li>
	        <li id='tab2' onclick="location.href='examscore.action?timesid=${timesid}'">成绩列表</li>
	        <li id='tab3' onclick="location.href='scoresum!initCount.action?timesid=${timesid}'">成绩分析统计</li>
	        <!--<li id='tab4' >批量调分处理</li>-->
	        <li id='tab5' onclick="location.href='examscore!initPublish.action?timesid=${timesid}'">成绩发布管理</li>
		</ul>
		<form id="mainForm" action="scoresum.action" method="post">
		<input type="hidden" id="timesid" name="timesid" value="${timesid}"/>
		<div class="top_serach_box_registration clearb">
			<ul>
    			<li>
    				<label>时间单元</label>
    				<select id="fid" name="filter_EQL_fid"  style="width:150px;">
    			 	 	<option value="">所有时间单元</option>
    			 	 	<s:iterator value="examTimes.fieldList">
    			 	 		<option value="${id}"><s:date name="startdate" format="MM月dd日 HH:mm"/>-<s:date name="enddate" format="HH:mm"/>(${dateTimeBetween}分钟)</option>
    			 	 	</s:iterator>
    			 	 </select>
    			</li>
    			<li>
					<label>考区</label>
					<s:select list="examAreaList" onchange="getSiteByAreaIDAndTimesID();" listKey="value" listValue="label" id="areaid" name="filter_EQL_areaid"  value="#parameters.filter_EQL_areaid"  theme="simple" cssStyle="width:150px;" headerKey="" headerValue="--选择--"/>
				</li>
    			<li>
    				<label>考点</label>
    				<s:select list="examSiteList" onchange="getRoomBySiteID();" listKey="value" listValue="label" id="siteid" name="filter_EQL_siteid"  value="#parameters.filter_EQL_siteid"  theme="simple" cssStyle="width:150px;" headerKey="" headerValue="--选择--"/>
    			</li>
    			<li>
    				<label>考场</label>
    				<s:select list="examRoomList" listKey="value" listValue="label" id="roomid" name="filter_EQL_examRoom$id"  value="#parameters.filter_EQL_examRoom$id"  theme="simple" cssStyle="width:150px;" headerKey="" headerValue="--选择--"/>
    			</li>
    			<li><button type="submit">搜索</button></li>
			</ul>
		</div>
		<table class="tablebox table_none_boder m0">
		    <tr>
			    <th width="10%">场次编号</th>
			    <th width="20%">时间单元</th>
			    <th width="10%">考场</th>
			    <th width="10%">考点</th>
			    <th width="10%">考区</th>
			    <th width="10%">应考人次</th>
			    <th width="15%">成绩回传人次</th>
			    <th width="15%">缺漏人次</th>
		    </tr>
		    <tr class="table_total_bg">
			    <td colspan="5">汇总</td>
			    <td>${ysumnum}</td>
			    <td><a href="examscore.action?timesid=${timesid}">${ssumnum}</a></td>
			    <td>${qsumnum}</td>
		    </tr>  
		    <s:iterator value="siteTableList">
			    <tr>
				    <td>${field.code}-${room.code}</td>
				    <td><s:date name="field.startdate" format="yyyy.MM.dd HH:mm"/>-<s:date name="field.enddate" format="HH:mm"/></td>
				    <td>${room.name}</td>
				    <td>${room.examSite.name}</td>
				    <td>${room.examSite.examArea.name}</td>
				    <td>${examSize}</td>
				    <td><a href="examscore.action?timesid=${timesid}&filter_EQL_fid=${field.id}">${scoreBackSize}</a></td>
				    <td>${missingSize}</td>
			    </tr>
			    <s:if test="page.result.size ==0">
					<tr> 
						<td height="30" align="center" colspan="8"><font color="gray">没有符合条件的记录</font></td>
					</tr>  
				</s:if> 
		    </s:iterator>
    	</table>
		<!-- 翻页 start  -->
			<%@ include file="/common/page.jsp"%>
		<!-- 翻页 end  -->
		</form>

<!--右边结束-->
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>