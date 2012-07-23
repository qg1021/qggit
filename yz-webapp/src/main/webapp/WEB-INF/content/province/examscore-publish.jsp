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
	        <li id='tab1'  onclick="location.href='scoresum.action?timesid=${timesid}'" >成绩汇总</li>
	        <li id='tab2' onclick="location.href='examscore.action?timesid=${timesid}'">成绩列表</li>
	        <li id='tab3' onclick="location.href='scoresum!initCount.action?timesid=${timesid}'">成绩分析统计</li>
	        <!--<li id='tab4' >批量调分处理</li>  -->
	        <li id='tab5' class="switch_tab_current">成绩发布管理</li>
		</ul>
		<!-- tab05 start -->
		<div id="tabid5">
    	<p class="right3pxborder">将成绩下发考区</p>
        <div class="top_serach_box mb20">
        	<s:if test="examTimes.areaScorePublish">
        		<p class="box_solid_green ta_c fontbold">省考务已于<s:date name="examTimes.areaScorePublishDate" format="yyyy.MM.dd HH:mm"/>向各考区下发本考次成绩！</p>
        	</s:if>
        	<s:else>
            	<p class="box_hint_red ta_c"><span class="fontbold mr20">尚未向各考区下发本考次的成绩！</span><button type="button" onclick="location.href='examscore!areaPublish.action?timesid=${timesid}'">向各考区下发</button></p>
            </s:else>
        </div>
    	<p class="right3pxborder">将成绩在网上公布</p>
        <div class="top_serach_box">
            <s:if test="examTimes.netScorePublish">
        		<p class="box_solid_green ta_c fontbold">省考务已于<s:date name="examTimes.areaScorePublishDate" format="yyyy.MM.dd HH:mm"/>网上公布成绩供考生查询！</p>
        	</s:if>
        	<s:else>
            	<p class="box_hint_red ta_c"><span class="fontbold mr20">尚未在网上公布成绩供考生查询！</span><button type="button" onclick="location.href='examscore!netPublish.action?timesid=${timesid}'">网上公布成绩</button></p>
            </s:else>
        </div>
    </div>
<!-- tab05 end -->

		

<!--右边结束-->
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>