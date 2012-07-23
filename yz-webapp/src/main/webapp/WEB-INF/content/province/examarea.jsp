<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="outsidearea" name="activemenu" />
	<title>考区</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
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
			<h2>考区管理</h2>
			<div class="pagehead01"></div>
				<div id="message" style="line-height: 35px;">
					<s:actionmessage theme="custom" cssClass="tipbox"/>
				</div>
    			<form id="mainForm" action="examarea.action" method="post">
    				<ul class="top_serach_box">
		    		<li class="rr"><button type="submit">搜索</button></li>
			        <li class="ll mr20">考区编号
			        	<input type="text" id="code" name="filter_EQS_code" size="10" value="${param['filter_EQS_code']}"/>
			        </li>
			        <li class="ll mr20">考区名称
			        	<input type="text" id="code" name="filter_LIKES_name" size="15" value="${param['filter_LIKES_name']}"/>
			        </li>
    			</ul>
	    			<table class="tablebox">
					    <tr>
					        <th width="30%">考区名称</th>
					        <th width="15%">考区编号</th>
					        <th width="15%">下辖考点数</th>
					        <th width="40%">操作</th>
					    </tr>
	    				<s:iterator value="page.result" status="st">
						   <tr>
						        <td title="${name}"><common:cut string="${name}" len="30"/></td>
						        <td>${code}</td>
						        <td>${siteSize}</td>
						        <td>
						        	<a href="examarea!input.action?id=${id}">修改</a>&nbsp;&nbsp;
						        	<a href="examarea!setList.action?areaid=${id}">管理员设置</a>&nbsp;&nbsp;
						        	<a href="javaScript:delRecord('examarea!delete.action?id=${id}');">删除</a>
						        </td>
						    </tr>
					    </s:iterator>
					    <s:if test="page.result.size ==0">
						<tr> 
							<td height="30" align="center" colspan="5"><font color="gray">没有符合条件的记录</font></td>
						</tr>  
					</s:if>      
	    			</table>
	    			<!-- 翻页 start  -->
	    			<%@ include file="/common/page.jsp"%>
	    			<p class="ll mt15"><button id="btnCreate" type="button" onclick="window.location.href='examarea!input.action'">新增考区</button></p>
					<!-- 翻页 end  -->
				</form>
				
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>