<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="timecell" name="activemenu" />
	<title>时间单元分配</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/module_tab.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/DatePicker/WdatePicker.js" ></script>
	<script type="text/javascript" >
	$(document).ready(function(){  
		var val = $('#pubhour').attr('val');
		if(val == null || val=="") val=-1;
		for(var i=0;i<24;i++){
			if(i == val)
				$('#pubhour').append('<option value="'+i+'" selected>'+ format(i) +'</option>');
			else
				$('#pubhour').append('<option value="'+i+'" >'+ format(i) +'</option>');
		}
		val = $('#pubmin').attr('val');
		if(val == null || val=="") val=-1;
		for(var i=0;i<60;i++){
			if(i == val)
				$('#pubmin').append('<option value="'+i+'" selected>'+ format(i) +'</option>');
			else
				$('#pubmin').append('<option value="'+i+'" >'+ format(i) +'</option>');
		}

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
	function format(i){
		if(i > 9)
			return i;
		return "0"+i;
	}
	function onPublish(){
		var pflag = false;
		$('#fieldtr tr:gt(0)').each(function (i){
			var fsize = $(this).find('td').eq(2).html(); 
			if(fsize>0){
				pflag = true;
			}
		});
		if(pflag){
			$("#inputForm").attr("action","timecell!publish.action?id=${examTimes.id}");
			$("#inputForm").submit();
		}else{
			alert("没有考区分配时间单元无法发布");
		}
	}
	function onCancel(){
		if(confirm("确认取消发布?")){
			$("#inputForm").attr("action","timecell!cancel.action?id=${examTimes.id}");
			$("#inputForm").submit();
		}
	}
	function onTab(pubdate){
		if(pubdate==''){
			alert("当前考次没有发布不能查看考试资源汇总");
			return false;
		}else{
			location.href="outsideseat!area.action?id=${examTimes.id}";
		}
	}
	</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<%@ include file="../common/examtop.jsp"%>
		
		<!-- 左侧内容 column  start -->
		<%@ include file="../common/exammenu.jsp"%>
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start -->  
		<div class="right_content">
			<h2>考试资源管理</h2>
			<div class="pagehead01"></div>
			<ul class="switch_tab mb10">
				<li id='tab1'  class="switch_tab_current">时间单元分配</li>
				<li id='tab2' onclick="onTab('${examTimes.publishDate}')">考试资源汇总上报</li>
			</ul>  
			<!-- tab01 start -->
			<div id="tabid1">
	      		<p class="examination_info">当前考次的时间单元列表</p>
	      		<p class="h2info box_dotline_bottom">设置时间单元时需根据考试科目的最长时长，并预留相应的延考缓冲时间。</p>
	      		<p class="mt10">已设置 <span class="strong">${page.totalCount}</span> 个时间单元</p>
	      		<table id="fieldtr" class="tablebox"  >
	        		<tr>
	          			<th width="15%">场次 ID</th>
	          			<th width="50%">时间单元 </th>
	          			<th width="20%">分配考区总数</th>
	          			<th width="15%">操作</th>
	        		</tr>
	    			<s:iterator value="page.result" status="st">
					    <tr>
						    <td>${code}</td>
						    <td><s:date name="startdate" format="MM月dd日 HH:mm"/>-<s:date name="enddate" format="HH:mm"/>(${dateTimeBetween}分钟)</td>
						    <td>${fieldAreaListSize}</td>
						    <td>
						    	<a href="timecell!initArea.action?fieldid=${id}&id=${examTimes.id}">分配设置</a>
						    </td>
					    </tr>
					</s:iterator>
	      		</table>
	      		<form  id="inputForm" action="timecell!publish.action?id=${examTimes.id}" method="post">
	      			<p class="examination_info">时间单元分配情况发布</p>
	      			<p>
	      				考区考试资源上报截止时间
	      				<input name="pubdate" readonly="readonly" class="required" value="${pubdate}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" size="11"></input>日
	      				<select name="pubhour" id="pubhour" val="${pubhour}" class="required"><option value="">选择</option></select>时
	      				<select name="pubmin" id="pubmin" val="${pubmin}" class="required"><option value="">选择</option></select>分 结束
	      			</p>
	      			<s:if test="examTimes.publishDate == null">
	      				<div class=" box_solid_red">该考次的时间单元分配尚未向各考区发布!<button type="button" onclick="onPublish();">向考区发布</button></div>
	      			</s:if>
	      			<s:else>
	   					<div class=" box_solid_green">该考次的安排和信息已于<s:date name="examTimes.publishDate" format="yyyy.MM.dd HH:mm"/> 向考区发布！  <button type="button" onclick="onCancel();">取消发布</button></div>
	   				</s:else>
	   			</form>
  			</div><!-- tab01 end -->
			<!-- tab02 start -->
			<div id="tabid2" style="display: none;">  
    		<div class="grey_boder_box">
    			<p class="examination_none">
    				<a href="#" class="colorred">尚无考试资源汇总信息！</a><br />
    				请向考区<a href="#" class="colororange">发布考试信息和考点安排！</a>
    			</p>
    		</div>
    
</div><!-- tab02 end -->
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>