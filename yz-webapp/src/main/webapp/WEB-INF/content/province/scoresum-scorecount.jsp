<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.drcl.jsexam.oems.vo.ScoreChatVO,cn.common.lib.vo.LabelValue,java.util.List"%>
<%@ include file="/common/taglibs.jsp" %>
<%
	ScoreChatVO scv = null;
	String categories = "";
	List<LabelValue> series = null;
	
	if(request.getAttribute("SCV")!=null){
		 scv = (ScoreChatVO)request.getAttribute("SCV");
		 if(scv.getCategories()!=null && !"".equals(scv.getCategories())){
		     categories = scv.getCategories();
		     series = scv.getSeries();
		 }
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examscore" name="activemenu" />
	<title>成绩汇总</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/highcharts/highcharts.js"></script>
	<script src="${ctx}/highcharts/modules/exporting.js"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">

	$(document).ready(function(){ 
		var highchart = {
            chart: {
                renderTo: 'container',
                type: 'line'
            },
            title: {
                text: '成绩区间分布图'
            },
            xAxis: {
                categories: []
            },
            yAxis: {
                title: {
                    text: '人数 '
                }
            },
            tooltip: {
                enabled: true,
                formatter: function() {
                    return '<b>'+ this.series.name +'</b><br/>'+
                        this.x +': '+ this.y;
                }
            },
            plotOptions: {
                line: {
                    dataLabels: {
                        enabled: true
                    },
                    enableMouseTracking: true
                }
            },
            series: []
        };
		var c = "<%=categories%>";
		var categories = c.split(',');
		var sdata = "";
		$.each(categories, function(i, c) {
			highchart.xAxis.categories.push(c);
        });

		 highchart.series = new Array();

	     
	        
	
		<% 
			if(series!=null && series.size()>0){
			    for(int i=0;i<series.size();i++){
			        LabelValue lv = series.get(i);
			        
			 
		%>
				highchart.series[<%=i%>] = new Object();
				highchart.series[<%=i%>].name="<%=lv.getLabel()%>";
				highchart.series[<%=i%>].data = new Array(<%=lv.getValue()%>);

			   
		<%
			    }
			}
		%>
		
		var chart = new Highcharts.Chart(highchart);
		

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
	        <li id='tab1'  onclick="location.href='scoresum.action?timesid=${timesid}'">成绩汇总</li>
	        <li id='tab2' onclick="location.href='examscore.action?timesid=${timesid}'">成绩列表</li>
	        <li id='tab3' class="switch_tab_current">成绩分析统计</li>
	        <!--<li id='tab4' >批量调分处理</li>-->
	        <li id='tab5' onclick="location.href='examscore!initPublish.action?timesid=${timesid}'">成绩发布管理</li>
		</ul>
		<!-- tab03 start -->
		<div id="tabid3">
			<%@ include file="../common/scoreleft.jsp"%>
    		<div class="score_right">
    			<!--统计分析表格一 start-->
    			<table class="tablebox table_none_boder">
				    <tr>
					   <th>统计项</th>
					   <s:iterator value="scoreReportList">
					   		<th colspan="2">${dataname}</th>
					   </s:iterator>
				    </tr>
   
				   <tr>
					   <th>平均分</th>
					   <s:iterator value="scoreReportList">
					   		<td colspan="2">${avgScore}</td>
					   </s:iterator>
				   </tr>
				   <tr>
					   <th>最高分</th>
					   <s:iterator value="scoreReportList">
					   		<td colspan="2">${maxScore}</td>
					   </s:iterator>
				   </tr>
   				   <s:iterator value="scoreItemList">
					   <tr>
						   <th>${itemname}</th>
						   <s:iterator value="scoreDataVOList">
						   		<td>${num}</td>
						   		<td>${rate}</td>
						   </s:iterator>
					   </tr>
				   </s:iterator>  
    		   </table>
    		   <div id="container" style="min-width: 200px; height: 400px; margin: 0 auto"></div>
    	</div>
	</div>
<!-- tab03 end -->

<!--右边结束-->
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>