<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="arrange" name="activemenu" />
	<title>报考记录管理</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/css/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#checkall").click(function(){
 			$("input[name='ids']").attr("checked",$(this).attr("checked"));
 		});
		$("#btnExport").fancybox({
			'titlePosition'		: 'inside',
			'transitionIn'		: 'elastic',
			'transitionOut'		: 'elastic',
			'width'				: 650,
			'height'			: 72,
			'type'				: 'iframe',
			'autoScale': true,
			'scrolling': 'no',  
			'padding': 0, //边框距离
			'margin':0 //边框距离
		});
		setTabClass(1);
	});
	function onSubmit(){
		$("#mainForm").attr("action","examrecord.action").submit();
	}
	function showUploadFanBox(){
		$("#btnExport").attr("href","examrecord!upload.action?timesid=${timesid}");	
	}
	function onExcused(){
		var recordid;
		var statusName;
		var isFlag = false,isChecked=false;
		$("input[name='ids']:checked").each(function(){
			recordid = $(this).val();
			statusName = $("#status_"+recordid).html();
			isChecked = true;
			if(statusName=="已排考"){
				isFlag = true;
			}

		});
		if(!isChecked){
			alert("选择导出到缓考区的报考记录");
			return false;
		}
		if(isFlag){
			alert("只有未排考的考试记录才能导出到缓考区");
			return false;
		}
		$("#mainForm").attr("action","examrecord!excused.action").submit();
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
		<form id="mainForm" action="examrecord.action" method="post">
			<input type="hidden" id="timesid" name="timesid" value="${timesid}"/>
		
			<div id="tabid1">
	    		<p class="ov_h">
	    			<span class="registration_h2_span">
		    			<span class="registration_h2_span_first">报考记录：<span class="fontbold">${examTimes.examRecordSize}</span></span>
		    			<span class="registration_h2_span_first">已排考记录：<span class="fontbold">${examTimes.examNoRecordSize}</span></span>
	    				未排考：<span class="fontbold">${examTimes.examOutRecordSize}</span>
	    			</span>
	    		</p>
				<div class="top_serach_box_registration clearb">
					<ul>
						<li>
							<label>身份证</label>
							<input id="filter_LIKES_idcard" name="filter_LIKES_idcard" value="${param['filter_LIKES_idcard']}" type="text" size="35" />
						</li>
					    <li>
					    	<label>姓名</label>
					    	<input id="filter_LIKES_name" name="filter_LIKES_name" value="${param['filter_LIKES_name']}" type="text" size="35" />
					    </li>
					    <li>
					    	<label>排考状态</label>
					    	<s:select list="#{'0':'未排考','1':'已排考'}"  id="status" name="filter_EQI_status"  value="@java.lang.Integer@parseInt(#parameters.filter_EQI_status)" cssStyle="width:85px;" headerKey="" headerValue="--所有--"/>
					    </li>
					</ul>
					<ul>
					    <li>
					    	<label>考区</label>
					    	<s:select onchange="getSiteByAreaIDAndTimesID();" list="examAreaList" listKey="value" listValue="label" id="areaid" name="filter_EQL_aid"  value="#parameters.filter_EQL_aid"  theme="simple" cssStyle="width:270px;" headerKey="" headerValue="--选择--"/>
					    </li>
					    <li>
					    	<label>考点</label><s:select list="examSiteList" listKey="value" listValue="label" id="siteid" name="filter_EQL_sid"  value="#parameters.filter_EQL_sid"  theme="simple" cssStyle="width:270px;" headerKey="" headerValue="--选择--"/>
					    </li>	
					    <li>
					    	<label>科目</label>
					    	<s:select list="subjectList" listKey="value" listValue="label" id="subjectid" name="filter_EQL_sbid"  value="#parameters.filter_EQL_sbid"  theme="simple" cssStyle="width:200px;" headerKey="" headerValue="--选择--"/>
					    </li>
					    <li><button type="button" onclick="onSubmit();">搜索</button></li>
					</ul>
				</div>
	    		<table class="tablebox">
				    <tr>
					    <th><input type="checkbox" id="checkall" name="checkall"/></th>
					    <th>报名号</th>
					    <th>考生身份证</th>
					    <th>考生姓名</th>
					    <th>报考科目</th>
					    <th>报名考区</th>
					    <th>报名考点</th>
					    <th>考试时间单元</th>
					    <th>考试考区</th>
					    <th>考试考点</th>
					    <th>考试考场</th>
					    <th>座位号</th>
					    <th>准考证号</th>
					    <th>排考状态</th>
				    </tr>
				    <s:iterator value="page.result">
					    <tr>
						    <td><input type="checkbox" id="ids" name="ids" value="${id}"/></td>
						    <td>${regNo}</td>
						    <td>${idcard}</td>
						    <td title="${name}"><common:cut len="4" string="${name}"/></td>
						    <td title="${subject.name}"><common:cut len="4" string="${subject.name}"/></td>
						    <td title="${examSite.examArea.name}"><common:cut len="6" string="${examSite.examArea.name}"/></td>
						    <td title="${examSite.name}"><common:cut len="6" string="${examSite.name}"/></td>
						    <td><s:date name="field.startdate" format="MM月dd日 HH:mm"/>-<s:date name="field.enddate" format="HH:mm"/></td>
						    <td title="${examRoom.examSite.examArea.name}"><common:cut len="6" string="${examRoom.examSite.examArea.name}"/></td>
						    <td title="${examRoom.examSite.name}"><common:cut len="6" string="${examRoom.examSite.name}"/></td>
						    <td>${examRoom.code}</td>
						    <td>${seat}</td>
						    <td>${cardNo}</td>
						    <td>
							    <s:if test=" statusName=='已排考'">
							    	<span class="colorgreen"><span id="status_${id}">${statusName}</span></span>
							    </s:if>
							    <s:else><span id="status_${id}">${statusName}</span></s:else>
						    </td>
					    </tr> 
				    </s:iterator>     
	    		</table>  
	    		<!-- 翻页 start  -->
				<%@ include file="/common/page.jsp"%>
				<!-- 翻页 end  -->
				<!--<p class="ll mt15"><span class="registration_h2_span ll"><span class="registration_h2_span_first"><a href="#">全选本页</a></span><a href="#">全选列表中所有</a></span></p> -->
				<p class="clearb mt10">
					<button type="button" class="ll" onclick="onExcused();">导出记录至缓考区</button>
					<button id="btnExport" onclick="showUploadFanBox();" type="button" class="rr">EXCEL批量导入记录</button></p> 
			</div>
		</form>
	<!-- tab01 end -->
	</div> <!-- content  end-->  
</div><!-- wrapper  end-->  
</body>
</html>