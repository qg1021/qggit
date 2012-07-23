<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="ban" name="activemenu" />
	<title>禁考列表</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/DatePicker/WdatePicker.js" ></script>
	<script type="text/javascript">

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
			<h2>禁考区</h2>
			<div class="pagehead01"></div>
			<p class="examination_info">禁考数据说明</p>
		    <dl class="slowtest_info">
			    <dt>考试项目名称</dt>
			    <dd>${examItem.name}</dd>
		    </dl>
     		<dl class="slowtest_info">
    			<dt>考试项目编号</dt>
    			<dd>${examItem.code}</dd>
    		</dl>
    		<p class="clearb"></p>
    		<p class="middleline"></p>
    		<p class="examination_info">禁考详细</p>
				<form id="mainForm" action="examban.action" method="post">
				<input type="hidden" id="itemid" name="itemid" value="${itemid}"/>
				  <div class="top_serach_box">
				     <table width="100%">
					     <tr>
					    	<td width="50%">
					    		<label>身份证</label> 
					    		<input id="idCard" name="idCard" style="width:210px;" value="${param['idCard']}" type="text" />
					    	</td>
					    	<td width="50%">
					    		<label>姓名</label> 
					    		<input id="name" name="name" value="${param['name']}" style="width:210px;"/></td>
					    </tr> 
					    <tr>
						    <td width="50%">
						    	<label>科目</label> 
						    	<input id="subjectName" name="subjectName" value="${param['subjectName']}"  type="text" style="width:210px;"/>
						    </td>
						    <td width="50%">
						    </td>
					    </tr>  
					    <tr>
						    <td width="50%">
						    	<label>禁考开始时间</label> 
						    	 <input id="startdate" name="startdate" value="${param['startdate']}" style="width:110px" readonly="readonly" onclick="WdatePicker();" type="text"  size="10"/> 
						    </td>
						    <td width="50%">
						    	<label>禁考结束时间</label> 
						    	<input id="enddate" name="enddate"  value="${param['enddate']}" style="width:110px" readonly="readonly" onclick="WdatePicker();" type="text"  size="10"/>
						    </td>
					    </tr> 
			    	</table>
			    	<p class="dotline"></p>
			    	<p class="ta_c"><button type="submit">立即搜索</button></p>
			    	</div>
    			
	    			<table class="tablebox"   border="0" cellspacing="0" cellpadding="0" class="tablebox">
	    				<tr>
						    <th width="120">身份证号</th>
						    <th>姓名</th>
						    <th>禁考科目</th>
						    <th>禁考开始时间</th>
						    <th>禁考结束时间</th>
						    <th>禁考原因</th>
						    <th width="50">操作</th>  
						 </tr>
	    				<s:iterator value="page.result" status="st">
						    <tr>
						    	<td title="${idCard}">${idCard}</td>
						    	<td>${name}</td>
							    <td>${subjectName}</td>
							    <td><s:date name="startDate" format="yyyy.MM.dd HH:mm"/></td>
							    <td><s:date name="endDate" format="yyyy.MM.dd HH:mm"/></td>
							    <td>${remark}</td>
							    <td>
								    <a href="examban!input.action?id=${id}&itemid=${examItem.id}">详细</a>
							    </td>
						    </tr>
					    </s:iterator>
					    <s:if test="page.result.size ==0">
						<tr> 
							<td height="30" align="center" colspan="7"><font color="gray">没有符合条件的记录</font></td>
						</tr>  
					</s:if>      
	    			</table>
	    			<!-- 翻页 start  -->
	    			<%@ include file="/common/page.jsp"%>
					<!-- 翻页 end  -->
					<button class="mt15" type="button" onclick="window.location.href='examban!input.action?itemid=${itemid}'">添加禁考名单</button>
				</form>
				
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>