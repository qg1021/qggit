<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="seat" name="activemenu" />
	<title>考试资源汇总</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/css/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript" >
	$(document).ready(function(){    
		$("#btnExport").fancybox({
			'titlePosition'		: 'inside',
			'transitionIn'		: 'elastic',
			'transitionOut'		: 'elastic',
			'width'				: 650,
			'height'			: 74,
			'type'				: 'iframe',
			'autoScale': false,
			'scrolling': 'auto',  
			'padding': 0, //边框距离
			'margin':0 //边框距离
		}
		);
		setTabClass(2);
		 
	}); 
	function showUploadFanBox(){
		
		$("#btnExport").attr("href","seat!initUpload.action?timesid=${timesid}");	
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
		<!-- tab01 start -->
		<form id="mainForm" action="seat.action?timesid=${timesid}" method="post">
			<input type="hidden" id="timesid" name="timesid" value="${timesid}"/>
			<div id="tabid1">
	    		<p class="ov_h">
	    			<span class="registration_h2_span">
		    			<span class="registration_h2_span_first">座位总数：<span class="fontbold">${resourceTotalNum}</span></span>
		    			<span class="registration_h2_span_first">已排考座次：<span class="fontbold">${resourceRecordNumY}</span></span>
	    				未排考：<span class="fontbold">${resourceRecordNumW}</span>
	    			</span>
	    		</p>
				<div class="top_serach_box_registration clearb">
					<ul>
					    <li>
					    	<label>考区</label>
					    	<s:select onchange="getSiteByAreaIDAndTimesID();" list="examAreaList" listKey="value" listValue="label" id="areaid" name="areaid"  value="#parameters.areaid"  theme="simple" cssStyle="width:270px;" headerKey="" headerValue="--选择--"/>
					    </li>
					    <li>
					    	<s:select list="examSiteList" listKey="value" listValue="label" id="siteid" name="siteid"  value="#parameters.siteid"  theme="simple" cssStyle="width:270px;" headerKey="" headerValue="--选择--"/>
					    </li>	
					    <li><button type="submit">搜索</button></li>
					</ul>
				</div>
	    		<table class="tablebox">
				    <tr>
					    <th>考试时间单元</th>
					    <th>考场次ID</th>
					    <th>考场名称</th>
					    <th>考区名称</th>
					    <th>考点名称</th>
					    <th>座位数</th>
					    <th>行数</th>
					    <th>列数</th>
					    <th>备用机位</th>
					    <th>已排座位</th>
					    <th>可用空位</th>
					</tr>
				    <s:iterator value="fieldRoomList">
					    <tr>
						    <td><s:date name="fieldRoom.field.startdate" format="MM月dd日 HH:mm"/>-<s:date name="fieldRoom.field.enddate" format="HH:mm"/></td>
						    <td>
						    	<!--<a href="seat!detail.action?timesid=${timesid}&roomid=${id}"></a>-->
						    	<s:if test="fieldRoom!=null && fieldRoom.field.code!=''">
						    		<a href="fieldroom!input.action?id=${fieldRoom.id}&timesid=${fieldRoom.tid}" target="_blank">${fieldRoom.examRoom.code}-${fieldRoom.field.code}</a>
						    	</s:if>
						    	<s:else>
						    		-
						    	</s:else>
						    </td>
						    <td>${fieldRoom.examRoom.name}</td>
						    <td>${fieldRoom.examRoom.examSite.examArea.name}</td>
						    <td>${fieldRoom.examRoom.examSite.name}</td>
						    <td>${resourceNum}</td>
						    <td>${fieldRoom.examRoom.lineNum}</td>
						    <td>${fieldRoom.examRoom.columnNum}</td>
						    <td>${spareNum}</td>
						    <td>${pnum}</td>
						    <td>${cnum}</td>
					    </tr> 
				    </s:iterator>     
	    		</table>  
	    		<!-- 翻页 start  -->
				<%@ include file="/common/page.jsp"%>
				<!-- 翻页 end  -->
				<p class="clearb mt10">
					<button id="btnExport" onclick="showUploadFanBox();" type="button" class="rr">EXCEL批量导入记录</button></p> 
			</div>
		</form>
	<!-- tab01 end -->
	</div> <!-- content  end-->  
</div><!-- wrapper  end-->  
</body>
</html>