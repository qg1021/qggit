<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examtimes" name="activemenu" />
	<title>时间单元</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/DatePicker/WdatePicker.js" ></script>
	<script type="text/javascript">
	$(document).ready(function() {
		//聚焦第一个输入框
		$("#startdate").focus();
		$("#inputForm").validate({
			rules: {
				startdate:"required",
				enddate:"required"
			},
			messages: {
				startdate: "选择开始时间",
				enddate: "选择结束时间"
			},
	        errorPlacement: function(error, element) {   
		        if (document.getElementById("error_"+element.attr("name")))  {
		            error.appendTo("#error_"+element.attr("name"));  
		        }
		        else       
		            error.insertAfter(element);   
		        }
		}); 
	});
	function getTimesValue(){
		var startTime = document.getElementById("startdate").value;
		var endTime = document.getElementById("enddate").value;
		if(startTime!='' && endTime!=''){
			var times = timesBetween(startTime,endTime);
			if(times<=0){
				return false;
			}else{
				document.getElementById("times").innerHTML = times;
			}
			return true;
		}
	}
	function timesBetween(TimeOne,TimeTwo)   
	{    
		var startY = TimeOne.substring(0,4);//年2010-03-23
		var startT = TimeOne.substring(5,7);//月   
		var startD = TimeOne.substring(8,10);//月

		var endY = TimeTwo.substring(0,4);//年2010-03-23
		var endT = TimeTwo.substring(5,7);//月   
		var endD = TimeTwo.substring(8,10);//月
	
	    var startH = TimeOne.substring(10,TimeOne.lastIndexOf (':'));  
	    var endH = TimeTwo.substring(10,TimeTwo.lastIndexOf (':'));
	    var startM = TimeOne.substring(TimeOne.lastIndexOf (':')+1,TimeOne.length);  
	    var endM = TimeTwo.substring(TimeTwo.lastIndexOf (':')+1,TimeTwo.length); 
   		var c = endY*1+endT*1+endD*1+endH*60+endM*1-startY*1-startT*1-startD*1-startH*60-startM*1;
   		return c;   
	}
	function onSave(){
		if(!$("#inputForm").valid()){ return false;}
		if(!getTimesValue()){
			alert("考试日期输入不合法");
			return false;
		}
		$("#inputForm").submit();
	}
	 
	</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<%@ include file="/common/left.jsp"%>
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start -->  
		<div class="right_content">
			<h2>新建考次</h2>
			<div class="pagehead01"></div>
			<table class="tablebox"  >
			    <tr>
				    <th width="25%">1 考次设置<span class="icon_success">&nbsp;</span></th>
				    <th width="25%">2 科目设置<span class="icon_success">&nbsp;</span></th>
				    <th width="25%">3 质量管理<span class="icon_success">&nbsp;</span></th>
				    <th width="25%">4 场次（时间单元）设置</th>
    			</tr>
			</table>
    		<p class="examination_info">当前考次的时间单元列表</p>
       		<p class="h2info box_dotline_bottom">设置时间单元时需根据考试科目的最长时长，并预留相应的延考缓冲时间。</p>
    		<form id="inputForm" action="field!save.action" method="post">
    			<input id="timesid" name="timesid" type="hidden" value="${timesid}"/>
    			<input id="id" name="id" type="hidden" value="${id}"/>
	    		<div class="top_serach_box">
       				<p class="examination_info">时间单元设置</p>
     				<ul class="form box_dotline_bottom">
     					<li>
     						<span class="rr">时长：<span id="times">${dateTimeBetween}</span>分钟</span>
     						<label>时间单元：</label>
     						<input type="text" id="startdate" name="startdate" class="Wdate" value="<s:date name="startdate" format="yyyy-MM-dd HH:mm"/>"  onmousemove="getTimesValue();" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'});"/><b>开 始</b>
     						<span id="error_startdate"></span> 
     					</li>
     					<li>
     						<label>&nbsp;&nbsp;</label>
     						<input type="text" id="enddate" name="enddate" class="Wdate" value="<s:date name="enddate" format="yyyy-MM-dd HH:mm"/>" readonly="readonly" onmousemove="getTimesValue();" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'});"/><b>结 束</b>
     						<span id="error_enddate"></span> 
     					</li>
     					<li>
     						<label>场次编码:</label>
     						<input type="text" id="code" name="code" value="${code}"  readonly="readonly"/>(系统自动生成)</li>
   					</ul>
   					<p class="button_box">
   						<button id="btnSave" name="btnSave" type="button" onclick="onSave();">保存设置</button>
   						<s:if test="id!=null">
   							<button id="btnDelete" name="btnDelete" type="button" onclick="delRecord('field!delete.action?id=${id}&timesid=${timesid}');">删除时间单元</button>
   						</s:if>
   						<button id="btnCancel" name="btnCancel" type="button" onclick="window.location.href='field.action?timesid=${timesid}'">取消</button>
   					</p>
   				</div>	
			</form>
				
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>