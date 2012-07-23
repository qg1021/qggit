<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examscore" name="activemenu" />
	<title>成绩管理</title>
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
	        <li id='tab1' onclick="location.href='scoresum.action?timesid=${timesid}'">成绩汇总</li>
	        <li id='tab2' class="switch_tab_current">成绩列表</li>
	        <li id='tab3' onclick="location.href='scoresum!initCount.action?timesid=${timesid}'">成绩分析统计</li>
	        <!--<li id='tab4' >批量调分处理</li>  -->
	        <li id='tab5' onclick="location.href='examscore!initPublish.action?timesid=${timesid}'">成绩发布管理</li>
		</ul>
		<!-- top_serach_box_registration  start --> 
		<p class="ov_h">
			<span class="registration_h2_span">
    			<span class="registration_h2_span_first">报考记录：<span class="fontbold">${examTimes.examRecordSize}</span></span>
    			<span class="registration_h2_span_first">已排考记录：<span class="fontbold">${examTimes.examNoRecordSize}</span></span>
   				未排考：<span class="fontbold">${examTimes.examOutRecordSize}</span>
   			</span>
		</p>
		<form id="mainForm" action="examscore.action" method="post">
		<input type="hidden" id="timesid" name="timesid" value="${timesid}"/>
		<div class="top_serach_box_registration clearb">
			<ul>
				<li>
					<label>准考证</label>
					<input id="filter_LIKES_cardNo" name="filter_LIKES_cardNo" value="${param['filter_LIKES_cardNo']}" type="text" size="15" />
				</li>
    			<li>
    				<label>身份证</label>
    				<input id="filter_LIKES_idCard" name="filter_LIKES_idCard" value="${param['filter_LIKES_idCard']}" type="text" size="15" />
    			</li>
    			<li>
    				<label>姓名</label>
    				<input id="filter_LIKES_name" name="filter_LIKES_name" value="${param['filter_LIKES_name']}" type="text" size="8" />
    			</li>
    			<li>
    				<label>科目</label>
    				<s:select list="subjectList" listKey="value" listValue="label" id="subjectid" name="filter_EQL_sbid"  value="#parameters.filter_EQL_sbid"  theme="simple" cssStyle="width:130px;" headerKey="" headerValue="--选择--"/>
    			</li>
    			<li>
    				<label>时间单元</label>
    				<select id="fid" name="filter_EQL_fid"  style="width:185px;">
    			 	 	<option value="">所有时间单元</option>
    			 	 	<s:iterator value="examTimes.fieldList">
    			 	 		<option value="${id}"><s:date name="startdate" format="MM月dd日 HH:mm"/>-<s:date name="enddate" format="HH:mm"/>(${dateTimeBetween}分钟)</option>
    			 	 	</s:iterator>
    			 	 </select>
    			</li>
			</ul>
			<ul>
    			<li>
    				<label>考区</label>
    				<s:select onchange="getSiteByAreaIDAndTimesID();" list="examAreaList" listKey="value" listValue="label" id="areaid" name="filter_EQL_areaId"  value="#parameters.filter_EQL_areaId"  theme="simple" cssStyle="width:110px;" headerKey="" headerValue="--选择--"/>
    			</li>
    			<li>
    				<label>考点</label>
    				<s:select list="examSiteList" onchange="getRoomBySiteID();" listKey="value" listValue="label" id="siteid" name="filter_EQL_sid"  value="#parameters.filter_EQL_sid"  theme="simple" cssStyle="width:120px;" headerKey="" headerValue="--选择--"/>
    			</li>
    			<li>
    				<label>考场</label>
    				<s:select list="examRoomList"  listKey="value" listValue="label" id="roomid" name="filter_EQL_rid"  value="#parameters.filter_EQL_rid"  theme="simple" cssStyle="width:120px;" headerKey="" headerValue="--选择--"/>
    			</li>
    			<li>
    				<label>成绩</label>
    				<input type="text" onkeypress="gNumeric(true,false,event);" id="filter_GEN_tscore" name="filter_GEN_tscore" value="${param['filter_GEN_tscore']}"  size="3" /> - <input type="text" onkeypress="gNumeric(true,false,event);" id="filter_LEN_tscore" name="filter_LEN_tscore" value="${param['filter_LEN_tscore']}"   size="3" /> 
    				<label>状态</label>
    				<s:select list="#{'正常':'正常','缺考':'缺考','违纪收卷':'违纪收卷'}"  id="scoreStatus" name="filter_EQS_scoreStatus" cssStyle="width:65px;"  value="#parameters.filter_EQS_scoreStatus"  headerKey="" headerValue="--所有--"/>
    			</li>
    			<li>
    				<label>警告</label>
    				<input type="text" onkeypress="gNumeric(false,false,event);" id="filter_GEI_warnNum" name="filter_GEI_warnNum" value="${param['filter_GEI_warnNum']}"  size="3" /> - <input onkeypress="gNumeric(false,false,event);" type="text" id="filter_LEI_warnNum" name="filter_LEI_warnNum" value="${param['filter_LEI_warnNum']}"   size="3" /> 
    			</li>
    			<li><button type="submit">搜索</button></li>
			</ul>
		</div>
    	<table class="tablebox">
		    <tr>
			    <th>准考证号</th>
			    <th>身份证号</th>
			    <th>姓名</th>
			    <th>报名科目</th>
			    <th>成绩</th>
			    <th>成绩状态</th>
			    <th>考区</th>
			    <th>考点</th>
			    <th>考场</th>
			    <th>时间单元</th>
			    <th>警告</th>
			    <th>操作</th>
		    </tr>
		    <s:iterator value="page.result">
			    <tr>
				    <td>${cardNo}</td>
				    <td>${idCard}</td>
				    <td>${name}</td>
				    <td>${subject.name}</td>
				    <td>${tscore}</td>
				    <td>${scoreStatus}</td>
				    <td>${examSite.examArea.name}</td>
				    <td>${examSite.name}</td>
				    <td>${examRoom.code}</td>
				    <td><s:date name="field.startdate" format="yyyy.MM.dd HH:mm"/>-<s:date name="field.enddate" format="HH:mm"/></td>
				    <td>${warnNum}</td>
				    <td>
					    <a  href="examscore!input.action?id=${id}&timesid=${timesid}" target="_blank">详细</a>
				    </td>
			    </tr>
			    <s:if test="page.result.size ==0">
					<tr> 
						<td height="30" align="center" colspan="12"><font color="gray">没有符合条件的记录</font></td>
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