<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="outsideuser" name="activemenu" />
	<title>省考务业务管理员管理</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
		function onSubmit(){
				$("#mainForm").submit();
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
			<h2>省考务业务管理员管理</h2>
			<div class="pagehead01"></div>
				<form id="mainForm" action="user.action" method="post">
				<ul class="top_serach_box">
			    	<li class="rr"><button type="submit">搜索</button></li>
				        <li class="ll mr20">用户名
        					<input type="text" id="filter_LIKES_loginName" name="filter_LIKES_loginName" value="${param['filter_LIKES_loginName']}"/>
				        </li>
    				</ul>
				<div id="message" style="line-height: 35px;">
					<s:actionmessage theme="custom" cssClass="tipbox"/>
				</div>
    			
	    			<table class="tablebox">
					    <tr>
					        <th width="40%">用户名</th>
					        <th width="40%">创建时间</th>
					        <th width="20%">操作</th>
					    </tr>
    					
	    				<s:iterator value="page.result" status="st">
						   <tr>
	        					<td>${loginName}</td>
	        					<td><s:date name="createDate" format="yyyy.MM.dd HH:mm"/></td>
	        					<td>
	        						<a href="user!input.action?id=${id}">重置密码</a>
	        						<a href="javaScript:delRecord('user!delete.action?id=${id}');">删除</a>
	        					</td>
    						</tr>
					    </s:iterator>
					    <s:if test="page.result.size ==0">
						<tr> 
							<td height="30" align="center" colspan="6"><font color="gray">没有符合条件的记录</font></td>
						</tr>  
					</s:if>      
	    			</table>
	    			<!-- 翻页 start  -->
	    			<%@ include file="/common/page.jsp"%>
	    			<p class="ll mt15"><button id="btnCreate" type="button" onclick="window.location.href='user!input.action'">创建管理员</button></p>
					<!-- 翻页 end  -->
				</form>
				
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>