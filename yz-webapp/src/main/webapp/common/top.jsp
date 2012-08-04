<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %> 
<%@page import="org.springside.modules.security.springsecurity.SpringSecurityUtils"%>
<%@ include file="/common/taglibs.jsp" %>
<table cellspacing="0" cellpadding="0" width="100%" background="${ctx}/image/admin/header_bg.jpg" border="0">
	<tr height="40">
    	<td width="240" valign="top">
    		<img height="56" src="${ctx}/image/admin/header_left.jpg" width="180">
    	</td>
    	<td style="FONT-WEIGHT: bold; COLOR: #fff; PADDING-TOP: 20px" align="center">
    		当前用户：<%=SpringSecurityUtils.getCurrentUserName()%> &nbsp;&nbsp; 
    		<a style="COLOR: #fff" href="user!input.action">修改口令</a> &nbsp;&nbsp; 
    		<a style="COLOR: #fff" onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="${ctx}/j_spring_security_logout" >退出系统</a> 
    	</td>
    	<td align="right" width="288" valign="top">
    		<img height="56" src="${ctx}/image/admin/header_right.jpg" width="268"/>
    	</td>
    </tr>
</table>
