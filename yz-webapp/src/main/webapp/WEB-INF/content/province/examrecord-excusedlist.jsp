<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examexcused" name="activemenu" />
	<title>缓考列表</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/css/layer.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script  src="${ctx}/js/DatePicker/WdatePicker.js" type="text/javascript"></script>
	<script src="${ctx}/js/json2.js" type="text/javascript"></script>
	<script src="${ctx}/js/layer.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#checkall").click(function(){
 			$("input[name='ids']").attr("checked",$(this).attr("checked"));
 		});
	});
	function onExportNewTimes(){
		if($("#newtimesid").val()!=''){
			var j=0;
			var obj = new Array();
			var flag = true;
			$("input[id='ids']:checked").each(function(){
				obj[j] = new getRecordID($(this).val());
				flag = false;
				j++;
			});
			if(flag){
					alert("没有导至新考次的报考记录");
					return false;
			}
			var head = new tableHead(obj,$("#newtimesid").val());
			//alert(JSON.stringify(head));
			ajaxSubmit("examrecord!exportNewTimes.action",head,callBack);
		}else{
			alert("没有选择导至新考次");
			return false;
		}
	}

	function callBack(data){
		var data = eval(data);
		alert(data.value);
		location.reload();
	}
	function getRecordID(recordid){
		this.recordid = recordid;
	}
	function tableHead(detail,newtimesid){
		this.detail = detail;
		this.newtimesid = newtimesid;
	}
	</script>
</head>
<body>
<!--浮动层-->
	<!-- JS遮罩层 --> 
	<div id="fullbg"></div> 
	<!-- end JS遮罩层 --> 
	<!-- 对话框 --> 
	<div id="dialog"> 
		<div id="dialog_content"></div> 
	</div>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<%@ include file="/common/left.jsp"%>
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start --> 
		<h2>缓考区</h2>
		<p class="ta_r">
			<a href="examexcused.action">返回列表&gt;&gt;</a>
		</p>
		<div class="pagehead01"></div>
		<div class="right_content">
			<p class="examination_info">缓考数据说明</p>
		   	<dl class="slowtest_info">
			    <dt>考试项目名称</dt>
			    <dd>${examExcused.examTimes.examItem.name}</dd>
		    </dl>    
		    <dl class="slowtest_info">
			    <dt>考试项目编号</dt>
			    <dd>${examExcused.examTimes.examItem.code}</dd>
		    </dl>
    		<p class="clearb"></p>
		    <dl class="slowtest_info_02">
		    	<dt>考次名称</dt><dd>${examExcused.examTimes.name}</dd>    
		    </dl>
			<dl class="slowtest_info_02">
		    	<dt>考次时间</dt><dd>2011.5.20</dd>    
		    </dl>    
			<dl class="slowtest_info_02">
		    	<dt>考次编号</dt><dd>${examExcused.examTimes.code}</dd>    
		    </dl>
    		<p class="clearb"></p>
    		<p class="box_dotline_top"></p>
    		<dl class="slowtest_info_03">
    			<dt>导入缓考期时间</dt><dd><s:date name="examExcused.importDate" format="yyyy.MM.dd HH:mm"/></dd>    
    		</dl>    
			<dl class="slowtest_info_03">
    			<dt>操作人</dt><dd>${examExcused.createBy}</dd>    
    		</dl>
    		<p class="clearb"></p>
    		<dl class="slowtest_info_04">
    			<dt>说明</dt><dd>${examExcused.remark}</dd>    
    		</dl>
    		<p class="clearb"></p>
    		<p class="middleline"></p>
       		<p class="examination_info">缓考报名记录详细</p>
   			<form id="mainForm" action="examrecord!excusedlist.action" method="post">
   			<input type="hidden" id="id" name="id" value="${examExcused.id}"/>
   			<input type="hidden" id="timesid" name="timesid" value="${timesid}"/>
		    <div class="top_serach_box">
			    <table width="100%">
				    <tr>
					    <td width="50%">
					    	<label>考区</label> 
					     	<s:select onchange="getSiteByAreaID();" list="examAreaList" listKey="value" listValue="label" id="areaid" name="filter_EQL_aid"  value="#parameters.filter_EQL_aid"  theme="simple" cssStyle="width:180px;" headerKey="" headerValue="--选择--"/>
					    </td>
					    <td width="50%">
					    	<label>考点</label>
					    	<s:select list="examSiteList" listKey="value" listValue="label" id="siteid" name="filter_EQL_sid"  value="#parameters.filter_EQL_sid"  theme="simple" cssStyle="width:180px;" headerKey="" headerValue="--选择--"/>
					    </td>
			    	</tr>
				    <tr>
					    <td width="50%">
					    	<label>身份证</label>
					    	<input id="filter_LIKES_idcard" name="filter_LIKES_idcard" value="${param['filter_LIKES_idcard']}" type="text" size="20" />
					    </td>
					    <td width="50%">
					    	<label>姓名</label> 
					    	<input id="filter_LIKES_name" name="filter_LIKES_name" value="${param['filter_LIKES_name']}" type="text" size="20" />
					    </td>
				    </tr> 
				    <tr>
					    <td width="50%">
					    	<label>科目</label> 
					    	<input id="filter_LIKES_sname" name="filter_LIKES_sname" value="${param['filter_LIKES_sname']}" type="text" size="20" />
					    </td>
					    <td width="50%">
					    	
					    </td>
				    </tr>   
    			</table>
    			<p class="dotline"></p>
    			<p class="ta_c"><button type="submit">立即搜索</button></p>
    		</div>
    		<table class="tablebox">
				    <tr>
					    <th><input type="checkbox" id="checkall" name="checkall"/></th>
					    <th>身份证</th>
					    <th>姓名</th>
					    <th>报考科目</th>
					    <th>考区</th>
					    <th>考点</th>
					    <th>操作</th>
				    </tr>
				    <s:iterator value="page.result">
					    <tr>
						    <td><input type="checkbox" id="ids" name="ids" value="${id}"/></td>
						    <td>${idcard}</td>
						    <td>${name}</td>
						    <td>${subject.name}</td>
						    <td>${examSite.examArea.name}</td>
						    <td>${examSite.name}</td>
						    <td><a target="_blank" href="examrecord!input.action?id=${id}&returnType=input&timesid=${examExcused.examTimes.id}">详细</a></td>
					    </tr> 
				    </s:iterator>     
	    		</table>  
	    		<!-- 翻页 start  -->
				<%@ include file="/common/page.jsp"%>
				<p class="clearb"></p>
				<p class="middleline"></p>
				<p class="examination_info">将选择的缓考报名记录导出至新考次的正式考试名单</p>
				<p class="mb10">-可选考次为本考试项目已建立并尚未生成准考证号的考次</p>
				<div class="top_serach_box">
					<s:select listKey="id" listValue="name" list="timesList" id="newtimesid" name="newtimesid" cssStyle="width:215px;" headerKey="" headerValue="--选择--"/>
					<button type="button" onclick="onExportNewTimes();">导出至新考次</button>
				</div>
			</form>
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>