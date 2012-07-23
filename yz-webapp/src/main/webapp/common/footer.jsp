<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@page import="cn.common.lib.util.web.PropertyUtils"%>
<%request.setAttribute("newsUrl",PropertyUtils.getPropertyWithConfigName("sysconfig.properties","news.webapp.url")); %>
<script type="text/javascript">
	//加入收藏
	function addFavor(url,title){
 
		if (document.all) {  
		  window.external.AddFavorite(url, title); 
		  } else if (window.sidebar) { 
		  window.sidebar.addPanel(title, url,""); 
		  } else if ( window.opera && window.print ) { 
			var mbm = document.createElement('a'); 
		  mbm.setAttribute('rel','sidebar'); 
		  mbm.setAttribute('href',url); 
		  mbm.setAttribute('title',title); 
		  mbm.click(); 
		  } else { 
		  alert("收藏失败！请使用Ctrl+D进行收藏"); 
		  }
		}

	//设为首页
	function setHomepage(pageURL) {
		if (document.all) {
		document.body.style.behavior='url(#default#homepage)';
		document.body.setHomePage(pageURL);
		}
		else if (window.sidebar) {
		if(window.netscape) {
		try {
		netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
		}
		catch (e) {
		alert( "该操作被浏览器拒绝，如果想启用该功能，请在地址栏内输入 about:config,然后将项signed.applets.codebase_principal_support 值该为true" );
		}
		}
		var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components. interfaces.nsIPrefBranch);
		prefs.setCharPref('browser.startup.homepage',pageURL);
		}
		}
	</script>
       <%
       	request.setAttribute("newsUrl",PropertyUtils.getPropertyWithConfigName("sysconfig.properties","news.webapp.url"));
       %>  	
<div id="footer">
<ul>
	<s:set name="loginNum" value="@com.drcl.jsstu.course.util.UserUtils@getLoginNum()"></s:set>
	<li class="clearit"><span class="rr"> <a href="${newsUrl}/index!websiteInput.action">网站地图</a><a href="#" onclick="javascript:setHomepage('http://www.js-study.cn');" class="sheer">设为首页</a><a href="#" onclick="addFavor('${newsUrl}', '江苏学习在线-www.js-study.cn')"  class="sheer">加入收藏夹</a></span>江苏广播电视大学 版权所有 © 2011苏ICP备09063596号-1</li>
	<li>地址：江苏省南京市江东北路399号 |   电话：(86-25) 86265533 |   电邮：<a href="mailto:jsss@jstvu.edu.cn">jsss@jstvu.edu.cn</a></li>
</ul>
</div>
