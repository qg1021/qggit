<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="certcode" name="activemenu" />
	<title>证书编号库</title>
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
	<h2>证书编号库管理</h2>
	<div class="pagehead01"></div>
	<!--<div class="pagehead02"></div>-->
	   	<form action="${ctx}/province/certcode.action" method="post" name="mainForm" id="mainForm">
        <input type="hidden" name="page.pageNo" id="pageNo" value="${page.pageNo}"/>
	    <input type="hidden" name="page.orderBy" id="orderBy" value="${page.orderBy}"/>
	    <input type="hidden" name="page.order" id="order" value="${page.order}"/>  
		<div class="top_serach_box">
	    <table width="100%">
	    <tr>
	    <td width="50%"><label>证书生成批次</label> <input type="text" name="filter_LIKES_batchCode" id="filter_LIKES_batchCode" value="${param['filter_LIKES_batchCode']}" size="30"/></td>
	    <td width="50%"><label>证书项目编号</label> <input type="text" name="filter_LIKES_certProject$code" id="filter_LIKES_certProject$code" value="${param['filter_LIKES_certProject$code']}" size="30"/></td>
	    </tr>
	    
	    <tr>
	    <td width="50%"><label>证书名称</label> <input type="text" name="filter_LIKES_certProject$name" id="filter_LIKES_certProject$name" value="${param['filter_LIKES_certProject$name']}" size="30"/></td>
	    <td width="50%"><label>考试项目编号</label> <input type="text" name="filter_LIKES_itemCode" id="filter_LIKES_itemCode" value="${param['filter_LIKES_itemCode']}" size="30"/></td>
	    </tr> 
	    
	    <tr>
	    <td width="50%"><label>考次编号</label> <input type="text" name="filter_LIKES_etimesCode" id="filter_LIKES_etimesCode" value="${param['filter_LIKES_etimesCode']}" size="30"/></td>
	    <td width="50%"><label>状态</label> <s:select name="filter_EQB_status" id="filter_EQB_status" list="usedVLists" listKey="label"  
                        listValue="value" cssStyle="width:220px;" value="#parameters.filter_EQB_status" headerKey=""
						headerValue="--所有--" theme="simple" /></td>
	    </tr> 
	    
	    </table>
	    
	    <p class="dotline"></p>
	    <p class="ta_c"><input type="button" onclick="search();" value="搜索" /></p>
	    </div>
		</form>
	 <table class="tablebox">
	    <tr>
	    <th width="50">生成批号</th>
	    <th>证书项目编号</th>
	    <th>证书名称</th>
	    <th>证书模板名称</th>
	    <th>证书编号范围</th>
	    <th>对应考试项目编号</th>
	    <th width="50">对应考次编号</th> 
	    <th width="40">状态</th> 
	    <th width="150">操作</th>  
	    </tr>
	    <s:iterator value="page.result">
	    <tr>
	    <td>${batchCode}</td>
	    <td>${certProject.code}</td>
	    <td>${certProject.name}</td>
	    <td>${certTemplate.name}</td>
	    <td>${codeStartRange}-${codeEndRange}</td>
	    <td>${itemCode}</td>
	    <td>${etimesCode}</td>
	    <td><s:if test="status">已下发</s:if><s:else><span class="colorred">未下发</span></s:else></td>
	    <td><s:if test="!status"><a href="${ctx}/province/certcode!updateStatus.action?id=${id}">下发</a></s:if> 
	    <a href="${ctx}/province/certmsg.action?certCodeId=${id}" style="color: #FF6666;">未下发的证书库查询</a>
	    <a href="${ctx}/province/certmsg!list.action?certCodeId=${id}" style="color: #2E8E62;">已下发的证书库查询</a></td>
	    </tr>      
		</s:iterator>
	    </table>
	    
	<!-- 翻页 start  -->
	 <%@ include file="/common/page.jsp"%>
	<!-- 翻页 end  -->
	</div>
	<!--右边结束-->

	</div> <!-- content  end-->  
</div><!-- wrapper  end-->
</body>
</html>