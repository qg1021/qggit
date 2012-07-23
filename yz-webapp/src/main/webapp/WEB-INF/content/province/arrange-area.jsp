<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="arrange" name="activemenu" />
	<title>报考管理</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		setTabClass(4);
	});
	function onLink(areaid,record_status){
		$("#filter_EQL_aid").val(areaid);
		$("#filter_EQI_status").val(record_status);
		$("#inputForm").submit();
	}
	</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		
		<!-- top 统计板块 start-->
		<%@ include file="arrange-base.jsp"%>
		<!-- top 统计板块 end-->
		<!-- tab03 start -->
		<form id="inputForm" action="examrecord.action" method="post">
			<input type="hidden" id="timesid" name="timesid" value="${timesid}"/>
			<input type="hidden" id="filter_EQL_aid" name="filter_EQL_aid" value=""/>
			<input type="hidden" id="filter_EQI_status" name="filter_EQI_status" value=""/>
			<div id="tabid4">
    				<table class="tablebox">
					    <tr>
						    <th>报名考区</th>
						    <th>考区编号</th>
						    <th>考生人数</th>
						    <th>座次总数（备用机除外）</th>
						    <th>报考记录</th>
						    <th>已完成排考记录</th>
						    <th>漏排记录</th>
						    <th colspan="2">操作</th>
					    </tr>
					    <s:iterator value="areaDisplayVO.areaRecordList">
						    <tr>
							    <td>${areaName}</td>
							    <td>${areaCode}</td>
							    <td>${studentNum}</td>
							    <td>${seatNum}</td>
							    <td><a onclick="onLink('${areaId}','');">${recordNum}</a></td>
							    <td><a onclick="onLink('${areaId}','1');">${recordYNum}</a></td>
							    <td><a onclick="onLink('${areaId}','0');">${recordNNum}</a></td>
							    <td><button type="button" onclick="window.location.href='arrange!testing.action?timesid=${timesid}'">系统排考</button></td>
							    <td><!--<button>手动调整</button>  --></td>
						    </tr>
					    </s:iterator>
					    <tr>
						    <td colspan="2" class="bg_grey">汇总</td>
						    <td class="bg_grey">${areaDisplayVO.studentTotalNum}</td>
						    <td class="bg_grey">${areaDisplayVO.seatTotalNum}</td>
						    <td class="bg_grey">${areaDisplayVO.recordTotalNum}</td>
						    <td class="bg_grey">${areaDisplayVO.recordYTotalNum}</td>
						    <td class="bg_grey">${areaDisplayVO.recordNTotalNum}</td>
						    <td class="bg_grey"></td>
						    <td class="bg_grey"></td>
					    </tr>
    				</table>
    				<p class="ta_c">
    					<span class="colorred mr20">${examTimes.arrangeStatusName}</span>
    					<s:if test="examTimes.arrangeDate==null">
    						<button type="button" disabled="disabled">结束排考</button>
    					</s:if>
    					<s:else>
    						<button type="button" onclick="window.location.href='arrange!result.action?timesid=${timesid}'">结束排考</button>
    					</s:else>
    				</p>
    		</div>
		</form>
	<!-- tab03 end -->
	</div> <!-- content  end-->  
</div><!-- wrapper  end-->  
</body>
</html>