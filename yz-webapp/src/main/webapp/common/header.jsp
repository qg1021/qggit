<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@page import="org.springside.modules.security.springsecurity.SpringSecurityUtils"%>
<br />
<!--the beginning of head-->
<div id="head">
	<h2><common:prop name="oems.project.name"  propfilename="sysconfig.properties" defaultvalue="考试报名排考管理平台" /></h2>
	<p class="head_bk01"></p>
	<p class="head_bk02">
		<span class="rr">${loginUser} </span>
		<span class="h2info"><%=SpringSecurityUtils.getCurrentUserName()%> 您好，<a href="user!goUpdatePwd.action"> [修改密码]</a><a href="${ctx}/j_spring_security_logout"> [退出登录]</a></span>
	</p>
</div>