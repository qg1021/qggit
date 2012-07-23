<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="listcert" name="activemenu" />
	<title>证书项目管理</title> 
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/table.js" type="text/javascript"></script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<div id="content">  
		<!--左边tab-->
		<%@ include file="/common/left.jsp"%>
		<!--左边tab结束-->
		<!--右边-->
		<div class="right_content">
		<h2>证书项目管理</h2>
		<div class="pagehead01"></div>
		<!--<div class="pagehead02"></div>-->
		<form action="${ctx}/province/certproject.action" method="post" name="mainForm" id="mainForm">
	    <input type="hidden" name="page.pageNo" id="pageNo" value="${page.pageNo}"/>
	    <input type="hidden" name="page.orderBy" id="orderBy" value="${page.orderBy}"/>
	    <input type="hidden" name="page.order" id="order" value="${page.order}"/>  
		<div class="top_serach_box_registration">
	        <ul>
	            <li><label>证书项目名称</label><input type="text" size="20" name="filter_LIKES_name" id="filter_LIKES_name" value="${param['filter_LIKES_name']}"/></li>
	            <li><label>证书项目编号</label><input type="text" size="20" name="filter_LIKES_code" id="filter_LIKES_code" value="${param['filter_LIKES_code']}"/></li>
	            <li>
	                <label>状态</label>
	                <s:select name="filter_EQB_used" id="filter_EQB_used" list="usedVLists" listKey="label"  
                        listValue="value" cssStyle="width:90px;" value="#parameters.filter_EQB_used" headerKey=""
						headerValue="--所有--" theme="simple" />
	            </li>
	            <li class="rr"><input type="button" onclick="search();" value="搜索"/></li>
	          </ul>
		    </div>
		</form>
		<table class="tablebox"  >
		    <tr>
		    <th  width="100">证书项目编号</th>
		    <th>证书项目名称</th>
		    <th>状态 </th>
		    <th colspan="2" width="120">操作</th> 
		    </tr>
		    <s:iterator value="page.result">
		    <tr>
		    <td>${code}</td>
		    <td>${name}</td>
		    <td><s:if test="used">可用</s:if><s:else><span class="colorred">已停用</span></s:else></td>
		    <td width="60"><a href="${ctx}/province/certproject!input.action?id=${id}">修改</a></td>
			<td width="60"><a href="${ctx}/province/certproject!updateUsed.action?id=${id}"><s:if test="used">停用</s:if><s:else>取消停用</s:else></a></td>
		    </tr>      
		    </s:iterator>
		    
		</table>
		<!-- 翻页 start  -->
		<%@ include file="/common/page.jsp"%>
		<!-- 翻页 end  -->
		<p class="mt15 ll"><input type="button" value="新增证书项目" onclick="location.href='${ctx}/province/certproject!input.action';" /></p>
		</div>
		<!--右边结束-->
	</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>