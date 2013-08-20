<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@page import="com.drcl.yz.contant.Global"%>
<s:iterator value="rightLinksList">
	<div class="showvideo" >
     	<img id="tryread_image" width="222px" height="180px" src="<%=Global.siteurl%><%=Global.picpath%>${picurl}"/>
		<div align="center"><a href="${link}" target="_blank" style="align:left;">${title }</a></div>
 </div>
</s:iterator>
 
