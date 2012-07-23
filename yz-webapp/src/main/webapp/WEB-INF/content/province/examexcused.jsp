 <%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examexcused" name="activemenu" />
	<title>缓考列表</title>
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
			<h2>缓考区</h2>
			<div class="pagehead01"></div>
				<form id="mainForm" action="examexcused.action" method="post">
				<div class="top_serach_box_registration">
					<p>以下为报名已确认但进行缓考的人数</p>
				    <p class="dotline"></p>
				        <ul>
				            <li>
				            	<label>考试项目名称</label>
				            	<input id="itemName" name="itemName" value="${param['itemName']}" type="text" size="20" />
				            </li>
				            <li>
				            	<label>考试项目编号</label>
				            	<input id="itemCode" name="itemCode" value="${param['itemCode']}" type="text" size="20" />
				            </li>
				            <li>
				            	<label>考次编号</label>
				            	<input id="timesCode" name="timesCode" value="${param['timesCode']}" type="text" size="20" />
				            </li>
				        </ul>
				        <ul>
				             <li>
				             	<label>考次名称</label>
				             	<input type="text" id="timesName" name="timesName" value="${param['timesName']}" size="20" />
				             </li>
				             <li>
				                <label>导入缓考区时间</label> 
				                <input id="startDate" name="startDate" value="${param['startDate']}" readonly="readonly" onclick="WdatePicker();" type="text"  size="10"/> -  
				                <input id="endDate" name="endDate"  value="${param['endDate']}" readonly="readonly" onclick="WdatePicker();" type="text"  size="10"/>
				            </li>
				            <li><button type="submit">搜索</button></li>
				        </ul>
				 </div>
    			
	    			<table class="tablebox"  >
	    				<tr>
	    					<th>考试项目</th>
						    <th>考试项目编号</th>
						    <th>原考次编号</th>
						    <th>报名人/科数</th>
						    <th>导入缓考区时间</th>
						    <th>说明</th>
						    <th>操作</th> 
	    				</tr>
	    				<s:iterator value="page.result" status="st">
						    <tr>
						    	<td title="${examTimes.examItem.name}"><common:cut string="${examTimes.examItem.name}" len="20"/></td>
							    <td>${examTimes.examItem.code}</td>
							    <td>${examTimes.code}</td>
							    <td>${recordsSize}</td>
							    <td><s:date name="importDate" format="yyyy.MM.dd HH:mm"/></td>
							    <td>${remark}</td>
							    <td>
								    <a href="examrecord!excusedlist.action?id=${id}&timesid=${examTimes.id}">详细</a>
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
				</form>
				
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>