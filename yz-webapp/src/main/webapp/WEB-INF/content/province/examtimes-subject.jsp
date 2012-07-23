<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examtimes" name="activemenu" />
	<title>科目设置</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script src="${ctx}/js/json2.js" type="text/javascript"></script>
	<script type="text/javascript">
		function onSave(){
			var isBlank = true;
			var isChecked = false;
			var obj = new Array();
			var j=0;
			$("input[id='subjectid']:checked").each(function(){
				isChecked = true;
				var subjectid = $(this).parent().parent().find('td').eq(0).find('input').val();
				var code = $(this).parent().parent().find('td').eq(1).html();
				var name = $(this).parent().parent().find('td').eq(2).html();
				var examtime = $(this).parent().parent().find('td').eq(3).find('input').val();
				if(examtime==null || examtime==''){
					isBlank = false;
				}
				obj[j] = new getSubjectDetail(subjectid,code,name,examtime);
				j++;
			});
			if(!isBlank){
				alert("选择开考科目信息不完整");
				return false;
			}
			if(!isChecked){
				alert("选择开考科目信息");
				return false;
			}
			var head = new tableHead(obj);
			//alert(JSON.stringify(head));
			$("#tableDetail").val(JSON.stringify(head));
			$("#inputForm").submit();
		}
		function getSubjectDetail(subjectid,code,name,examtime){
			this.id = subjectid;
			this.code = code;
			this.name = name;
			this.examtime = examtime;
		}
		function tableHead(detail){
			this.detail = detail;
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
			<h2>新增考次</h2>
			<div class="pagehead01"></div>
				<form id="inputForm" action="examtimes!saveSubject.action" method="post">
					<input type="hidden" id="id" name="id" value="${id}"/>
					<input type="hidden" id="tableDetail" name="tableDetail" value=""/>
					<table class="tablebox"  >
	    				<tr>
	    					<th width="25%">1 考次设置<span class="icon_success">&nbsp;</span></th>
	    					<th width="25%">2 科目设置 </th>
	    					<th width="25%">3 质量管理</th>
	    					<th width="25%">4 场次（时间单元）设置</th>
	    				</tr>
					</table>    
	    			<div class="top_serach_box">
	       				<p class="rr">已开考<span class="strong">${subjectSize}</span>个考试科目</p>
       					<p class="examination_info">本考次的科目配置</p>
       					<p class=" box_dotline_top"></p>
					    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablebox">
						    <tr>
							    <th width="10%">科目开考</th>
							    <th width="15%">科目代码</th>
							    <th width="45%">科目名称 </th>
							    <th width="15%">考试时长(分钟)</th>
							    <th width="15%">已开考次</th>
						    </tr>
						    <s:iterator value="subjectCheckedList">
							    <tr>
								    <td>
								    	<s:if test="checked">
								    		<input type="checkbox" id="subjectid" value="${id}" checked="checked"/>
								    	</s:if>
								    	<s:else>
								    		<input type="checkbox" id="subjectid" value=""/>
								    	</s:else>
								    </td>
								    <td>${code}</td>
								    <td>${name}</td>
								    <td><input type="text" id="examtime" name="examtime" onkeypress="gNumeric(true, false,event);" maxlength="4"  value="${examtime}" style="width:80px;"/></td>
								    <td>${knumber}</td>
							    </tr>
						    </s:iterator>      
    					</table>  
	    			</div>
	 				<div class="box_solid_blue">
	 					<button class="rr" type="button" onclick="onSave();">下一步</button>
	 					<button type="button" onclick="window.location.href='examtimes!input.action?id=${id}&returnType=base&itemid=${examItem.id}'">上一步</button>
	 				</div>
				</form>
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>