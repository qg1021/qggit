<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="listcert" name="activemenu" />
	<title>网站后台</title> 
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/css/admin.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/table.js" type="text/javascript"></script>
</head>
<body>
<div id="wrapper"><%@ include file="/common/top.jsp"%>
<div id="content"><!--左边tab--> <%@ include file="/common/menu.jsp"%>
<!--左边tab结束--> <!--右边-->
<div class="right_content">
<table cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
	<tr height=28>
		<td background="${ctx}/image/admin/title_bg1.jpg">当前位置:</td>
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
		<td align=middle width=100><IMG height=100
			src="${ctx}/image/admin/admin_p.gif" width=90></td>
		<td width=60>&nbsp;</td>
		<td>
		<table height=100 cellSpacing=0 cellPadding=0 width="100%" border=0>

			<tr>
				<td>当前时间：2008-12-27 17:03:55</td>
			</tr>
			<tr>
				<td style="FONT-WEIGHT: bold; FONT-SIZE: 16px">admin</td>
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
<table cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
	<tr height=20>
		<td></td>
	</tr>
	<tr height=22>
		<td style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff"
			align=middle background="${ctx}/image/admin/title_bg2.jpg">您的相关信息</td>
	</tr>
	<tr bgColor=#ecf4fc height=12>
		<td></td>
	</tr>
	<tr height=20>
		<td></td>
	</tr>
</table>
<table cellSpacing=0 cellPadding=2 width="95%" align=center border=0>
	<tr>
		<td align=right width=100>登陆帐号：</td>
		<td style="COLOR: #880000">admin</td>
	</tr>
	<tr>
		<td align=right>真实姓名：</td>
		<td style="COLOR: #880000">admin</td>
	</tr>
	<tr>
		<td align=right>注册时间：</td>
		<td style="COLOR: #880000">2007-7-25 15:02:04</td>
	</tr>
	<tr>
		<td align=right>登陆次数：</td>
		<td style="COLOR: #880000">58</td>
	</tr>
	<tr>
		<td align=right>上线时间：</td>
		<td style="COLOR: #880000">2008-12-27 17:02:54</td>
	</tr>
	<tr>
		<td align=right>IP地址：</td>
		<td style="COLOR: #880000">222.240.172.117</td>
	</tr>
	<tr>
		<td align=right>身份过期：</td>
		<td style="COLOR: #880000">30 分钟</td>
	</tr>
	<tr>
		<td align=right>网站开发QQ：</td>
		<td style="COLOR: #880000">215288671</td>
	</tr>
	<tr>
		<td align=right>免费模板网：</td>
		<td style="COLOR: #880000"><a href="http://www.865171.cn">www.865171.cn</a></td>
	</tr>
</table>

</div>
<!--右边结束--></div>
<!-- content  end--></div>
<!-- wrapper  end-->
</body>
</html>