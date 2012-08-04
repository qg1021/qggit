<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.drcl.yz.util.CommonUtils"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="/common/meta.jsp" %>
	<title>网站后台</title> 
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/table.js" type="text/javascript"></script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/top.jsp"%>
	<div id="content"><!--左边tab--> 
		<%@ include file="/common/menu.jsp"%>
		<!--左边tab结束--> <!--右边-->
	<div class="right_content">
		<table cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
			<tr height=28>
				<td background="${ctx}/image/admin/title_bg1.jpg">当前位置:后台首页</td>
			</tr>
			<tr>
				<td bgColor="#b1ceef" height="1"></td>
			</tr>
			<tr height="20">
				<td background="${ctx}/image/admin/shadow_bg.jpg"></td>
			</tr>
		</table>
		<table cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
			<tr height=100>
				<td align="center" width=100>
					<img height="100" src="${ctx}/image/admin/admin_p.gif" width="90"/></td>
				<td width=60>&nbsp;</td>
				<td>
				<table height=100 cellSpacing=0 cellPadding=0 width="100%" border=0>
		
					<tr>
						<td>当前时间：<%=CommonUtils.getCurrentDate("yyyy-MM-dd HH:mm")%></td>
					</tr>
					<tr>
						<td>欢迎进入网站管理中心！</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td colSpan=3 height=10></td>
			</tr>
		</table>
	</div>
<!--右边结束--></div>
<!-- content  end--></div>
<!-- wrapper  end-->
</body>
</html>